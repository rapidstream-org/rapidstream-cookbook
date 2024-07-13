


 #include <cstdint>

#include <stdio.h>

#include <stdlib.h>

#include <iostream>

#include <fstream>

#include <string>

#include <vector>

#include <algorithm>

#include <inttypes.h>


 #include "ap_int.h"

#include <tapa.h>

// const uint32_t dataWR_Cnt = 934640;
// const uint32_t metaWR_Cnt = 934640;  //2147483647;
const uint8_t SR = 0;
const uint8_t DIRECT = 1;
const uint8_t PATCHED = 2;
const uint8_t DELTA = 3;
const uint8_t HEADER_ST = 7;
const uint8_t SR_STATE = 0; // 0 from 8
const uint8_t DI_STATE = 1; // 1 from 5
const uint8_t PA_STATE = 2; // 2 from 7
const uint8_t DE_STATE = 3; // 3 from 2
const uint8_t ASSIGN_DATA = 4;
const uint8_t PA_META_PROC = 5;
const uint8_t TR_HEADER = 6;
const uint8_t HD_PROC = 8;
const uint8_t waste_cycles = 9;
const uint16_t AXI_WIDTH_2X = 1024;
const uint16_t AXI_WIDTH_4X = 2048;
const uint16_t AXI_WIDTH = 512;
const uint16_t SR_DATAW = 320;
const uint16_t AXI_WIDTH_H = 256;
const uint16_t AXI_WIDTH_HH = 128;
typedef ap_uint<AXI_WIDTH_4X> _2048b;
typedef ap_uint<AXI_WIDTH_2X> _1024b;
typedef ap_uint<AXI_WIDTH> _512b;
typedef ap_int<AXI_WIDTH> _512bi;
typedef ap_uint<SR_DATAW> _320b;
typedef ap_uint<AXI_WIDTH_H> _256b;
typedef ap_uint<AXI_WIDTH_HH> _128b;
const uint16_t PEs = 16;
// Map to bit width value.
// const uint16_t NDelta_BitMap[32] = {1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11,
//                                 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
//                                 23, 24, 26, 28, 30, 32, 40, 48, 56, 64};
// const uint16_t Delta_BitMap[32] = {0,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11,
//                                 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
//                                 23, 24, 26, 28, 30, 32, 40, 48, 56, 64};

void mmap2s(uint64_t  input_port,
            tapa::ostream<_512b>& outLstrm,
            tapa::ostream<bool>& rstStrmL,
            tapa::ostream<bool>& rstStrmMeta,
            tapa::ostream<bool>& rstStrmStore,
            uint32_t wait_count,
            uint32_t data_count)
;
void load(tapa::istream<_512b>& data_in,
            tapa::istream<bool>& rstStrm,
            tapa::ostream<_2048b>& outAll_Lstrm,
            tapa::ostream<_256b> &out_strmC_Track,
            tapa::ostream<_512b>& PA_DATA,
            tapa::ostream<uint32_t>& PA_metaDATA
            // tapa::ostream<uint32_t>& paCnt_strm
            // uint32_t KRNL_Data_Write
            // uint32_t data_count
                 )
;
void data_Sender(tapa::istream<_2048b>& data_in,
                tapa::istream<_256b>& meta_in,
                // tapa::istream<bool> & rst_Strm,
                tapa::ostreams<_512b,4>& outAll_Pstrm,
                tapa::ostream<uint64_t>& outSR_Pstrm,
                tapa::ostreams<_256b, 4>& meta_out,
                tapa::ostream<uint8_t>& SR_meta_out,
                tapa::ostream<uint64_t>& All_meta_out,
                tapa::ostream<uint8_t>& Dec_type_Out
                // tapa::ostream<uint32_t>& data_Cnt,
                // tapa::ostream<uint32_t>& pa_Cnt
                )
;
void compSR(tapa::istream<uint64_t>& outSR_Pstrm,
            tapa::istream<uint8_t>& meta_out,
            tapa::ostream<_320b>& SR_Dout)
;
void compute_delta(tapa::istream<_512b>& in_Cstrm,
                tapa::istream<_256b>& in_Trstrm,
                tapa::ostream<uint32_t>& out_Cmeta_strm,
                tapa::ostream<_512b>& out_Cstrm,
                tapa::ostream<_512b>& DI_strm,
                tapa::ostream<_512b>& PA_strm,
                tapa::ostream<uint32_t>& PA_meta_strm,
                uint32_t compD_ID)
;
void PA_meta_proc(tapa::istream<_512b>& PA_Strm,
                tapa::istream<uint32_t>& PA_meta_Strm,
                tapa::ostream<uint64_t>& metaOutPA_Strm) //PLL, IDX, VAL
;
void PA_sum_out(tapa::istream<_512b>& PA_Strm,
                tapa::istream<uint32_t>& PA_BV_Strm,
                tapa::ostream<_512b>& dataOutPA_Strm
                )
;
void Meta_Aligner(tapa::istream<uint64_t>& PA_metaStrm,
                tapa::istream<uint64_t>& All_meta_Strm,
                tapa::ostream<_128b>& meta_Out
                )
{
#pragma HLS disaggregate variable = PA_metaStrm
#pragma HLS interface ap_fifo port = PA_metaStrm._
#pragma HLS aggregate variable = PA_metaStrm._ bit
#pragma HLS interface ap_fifo port = PA_metaStrm._peek
#pragma HLS aggregate variable = PA_metaStrm._peek bit
void(PA_metaStrm._.empty());
void(PA_metaStrm._peek.empty());

#pragma HLS disaggregate variable = All_meta_Strm
#pragma HLS interface ap_fifo port = All_meta_Strm._
#pragma HLS aggregate variable = All_meta_Strm._ bit
#pragma HLS interface ap_fifo port = All_meta_Strm._peek
#pragma HLS aggregate variable = All_meta_Strm._peek bit
void(All_meta_Strm._.empty());
void(All_meta_Strm._peek.empty());

#pragma HLS disaggregate variable = meta_Out
#pragma HLS interface ap_fifo port = meta_Out._
#pragma HLS aggregate variable = meta_Out._ bit
void(meta_Out._.full());

    bool send_all_data = true;
    ap_uint<128> all_meta = 0;
    ap_uint<64> pa_meta = 0;
    ap_uint<128> myMeta = 0;
    uint16_t DecType = 0;
    uint16_t runLength = 0;
    uint32_t d_count = 0;
    uint8_t PLL = 0;
    uint8_t myCount = 0;
    // bool write_all_data = false;
    // bool write_pa_data = false;
    // uint32_t all_cnt = 0;
    // uint32_t pa_cnt = 0;
    meta_align_loop:for(;;)
    {
        temploop:for(int i = 0; i < 2147483647; i ++)
        {
#pragma HLS pipeline II=1
            if(send_all_data)
            {
                if(!All_meta_Strm.empty())
                {
                    all_meta = All_meta_Strm.read();
                    DecType = all_meta.range(15,0);
                    runLength = all_meta.range(31,16);
                    myMeta = (all_meta << 64);
                    if(DecType == PATCHED)
                    {
                        if(d_count < (runLength-64))
                        {
                            d_count+=64;
                        }
                        else
                        {
                            d_count = 0;
                            send_all_data = false;
                        }
                    }
                    // all_cnt += 1;
                    // write_all_data = true;
                    meta_Out.write(myMeta);
                }
            }
            else
            {
                if(!PA_metaStrm.empty())
                {
                    pa_meta = PA_metaStrm.read();
                    PLL = pa_meta.range(7,0);
                    myMeta = (all_meta << 64) | pa_meta;
                    if(myCount < (PLL-1))
                    {
                        myCount+=1;
                    }
                    else //(myCount ==  PLL)
                    {
                        myCount = 0;
                        send_all_data = true;
                    }
                    // write_pa_data = true;
                    meta_Out.write(myMeta);
                }
            }
        }
    }
}
void Meta_Writer(tapa::istream<_128b>& PA_metaStrm,
                tapa::istream<bool>& rst_StrmDS,
                // tapa::istream<uint32_t>& complete_count,
                uint64_t  metaPort_Out
                // uint32_t KRNL_Data_Write
                )
;
void delta_sumNC_in(tapa::istream<_512b>& delta_Strm,
                // tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostream<_512b>& dataOut_Strm,
                tapa::ostream<uint32_t>& CarryOut_Strm
                // ,uint32_t ID
                )
;
void delta_sumNC_all(tapa::istream<_512b>& delta_Strm,
                // tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostream<_512b>& dataOut_Strm
                )
;
void delta_sum_2out(tapa::istream<_512b>& delta_Strm,
                tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostream<_512b>& dataOut_Strm,
                tapa::ostream<uint32_t>& CarryOut_Strm,
                tapa::ostream<uint32_t>& CarryOut_Strm1
                )
;
void delta_sum_1out(tapa::istream<_512b>& delta_Strm,
                tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostream<_512b>& dataOut_Strm,
                tapa::ostream<uint32_t>& CarryOut_Strm
                )
;
void delta_sum_0out(tapa::istream<_512b>& delta_Strm,
                tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostream<_512b>& dataOut_Strm
                )
;
void delta_Fsum(tapa::istreams<_512b, 4>& delta_Strm,
                tapa::istreams<uint32_t, 4>& meta_Strm,
                tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostreams<_512b, 4>& dataOut_Strm
                )
;
void Data_Aligner(tapa::istream<uint8_t>& inTrackStrm,
                tapa::istreams<_512b, 4>& inDEStrm,
                tapa::istreams<_512b, 4>& inDIStrm,
                tapa::istreams<_512b, 4>& inPAStrm,
                tapa::istream<_320b>& inSRStrm,
                tapa::ostreams<_512b, 4>& outWRStrm )
;
void store_all(tapa::istreams<_512b, 4>& inAllStrm,
            tapa::istream<bool>& rst_StrmL,
            // tapa::istream<uint32_t>& dataCnt_strm,
            uint64_t OUT0_32b_8b,
            uint64_t OUT1_16b_8b,
            uint64_t OUT2_16b_8b,
            uint64_t OUT3_8b)
;
void data_decoding(uint64_t  input_port,
                    uint64_t  output_port0_32b_8b,
                    uint64_t  output_port1_16b_8b,
                    uint64_t  output_port2_16b_8b,
                    uint64_t  output_port3_8b,
                    uint64_t  output_port4_Track,
                    uint32_t wait_count,
                    uint32_t data_count)
;
