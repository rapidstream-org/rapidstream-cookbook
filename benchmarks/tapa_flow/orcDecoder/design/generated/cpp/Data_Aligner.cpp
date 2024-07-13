


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
{
#pragma HLS disaggregate variable = inTrackStrm
#pragma HLS interface ap_fifo port = inTrackStrm._
#pragma HLS aggregate variable = inTrackStrm._ bit
#pragma HLS interface ap_fifo port = inTrackStrm._peek
#pragma HLS aggregate variable = inTrackStrm._peek bit
void(inTrackStrm._.empty());
void(inTrackStrm._peek.empty());

#pragma HLS disaggregate variable = inDEStrm
#pragma HLS array_partition variable = inDEStrm complete
#pragma HLS interface ap_fifo port = inDEStrm[0]._
#pragma HLS aggregate variable = inDEStrm[0]._ bit
#pragma HLS interface ap_fifo port = inDEStrm[0]._peek
#pragma HLS aggregate variable = inDEStrm[0]._peek bit
void(inDEStrm[0]._.empty());
void(inDEStrm[0]._peek.empty());
#pragma HLS interface ap_fifo port = inDEStrm[1]._
#pragma HLS aggregate variable = inDEStrm[1]._ bit
#pragma HLS interface ap_fifo port = inDEStrm[1]._peek
#pragma HLS aggregate variable = inDEStrm[1]._peek bit
void(inDEStrm[1]._.empty());
void(inDEStrm[1]._peek.empty());
#pragma HLS interface ap_fifo port = inDEStrm[2]._
#pragma HLS aggregate variable = inDEStrm[2]._ bit
#pragma HLS interface ap_fifo port = inDEStrm[2]._peek
#pragma HLS aggregate variable = inDEStrm[2]._peek bit
void(inDEStrm[2]._.empty());
void(inDEStrm[2]._peek.empty());
#pragma HLS interface ap_fifo port = inDEStrm[3]._
#pragma HLS aggregate variable = inDEStrm[3]._ bit
#pragma HLS interface ap_fifo port = inDEStrm[3]._peek
#pragma HLS aggregate variable = inDEStrm[3]._peek bit
void(inDEStrm[3]._.empty());
void(inDEStrm[3]._peek.empty());

#pragma HLS disaggregate variable = inDIStrm
#pragma HLS array_partition variable = inDIStrm complete
#pragma HLS interface ap_fifo port = inDIStrm[0]._
#pragma HLS aggregate variable = inDIStrm[0]._ bit
#pragma HLS interface ap_fifo port = inDIStrm[0]._peek
#pragma HLS aggregate variable = inDIStrm[0]._peek bit
void(inDIStrm[0]._.empty());
void(inDIStrm[0]._peek.empty());
#pragma HLS interface ap_fifo port = inDIStrm[1]._
#pragma HLS aggregate variable = inDIStrm[1]._ bit
#pragma HLS interface ap_fifo port = inDIStrm[1]._peek
#pragma HLS aggregate variable = inDIStrm[1]._peek bit
void(inDIStrm[1]._.empty());
void(inDIStrm[1]._peek.empty());
#pragma HLS interface ap_fifo port = inDIStrm[2]._
#pragma HLS aggregate variable = inDIStrm[2]._ bit
#pragma HLS interface ap_fifo port = inDIStrm[2]._peek
#pragma HLS aggregate variable = inDIStrm[2]._peek bit
void(inDIStrm[2]._.empty());
void(inDIStrm[2]._peek.empty());
#pragma HLS interface ap_fifo port = inDIStrm[3]._
#pragma HLS aggregate variable = inDIStrm[3]._ bit
#pragma HLS interface ap_fifo port = inDIStrm[3]._peek
#pragma HLS aggregate variable = inDIStrm[3]._peek bit
void(inDIStrm[3]._.empty());
void(inDIStrm[3]._peek.empty());

#pragma HLS disaggregate variable = inPAStrm
#pragma HLS array_partition variable = inPAStrm complete
#pragma HLS interface ap_fifo port = inPAStrm[0]._
#pragma HLS aggregate variable = inPAStrm[0]._ bit
#pragma HLS interface ap_fifo port = inPAStrm[0]._peek
#pragma HLS aggregate variable = inPAStrm[0]._peek bit
void(inPAStrm[0]._.empty());
void(inPAStrm[0]._peek.empty());
#pragma HLS interface ap_fifo port = inPAStrm[1]._
#pragma HLS aggregate variable = inPAStrm[1]._ bit
#pragma HLS interface ap_fifo port = inPAStrm[1]._peek
#pragma HLS aggregate variable = inPAStrm[1]._peek bit
void(inPAStrm[1]._.empty());
void(inPAStrm[1]._peek.empty());
#pragma HLS interface ap_fifo port = inPAStrm[2]._
#pragma HLS aggregate variable = inPAStrm[2]._ bit
#pragma HLS interface ap_fifo port = inPAStrm[2]._peek
#pragma HLS aggregate variable = inPAStrm[2]._peek bit
void(inPAStrm[2]._.empty());
void(inPAStrm[2]._peek.empty());
#pragma HLS interface ap_fifo port = inPAStrm[3]._
#pragma HLS aggregate variable = inPAStrm[3]._ bit
#pragma HLS interface ap_fifo port = inPAStrm[3]._peek
#pragma HLS aggregate variable = inPAStrm[3]._peek bit
void(inPAStrm[3]._.empty());
void(inPAStrm[3]._peek.empty());

#pragma HLS disaggregate variable = inSRStrm
#pragma HLS interface ap_fifo port = inSRStrm._
#pragma HLS aggregate variable = inSRStrm._ bit
#pragma HLS interface ap_fifo port = inSRStrm._peek
#pragma HLS aggregate variable = inSRStrm._peek bit
void(inSRStrm._.empty());
void(inSRStrm._peek.empty());

#pragma HLS disaggregate variable = outWRStrm
#pragma HLS array_partition variable = outWRStrm complete
#pragma HLS interface ap_fifo port = outWRStrm[0]._
#pragma HLS aggregate variable = outWRStrm[0]._ bit
void(outWRStrm[0]._.full());
#pragma HLS interface ap_fifo port = outWRStrm[1]._
#pragma HLS aggregate variable = outWRStrm[1]._ bit
void(outWRStrm[1]._.full());
#pragma HLS interface ap_fifo port = outWRStrm[2]._
#pragma HLS aggregate variable = outWRStrm[2]._ bit
void(outWRStrm[2]._.full());
#pragma HLS interface ap_fifo port = outWRStrm[3]._
#pragma HLS aggregate variable = outWRStrm[3]._ bit
void(outWRStrm[3]._.full());

    uint8_t dec_type = 0;
    bool Read_Tr = true;
    data_align:for( ;; )
    {
#pragma HLS pipeline II=1
        if(!inTrackStrm.empty())
        {
            if(Read_Tr)
            {
                dec_type = inTrackStrm.read();
                Read_Tr = false;
            }
        }
        if(dec_type == DIRECT)
        {
            if((!inDIStrm[0].empty()) &&
                (!inDIStrm[1].empty()) &&
                (!inDIStrm[2].empty()) &&
                (!inDIStrm[3].empty())
                )
            {
                Read_Tr = true;
                dec_type = 10;
                write_DI:for(int i = 0; i < 4; i++)
                {
#pragma HLS UNROLL
                    outWRStrm[i].write(inDIStrm[i].read());
                }
            }
        }
        else if(dec_type == DELTA)
        {
            if((!inDEStrm[0].empty()) &&
                (!inDEStrm[1].empty()) &&
                (!inDEStrm[2].empty()) &&
                (!inDEStrm[3].empty())
                )
            {
                Read_Tr = true;
                dec_type = 10;
                write_DE:for(int i = 0; i < 4; i++)
                {
#pragma HLS UNROLL
                    outWRStrm[i].write(inDEStrm[i].read());
                }
            }
        }
        else if(dec_type == PATCHED)
        {
            if((!inPAStrm[0].empty()) &&
                (!inPAStrm[1].empty()) &&
                (!inPAStrm[2].empty()) &&
                (!inPAStrm[3].empty())
                )
            {
                Read_Tr = true;
                dec_type = 10;
                write_PA:for(int i = 0; i < 4; i++)
                {
#pragma HLS UNROLL
                    outWRStrm[i].write(inPAStrm[i].read());
                }
            }
        }
        else
        {
            if(!inSRStrm.empty())
            {
                Read_Tr = true;
                dec_type = 10;
                outWRStrm[0].write(inSRStrm.read());
                write_SR:for(int i = 1; i < 4; i++)
                {
#pragma HLS UNROLL
                    outWRStrm[i].write(0);
                }
            }
        }
    }
}
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
