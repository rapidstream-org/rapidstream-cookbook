


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
{
#pragma HLS disaggregate variable = data_in
#pragma HLS interface ap_fifo port = data_in._
#pragma HLS aggregate variable = data_in._ bit
#pragma HLS interface ap_fifo port = data_in._peek
#pragma HLS aggregate variable = data_in._peek bit
void(data_in._.empty());
void(data_in._peek.empty());

#pragma HLS disaggregate variable = meta_in
#pragma HLS interface ap_fifo port = meta_in._
#pragma HLS aggregate variable = meta_in._ bit
#pragma HLS interface ap_fifo port = meta_in._peek
#pragma HLS aggregate variable = meta_in._peek bit
void(meta_in._.empty());
void(meta_in._peek.empty());

#pragma HLS disaggregate variable = outAll_Pstrm
#pragma HLS array_partition variable = outAll_Pstrm complete
#pragma HLS interface ap_fifo port = outAll_Pstrm[0]._
#pragma HLS aggregate variable = outAll_Pstrm[0]._ bit
void(outAll_Pstrm[0]._.full());
#pragma HLS interface ap_fifo port = outAll_Pstrm[1]._
#pragma HLS aggregate variable = outAll_Pstrm[1]._ bit
void(outAll_Pstrm[1]._.full());
#pragma HLS interface ap_fifo port = outAll_Pstrm[2]._
#pragma HLS aggregate variable = outAll_Pstrm[2]._ bit
void(outAll_Pstrm[2]._.full());
#pragma HLS interface ap_fifo port = outAll_Pstrm[3]._
#pragma HLS aggregate variable = outAll_Pstrm[3]._ bit
void(outAll_Pstrm[3]._.full());

#pragma HLS disaggregate variable = outSR_Pstrm
#pragma HLS interface ap_fifo port = outSR_Pstrm._
#pragma HLS aggregate variable = outSR_Pstrm._ bit
void(outSR_Pstrm._.full());

#pragma HLS disaggregate variable = meta_out
#pragma HLS array_partition variable = meta_out complete
#pragma HLS interface ap_fifo port = meta_out[0]._
#pragma HLS aggregate variable = meta_out[0]._ bit
void(meta_out[0]._.full());
#pragma HLS interface ap_fifo port = meta_out[1]._
#pragma HLS aggregate variable = meta_out[1]._ bit
void(meta_out[1]._.full());
#pragma HLS interface ap_fifo port = meta_out[2]._
#pragma HLS aggregate variable = meta_out[2]._ bit
void(meta_out[2]._.full());
#pragma HLS interface ap_fifo port = meta_out[3]._
#pragma HLS aggregate variable = meta_out[3]._ bit
void(meta_out[3]._.full());

#pragma HLS disaggregate variable = SR_meta_out
#pragma HLS interface ap_fifo port = SR_meta_out._
#pragma HLS aggregate variable = SR_meta_out._ bit
void(SR_meta_out._.full());

#pragma HLS disaggregate variable = All_meta_out
#pragma HLS interface ap_fifo port = All_meta_out._
#pragma HLS aggregate variable = All_meta_out._ bit
void(All_meta_out._.full());

#pragma HLS disaggregate variable = Dec_type_Out
#pragma HLS interface ap_fifo port = Dec_type_Out._
#pragma HLS aggregate variable = Dec_type_Out._ bit
void(Dec_type_Out._.full());

    bool dRead = true;
    bool proc = false;
    // bool my_proc =false;
    _2048b myData = 0;
    _512b tempData = 0;
    _256b metaData = 0;
    _256b MymetaData = 0;
    uint32_t DrunLength = 0;
    uint32_t d_count = 0;
    uint8_t bitSize = 0;
    uint8_t DecType = 0;
    uint32_t runLength = 0;
    bool BSF = 0;
    bool mBSF = 0;
    uint32_t BV = 0;
    uint32_t DB = 0;
    uint32_t SDS = 0;
    uint32_t T_CYCLES = 0;
    uint32_t PLL = 0;
    uint32_t data_counter = 0;
    uint32_t pa_counter = 0;
    uint64_t metaPort_D = 0;
    uint32_t PLL_SUM = 0;
    // uint32_t temp_counter = 0;
    data_sender:for(;;)
    {
#pragma HLS pipeline II=1
        if(dRead)
        {
            if((!data_in.empty()) && (!meta_in.empty()))
            {
                proc = true;
                myData = data_in.read();
                metaData = meta_in.read();
                DrunLength = myData.range(31,0);
                bitSize = metaData.range(31,0);
                DecType = metaData.range(63,32);
                runLength = metaData.range(95,64);
                BSF = metaData.range(127,96);
                BV = metaData.range(159,128);
                DB = metaData.range(191,160);
                SDS = metaData.range(223,192);
                PLL = metaData.range(255,224);
                mBSF = BSF;
                T_CYCLES = DrunLength;
                dRead = (bitSize!=0) ? true:false;
            }
            //////////////////////////////////////////////
        }
        if(proc)
        {
            Dec_type_Out.write(DecType); //for data_aligner to check the streams
            metaPort_D = BV;
            metaPort_D = (metaPort_D << 16) | runLength;
            metaPort_D = (metaPort_D << 16) | DecType;
            //DecType, RL , BV
            All_meta_out.write(metaPort_D); //Send Data for metaData Port required to handle patched
            if(bitSize != 0)
            {
                proc = false;
                // dRead = true;
                MymetaData = metaData;
                MymetaData.range(193,192) = 0; //Changes the endianness when it is 0
                if(DecType == SR)
                {
                    outSR_Pstrm.write(myData.range(bitSize-1,0));
                }
                else if(BSF) //for delta only, for SR this is also 1
                {
                    if(bitSize == 32)
                    {
                        outAll_Pstrm[0].write(myData.range(447,0)); //Sending 448bits ~ 14Deltas
                        outAll_Pstrm[1].write(myData.range(959,448)); //Sending 512*3bits ~ 16*3Deltas
                        outAll_Pstrm[2].write(myData.range(1471,960)); //Sending 512*3bits ~ 16*3Deltas
                        outAll_Pstrm[3].write(myData.range(1983,1472)); //Sending 512*3bits ~ 16*3Deltas
                    }
                    else if(bitSize == 24)
                    {
                        outAll_Pstrm[0].write(myData.range(335,0)); //Sending 336 ~ 14Deltas
                        outAll_Pstrm[1].write(myData.range(719,336)); //Sending 384*3bits ~ 16*3Deltas
                        outAll_Pstrm[2].write(myData.range(1103,720)); //Sending 384*3bits ~ 16*3Deltas
                        outAll_Pstrm[3].write(myData.range(1487,1104)); //Sending 384*3bits ~ 16*3Deltas
                    }
                    else if(bitSize == 16)
                    {
                        outAll_Pstrm[0].write(myData.range(223,0)); //Sending 224 ~ 14Deltas
                        outAll_Pstrm[1].write(myData.range(479,224)); //Sending 256*3bits ~ 16*3Deltas
                        outAll_Pstrm[2].write(myData.range(735,480)); //Sending 256*3bits ~ 16*3Deltas
                        outAll_Pstrm[3].write(myData.range(991,736)); //Sending 256*3bits ~ 16*3Deltas
                    }
                    else if(bitSize == 8)
                    {
                        outAll_Pstrm[0].write(myData.range(111,0)); //Sending 112 ~ 14Deltas
                        outAll_Pstrm[1].write(myData.range(239,112)); //Sending 128*3bits ~ 16*3Deltas
                        outAll_Pstrm[2].write(myData.range(367,240)); //Sending 128*3bits ~ 16*3Deltas
                        outAll_Pstrm[3].write(myData.range(495,368)); //Sending 128*3bits ~ 16*3Deltas
                    }
                }
                else
                {
                    data_WriterBS:for(int k = 0; k < 4; k++)
                    {
#pragma HLS UNROLL
                        outAll_Pstrm[k].write(myData.range(((k+1)*SDS)-1,k*SDS)); //Sending 2048bits
                    }
                }
            }
            else //bitSize 0 for delta case
            {
                MymetaData = metaData;
                MymetaData.range(31,0) = 32; //change the bitSize to 32 bcz of BV and DB being 32
                MymetaData.range(127,96) = mBSF; //change BSF flag to 0 after 1st time
                MymetaData.range(193,192) = 1; // To Skip the endiannness change
                mBSF = 0;
                //Compute Delta will use meta data and insert BV for BSF == 1
                DB_COPY:for(int i = 0; i < PEs; i++)
                {
#pragma HLS unroll
                    tempData.range((i*32)+31,(i*32)) = DB;
                }
                data_WriterBS0:for(int k = 0; k < 4; k++)
                {
#pragma HLS UNROLL
                    outAll_Pstrm[k].write(tempData); //Sending 2048bits
                }
                if(d_count < T_CYCLES)
                {
                    d_count += 64;
                }
                else //(d_count >= DrunLength)
                {
                    d_count = 0;
                    proc = false;
                    dRead = true;
                }
            }
            if(DecType == SR)
            {
                SR_meta_out.write(bitSize);
            }
            else
            {
                send_meta:for(int i = 0;i < 4;i++)
                {
#pragma HLS UNROLL
                    meta_out[i].write(MymetaData);
                }
            }
        }
    }
}
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
