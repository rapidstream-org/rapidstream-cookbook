


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
{
#pragma HLS disaggregate variable = PA_Strm
#pragma HLS interface ap_fifo port = PA_Strm._
#pragma HLS aggregate variable = PA_Strm._ bit
#pragma HLS interface ap_fifo port = PA_Strm._peek
#pragma HLS aggregate variable = PA_Strm._peek bit
void(PA_Strm._.empty());
void(PA_Strm._peek.empty());

#pragma HLS disaggregate variable = PA_meta_Strm
#pragma HLS interface ap_fifo port = PA_meta_Strm._
#pragma HLS aggregate variable = PA_meta_Strm._ bit
#pragma HLS interface ap_fifo port = PA_meta_Strm._peek
#pragma HLS aggregate variable = PA_meta_Strm._peek bit
void(PA_meta_Strm._.empty());
void(PA_meta_Strm._peek.empty());

#pragma HLS disaggregate variable = metaOutPA_Strm
#pragma HLS interface ap_fifo port = metaOutPA_Strm._
#pragma HLS aggregate variable = metaOutPA_Strm._ bit
void(metaOutPA_Strm._.full());

    bool dRead = true;
    bool meta_Proc = false;
    _512b pa_data = 0;
    ap_uint<32> pa_meta = 0;
    uint8_t CLBW = 0;
    uint8_t myCLBW = 0;
    uint8_t PW = 0;
    uint8_t bitSize = 0;
    uint8_t PLL = 0;
    uint8_t pll_count = 0;
    uint32_t pa_bytes[4] = {0};
    ap_uint<32> pa_gap = 0;
    uint8_t bitShifter_8b = 0;
    uint8_t bitShifter_16b = 0;
    uint8_t bitShifter_24b = 0;
    uint8_t bitShifter_32b = 0;
    uint8_t right_Shift = 0;
    uint8_t pa_mask = 0;
    uint32_t old_data = 0;
    ap_uint<32> myData = 0;
    uint16_t gap_val = 0;
    uint32_t patch_val = 0;
    uint64_t metaData = 0;
    uint32_t saved_data = 0;
    uint16_t append_shift = 0;
    bool first_time = false;
    // uint16_t tt_var = 0;
    //masking data
    const uint8_t pa_maskOLD[9] = {0,1,3,7,15,31,63,127,255}; //cannot be greater than 8 bits
    // #pragma HLS bind_storage variable=pa_maskOLD type=ROM_2P impl=bram
    PA_meta:for( ;; )
    {
#pragma HLS pipeline II=1
        //Give cycle to stable
        if((!PA_Strm.empty()) && (!PA_meta_Strm.empty()))
        {
            if(dRead)
            {
                dRead = false;
                meta_Proc = true;
                first_time = true;
                pa_data = PA_Strm.read();
                pa_meta = PA_meta_Strm.read(); //CLBW, PW, bitSize, PLL
                CLBW = pa_meta.range(7,0);
                PW = pa_meta.range(15,8);
                bitSize = pa_meta.range(23,16);
                PLL = pa_meta.range(31,24);
                myCLBW = CLBW;
            }
        }
        if(meta_Proc)
        {
            //Based on CLBW divide the data and udpate endianness
            // bufferWriteTemp = pa_data.range(CLBW-1, 0); //BitSize any Size
            if(first_time)
            {
                first_time = false;
                uint8_t temp_var = (myCLBW%8);
                if(temp_var != 0)
                {
                    myCLBW += (8-temp_var); // make it byte aligned
                    //how many bits to throw
                    if(CLBW > 24)
                    {
                        right_Shift = 32-CLBW;
                    }
                    else if(CLBW > 16)
                    {
                        right_Shift = 24-CLBW;
                    }
                    else if(CLBW > 8)
                    {
                        right_Shift = 16-CLBW;
                    }
                    else
                    {
                        right_Shift = 0;
                    }
                    //mask for reusing the bits in next cycle
                    pa_mask = pa_maskOLD[right_Shift];
                }
                else
                {
                    right_Shift = 0;
                    pa_mask = 0;
                }
                bitShifter_8b = myCLBW - 8;
                bitShifter_16b = (myCLBW <= 8) ? 40 : (myCLBW - 16);
                bitShifter_24b = (myCLBW <= 16) ? 40 : (myCLBW - 24);
                bitShifter_32b = (myCLBW <= 24) ? 40 : (myCLBW - 32);
            }
            else if(pll_count >= PLL)
            {
                meta_Proc = false;
                dRead = true;
                pll_count = 0;
                pa_data = 0;
                old_data = 0;
                saved_data = 0;
                append_shift = 0;
            }
            else
            {
                // pa_data = (pa_data << right_Shift) | old_data;
                myData = pa_data.range(myCLBW-1,0);
                pa_gap = (myData.range(7,0) << bitShifter_8b) | (myData.range(15,8) << bitShifter_16b) |
                        (myData.range(23,16) << bitShifter_24b) | (myData.range(31,24) << bitShifter_32b);
                old_data = pa_gap & pa_mask;
                saved_data = saved_data << append_shift;
                pa_gap = pa_gap >> right_Shift;
                pa_gap |= saved_data;
                gap_val = pa_gap >> PW;
                patch_val = pa_gap.range(PW-1,0);
                patch_val = patch_val << bitSize;
                metaData = patch_val;
                metaData = metaData << 16 | gap_val;
                metaData = metaData << 8 | PLL;
                //PLL, gap_val, Patch_val
                metaOutPA_Strm.write(metaData);
                pa_data = pa_data >> myCLBW;
                saved_data = old_data;
                if((right_Shift + 8) >= CLBW)
                {
                    myCLBW = 8;
                }
                else if((right_Shift + 16) >= CLBW)
                {
                    myCLBW = 16;
                }
                else if((right_Shift + 24) >= CLBW)
                {
                    myCLBW = 24;
                }
                else if((right_Shift + 32) >= CLBW)
                {
                    myCLBW = 32;
                }
                right_Shift = (right_Shift + myCLBW) - CLBW;
                append_shift = myCLBW - right_Shift;
                //mask for reusing the bits in next cycle
                pa_mask = pa_maskOLD[right_Shift];
                bitShifter_8b = myCLBW - 8;
                bitShifter_16b = (myCLBW <= 8) ? 40 : (myCLBW - 16);
                bitShifter_24b = (myCLBW <= 16) ? 40 : (myCLBW - 24);
                bitShifter_32b = (myCLBW <= 24) ? 40 : (myCLBW - 32);
                pll_count += 1;
            }
        }
    }
}
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
