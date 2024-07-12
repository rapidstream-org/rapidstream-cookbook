

#include <ap_int.h>

#include <cstdio>

#include <cstring>

#include <cassert>

#include <tapa.h>

#include <ap_int.h>

#include <tapa.h>
constexpr int NUM_CH_SPARSE = 8;
constexpr int NUM_CH_B = 4;
constexpr int NUM_CH_C = 8;
const int WINDOW_SIZE = 4096;
const int DEP_DIST_LOAD_STORE = 10;
const int B_PARTITION_FACTOR = 4;
const int URAM_DEPTH = 8192;
using float_v16 = tapa::vec_t<float, 16>;
using float_v8 = tapa::vec_t<float, 8>;
void Sextans(tapa::mmap<int> edge_list_ptr,
             tapa::mmaps<ap_uint<512>, NUM_CH_SPARSE> edge_list_ch,
             tapa::mmaps<float_v16, NUM_CH_B> mat_B_ch,
             tapa::mmaps<float_v16, NUM_CH_C> mat_C_ch_in,
             tapa::mmaps<float_v16, NUM_CH_C> mat_C_ch, const int NUM_ITE,
             const int NUM_A_LEN, const int M, const int K, const int P_N,
             const int alpha_u, int beta_u);
//#include "modules.h"
constexpr int FIFO_DEPTH = 2;
constexpr int PEG_PER_A = 512 / 256;
struct MultBVec {
  ap_uint<18> row;
  float_v8 abvec;
};
template <typename T, typename R>
inline void async_read(tapa::async_mmap<T> &A, tapa::ostream<T> &fifo_A,
                       const R A_len, R &i_req, R &i_resp) {
#pragma HLS inline
  if ((i_req < A_len) & !A.read_addr.full()) {
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
void read_edge_list_ptr(
    const int num_ite, const int M,
    const int P_N, // bit 31 - 16: repeat time, bit 15 - 0: N
    const int K, uint64_t edge_list_ptr, tapa::ostream<int> &fifo_edge_list_ptr,
    tapa::ostream<int> &PE_inst);
void read_A(uint64_t A, tapa::ostream<ap_uint<512>> &fifo_A, const int A_len,
            const int P_N);
void read_B(uint64_t B, tapa::ostream<float_v16> &fifo_B, const int K,
            const int P_N);
void read_C(uint64_t C, tapa::ostream<float_v16> &fifo_C, const int M,
            const int P_N, tapa::ostream<int> &wrC_inst);
void write_C(tapa::istream<int> &wrC_inst, tapa::istream<float_v16> &fifo_C,
             uint64_t C_out);
void FloatvMultConst(const int alpha_u, const int M, const int P_N,
                     tapa::istream<float_v16> &fifo_in,
                     tapa::ostream<float_v16> &fifo_out);
void FloatvAddFloatv(tapa::istream<float_v16> &fifo_in0,
                     tapa::istream<float_v16> &fifo_in1,
                     tapa::ostream<float_v16> &fifo_out);
/*
void PU2core(ap_uint<18> & addr_c,
             float a_val_f,
             float b_val_d0_f,
             float b_val_d1_f,
             ap_uint<64> local_C_pe0_d0_d1[URAM_DEPTH]
             ) {
#pragma HLS inline
    ap_uint<64> c_val_d0_d1_u64 = local_C_pe0_d0_d1[addr_c];

    ap_uint<32> c_val_d0_u = c_val_d0_d1_u64(31,  0);
    ap_uint<32> c_val_d1_u = c_val_d0_d1_u64(63, 32);

    float c_val_d0_f = tapa::bit_cast<float>(c_val_d0_u);
    float c_val_d1_f = tapa::bit_cast<float>(c_val_d1_u);

    c_val_d0_f += tapa::reg(a_val_f) * b_val_d0_f;
    c_val_d1_f += tapa::reg(a_val_f) * b_val_d1_f;

    c_val_d0_u = tapa::bit_cast<ap_uint<32>>(c_val_d0_f);
    c_val_d1_u = tapa::bit_cast<ap_uint<32>>(c_val_d1_f);

    c_val_d0_d1_u64(31,  0) = c_val_d0_u;
    c_val_d0_d1_u64(63, 32) = c_val_d1_u;

    local_C_pe0_d0_d1[addr_c] = c_val_d0_d1_u64;
}

void PEcore(ap_uint<14> & addr_b,
            ap_uint<18> & addr_c,
            ap_uint<32> & a_val_u,
            ap_uint<64> local_C[4][URAM_DEPTH],
            float local_B[8][WINDOW_SIZE]
            ) {
#pragma HLS inline
    //if (addr_c != ((ap_uint<18>) 0x3FFFF)) {
    if (addr_c[17] == 0) {
        float a_val_f = tapa::bit_cast<float>(a_val_u);
        for (int i = 0; i < 4; ++i) {
            PU2core(addr_c,
                    a_val_f,
                    local_B[i*2+0][addr_b],
                    local_B[i*2+1][addr_b],
                    local_C[i]
                    );
        }
    }
}
*/
void PEcore_Bmtx(ap_uint<14> addr_b, ap_uint<32> a_val_u,
                 float local_B[8][WINDOW_SIZE], float_v8 &abv) {
#pragma HLS inline
  float a_val_f = tapa::bit_cast<float>(a_val_u);
  for (int i = 0; i < 8; ++i) {
    abv[i] = a_val_f * local_B[i][addr_b];
  }
}
void PEG_Bmtx(
    tapa::istream<int> &PE_inst_in, tapa::istream<int> &fifo_inst_in,
    // tapa::istream<ap_uint<128>> & fifo_A,
    tapa::istream<ap_uint<256>> &fifo_A,
    tapa::istreams<float_v16, NUM_CH_B> &fifo_B_in, // [256(16)] * 2, 2: dim d
    // [64(32bits * 2.0)] * 8 dim
    tapa::ostream<int> &PE_inst_out, tapa::ostream<int> &fifo_inst_out,
    tapa::ostreams<float_v16, NUM_CH_B> &fifo_B_out,
    // to PEG_Cmtx
    tapa::ostream<int> &PE_inst_to_Cmtx,
    tapa::ostream<int> &fifo_inst_out_to_Cmtx,
    tapa::ostreams<MultBVec, 4> &fifo_aBvec);
void PU2core_Cmtx(ap_uint<18> addr_c, float val_d0_f, float val_d1_f,
                  ap_uint<64> local_C_pe0_d0_d1[URAM_DEPTH]) {
#pragma HLS inline
  ap_uint<64> c_val_d0_d1_u64 = local_C_pe0_d0_d1[addr_c];
  ap_uint<32> c_val_d0_u = c_val_d0_d1_u64(31, 0);
  ap_uint<32> c_val_d1_u = c_val_d0_d1_u64(63, 32);
  float c_val_d0_f = tapa::bit_cast<float>(c_val_d0_u) + val_d0_f;
  float c_val_d1_f = tapa::bit_cast<float>(c_val_d1_u) + val_d1_f;
  c_val_d0_u = tapa::bit_cast<ap_uint<32>>(c_val_d0_f);
  c_val_d1_u = tapa::bit_cast<ap_uint<32>>(c_val_d1_f);
  c_val_d0_d1_u64(31, 0) = c_val_d0_u;
  c_val_d0_d1_u64(63, 32) = c_val_d1_u;
  local_C_pe0_d0_d1[addr_c] = c_val_d0_d1_u64;
}
void PEcore_Cmtx(ap_uint<18> addr_c, float_v8 &abvec,
                 ap_uint<64> local_C[4][URAM_DEPTH]) {
#pragma HLS inline
  for (int i = 0; i < 4; ++i) {
    PU2core_Cmtx(addr_c, abvec[i * 2 + 0], abvec[i * 2 + 1], local_C[i]);
  }
}
void PEG_Cmtx(tapa::istream<int> &PE_inst_in, tapa::istream<int> &fifo_inst_in,
              tapa::istreams<MultBVec, 4> &fifo_aBvec,
              tapa::ostream<float_v8> &fifo_C_out);
/*
void PEG(tapa::istream<int> & PE_inst_in,
         tapa::istream<int> & fifo_inst_in,
         //tapa::istream<ap_uint<128>> & fifo_A,
         tapa::istream<ap_uint<256>> & fifo_A,
         tapa::istreams<float_v16, NUM_CH_B> & fifo_B_in, // [256(16)] * 2, 2:
dim d
         // [64(32bits * 2.0)] * 8 dim
         tapa::ostream<int> & PE_inst_out,
         tapa::ostream<int> & fifo_inst_out,
         tapa::ostreams<float_v16, NUM_CH_B> & fifo_B_out,
         tapa::ostream<float_v8> & fifo_C_out
         ) {
    tapa::streams<MultBVec, 4, FIFO_DEPTH> fifo_aBvec("fifo_aBvec");
    tapa::stream<int, FIFO_DEPTH> PE_inst_to_Cmtx("PE_inst_to_Cmtx");
    tapa::stream<int, FIFO_DEPTH>
fifo_inst_out_to_Cmtx("fifo_inst_out_to_Cmtx");

    tapa::task()
        .invoke(PEG_Bmtx,
                PE_inst_in,
                fifo_inst_in,
                fifo_A,
                fifo_B_in,
                PE_inst_out,
                fifo_inst_out,
                fifo_B_out,
                // to PEG_Cmtx
                PE_inst_to_Cmtx,
                fifo_inst_out_to_Cmtx,
                fifo_aBvec)

        .invoke(PEG_Cmtx,
                PE_inst_to_Cmtx,
                fifo_inst_out_to_Cmtx,
                fifo_aBvec,
                fifo_C_out)
    ;
}

void PEG_c(tapa::istream<int> & PE_inst_in,
           tapa::istream<int> & fifo_inst_in,
           //tapa::istream<ap_uint<128>> & fifo_A,
           tapa::istream<ap_uint<256>> & fifo_A,
           tapa::istreams<float_v16, NUM_CH_B> & fifo_B_in, // [256(16)] * 2, 2:
dim d
           // [64(32bits * 2.0)] * 8 dim
           tapa::ostream<int> & PE_inst_out,
           tapa::ostream<int> & fifo_inst_out,
           tapa::ostreams<float_v16, NUM_CH_B> & fifo_B_out,
           tapa::ostream<float_v8> & fifo_C_out
           ) {
    const int NUM_ITE = PE_inst_in.read();
    const int M = PE_inst_in.read();
    const int P_N = PE_inst_in.read();
    const int K = PE_inst_in.read();

    PE_inst_out.write(NUM_ITE);
    PE_inst_out.write(M);
    PE_inst_out.write(P_N);
    PE_inst_out.write(K);

    const int N16 = P_N >> 16;
    const int rp_time = (N16 == 0)? 1 : N16;
    const int N = P_N & 0xFFFF;
    const int rp_time_N = rp_time * ((N + 7) >> 3);

    const int num_v_init = (M + 63) >> 6;
    //const int num_v_out = (M + 31) >> 5;
    const int num_v_out = (M + 15) >> 4;

    //define local C buffer and pragma to URAM
    //ap_uint<64> local_C[2][8 / 2][URAM_DEPTH];
    ap_uint<64> local_C[4][8 / 2][URAM_DEPTH];
#pragma HLS bind_storage variable=local_C type=RAM_2P impl=URAM latency=1
#pragma HLS array_partition complete variable=local_C dim=1
#pragma HLS array_partition complete variable=local_C dim=2

l_rp:
    for(int rp = 0; rp < rp_time_N; rp++) {
#pragma HLS loop_flatten off
#pragma HLS loop_tripcount min=1 max=16

        //init local C
    init_C:
        for (int i = 0; i < num_v_init; ++i) {
#pragma HLS loop_tripcount min=1 max=800
#pragma HLS pipeline style=stp II=1
            //for (int j = 0; j < 2; ++j) {
            for (int j = 0; j < 4; ++j) {
                for (int k = 0; k < 8 / 2; ++k) {
                    local_C[j][k][i] = 0;
                }
            }
        }
        //define local B buffer and pragma local B buffer if partition factor >
1

        //float local_B[8/2][8][WINDOW_SIZE];
        //float local_B[8][WINDOW_SIZE];
        float local_B[4/2][8][WINDOW_SIZE];
#pragma HLS bind_storage variable=local_B latency=2
#pragma HLS array_partition variable=local_B complete dim=1
#pragma HLS array_partition variable=local_B complete dim=2
#pragma HLS array_partition variable=local_B cyclic factor=B_PARTITION_FACTOR
dim=3
//#pragma HLS array_partition variable=local_B cyclic factor=B_PARTITION_FACTOR
dim=2

        auto start_32 = fifo_inst_in.read();
        fifo_inst_out.write(start_32);

    main:
        for (int i = 0; i < NUM_ITE; ++i) {
#pragma HLS loop_tripcount min=1 max=49

            // fill onchip B
        read_B:
            for (int j = 0; (j < (WINDOW_SIZE >> 3)) && (j < ((K + 7) >> 3) - i
* (WINDOW_SIZE >> 3)); ) { #pragma HLS loop_tripcount min=1 max=512 #pragma HLS
pipeline style=stp II = 1

                bool b_2048_ready = true;
                bool b_2048_out_not_full = true;
                for (int k = 0; k < NUM_CH_B; ++k) {
                    b_2048_ready &= !fifo_B_in[k].empty();
                    b_2048_out_not_full &= !fifo_B_out[k].full();
                }

                if (b_2048_ready & b_2048_out_not_full) {
                    float_v16 b_512_x[NUM_CH_B];
                    for (int k = 0; k < NUM_CH_B; ++k) {
                        b_512_x[k] = fifo_B_in[k].read();
                        fifo_B_out[k].write(b_512_x[k]);
                    }

                    for (int k = 0; k < 8; ++k) {
                        for (int m = 0; m < 8; ++m) {
                            for (int l = 0; l < 2; ++l) {
                                local_B[l][m][j * 8 + k] = b_512_x[m/2][k + m %
2 * 8];
                            }
                        }
                    }
                    ++j;
                }
            }

            // computation
            const auto end_32 = fifo_inst_in.read();
            fifo_inst_out.write(end_32);

        computation:
            for (int j = start_32; j < end_32; ) {
#pragma HLS loop_tripcount min=1 max=200
#pragma HLS pipeline style=stp II=1
#pragma HLS dependence true variable=local_C distance=DEP_DIST_LOAD_STORE

                //ap_uint<128> a_pes;
                ap_uint<256> a_pes;
                bool a_pes_ready = fifo_A.try_read(a_pes);

                if (a_pes_ready) {
                    //for (int p = 0; p < 2; ++p) {
                    for (int p = 0; p < 4; ++p) {
                        ap_uint<14> a_col;
                        ap_uint<18> a_row;
                        ap_uint<32> a_val;

                        ap_uint<64> a = a_pes(63 + p * 64, p * 64);
                        a_col = a(63, 50);
                        a_row = a(49, 32);
                        a_val = a(31,  0);

                        // PE process
                        PEcore(a_col,
                               a_row,
                               a_val,
                               local_C[p],
                               //local_B
                               local_B[p/2]
                               );
                    }
                    ++j;
                }
            }
            start_32 = end_32;
        }

        //cout << "PE = " << pe_idx << endl;
    write_C_outer:
        for (int i = 0, c_idx = 0; i < num_v_out; ++i) {
#pragma HLS loop_tripcount min=1 max=1800
#pragma HLS pipeline style=stp II=1
            ap_uint<32> u_32_d[8];

            for (int d = 0; d < 4; ++d) {
                ap_uint<64> u_64 = local_C[c_idx][d][i>>2];
                u_32_d[2 * d    ] = u_64(31,  0);
                u_32_d[2 * d + 1] = u_64(63, 32);
            }

            switch (c_idx) { //0,2,1,3
                case 0: c_idx = 2; break;
                case 1: c_idx = 3; break;
                case 2: c_idx = 1; break;
                case 3: c_idx = 0; break;
            }

            float_v8 out_v;
            for (int d = 0; d < 8; ++d) {
                out_v[d] = tapa::bit_cast<float>(u_32_d[d]);
            }
            fifo_C_out.write(out_v);
            //for (int ii = 0; ii < 8; ++ii) {cout << out_v[ii] << " ";} cout <<
endl;
        }
    }
}
*/
void Scatter_1_2(tapa::istream<ap_uint<512>> &fifo_in,
                 tapa::ostreams<ap_uint<256>, 2> &fifo_out);
void Merger(tapa::istreams<float_v8, 2> &fifo_in,
            tapa::ostream<float_v16> &fifo_out);
void black_hole_int(tapa::istream<int> &fifo_in);
void black_hole_float_v16(tapa::istream<float_v16> &fifo_in) {
#pragma HLS disaggregate variable = fifo_in
#pragma HLS interface ap_fifo port = fifo_in._
#pragma HLS aggregate variable = fifo_in._ bit
#pragma HLS interface ap_fifo port = fifo_in._peek
#pragma HLS aggregate variable = fifo_in._peek bit
  void(fifo_in._.empty());
  void(fifo_in._peek.empty());

  for (;;) {
#pragma HLS pipeline style = stp II = 1
    fifo_in.read(nullptr);
  }
}
void Sextans(uint64_t edge_list_ptr, uint64_t edge_list_ch_0,
             uint64_t edge_list_ch_1, uint64_t edge_list_ch_2,
             uint64_t edge_list_ch_3, uint64_t edge_list_ch_4,
             uint64_t edge_list_ch_5, uint64_t edge_list_ch_6,
             uint64_t edge_list_ch_7, uint64_t mat_B_ch_0, uint64_t mat_B_ch_1,
             uint64_t mat_B_ch_2, uint64_t mat_B_ch_3, uint64_t mat_C_ch_in_0,
             uint64_t mat_C_ch_in_1, uint64_t mat_C_ch_in_2,
             uint64_t mat_C_ch_in_3, uint64_t mat_C_ch_in_4,
             uint64_t mat_C_ch_in_5, uint64_t mat_C_ch_in_6,
             uint64_t mat_C_ch_in_7, uint64_t mat_C_ch_0, uint64_t mat_C_ch_1,
             uint64_t mat_C_ch_2, uint64_t mat_C_ch_3, uint64_t mat_C_ch_4,
             uint64_t mat_C_ch_5, uint64_t mat_C_ch_6, uint64_t mat_C_ch_7,
             const int NUM_ITE, const int NUM_A_LEN, const int M, const int K,
             const int P_N, const int alpha_u, const int beta_u);
