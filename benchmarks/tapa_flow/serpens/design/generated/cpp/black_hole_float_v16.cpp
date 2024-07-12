

 #include <ap_int.h>

#include <cstdio>

#include <cstring>

#include <cassert>


 #include <tapa.h>



 #include <ap_int.h>

#include <tapa.h>
//constexpr int NUM_CH_SPARSE = 16;
constexpr int NUM_CH_SPARSE = 24; //or, 32, 40, 48, 56
constexpr int WINDOW_SIZE = 8192;
constexpr int DEP_DIST_LOAD_STORE = 10;
constexpr int X_PARTITION_FACTOR = 8;
constexpr int URAM_DEPTH = ((NUM_CH_SPARSE == 16)? 3 : 2) * 4096; // 16 -> 12,288, others -> 8,192
using float_v16 = tapa::vec_t<float, 16>;
void Serpens(tapa::mmap<int> edge_list_ptr,
             tapa::mmaps<ap_uint<512>, NUM_CH_SPARSE> edge_list_ch,
             tapa::mmap<float_v16> vec_X,
             tapa::mmap<float_v16> vec_Y,
             tapa::mmap<float_v16> vec_Y_out,
             const int NUM_ITE, const int NUM_A_LEN, const int M, const int K,
             const int P_N, const int alpha_u, const int beta_u);

//#include <iostream>
//using namespace std;
constexpr int FIFO_DEPTH = 2;
const int NUM_CH_SPARSE_div_8 = NUM_CH_SPARSE / 8;
const int NUM_CH_SPARSE_mult_16 = NUM_CH_SPARSE * 16;
const int NUM_CH_SPARSE_mult_2 = NUM_CH_SPARSE * 2;
const int WINDOW_SIZE_div_16 = WINDOW_SIZE >> 4;
using float_v8 = tapa::vec_t<float, 8>;
using float_v2 = tapa::vec_t<float, 2>;
struct MultXVec {
    tapa::vec_t<ap_uint<18>, 8> row;
    float_v8 axv;
};
template <typename T, typename R>
inline void async_read(tapa::async_mmap<T> & A,
                       tapa::ostream<T> & fifo_A,
                       const R A_len,
                       R & i_req,
                       R & i_resp) {
#pragma HLS inline
    if ((i_req < A_len) &
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
void read_edge_list_ptr(const int num_ite,
                        const int M,
                        const int P_N,
                        const int K,
                        uint64_t  edge_list_ptr,
                        tapa::ostream<int> & PE_inst
                        ) ;
void read_X(const int P_N,
            const int K,
            uint64_t  vec_X,
            tapa::ostream<float_v16> & fifo_X
            ) ;
void read_A(const int P_N,
            const int A_len,
            uint64_t  A,
            tapa::ostream<ap_uint<512>> & fifo_A
            ) ;
void PEG_Xvec(tapa::istream<int> & fifo_inst_in,
              tapa::istream<ap_uint<512>> & fifo_A,
              tapa::istream<float_v16> & fifo_X_in,
              tapa::ostream<int> & fifo_inst_out,
              tapa::ostream<float_v16> & fifo_X_out,
              // to PEG_Yvec
              tapa::ostream<int> & fifo_inst_out_to_Yvec,
              tapa::ostream<MultXVec> & fifo_aXvec
              ) ;
inline void PUcore_Ymtx(ap_uint<18> addr_c,
                        float val_d0_f,
                        ap_uint<64> local_C_pe0[URAM_DEPTH]
                        ) {
#pragma HLS inline
    ap_uint<64> c_val_u64 = local_C_pe0[addr_c(17, 1)];
    ap_uint<32> c_val_d0_u = c_val_u64(31, 0);
    ap_uint<32> c_val_d1_u = c_val_u64(63, 32);
    ap_uint<32> c_val_u = (addr_c[0])? c_val_d1_u : c_val_d0_u;
    float c_val_plus_d0_f = tapa::bit_cast<float>(c_val_u) + val_d0_f;
    c_val_u = tapa::bit_cast<ap_uint<32>>(c_val_plus_d0_f);
    if (addr_c[0]) {
        c_val_d1_u = c_val_u;
    } else {
        c_val_d0_u = c_val_u;
    }
    c_val_u64(63, 32) = c_val_d1_u;
    c_val_u64(31, 0) = c_val_d0_u;
    local_C_pe0[addr_c(17, 1)] = c_val_u64;
}
void PEG_Yvec(tapa::istream<int> & fifo_inst_in,
              tapa::istream<MultXVec> & fifo_aXvec,
              tapa::ostream<float_v2> & fifo_Y_out
              ) ;
void Arbiter_Y(const int P_N,
               const int M,
               tapa::istreams<float_v2, NUM_CH_SPARSE_div_8> & fifo_in,
               tapa::ostream<float_v2> & fifo_out
               ) ;
void Merger_Y(tapa::istreams<float_v2, 8> & fifo_in,
              tapa::ostream<float_v16> & fifo_out) ;
void FloatvMultConst(const int P_N,
                     const int M,
                     const int alpha_u,
                     tapa::istream<float_v16> & fifo_in,
                     tapa::ostream<float_v16> & fifo_out
                     ) ;
void read_Y(const int P_N,
            const int M,
            uint64_t  Y,
            tapa::ostream<float_v16> & fifo_Y
            ) ;
void FloatvAddFloatv(tapa::istream<float_v16> & fifo_in0,
                     tapa::istream<float_v16> & fifo_in1,
                     tapa::ostream<float_v16> & fifo_out
                     ) ;
void write_Y(const int P_N,
             const int M,
             tapa::istream<float_v16> & fifo_Y,
             uint64_t  Y_out
             ) ;
void black_hole_int(tapa::istream<int> & fifo_in) ;
void black_hole_float_v16(tapa::istream<float_v16> & fifo_in) {
#pragma HLS disaggregate variable = fifo_in
#pragma HLS interface ap_fifo port = fifo_in._
#pragma HLS aggregate variable = fifo_in._ bit
#pragma HLS interface ap_fifo port = fifo_in._peek
#pragma HLS aggregate variable = fifo_in._peek bit
void(fifo_in._.empty());
void(fifo_in._peek.empty());

    for (;;) {
#pragma HLS pipeline II=1
        float_v16 tmp; fifo_in.try_read(tmp);
    }
}
void Serpens(uint64_t  edge_list_ptr,
             uint64_t edge_list_ch_0, uint64_t edge_list_ch_1, uint64_t edge_list_ch_2, uint64_t edge_list_ch_3, uint64_t edge_list_ch_4, uint64_t edge_list_ch_5, uint64_t edge_list_ch_6, uint64_t edge_list_ch_7, uint64_t edge_list_ch_8, uint64_t edge_list_ch_9, uint64_t edge_list_ch_10, uint64_t edge_list_ch_11, uint64_t edge_list_ch_12, uint64_t edge_list_ch_13, uint64_t edge_list_ch_14, uint64_t edge_list_ch_15, uint64_t edge_list_ch_16, uint64_t edge_list_ch_17, uint64_t edge_list_ch_18, uint64_t edge_list_ch_19, uint64_t edge_list_ch_20, uint64_t edge_list_ch_21, uint64_t edge_list_ch_22, uint64_t edge_list_ch_23,
             uint64_t  vec_X,
             uint64_t  vec_Y,
             uint64_t  vec_Y_out,
             const int NUM_ITE,
             const int NUM_A_LEN,
             const int M,
             const int K,
             const int P_N,
             const int alpha_u,
             const int beta_u
             ) ;
