

 #include <ap_int.h>

#include <cstdio>

#include <cstring>

#include <cassert>


 #include "ap_utils.h"

#include <tapa.h>



 #include <ap_int.h>

#include <tapa.h>
constexpr int NUM_CH_SPARSE = 16;
constexpr int X_PARTITION_FACTOR = 4; // BRAMs = 512 / 16 / 2 = 16 -> factor = 16 / (64 / 16)
constexpr int WINDOW_SIZE = X_PARTITION_FACTOR * 1024;
constexpr int DEP_DIST_LOAD_STORE = 7;
constexpr int URAM_DEPTH = 3 * 4096;
// ch16: 3 * 4096 * 16 * 8 = 1,572,864
using double_v8 = tapa::vec_t<double, 8>;
void Callipepla(tapa::mmap<int> edge_list_ptr,
                tapa::mmaps<ap_uint<512>, NUM_CH_SPARSE> edge_list_ch,
                tapa::mmaps<double_v8, 2> vec_x,
                tapa::mmaps<double_v8, 2> vec_p,
                tapa::mmap<double_v8> vec_Ap,
                tapa::mmaps<double_v8, 2> vec_r,
                tapa::mmap<double_v8> vec_digA,
                tapa::mmap<double> vec_res,
                const int NUM_ITE, const int NUM_A_LEN, const int M,
                const int rp_time,
                const double th_termination
                );

constexpr int FIFO_DEPTH = 2;
constexpr int FIFO_DEPTH_M6 = 50;
const int NUM_CH_SPARSE_div_8 = NUM_CH_SPARSE / 8;
const int NUM_CH_SPARSE_mult_8 = NUM_CH_SPARSE * 8;
const int WINDOW_SIZE_div_8 = WINDOW_SIZE / 8;
struct MultXVec {
    tapa::vec_t<ap_uint<18>, 8> row;
    double_v8 axv;
};
struct InstRdWr {
    bool rd;
    bool wr;
    //bool require_response;
    int base_addr;
    int len;
};
struct InstVCtrl {
    bool rd;
    bool wr;
    int base_addr;
    int len;
    ap_uint<3> q_rd_idx;
    //ap_uint<3> q_wr_idx;
};
struct InstCmp {
    int len;
    double alpha;
    ap_uint<3> q_idx;
};
struct ResTerm {
    double res;
    bool term;
};
template <typename T, typename R>
inline void async_read(tapa::async_mmap<T> & A,
                       tapa::ostream<T> & fifo_A,
                       const R i_end_addr,
                       R & i_req,
                       R & i_resp) {
#pragma HLS inline
    if ((i_req < i_end_addr) &
        !A.read_addr.full()) {
        A.read_addr.try_write(i_req);
        ++i_req;
    }
    if (!fifo_A.full() & !A.read_data.empty()) {
        T tmp;
        A.read_data.try_read(tmp);
        fifo_A.try_write(tmp);
        ++i_resp;
    }
}
template <typename T, typename R>
inline void async_write(tapa::async_mmap<T> & Y_out,
                        tapa::istream<T> & fifo_Y,
                        const R num_ite_Y,
                        R & i_req,
                        R & i_resp
                        ) {
#pragma HLS inline
    if ((i_req < num_ite_Y) &
        !fifo_Y.empty() &
        !Y_out.write_addr.full() &
        !Y_out.write_data.full() ) {
        Y_out.write_addr.try_write(i_req);
        T tmpv;
        fifo_Y.try_read(tmpv);
        Y_out.write_data.try_write(tmpv);
        ++i_req;
    }
    uint8_t n_resp;
    if (Y_out.write_resp.try_read(n_resp)) {
        i_resp += R(n_resp) + 1;
    }
}
void rdwr_vec(tapa::async_mmap<double_v8> & vec_p,
              tapa::istream<InstRdWr> & q_inst,
              tapa::istream<double_v8> & q_din,
              tapa::ostream<double_v8> & q_dout,
              tapa::ostream<bool> & q_response
              ) {
#pragma HLS disaggregate variable = vec_p
#pragma HLS interface ap_fifo port = vec_p.read_addr._
#pragma HLS aggregate variable = vec_p.read_addr._  bit
#pragma HLS interface ap_fifo port = vec_p.read_data._
#pragma HLS aggregate variable = vec_p.read_data._  bit
#pragma HLS interface ap_fifo port = vec_p.write_addr._
#pragma HLS aggregate variable = vec_p.write_addr._  bit
#pragma HLS interface ap_fifo port = vec_p.write_data._
#pragma HLS aggregate variable = vec_p.write_data._  bit
#pragma HLS interface ap_fifo port = vec_p.write_resp._
#pragma HLS aggregate variable = vec_p.write_resp._  bit
#pragma HLS disaggregate variable = vec_p .read_data
#pragma HLS interface ap_fifo port = vec_p.read_data._peek
#pragma HLS aggregate variable = vec_p.read_data._peek bit
#pragma HLS disaggregate variable = vec_p .write_resp
#pragma HLS interface ap_fifo port = vec_p.write_resp._peek
#pragma HLS aggregate variable = vec_p.write_resp._peek bit
void(vec_p.read_addr._.full());
void(vec_p.read_data._.empty());
void(vec_p.read_data._peek.empty());
void(vec_p.write_addr._.full());
void(vec_p.write_data._.full());
void(vec_p.write_resp._.empty());
void(vec_p.write_resp._peek.empty());

#pragma HLS disaggregate variable = q_inst
#pragma HLS interface ap_fifo port = q_inst._
#pragma HLS aggregate variable = q_inst._ bit
#pragma HLS interface ap_fifo port = q_inst._peek
#pragma HLS aggregate variable = q_inst._peek bit
void(q_inst._.empty());
void(q_inst._peek.empty());

#pragma HLS disaggregate variable = q_din
#pragma HLS interface ap_fifo port = q_din._
#pragma HLS aggregate variable = q_din._ bit
#pragma HLS interface ap_fifo port = q_din._peek
#pragma HLS aggregate variable = q_din._peek bit
void(q_din._.empty());
void(q_din._peek.empty());

#pragma HLS disaggregate variable = q_dout
#pragma HLS interface ap_fifo port = q_dout._
#pragma HLS aggregate variable = q_dout._ bit
void(q_dout._.full());

#pragma HLS disaggregate variable = q_response
#pragma HLS interface ap_fifo port = q_response._
#pragma HLS aggregate variable = q_response._ bit
void(q_response._.full());

    for (;;) {
        auto inst = q_inst.read();
        const int rd_end_addr = inst.rd? (inst.base_addr + inst.len) : 0;
        const int wr_end_addr = inst.wr? (inst.base_addr + inst.len) : 0;
        const int rd_total = inst.rd? inst.len : 0;
        const int wr_total = inst.wr? inst.len : 0;
    rdwr:
        for (int rd_req = inst.base_addr, rd_resp = 0,
             wr_req = inst.base_addr, wr_resp = 0;
             (rd_resp < rd_total) | (wr_resp < wr_total);) {
#pragma HLS loop_tripcount min=1 max=500000
#pragma HLS pipeline II=1
            // rd
            if ((rd_req < rd_end_addr) &
                !vec_p.read_addr.full()) {
                vec_p.read_addr.try_write(rd_req);
                ++rd_req;
            }
            if (!q_dout.full() & !vec_p.read_data.empty()) {
                double_v8 tmp;
                vec_p.read_data.try_read(tmp);
                q_dout.try_write(tmp);
                ++rd_resp;
            }
            //wr
            if ((wr_req < wr_end_addr) &
                !q_din.empty() &
                !vec_p.write_addr.full() &
                !vec_p.write_data.full() ) {
                vec_p.write_addr.try_write(wr_req);
                double_v8 tmpv;
                q_din.try_read(tmpv);
                vec_p.write_data.try_write(tmpv);
                ++wr_req;
            }
            uint8_t n_resp;
            if (vec_p.write_resp.try_read(n_resp)) {
                wr_resp += int(n_resp) + 1;
            }
        }
        ap_wait();
        if (inst.wr){
            q_response.write(true);
        }
    }
}
template <typename data_t>
inline void q2q(tapa::istream<data_t> & qin,
                tapa::ostream<data_t> & qout,
                const int num_ite) {
#pragma HLS inline
q:
    for(int i = 0; i < num_ite;) {
#pragma HLS loop_tripcount min=1 max=500000
#pragma HLS pipeline II=1
        if (!qin.empty() & !qout.full()) {
            data_t tmp;
            qin.try_read(tmp);
            qout.try_write(tmp);
            ++i;
        }
    }
}
template <typename data_t>
inline void clearq(tapa::istream<data_t> & qin,
                   const int num_ite) {
#pragma HLS inline
q:
    for(int i = 0; i < num_ite;) {
#pragma HLS loop_tripcount min=1 max=500000
#pragma HLS pipeline II=1
        if (!qin.empty()) {
            data_t tmp;
            qin.try_read(tmp);
            ++i;
        }
    }
}
template <typename data_t>
inline void q2q(tapa::istreams<data_t, 2> & qin,
                tapa::ostream<data_t> & qout,
                const int num_ite,
                const int idx) {
#pragma HLS inline
q:
    for(int i = 0; i < num_ite;) {
#pragma HLS loop_tripcount min=1 max=500000
#pragma HLS pipeline II=1
        if (!qin[idx].empty() & !qout.full()) {
            data_t tmp;
            qin[idx].try_read(tmp);
            qout.try_write(tmp);
            ++i;
        }
    }
}
template <typename data_t>
inline void qq2qq(tapa::istream<data_t> & qin_pe,
                  tapa::ostreams<data_t, 2> & qout_mem,
                  tapa::istreams<data_t, 2> & qin_mem,
                  tapa::ostream<data_t> & qout_qe,
                  const int num_ite,
                  const int idx) {
#pragma HLS inline
qq:
    for(int i = 0; i < num_ite;) {
#pragma HLS loop_tripcount min=1 max=500000
#pragma HLS pipeline II=1
        if (!qin_pe.empty() & !qout_mem[idx].full()) {
            data_t tmp;
            qin_pe.try_read(tmp);
            qout_mem[idx].try_write(tmp);
            ++i;
        }
        if (!qin_mem[1 - idx].empty() & !qout_qe.full()) {
            data_t tmp;
            qin_mem[1 - idx].try_read(tmp);
            qout_qe.try_write(tmp);
        }
    }
}
void term_signal_router(tapa::istream<bool> & q_gbc,
                        tapa::ostream<bool> & q_to_rdA,
                        tapa::ostream<bool> & q_to_edgepointer,
                        tapa::ostream<bool> & q_to_abiter,
                        tapa::ostream<bool> & q_to_ctrlmem,
                        tapa::ostream<bool> & q_to_mux
                        ) ;
void read_edge_list_ptr(const int num_ite,
                        const int M,
                        const int rp_time, //P_N,
                        uint64_t  edge_list_ptr,
                        tapa::ostream<int> & PE_inst,
                        tapa::istream<bool> & q_gbc,
                        tapa::ostream<bool> & q_gbc_out
                        ) ;
void read_vec(const int rp_time, //P_N
              const int M, //K,
              tapa::async_mmap<double_v8> & vec_X,
              tapa::ostream<double_v8> & fifo_X
              ) {
    //const int rp_time = (P_N == 0)? 1 : P_N;
    const int num_ite_X = (M + 7) >> 3;
l_rp:
    for(int rp = 0; rp < rp_time; rp++) {
#pragma HLS loop_flatten off
#pragma HLS loop_tripcount min=1 max=16
    rd_X:
        for(int i_req = 0, i_resp = 0; i_resp < num_ite_X;) {
#pragma HLS loop_tripcount min=1 max=500000
#pragma HLS pipeline II=1
            async_read(vec_X,
                       fifo_X,
                       num_ite_X,
                       i_req, i_resp);
        }
    }
}
void read_A(const int rp_time, //P_N,
            const int A_len,
            uint64_t  A,
            tapa::ostream<ap_uint<512>> & fifo_A,
            tapa::istream<bool> & q_gbc,
            tapa::ostream<bool> & q_gbc_out
            ) ;
void PEG_Xvec(tapa::istream<int> & fifo_inst_in,
              tapa::istream<ap_uint<512>> & fifo_A,
              tapa::istream<double_v8> & fifo_X_in,
              tapa::ostream<int> & fifo_inst_out,
              tapa::ostream<double_v8> & fifo_X_out,
              // to PEG_Yvec
              tapa::ostream<int> & fifo_inst_out_to_Yvec,
              tapa::ostream<MultXVec> & fifo_aXvec,
              tapa::istream<bool> & q_gbc,
              tapa::ostream<bool> & q_gbc_out,
              tapa::ostream<bool> & q_gbc_out_Y
              ) ;
void PEG_Yvec(tapa::istream<int> & fifo_inst_in,
              tapa::istream<MultXVec> & fifo_aXvec,
              tapa::ostream<double> & fifo_Y_out,
              tapa::istream<bool> & q_gbc
              ) ;
void Arbiter_Y(const int rp_time, //P_N,
               const int M,
               tapa::istreams<double, NUM_CH_SPARSE_div_8> & fifo_in, // 2 = 16 / 8
               tapa::ostream<double> & fifo_out,
               tapa::istream<bool> & q_gbc,
               tapa::ostream<bool> & q_gbc_out
               ) ;
void Merger_Y(tapa::istreams<double, 8> & fifo_in,
              tapa::ostreams<double_v8, 2> & fifo_out) ;
template <typename data_t>
inline void bh(tapa::istream<data_t> & q) {
#pragma HLS inline
    for (;;) {
#pragma HLS pipeline II=1
        data_t tmp; q.try_read(tmp);
    }
}
void black_hole_int(tapa::istream<int> & fifo_in) ;
void black_hole_double_v8(tapa::istream<double_v8> & fifo_in) ;
void black_hole_bool(tapa::istream<bool> & fifo_in) ;
void ctrl_P(tapa::istreams<double_v8, 2> & qm_din,
            tapa::ostreams<double_v8, 2> & qm_dout,
            const int rp_time, //P_N
            const int M, //K,
            tapa::ostreams<InstRdWr, 2> & q_inst,
            tapa::ostream<double_v8> & q_spmv,
            tapa::ostream<double_v8> & q_dotp,
            //tapa::ostream<double_v8> & q_updtx,
            tapa::ostream<double_v8> & q_updtp,
            tapa::istream<double_v8> & q_updated,
            tapa::istreams<bool, 2> & q_res,
            tapa::istream<bool> & q_gbc,
            tapa::ostream<bool> & q_gbc_out
            ) ;
void ctrl_AP(tapa::istream<double_v8> & qm_din,
             tapa::ostream<double_v8> & qm_dout,
             const int rp_time,
             const int M,
             tapa::ostream<InstRdWr> & q_inst,
             tapa::ostream<double_v8> & q_updr,
             tapa::istream<double_v8> & q_pe,
             tapa::istream<bool> & q_res,
             tapa::istream<bool> & q_gbc,
             tapa::ostream<bool> & q_gbc_out
             ) ;
void ctrl_X(tapa::istreams<double_v8, 2> & qm_din,
            tapa::ostreams<double_v8, 2> & qm_dout,
            const int rp_time,
            const int M,
            tapa::ostreams<InstRdWr, 2> & q_inst,
            tapa::ostream<double_v8> & q_oldx,
            tapa::istream<double_v8> & q_newx,
            tapa::istreams<bool, 2> & q_res,
            tapa::istream<bool> & q_gbc
            //tapa::ostream<bool> & q_gbc_out
            ) ;
void ctrl_R(tapa::istreams<double_v8, 2> & qm_din,
            tapa::ostreams<double_v8, 2> & qm_dout,
            const int rp_time,
            const int M,
            tapa::ostreams<InstRdWr, 2> & q_inst,
            tapa::ostream<double_v8> & qr_to_pe,
            tapa::istream<double_v8> & qr_from_pe,
            tapa::istreams<bool, 2> & q_res,
            tapa::istream<bool> & q_gbc,
            tapa::ostream<bool> & q_gbc_out
            ) ;
void read_digA(uint64_t  vec_mem,
               const int rp_time, //P_N
               const int M, //K,
               tapa::ostream<double_v8> & q_dout,
               tapa::istream<bool> & q_gbc,
               tapa::ostream<bool> & q_gbc_out
               ) ;
/*  computation modules  */
//M2: alpha = rzold / (p' * Ap)
void dot_alpha(const int rp_time,
               const int M,
               //const unsigned long rz0,
               tapa::istream<double> & qrz,
               tapa::istream<double_v8> & q1,
               tapa::istream<double_v8> & q2,
               tapa::ostreams<double, 2> & q3,
               tapa::istream<bool> & q_gbc,
               tapa::ostream<bool> & q_gbc_out
               ) ;
//M end: res = r' * r
void dot_res(const int rp_time,
             const int M,
             const double th_termination,
             tapa::istream<double_v8> & q1,
             tapa::ostream<ResTerm> & q2,
             tapa::ostream<bool> & q_termination
             ) ;
//M6: rznew = r' * z
void dot_rznew(const int rp_time,
               const int M,
               tapa::istream<double_v8> & qr,
               tapa::istream<double_v8> & qz,
               tapa::ostream<double_v8> & qr_out,
               tapa::ostreams<double, 2> & qrz,
               tapa::istream<bool> & q_gbc,
               tapa::ostream<bool> & q_gbc_out
               ) ;
//M3: x = x + alpha * p
void updt_x(const int rp_time,
            const int M,
            tapa::istream<double> & qalpha,
            tapa::istream<double_v8> & qx,
            tapa::istream<double_v8> & qp,
            tapa::ostream<double_v8> & qout,
            tapa::istream<bool> & q_gbc
            //tapa::ostream<bool> & q_gbc_out
            ) ;
//M7: p = z + (rznew/rzold) * p
void updt_p(const int rp_time,
            const int M,
            //const unsigned long rz0,
            tapa::istream<double> & qrznew,
            tapa::istream<double_v8> & qz,
            tapa::istream<double_v8> & qp,
            tapa::ostream<double_v8> & qp2m3,
            tapa::ostream<double_v8> & qout,
            tapa::istream<bool> & q_gbc,
            tapa::ostream<bool> & q_gbc_out
            ) ;
//M4: r = r - alpha * Ap
void updt_r(const int rp_time,
            const int M,
            tapa::istream<double> & qalpha,
            tapa::istream<double_v8> & qr,
            tapa::istream<double_v8> & qap,
            tapa::ostream<double_v8> & qout,
            tapa::istream<bool> & q_gbc,
            tapa::ostream<bool> & q_gbc_out
            ) ;
//M5: z = diagA \ r
void left_div(const int rp_time,
              const int M,
              tapa::istream<double_v8> & qr,
              tapa::istream<double_v8> & qdiagA,
              tapa::ostreams<double_v8, 2> & qz,
              tapa::ostream<double_v8> & qr_m6,
              tapa::ostream<double_v8> & qrmem,
              tapa::istream<bool> & q_gbc,
              tapa::ostream<bool> & q_gbc_out
              ) ;
void wr_r(const int rp_time,
          uint64_t  vec_r,
          tapa::istream<ResTerm> & q_din
          ) ;
void duplicator(tapa::istream<double_v8> & q_in,
                tapa::ostream<double_v8> & q_out1,
                tapa::ostream<double_v8> & q_out2
                ) ;
void vecp_mux(const int rp_time,
              const int M,
              tapa::istream<bool> & q_gbc,
              tapa::istream<double_v8> & q_in1,
              tapa::istream<double_v8> & q_in2,
              tapa::ostream<double_v8> & q_out
              ) ;
void Callipepla(uint64_t  edge_list_ptr,
                uint64_t edge_list_ch_0, uint64_t edge_list_ch_1, uint64_t edge_list_ch_2, uint64_t edge_list_ch_3, uint64_t edge_list_ch_4, uint64_t edge_list_ch_5, uint64_t edge_list_ch_6, uint64_t edge_list_ch_7, uint64_t edge_list_ch_8, uint64_t edge_list_ch_9, uint64_t edge_list_ch_10, uint64_t edge_list_ch_11, uint64_t edge_list_ch_12, uint64_t edge_list_ch_13, uint64_t edge_list_ch_14, uint64_t edge_list_ch_15,
                uint64_t vec_x_0, uint64_t vec_x_1,
                uint64_t vec_p_0, uint64_t vec_p_1,
                uint64_t  vec_Ap,
                uint64_t vec_r_0, uint64_t vec_r_1,
                uint64_t  vec_digA,
                uint64_t  vec_res,
                const int NUM_ITE,
                const int NUM_A_LEN,
                const int M,
                const int rp_time,
                const double th_termination
                ) ;
