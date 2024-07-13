


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
{
#pragma HLS disaggregate variable = data_in
#pragma HLS interface ap_fifo port = data_in._
#pragma HLS aggregate variable = data_in._ bit
#pragma HLS interface ap_fifo port = data_in._peek
#pragma HLS aggregate variable = data_in._peek bit
void(data_in._.empty());
void(data_in._peek.empty());

#pragma HLS disaggregate variable = rstStrm
#pragma HLS interface ap_fifo port = rstStrm._
#pragma HLS aggregate variable = rstStrm._ bit
#pragma HLS interface ap_fifo port = rstStrm._peek
#pragma HLS aggregate variable = rstStrm._peek bit
void(rstStrm._.empty());
void(rstStrm._peek.empty());

#pragma HLS disaggregate variable = outAll_Lstrm
#pragma HLS interface ap_fifo port = outAll_Lstrm._
#pragma HLS aggregate variable = outAll_Lstrm._ bit
void(outAll_Lstrm._.full());

#pragma HLS disaggregate variable = out_strmC_Track
#pragma HLS interface ap_fifo port = out_strmC_Track._
#pragma HLS aggregate variable = out_strmC_Track._ bit
void(out_strmC_Track._.full());

#pragma HLS disaggregate variable = PA_DATA
#pragma HLS interface ap_fifo port = PA_DATA._
#pragma HLS aggregate variable = PA_DATA._ bit
void(PA_DATA._.full());

#pragma HLS disaggregate variable = PA_metaDATA
#pragma HLS interface ap_fifo port = PA_metaDATA._
#pragma HLS aggregate variable = PA_metaDATA._ bit
void(PA_metaDATA._.full());

    ap_uint<AXI_WIDTH> b1 = 0; //Pipeline Depth of 7
    ap_uint<3584> b2 = 0;
    ap_uint<AXI_WIDTH> b3 = 0; //Just reducing the bitwidth of b2 by 512.
    ap_uint<1536> headerProc = 0;
    // ap_uint<1024> mheaderProc = 0;
    ap_uint<8> dec_type = 0;
    ap_uint<8> Datadec_type = 0;
    uint8_t bitSize = 1;
    uint32_t runLength = 0;
    uint32_t SEC_SHIFTER = 0;
    uint32_t FIRST_SHIFTER = 0;
    int32_t mFIRST_SHIFTER = 0;
    // uint16_t hd_off = 0;
    uint16_t DS_SDS = 0;
    uint8_t st_count = 0;
    uint8_t mHD_READ_OFF = 0;
    uint8_t HD_READ_OFF = 0;
    uint8_t mbitSize = 1;
    uint16_t mrunLength = 0;
    uint16_t SRrunLength = 0;
    uint32_t mSEC_SHIFTER = 0;
    ap_uint<3584> dSEND = 0; //Need atleast 80 bits more than 2048
    _256b TrackSEND = 0;
    bool first_time = 0;
    bool mfirst_time = 0;
    bool check_header_wait = 0;
    // bool shiftFlag = true;
    // bool mshiftFlag = false;
    // bool last_cycle = false;
    // uint16_t tr_count = 0;
    uint32_t shift_count = 0;
    uint32_t myShift = 0;
    uint32_t HD_COUNTS = 0;
    uint32_t T_SHIFTs = 16384;
    uint16_t d_loop = 0;
    uint16_t SDS = 0; //second_data_sender
    uint16_t FDS = 0; //First_data_sender
    uint8_t state = HEADER_ST;
    uint32_t myCount = 0;
    uint8_t fbo = 0;
    // uint32_t data_iter = 0;
    uint32_t buf_header = 0;
    // uint32_t data_counter = 0;
    uint8_t start_proc = 0;
    bool wait_adjust = 0;
    bool wait_cycles = 0;
    uint8_t wait_idx = 0;
    uint8_t wait_count = 0;
    bool bsf = 0;
    bool start_cycle = 0;
    uint8_t APPEND_DATA_SHIFTER = 0;
    uint8_t mAPPEND_DATA_SHIFTER = 0;
    // bool bit24head_FLG = 0;
    //Delta Decoder
    int32_t temp_val = 0;
    uint16_t tmpBS_DE = 0;
    uint8_t BV_idx = 0;
    ap_uint<64> rd_bytes[10] = {0};
    ap_uint<64> reg_data_0 = 0;
    ap_uint<64> reg_data_1 = 0;
    ap_uint<64> reg_data_2 = 0;
    ap_uint<64> reg_data_3 = 0;
    ap_uint<64> reg_data_4 = 0;
    uint32_t base_value = 0;
    uint32_t mbase_value = 0;
    uint8_t DB_idx = 0;
    uint32_t delta_base = 0;
    uint32_t mdelta_base = 0;
    uint8_t BV_S1 = 0;
    uint8_t BV_S2 = 0;
    uint8_t BV_S3 = 0;
    uint8_t BV_S4 = 0;
    uint8_t DB_S1 = 0;
    uint8_t DB_S2 = 0;
    uint8_t DB_S3 = 0;
    uint8_t DB_S4 = 0;
    uint32_t my_bv_val = 0;
    // bool data_incoming = 0;
    //Patched Decoder
    ap_uint<1536> Patch_Data_Proc = 0;
    uint8_t BV_Width = 0;
    uint8_t BV_Bits = 0;
    uint8_t PGW = 0;
    uint8_t PW = 0;
    uint8_t PLL = 0;
    uint64_t BV_mask = 0;
    uint8_t CLBW = 0;
    ap_uint<32> BV_PA = 0;
    int32_t BV_VAL_PA = 0;
    uint32_t patch_shifter = 0;
    uint8_t hd_waitCount = 0;
    uint16_t rem_PatchD = 0;
    uint16_t tr_thresh = 0;
    uint16_t patch_data_L = 0;
    uint8_t T_WAIT = 0;
    uint32_t PA_metaData = 0;
    uint32_t pa_counter = 0;
    uint32_t start_shift = 0;
    uint32_t patchPC_mul = 0;
    uint8_t PA_bitShifter_8b = 0;
    uint8_t PA_bitShifter_16b = 0;
    uint8_t PA_bitShifter_24b = 0;
    uint8_t PA_bitShifter_32b = 0;
    uint8_t D_PLL = 0;
    bool fPLL = 0;
    bool mfPLL = 0;
    bool temp_Rst = 0;
    // int i_resp = 0;
    // int My_Cntr = 0;
    //Short Repeat
    uint8_t SR_repWidth = 0;
    // uint8_t SR_repCount = 0;
    const uint16_t NDelta_BitMap[32] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
                                12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
                                23, 24, 26, 28, 30, 32, 40, 48, 56, 64};
    const uint8_t ClosestFixedBitsMap[65] = {
      1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
      22, 23, 24, 26, 26, 28, 28, 30, 30, 32, 32, 40, 40, 40, 40, 40, 40, 40, 40, 48, 48, 48,
      48, 48, 48, 48, 48, 56, 56, 56, 56, 56, 56, 56, 56, 64, 64, 64, 64, 64, 64, 64, 64};
    // #pragma HLS bind_storage variable=NDelta_BitMap type=ROM_2P impl=bram
    // #pragma HLS bind_storage variable=ClosestFixedBitsMap type=ROM_1P impl=bram
#pragma HLS ARRAY_PARTITION variable=rd_bytes complete dim=0
#pragma HLS BIND_OP variable=myCount op=mul impl=dsp latency=3
#pragma HLS BIND_OP variable=patchPC_mul op=mul impl=dsp latency=1
    LOAD_LOOP:for( ;; ) //7*64 (Pipeline Depth)*64...8*64=512
    {
#pragma HLS pipeline II=1
        if(!rstStrm.empty())
        {
            temp_Rst = rstStrm.read();
            b2 = 0; headerProc = 0; SRrunLength = 0; T_SHIFTs = 16384; //512=64*8
            mbitSize = 1; bitSize = 1; hd_waitCount = 0; myShift = 0;
            start_cycle = 0; wait_cycles = 0; start_proc = 0; dec_type = 0;
            d_loop = 0; runLength = 0; start_shift = 0; state = HEADER_ST;
            pa_counter = 0; HD_READ_OFF = 0; mSEC_SHIFTER = 0; wait_count = 0;
            wait_idx = 0; mAPPEND_DATA_SHIFTER = 0; st_count = 0; myCount = 0;
        }
        else if(!data_in.empty())
        {
            //starting next batch waste cycle
            if(wait_cycles == 1)
            {
                if(wait_idx == (wait_count))
                {
                    wait_idx = 0;
                    // extra_waits = 0;
                    wait_count = 0;
                    wait_cycles = 0;
                }
                else
                {
                    wait_idx += 1;
                }
            }
            else
            {
                if((d_loop < runLength)) //Last 512bits may or may not have data
                {
                    dSEND = 0;
                    dSEND = (b2 << 512) | b3;
                    //SEND DATA COUNT
                    // uint16_t sum = (bitSize == 0) ? 512:64;
                    d_loop = d_loop + 64;
                    if(bitSize == 16)
                    {
                        wait_cycles = 1 - wait_adjust;
                        // wait_count = 0; // wait 1 cycle
                    }
                    else if(bitSize == 24)
                    {
                        wait_cycles = 1;
                        wait_count = 1 - wait_adjust; // wait 2 cycle
                    }
                    else if(bitSize == 32) // bitSize == 32
                    {
                        wait_cycles = 1;
                        wait_count = 2 - wait_adjust; // wait 3 cycle
                    }
                    TrackSEND = 0;
                    bsf = first_time;
                    if(fPLL)
                    {
                        fPLL = 0;
                        TrackSEND.range(255,224) = D_PLL;
                    }
                    else
                    {
                        TrackSEND.range(255,224) = 0;
                    }
                    TrackSEND.range(223,192) = DS_SDS;
                    TrackSEND.range(191,160) = delta_base;
                    TrackSEND.range(159,128) = base_value;
                    TrackSEND.range(127,96) = bsf;
                    TrackSEND.range(95,64) = runLength;
                    TrackSEND.range(63,32) = Datadec_type;
                    TrackSEND.range(31,0) = bitSize;
                    //SEND METADATA
                    //Data (BITSIZE, DecType, runLength, BSF, BV, DB)
                    out_strmC_Track.write(TrackSEND);
                    //SEND DATA
                    if(first_time)
                    {
                        first_time = 0;
                        wait_adjust = 0;
                        dSEND = dSEND >> FIRST_SHIFTER;
                        if(APPEND_DATA_SHIFTER == 1)
                        {
                            buf_header = dSEND.range(511,504);
                        }
                        else
                        {
                            buf_header = 0;
                        }
                        if(Datadec_type == SR)
                        {
                            outAll_Lstrm.write(dSEND.range((bitSize-1)+512,512)); //offset 512 bcz data is not in b3
                        }
                        else
                        {
                            if(bitSize != 0)
                            {
                                outAll_Lstrm.write(dSEND.range(FDS,0)); //replace_F_SDS
                            }
                            else
                            {
                                outAll_Lstrm.write((runLength-64));
                            }
                        }
                    }
                    else
                    {
                        if(APPEND_DATA_SHIFTER == 1)
                        {
                            dSEND = (dSEND << 8) | buf_header;
                            buf_header = dSEND.range(519,512);
                        }
                        else
                        {
                            dSEND = dSEND >> SEC_SHIFTER;
                        }
                        outAll_Lstrm.write(dSEND.range(SDS,0));
                    }
                }
            }
            if(start_proc == 3)
            {
                start_cycle = 1;
            }
            else
            {
                start_proc += 1;
            }
            //Header Processing
            if(start_cycle)
            {
                if(state == HEADER_ST)
                {
                    //can be replaced with a next_state variable
                    if(dec_type == PATCHED)
                    {
                        state = PA_META_PROC;
                    }
                    else
                    {
                        state = HD_PROC;
                    }
                    if(HD_READ_OFF == 0)
                    {
                        headerProc = b2.range(3583,2560); //normal
                    }
                    else if(HD_READ_OFF == 1)
                    {
                        headerProc = b2.range(3575,2552); //get extra 8bits
                    }
                    else
                    {
                        headerProc = b2.range(1023,0); //bs==0 or short rep
                    }
                    headerProc = headerProc >> mSEC_SHIFTER;
                    check_header_wait = 0;
                    mHD_READ_OFF = 0; //reset it
                    st_count = 0;
                }
                else if(state == PA_META_PROC)
                {
                    uint32_t m_pa_shifter = 0;
                    //Currently Only works for 512 bit of Patch meta data
                    if(hd_waitCount >= T_WAIT) //Only if patches data exceed 512
                    {
                        state = HD_PROC;
                        hd_waitCount = 0;
                        // pa_counter = PLL;                              //For MetaWrite port
                        PA_metaData = PLL; //To Complete the Data count
                        PA_metaData = (PA_metaData << 8) | bitSize; //required to Patch Value
                        PA_metaData = (PA_metaData << 8) | PW; //required to get the GAP value
                        PA_metaData = (PA_metaData << 8) | CLBW; //required to Process the Data
                        PA_metaDATA.write(PA_metaData);
                        PA_DATA.write(headerProc.range(patch_data_L-1,0)); //patch_data_L should not be greater than 512
                        // paCnt_strm.write(pa_counter);
                        mSEC_SHIFTER = patch_shifter;
                        if(T_WAIT > 0)
                        {
                            m_pa_shifter = patch_shifter;
                            headerProc = Patch_Data_Proc;
                        }
                        else
                        {
                            m_pa_shifter = patch_data_L;
                            headerProc = headerProc;
                        }
                        headerProc = headerProc >> m_pa_shifter;
                    }
                    else
                    {
                        hd_waitCount += 1;
                        if(HD_READ_OFF == 0)
                        {
                            Patch_Data_Proc = b2.range(3583,2560); //get extra 8bits
                        }
                        else if(HD_READ_OFF == 1)
                        {
                            Patch_Data_Proc = b2.range(3575,2552); //get extra 8bits
                        }
                        else
                        {
                            Patch_Data_Proc = b2.range(1023,0); //get extra 8bits
                        }
                        state = PA_META_PROC;
                    }
                }
                else if(state == HD_PROC)
                {
                    dec_type = (headerProc >> 6).range(1,0);
                    patch_shifter = 0;
                    // PLL = 0;
                    mfPLL = 0;
                    start_shift = 0;
                    // mfirst_time = 1;
                    mrunLength = (((uint16_t)(headerProc.range(0,0)) << 8) | ((uint16_t)((headerProc >> 8).range(7,0)))) + 1;
                    SRrunLength = mrunLength;
                    fbo = (headerProc >> 1).range(4,0);
                    mbitSize = (fbo!=0) ? NDelta_BitMap[fbo] : 0;
                    // myCount = (mrunLength*mbitSize);
                    //PA
                    PW = NDelta_BitMap[headerProc.range(20,16)];
                    PGW = (headerProc.range(31,29)) + 1;
                    PLL = headerProc.range(28,24);
                    BV_Width = (headerProc.range(23,21)) + 1;
                    state = dec_type;
                    if(dec_type==SR)
                    {
                        headerProc = headerProc;
                        mSEC_SHIFTER += 8;
                    }
                    else
                    {
                        headerProc = headerProc >> 16;
                        mSEC_SHIFTER += 16;
                    }
                    BV_bytes:for(int i = 0; i < 10; i++)
                    {
#pragma HLS unroll
                        rd_bytes[i] = headerProc.range((i*8)+7, (i*8));
                    }
                    BV_idx = ((rd_bytes[0].range(7,7)) == 0) ? 0 :
                            ((rd_bytes[1].range(7,7)) == 0) ? 1 :
                            ((rd_bytes[2].range(7,7)) == 0) ? 2 :
                            ((rd_bytes[3].range(7,7)) == 0) ? 3 :
                            ((rd_bytes[4].range(7,7)) == 0) ? 4 : 5;
                }
                else if(state == SR_STATE)
                {
                    if(SRrunLength == 1)
                    {
                        //final counts
                        // state = waste_cycles;   //last cycle to waste the data
                        myShift = 0;
                        T_SHIFTs = 16384;
                    }
                    else
                    {
                        // state = SR_STATE;
                        st_count += 1;
                        if(st_count >= 3)
                        {
                            state = ASSIGN_DATA;
                            st_count = 0;
                            if(mFIRST_SHIFTER > 512)
                            {
                                mFIRST_SHIFTER = mFIRST_SHIFTER - 512;
                                temp_val = mSEC_SHIFTER - 512; //to use the same last state as delta
                                check_header_wait = 1; //it is reset at the start
                                shift_count = mbitSize + 512;
                            }
                            else
                            {
                                temp_val = mSEC_SHIFTER;
                                shift_count = mbitSize;
                            }
                        }
                        else if(st_count == 2)
                        {
                            // mSEC_SHIFTER += mbitSize;
                            start_shift = 512;
                            // mbitSize = mbitSize << 3; //multiply by 8
                            mAPPEND_DATA_SHIFTER = 0;
                            mSEC_SHIFTER += mbitSize;
                            mdelta_base = 0; //Compute delta checks this value
                            mbase_value = 0;
                            mHD_READ_OFF = 2; //stop
                        }
                        else
                        {
                            mfirst_time = 1; //
                            // myCount = (mrunLength*mbitSize);
                            mFIRST_SHIFTER = mSEC_SHIFTER;
                            mbitSize = (headerProc.range(5,3) + 1) << 3; //Multiply 8 to get the bits
                            mrunLength = headerProc.range(2,0) + 3; //repeat Count, min_repcount = 3
                        }
                    }
                }
                else if(state == PA_STATE)
                {
                    // state = PA_STATE;
                    st_count += 1;
                    if(st_count >= 3)
                    {
                        state = ASSIGN_DATA;
                        st_count = 0;
                        if(check_header_wait)
                        {
                            shift_count = myCount + 512;
                        }
                        else
                        {
                            shift_count = myCount;
                        }
                        if((BV_VAL_PA & BV_mask) != 0)
                        {
                            BV_VAL_PA = BV_VAL_PA & (~BV_mask);
                            BV_VAL_PA = -BV_VAL_PA;
                        }
                        rem_PatchD = (patchPC_mul%8);
                        // uint8_t offVal = (patch_data_L%8);
                        if(rem_PatchD != 0)
                        {
                            patch_data_L = patchPC_mul + (8 - rem_PatchD);
                        }
                        else
                        {
                            patch_data_L = patchPC_mul;
                        }
                        patch_shifter = temp_val + patch_data_L;
                        mAPPEND_DATA_SHIFTER = 0;
                        mFIRST_SHIFTER = 0;
                        mfirst_time = 0; //no need for this in PATCHED
                        mdelta_base = 0; //Compute delta checks this value
                        mbase_value = BV_VAL_PA; //Patch Data Base_Value
                    }
                    else if(st_count == 2)
                    {
                        // shift_count = myCount;    //read earlier to proc PA meta
                        // CLBW = ClosestFixedBitsMap[PGW+PW];
                        BV_mask = 1 << (BV_Bits - 1); //for neg check  BV_Bits = BV_Width*8
                        //change endianness
                        BV_PA = headerProc.range(BV_Bits-1, 0);
                        BV_VAL_PA = (BV_PA.range(7,0) << PA_bitShifter_8b) | (BV_PA.range(15,8) << PA_bitShifter_16b) |
                                    (BV_PA.range(23,16) << PA_bitShifter_24b) | (BV_PA.range(31,24) << PA_bitShifter_32b);
                        patchPC_mul = PLL*CLBW;
                        // patch_shifter = PLL*CLBW;
                        mSEC_SHIFTER += BV_Bits;
                        if(mSEC_SHIFTER > 512)
                        {
                            temp_val = mSEC_SHIFTER - 512; //to use the same last state as delta
                            check_header_wait = 1; //it is reset at the start
                        }
                        else
                        {
                            temp_val = mSEC_SHIFTER;
                        }
                    }
                    else //run on 1
                    {
                        CLBW = ClosestFixedBitsMap[PGW+PW];
                        myCount = (mrunLength*mbitSize);
                        BV_Bits = BV_Width << 3; //BV_Width*8
                        // PW = NDelta_BitMap[headerProc.range(4,0)];
                        // BV_Width = ((headerProc >> 5).range(2,0)) + 1;
                        // PLL = (headerProc >> 8).range(4,0);
                        // PGW = ((headerProc >> 13).range(2,0)) + 1;
                        mfPLL = 1;
                        mSEC_SHIFTER += 16; //4 bytes header with base value added
                        headerProc = headerProc >> 16;
                        PA_bitShifter_8b = BV_Bits - 8;
                        PA_bitShifter_16b = (BV_Bits <= 8) ? 40 : (BV_Bits - 16);
                        PA_bitShifter_24b = (BV_Bits <= 16) ? 40 : (BV_Bits - 24);
                        PA_bitShifter_32b = (BV_Bits <= 24) ? 40 : (BV_Bits - 32);
                    }
                }
                else if(state == DI_STATE)
                {
                    // state = DI_STATE;
                    st_count += 1;
                    if(st_count >= 3)
                    {
                        state = ASSIGN_DATA;
                        st_count = 0;
                        if(check_header_wait)
                        {
                            shift_count = myCount + 512;
                        }
                        else
                        {
                            shift_count = myCount;
                        }
                    }
                    else if(st_count == 2)
                    {
                        // shift_count = myCount;
                        mAPPEND_DATA_SHIFTER = 0;
                        mFIRST_SHIFTER = 0;
                        mfirst_time = 0; //no need for this in DIRECT
                        mdelta_base = 0; //Compute delta checks this value
                        mbase_value = 0;
                    }
                    else //run on 1
                    {
                        myCount = (mrunLength*mbitSize);
                        if(mSEC_SHIFTER > 512)
                        {
                            temp_val = mSEC_SHIFTER - 512; //to use the same last state as delta
                            check_header_wait = 1; //it is reset at the start
                        }
                        else
                        {
                            temp_val = mSEC_SHIFTER;
                        }
                    }
                }
                else if(state == DE_STATE)
                {
                    // state = DE_STATE;
                    st_count += 1;
                    if(st_count >= 3)
                    {
                        state = ASSIGN_DATA;
                        st_count = 0;
                        uint32_t temp_bv_db = (reg_data_0.range(6,0)) |
                                    ((reg_data_1.range(6,0)) << DB_S1) |
                                    ((reg_data_2.range(6,0)) << DB_S2) |
                                    ((reg_data_3.range(6,0)) << DB_S3) |
                                    ((reg_data_4.range(6,0)) << DB_S4);
                        mbase_value = (my_bv_val >> 1) ^ (-(my_bv_val & 1));
                        mdelta_base = (temp_bv_db >> 1) ^ (-(temp_bv_db & 1));
                        // FIRST_SHIFTER %= 512;
                        if(mFIRST_SHIFTER > 512)
                        {
                            mFIRST_SHIFTER = mFIRST_SHIFTER - 512;
                            check_header_wait = 1;
                            shift_count = myCount + 512 - tmpBS_DE;
                        }
                        else
                        {
                            shift_count = myCount - tmpBS_DE;
                        }
                        // myCount += check_header_wait;
                        // #pragma HLS BIND_OP variable=temp_val op=mul impl=dsp
                        if((mFIRST_SHIFTER == 8) && (mbitSize == 8))
                        {
                            temp_val = 0;
                            mAPPEND_DATA_SHIFTER = 1; //gets reset in prev cycle
                            mHD_READ_OFF = 1;
                        }
                        else if(mbitSize == 0)
                        {
                            temp_val = mFIRST_SHIFTER;
                            mHD_READ_OFF = 2;
                        }
                        else
                        {
                            temp_val = mFIRST_SHIFTER - tmpBS_DE;
                            mHD_READ_OFF = 0;
                        }
                        // header_bound = mheader_bound;
                    }
                    else if(st_count == 2)
                    {
                        // shift_count = myCount;
                        mAPPEND_DATA_SHIFTER = 0;
                        my_bv_val = (rd_bytes[0].range(6,0)) |
                                    ((rd_bytes[1].range(6,0)) << BV_S1) |
                                    ((rd_bytes[2].range(6,0)) << BV_S2) |
                                    ((rd_bytes[3].range(6,0)) << BV_S3) |
                                    ((rd_bytes[4].range(6,0)) << BV_S4);
                        reg_data_0 = rd_bytes[BV_idx+1];
                        reg_data_1 = rd_bytes[BV_idx+2];
                        reg_data_2 = rd_bytes[BV_idx+3];
                        reg_data_3 = rd_bytes[BV_idx+4];
                        reg_data_4 = rd_bytes[BV_idx+5];
                        // my_bv_val = bv_D[BV_idx];
                        // S0 = (DB_idx*7);
                        DB_S1 = (DB_idx >= 1) ? 7 : 40;
                        DB_S2 = (DB_idx >= 2) ? 14 : 40;
                        DB_S3 = (DB_idx >= 3) ? 21 : 40;
                        DB_S4 = (DB_idx >= 4) ? 28 : 40;
                        // #pragma HLS BIND_OP variable=mFIRST_SHIFTER op=add impl=dsp
                        // #pragma HLS BIND_OP variable=mFIRST_SHIFTER op=mul impl=dsp
                        mFIRST_SHIFTER += ((BV_idx+DB_idx+2)*8); //((BV_idx+DB_idx)*8)+16
                    }
                    else //run on 1
                    {
                        mfirst_time = 1;
                        myCount = (mrunLength*mbitSize);
                        tmpBS_DE = mbitSize << 1; //mbitSize*2 = mbitSize+mbitSize = mbitSize<<1
                        // S0 = (BV_idx*7);
                        BV_S1 = (BV_idx >= 1) ? 7 : 40;
                        BV_S2 = (BV_idx >= 2) ? 14 : 40;
                        BV_S3 = (BV_idx >= 3) ? 21 : 40;
                        BV_S4 = (BV_idx >= 4) ? 28 : 40;
                        //Get Delta Base
                        DB_idx = ((rd_bytes[BV_idx+1].range(7,7)) == 0) ? 0 :
                                    ((rd_bytes[BV_idx+2].range(7,7)) == 0) ? 1 :
                                    ((rd_bytes[BV_idx+3].range(7,7)) == 0) ? 2 :
                                    ((rd_bytes[BV_idx+4].range(7,7)) == 0) ? 3 :
                                    ((rd_bytes[BV_idx+5].range(7,7)) == 0) ? 4 : 20;
                        mFIRST_SHIFTER = mSEC_SHIFTER - (mAPPEND_DATA_SHIFTER*8);
                    }
                    //reset mAPPEND_DATA_SHIFTER = 0 in next cycle
                }
                else if(state == ASSIGN_DATA)
                {
                    state = TR_HEADER;
                    // data_counter += mrunLength;
                    d_loop = 0; //start the data sender
                    myShift = start_shift; //reset the shifter, start it from 512. Bcz if total is less than 512 no shift
                    if(patch_shifter > 512)
                    {
                        T_WAIT = 1;
                        patch_shifter = patch_shifter - 512;
                        T_SHIFTs = shift_count + 512;
                    }
                    else
                    {
                        T_SHIFTs = shift_count; //if you are reading header beyond 512 bits
                        T_WAIT = 0;
                    }
                    if(temp_val < 0)
                    {
                        //
                        HD_COUNTS = shift_count-512; //Header tracker to re-read new header, read early
                        mSEC_SHIFTER = 512 + temp_val;
                        wait_adjust = 1;
                    }
                    else
                    {
                        HD_COUNTS = shift_count; //Header tracker to re-read new header
                        mSEC_SHIFTER = temp_val;
                        wait_adjust = 0;
                    }
                    if(mbitSize == 8)
                    {
                        SDS = 511;
                        DS_SDS = 128;
                        FDS = 495;
                    }
                    else if(mbitSize == 16)
                    {
                        SDS = 1023;
                        DS_SDS = 256;
                        FDS = 991;
                    }
                    else if(mbitSize == 24)
                    {
                        SDS = 1535;
                        DS_SDS = 384;
                        FDS = 1487;
                    }
                    else if(mbitSize == 32)
                    {
                        SDS = 2047;
                        DS_SDS = 512;
                        FDS = 1983;
                    }
                    else //mbitSize == 0
                    {
                        d_loop = mrunLength - 64;
                    }
                    // data_counter += mrunLength;
                    //Set these variables always in the last cycle of header Processing
                    Datadec_type = dec_type;
                    APPEND_DATA_SHIFTER = mAPPEND_DATA_SHIFTER;
                    HD_READ_OFF = mHD_READ_OFF;
                    FIRST_SHIFTER = mFIRST_SHIFTER;
                    SEC_SHIFTER = mSEC_SHIFTER;
                    bitSize = mbitSize;
                    runLength = mrunLength;
                    first_time = mfirst_time;
                    delta_base = mdelta_base;
                    base_value = mbase_value;
                    fPLL = mfPLL;
                    D_PLL = PLL;
                    wait_cycles = check_header_wait && (mbitSize != 0);
                }
                else if(state == TR_HEADER)
                {
                    if(HD_COUNTS <= 3584)
                    {
                        HD_COUNTS = 0;
                        state = HEADER_ST;
                    }
                    else
                    {
                        HD_COUNTS -= 512;
                    }
                }
                // else if(state == waste_cycles)
                // {
                //     state = waste_cycles;
                //     myShift = 0;
                //     T_SHIFTs = 16384;
                // }
                // else
                // {
                //     state = waste_cycles;
                //     #ifndef __SYNTHESIS__
                //         // std::cout << "Default state" << std::endl;
                //     #endif
                // }
            }
            if(myShift < T_SHIFTs)
            {
                b3=b2;
                b2= (b2 >> 512); //512
                b2.range(3583,3072) = b1; //Myb1_Data //Place at the MSB (2047,1536)
                b1 = data_in.read();
                myShift+=512;
            }
            // else
            // {
            //     #ifndef __SYNTHESIS__
            //         // std::cout << "RD_STOP" << std::endl;
            //     #endif
            //     b3 = b3;
            // }
        }
    }
}
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
