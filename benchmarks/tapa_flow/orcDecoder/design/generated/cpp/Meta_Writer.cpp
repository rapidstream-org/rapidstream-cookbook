


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
;
void Meta_Writer(tapa::istream<_128b>& PA_metaStrm,
                tapa::istream<bool>& rst_StrmDS,
                // tapa::istream<uint32_t>& complete_count,
                tapa::async_mmap<_128b>& metaPort_Out
                // uint32_t KRNL_Data_Write
                )
{
#pragma HLS disaggregate variable = PA_metaStrm
#pragma HLS interface ap_fifo port = PA_metaStrm._
#pragma HLS aggregate variable = PA_metaStrm._ bit
#pragma HLS interface ap_fifo port = PA_metaStrm._peek
#pragma HLS aggregate variable = PA_metaStrm._peek bit
void(PA_metaStrm._.empty());
void(PA_metaStrm._peek.empty());

#pragma HLS disaggregate variable = rst_StrmDS
#pragma HLS interface ap_fifo port = rst_StrmDS._
#pragma HLS aggregate variable = rst_StrmDS._ bit
#pragma HLS interface ap_fifo port = rst_StrmDS._peek
#pragma HLS aggregate variable = rst_StrmDS._peek bit
void(rst_StrmDS._.empty());
void(rst_StrmDS._peek.empty());

#pragma HLS disaggregate variable = metaPort_Out
#pragma HLS interface ap_fifo port = metaPort_Out.read_addr._
#pragma HLS aggregate variable = metaPort_Out.read_addr._  bit
#pragma HLS interface ap_fifo port = metaPort_Out.read_data._
#pragma HLS aggregate variable = metaPort_Out.read_data._  bit
#pragma HLS interface ap_fifo port = metaPort_Out.write_addr._
#pragma HLS aggregate variable = metaPort_Out.write_addr._  bit
#pragma HLS interface ap_fifo port = metaPort_Out.write_data._
#pragma HLS aggregate variable = metaPort_Out.write_data._  bit
#pragma HLS interface ap_fifo port = metaPort_Out.write_resp._
#pragma HLS aggregate variable = metaPort_Out.write_resp._  bit
#pragma HLS disaggregate variable = metaPort_Out .read_data
#pragma HLS interface ap_fifo port = metaPort_Out.read_data._peek
#pragma HLS aggregate variable = metaPort_Out.read_data._peek bit
#pragma HLS disaggregate variable = metaPort_Out .write_resp
#pragma HLS interface ap_fifo port = metaPort_Out.write_resp._peek
#pragma HLS aggregate variable = metaPort_Out.write_resp._peek bit
void(metaPort_Out.read_addr._.full());
void(metaPort_Out.read_data._.empty());
void(metaPort_Out.read_data._peek.empty());
void(metaPort_Out.write_addr._.full());
void(metaPort_Out.write_data._.full());
void(metaPort_Out.write_resp._.empty());
void(metaPort_Out.write_resp._peek.empty());

    uint32_t i_req_0 = 0, i_resp_0 = 0;
    // uint32_t write_count = metaWR_Cnt; //metaWR_Cnt; //2147483647;
    // uint32_t Rwrite_count = 0;
    // (i_resp_0 < write_count)
    store_meta:for( ; ; )
    {
#pragma HLS pipeline II=1
        //reset Stream
            if(!rst_StrmDS.empty())
            {
                bool tmp = rst_StrmDS.read();
                i_req_0 = 0;
            }
        //Update Write Count
        // if(!complete_count.empty())
        // {
        //     write_count = complete_count.read();
        //     // write_count = write_count+Rwrite_count;
        // }
        // issue write requests
        if((!PA_metaStrm.empty()) &&
            (!metaPort_Out.write_addr.full()) &&
            (!metaPort_Out.write_data.full())
            )
        {
            metaPort_Out.write_addr.try_write(i_req_0);
            metaPort_Out.write_data.try_write(PA_metaStrm.read(nullptr));
            ++i_req_0;
        }
        // receive acks of write success
        if (!metaPort_Out.write_resp.empty()) {
            i_resp_0 = unsigned(metaPort_Out.write_resp.read(nullptr)) + 1;
        }
    }
}
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