


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
{
#pragma HLS disaggregate variable = in_Cstrm
#pragma HLS interface ap_fifo port = in_Cstrm._
#pragma HLS aggregate variable = in_Cstrm._ bit
#pragma HLS interface ap_fifo port = in_Cstrm._peek
#pragma HLS aggregate variable = in_Cstrm._peek bit
void(in_Cstrm._.empty());
void(in_Cstrm._peek.empty());

#pragma HLS disaggregate variable = in_Trstrm
#pragma HLS interface ap_fifo port = in_Trstrm._
#pragma HLS aggregate variable = in_Trstrm._ bit
#pragma HLS interface ap_fifo port = in_Trstrm._peek
#pragma HLS aggregate variable = in_Trstrm._peek bit
void(in_Trstrm._.empty());
void(in_Trstrm._peek.empty());

#pragma HLS disaggregate variable = out_Cmeta_strm
#pragma HLS interface ap_fifo port = out_Cmeta_strm._
#pragma HLS aggregate variable = out_Cmeta_strm._ bit
void(out_Cmeta_strm._.full());

#pragma HLS disaggregate variable = out_Cstrm
#pragma HLS interface ap_fifo port = out_Cstrm._
#pragma HLS aggregate variable = out_Cstrm._ bit
void(out_Cstrm._.full());

#pragma HLS disaggregate variable = DI_strm
#pragma HLS interface ap_fifo port = DI_strm._
#pragma HLS aggregate variable = DI_strm._ bit
void(DI_strm._.full());

#pragma HLS disaggregate variable = PA_strm
#pragma HLS interface ap_fifo port = PA_strm._
#pragma HLS aggregate variable = PA_strm._ bit
void(PA_strm._.full());

#pragma HLS disaggregate variable = PA_meta_strm
#pragma HLS interface ap_fifo port = PA_meta_strm._
#pragma HLS aggregate variable = PA_meta_strm._ bit
void(PA_meta_strm._.full());


    ap_uint<AXI_WIDTH> data_buffer = 0;
    _256b track_buffer = 0;
    uint32_t bitSize = 0;
    uint8_t DecType = 0; //Last Data Cycle Flag
    uint32_t BSF = 0; //Batch Start Flag
    int32_t BV = 0;
    int32_t DB = 0;
    // uint16_t runLength = 0;
    uint32_t metadata = 0;
    ap_uint<32> bufferWriteTemp[PEs] = {0};
    int32_t bufferWrite[PEs] = {0};
    ap_uint<AXI_WIDTH> bufferWriteStrm = 0;
    bool disableShift = false;
    uint32_t bitShifter_32b = 0;
    uint32_t bitShifter_24b = 0;
    uint32_t bitShifter_16b = 0;
    uint32_t bitShifter_8b = 0;
    // #pragma HLS bind_storage variable=bufferWrite type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=bufferWriteTemp type=RAM_2P impl=bram
    compute_deltas:for(;;)
    {
#pragma HLS pipeline II=1
        if((!in_Cstrm.empty()) && (!in_Trstrm.empty()))
        {
            bufferWriteStrm = 0;
            bufferWriteTemp[PEs-1] = {0};
            bufferWrite[PEs-1] = {0};
            data_buffer = in_Cstrm.read();
            //Data (BITSIZE, DecType, BSF, BV, DB)
            track_buffer = in_Trstrm.read();
            bitSize = track_buffer.range(31,0);
            DecType = track_buffer.range(63,32);
            // runLength = track_buffer.range(95,64);
            BSF = track_buffer.range(127,96);
            BV = track_buffer.range(159,128);
            DB = track_buffer.range(191,160);
            disableShift = track_buffer.range(193,192);
            bitShifter_8b = bitSize - 8;
            bitShifter_16b = (bitSize <= 8) ? 40 : (bitSize - 16);
            bitShifter_24b = (bitSize <= 16) ? 40 : (bitSize - 24);
            bitShifter_32b = (bitSize <= 24) ? 40 : (bitSize - 32);
            DELTA_di_load:for(int i = 0; i < PEs; i++) //16
            {
#pragma HLS UNROLL
                bufferWriteTemp[i] = data_buffer.range(((i+1)*bitSize)-1, i*bitSize); //BitSize == 32
            }
            if(disableShift)
            {
                delta_cpy:for(int i = 0; i < PEs; i++)
                {
#pragma HLS UNROLL
                    bufferWrite[i] = bufferWriteTemp[i];
                }
            }
            else
            {
                DELTA_di_endian:for(int i = 0; i < PEs; i++)
                {
#pragma HLS UNROLL
                    bufferWrite[i] = (bufferWriteTemp[i].range(7,0) << bitShifter_8b) | (bufferWriteTemp[i].range(15,8) << bitShifter_16b) |
                                    (bufferWriteTemp[i].range(23,16) << bitShifter_24b) | (bufferWriteTemp[i].range(31,24) << bitShifter_32b);
                }
            }
            if(DecType == DIRECT)
            {
                unzigzag:for(int i = 0; i < PEs; i++)
                {
#pragma HLS UNROLL
                    bufferWriteStrm.range(((i*32)+31),(i*32)) = (ap_int<32>)((((ap_uint<32>)bufferWrite[i]) >> 1) ^ (-1*(((ap_uint<32>)bufferWrite[i]) & 1)));
                }
                DI_strm.write(bufferWriteStrm);
            }
            else
            {
                if(DB < 0)
                {
                    NO_unzigzagA:for(int i = 0; i < PEs; i++)
                    {
#pragma HLS UNROLL
                        bufferWriteStrm.range(((i*32)+31),(i*32)) = (int32_t)(-1*bufferWrite[i]);
                    }
                }
                else
                {
                    NO_unzigzagB:for(int i = 0; i < PEs; i++)
                    {
#pragma HLS UNROLL
                        bufferWriteStrm.range(((i*32)+31),(i*32)) = bufferWrite[i];
                    }
                }
                if(DecType == DELTA)
                {
                    if(compD_ID == 0)
                    {
                        metadata = BSF;
                        //Data (BSF, FDCF, LDCF)
                        out_Cmeta_strm.write(metadata);
                        if(BSF == 1)
                        {
                            bufferWriteStrm = (bufferWriteStrm << 32)| (uint32_t)(DB);
                            bufferWriteStrm = (bufferWriteStrm << 32) | (uint32_t)(BV);
                        }
                        else
                        {
                            bufferWriteStrm = bufferWriteStrm;
                        }
                    }
                    else
                    {
                        bufferWriteStrm = bufferWriteStrm;
                    }
                    out_Cstrm.write(bufferWriteStrm);
                }
                else
                {
                    PA_meta_strm.write((uint32_t)(BV)); //convert to int in the accumulator
                    PA_strm.write(bufferWriteStrm);
                }
            }
        }
    }
}
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
