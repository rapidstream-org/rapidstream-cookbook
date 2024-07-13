


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
            tapa::async_mmap<_512b> &OUT0_32b_8b,
            tapa::async_mmap<_512b> &OUT1_16b_8b,
            tapa::async_mmap<_512b> &OUT2_16b_8b,
            tapa::async_mmap<_512b> &OUT3_8b)
{
#pragma HLS disaggregate variable = inAllStrm
#pragma HLS array_partition variable = inAllStrm complete
#pragma HLS interface ap_fifo port = inAllStrm[0]._
#pragma HLS aggregate variable = inAllStrm[0]._ bit
#pragma HLS interface ap_fifo port = inAllStrm[0]._peek
#pragma HLS aggregate variable = inAllStrm[0]._peek bit
void(inAllStrm[0]._.empty());
void(inAllStrm[0]._peek.empty());
#pragma HLS interface ap_fifo port = inAllStrm[1]._
#pragma HLS aggregate variable = inAllStrm[1]._ bit
#pragma HLS interface ap_fifo port = inAllStrm[1]._peek
#pragma HLS aggregate variable = inAllStrm[1]._peek bit
void(inAllStrm[1]._.empty());
void(inAllStrm[1]._peek.empty());
#pragma HLS interface ap_fifo port = inAllStrm[2]._
#pragma HLS aggregate variable = inAllStrm[2]._ bit
#pragma HLS interface ap_fifo port = inAllStrm[2]._peek
#pragma HLS aggregate variable = inAllStrm[2]._peek bit
void(inAllStrm[2]._.empty());
void(inAllStrm[2]._peek.empty());
#pragma HLS interface ap_fifo port = inAllStrm[3]._
#pragma HLS aggregate variable = inAllStrm[3]._ bit
#pragma HLS interface ap_fifo port = inAllStrm[3]._peek
#pragma HLS aggregate variable = inAllStrm[3]._peek bit
void(inAllStrm[3]._.empty());
void(inAllStrm[3]._peek.empty());

#pragma HLS disaggregate variable = rst_StrmL
#pragma HLS interface ap_fifo port = rst_StrmL._
#pragma HLS aggregate variable = rst_StrmL._ bit
#pragma HLS interface ap_fifo port = rst_StrmL._peek
#pragma HLS aggregate variable = rst_StrmL._peek bit
void(rst_StrmL._.empty());
void(rst_StrmL._peek.empty());

#pragma HLS disaggregate variable = OUT0_32b_8b
#pragma HLS interface ap_fifo port = OUT0_32b_8b.read_addr._
#pragma HLS aggregate variable = OUT0_32b_8b.read_addr._  bit
#pragma HLS interface ap_fifo port = OUT0_32b_8b.read_data._
#pragma HLS aggregate variable = OUT0_32b_8b.read_data._  bit
#pragma HLS interface ap_fifo port = OUT0_32b_8b.write_addr._
#pragma HLS aggregate variable = OUT0_32b_8b.write_addr._  bit
#pragma HLS interface ap_fifo port = OUT0_32b_8b.write_data._
#pragma HLS aggregate variable = OUT0_32b_8b.write_data._  bit
#pragma HLS interface ap_fifo port = OUT0_32b_8b.write_resp._
#pragma HLS aggregate variable = OUT0_32b_8b.write_resp._  bit
#pragma HLS disaggregate variable = OUT0_32b_8b .read_data
#pragma HLS interface ap_fifo port = OUT0_32b_8b.read_data._peek
#pragma HLS aggregate variable = OUT0_32b_8b.read_data._peek bit
#pragma HLS disaggregate variable = OUT0_32b_8b .write_resp
#pragma HLS interface ap_fifo port = OUT0_32b_8b.write_resp._peek
#pragma HLS aggregate variable = OUT0_32b_8b.write_resp._peek bit
void(OUT0_32b_8b.read_addr._.full());
void(OUT0_32b_8b.read_data._.empty());
void(OUT0_32b_8b.read_data._peek.empty());
void(OUT0_32b_8b.write_addr._.full());
void(OUT0_32b_8b.write_data._.full());
void(OUT0_32b_8b.write_resp._.empty());
void(OUT0_32b_8b.write_resp._peek.empty());

#pragma HLS disaggregate variable = OUT1_16b_8b
#pragma HLS interface ap_fifo port = OUT1_16b_8b.read_addr._
#pragma HLS aggregate variable = OUT1_16b_8b.read_addr._  bit
#pragma HLS interface ap_fifo port = OUT1_16b_8b.read_data._
#pragma HLS aggregate variable = OUT1_16b_8b.read_data._  bit
#pragma HLS interface ap_fifo port = OUT1_16b_8b.write_addr._
#pragma HLS aggregate variable = OUT1_16b_8b.write_addr._  bit
#pragma HLS interface ap_fifo port = OUT1_16b_8b.write_data._
#pragma HLS aggregate variable = OUT1_16b_8b.write_data._  bit
#pragma HLS interface ap_fifo port = OUT1_16b_8b.write_resp._
#pragma HLS aggregate variable = OUT1_16b_8b.write_resp._  bit
#pragma HLS disaggregate variable = OUT1_16b_8b .read_data
#pragma HLS interface ap_fifo port = OUT1_16b_8b.read_data._peek
#pragma HLS aggregate variable = OUT1_16b_8b.read_data._peek bit
#pragma HLS disaggregate variable = OUT1_16b_8b .write_resp
#pragma HLS interface ap_fifo port = OUT1_16b_8b.write_resp._peek
#pragma HLS aggregate variable = OUT1_16b_8b.write_resp._peek bit
void(OUT1_16b_8b.read_addr._.full());
void(OUT1_16b_8b.read_data._.empty());
void(OUT1_16b_8b.read_data._peek.empty());
void(OUT1_16b_8b.write_addr._.full());
void(OUT1_16b_8b.write_data._.full());
void(OUT1_16b_8b.write_resp._.empty());
void(OUT1_16b_8b.write_resp._peek.empty());

#pragma HLS disaggregate variable = OUT2_16b_8b
#pragma HLS interface ap_fifo port = OUT2_16b_8b.read_addr._
#pragma HLS aggregate variable = OUT2_16b_8b.read_addr._  bit
#pragma HLS interface ap_fifo port = OUT2_16b_8b.read_data._
#pragma HLS aggregate variable = OUT2_16b_8b.read_data._  bit
#pragma HLS interface ap_fifo port = OUT2_16b_8b.write_addr._
#pragma HLS aggregate variable = OUT2_16b_8b.write_addr._  bit
#pragma HLS interface ap_fifo port = OUT2_16b_8b.write_data._
#pragma HLS aggregate variable = OUT2_16b_8b.write_data._  bit
#pragma HLS interface ap_fifo port = OUT2_16b_8b.write_resp._
#pragma HLS aggregate variable = OUT2_16b_8b.write_resp._  bit
#pragma HLS disaggregate variable = OUT2_16b_8b .read_data
#pragma HLS interface ap_fifo port = OUT2_16b_8b.read_data._peek
#pragma HLS aggregate variable = OUT2_16b_8b.read_data._peek bit
#pragma HLS disaggregate variable = OUT2_16b_8b .write_resp
#pragma HLS interface ap_fifo port = OUT2_16b_8b.write_resp._peek
#pragma HLS aggregate variable = OUT2_16b_8b.write_resp._peek bit
void(OUT2_16b_8b.read_addr._.full());
void(OUT2_16b_8b.read_data._.empty());
void(OUT2_16b_8b.read_data._peek.empty());
void(OUT2_16b_8b.write_addr._.full());
void(OUT2_16b_8b.write_data._.full());
void(OUT2_16b_8b.write_resp._.empty());
void(OUT2_16b_8b.write_resp._peek.empty());

#pragma HLS disaggregate variable = OUT3_8b
#pragma HLS interface ap_fifo port = OUT3_8b.read_addr._
#pragma HLS aggregate variable = OUT3_8b.read_addr._  bit
#pragma HLS interface ap_fifo port = OUT3_8b.read_data._
#pragma HLS aggregate variable = OUT3_8b.read_data._  bit
#pragma HLS interface ap_fifo port = OUT3_8b.write_addr._
#pragma HLS aggregate variable = OUT3_8b.write_addr._  bit
#pragma HLS interface ap_fifo port = OUT3_8b.write_data._
#pragma HLS aggregate variable = OUT3_8b.write_data._  bit
#pragma HLS interface ap_fifo port = OUT3_8b.write_resp._
#pragma HLS aggregate variable = OUT3_8b.write_resp._  bit
#pragma HLS disaggregate variable = OUT3_8b .read_data
#pragma HLS interface ap_fifo port = OUT3_8b.read_data._peek
#pragma HLS aggregate variable = OUT3_8b.read_data._peek bit
#pragma HLS disaggregate variable = OUT3_8b .write_resp
#pragma HLS interface ap_fifo port = OUT3_8b.write_resp._peek
#pragma HLS aggregate variable = OUT3_8b.write_resp._peek bit
void(OUT3_8b.read_addr._.full());
void(OUT3_8b.read_data._.empty());
void(OUT3_8b.read_data._peek.empty());
void(OUT3_8b.write_addr._.full());
void(OUT3_8b.write_data._.full());
void(OUT3_8b.write_resp._.empty());
void(OUT3_8b.write_resp._peek.empty());

    uint32_t i_req_0 = 0, i_resp_0 = 0,
             i_req_1 = 0, i_resp_1 = 0,
             i_req_2 = 0, i_resp_2 = 0,
             i_req_3 = 0, i_resp_3 = 0;
    // uint32_t write_count = dataWR_Cnt; //dataWR_Cnt; //2147483647;
    // (i_resp_3 < write_count) ||
    // (i_resp_2 < write_count) ||
    // (i_resp_1 < write_count) ||
    // (i_resp_0 < write_count)
    store_loop32:for( ; ; )
    {
#pragma HLS pipeline II=1
        //reset stream
            if(!rst_StrmL.empty())
            {
                bool tmp = rst_StrmL.read();
                i_req_0 = 0;
                i_req_1 = 0;
                i_req_2 = 0;
                i_req_3 = 0;
            }
        // //Update Write Count
        //     if(!dataCnt_strm.empty())
        //     {
        //         write_count = dataCnt_strm.read();
        //     }
        //------PORT0_32Bits _ 8bits--------
            // issue write requests
            if((!inAllStrm[0].empty()) &&
                (!OUT0_32b_8b.write_addr.full()) &&
                (!OUT0_32b_8b.write_data.full())
                ){
            OUT0_32b_8b.write_addr.try_write(i_req_0);
            OUT0_32b_8b.write_data.try_write(inAllStrm[0].read(nullptr));
            ++i_req_0;
            }
            // receive acks of write success
            if (!OUT0_32b_8b.write_resp.empty()) {
            i_resp_0 =
                unsigned(OUT0_32b_8b.write_resp.read(nullptr)) + 1;
            }
        //------PORT1_16Bits _ 8bits--------
            // issue write requests
            if ((!inAllStrm[1].empty()) &&
                (!OUT1_16b_8b.write_addr.full()) &&
                (!OUT1_16b_8b.write_data.full())
                ) {
            OUT1_16b_8b.write_addr.try_write(i_req_1);
            OUT1_16b_8b.write_data.try_write(inAllStrm[1].read(nullptr));
            ++i_req_1;
            }
            // receive acks of write success
            if (!OUT1_16b_8b.write_resp.empty()) {
            i_resp_1 =
                unsigned(OUT1_16b_8b.write_resp.read(nullptr)) + 1;
            }
        //------PORT2_16Bits _ 8bits--------
            // issue write requests
            if ((!inAllStrm[2].empty()) &&
                (!OUT2_16b_8b.write_addr.full()) &&
                (!OUT2_16b_8b.write_data.full())
                ) {
            OUT2_16b_8b.write_addr.try_write(i_req_2);
            OUT2_16b_8b.write_data.try_write(inAllStrm[2].read(nullptr));
            ++i_req_2;
            }
            // receive acks of write success
            if (!OUT2_16b_8b.write_resp.empty()) {
            i_resp_2 =
                unsigned(OUT2_16b_8b.write_resp.read(nullptr)) + 1;
            }
        //------PORT3_8Bits--------
            // issue write requests
            if ((!inAllStrm[3].empty()) &&
                (!OUT3_8b.write_addr.full()) &&
                (!OUT3_8b.write_data.full())
                ) {
            OUT3_8b.write_addr.try_write(i_req_3);
            OUT3_8b.write_data.try_write(inAllStrm[3].read(nullptr));
            ++i_req_3;
            }
            // receive acks of write success
            if (!OUT3_8b.write_resp.empty()) {
            i_resp_3 =
                unsigned(OUT3_8b.write_resp.read(nullptr)) + 1;
            }
        //------PORT4_SR--------
            // // issue write requests
            // if (!inSR_Strm.empty() &&
            //     !OUT4_SR.write_addr.full() &&
            //     !OUT4_SR.write_data.full()) {
            // OUT4_SR.write_addr.try_write(i_req_4);
            // OUT4_SR.write_data.try_write(inSR_Strm.read(nullptr));
            // ++i_req_4;
            // }
            // // receive acks of write success
            // if (!OUT4_SR.write_resp.empty()) {
            // i_resp_4+ =
            //     unsigned(OUT4_SR.write_resp.read(nullptr)) + 1;
            // }
    }
}
void data_decoding(uint64_t  input_port,
                    uint64_t  output_port0_32b_8b,
                    uint64_t  output_port1_16b_8b,
                    uint64_t  output_port2_16b_8b,
                    uint64_t  output_port3_8b,
                    uint64_t  output_port4_Track,
                    uint32_t wait_count,
                    uint32_t data_count)
;
