


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

void mmap2s(tapa::async_mmap<_512b>& input_port,
            tapa::ostream<_512b>& outLstrm,
            tapa::ostream<bool>& rstStrmL,
            tapa::ostream<bool>& rstStrmMeta,
            tapa::ostream<bool>& rstStrmStore,
            uint32_t wait_count,
            uint32_t data_count)
{
    _512b data_read = 0;
    int counter = 0;
    rstStrmL.write(1);
    rstStrmMeta.write(1);
    rstStrmStore.write(1);
    // uint32_t loop_bound = (data_count/64);    //ADD this extra depth in host.
    mmap2s:for(uint32_t i_req = 0, i_resp = 0; i_resp < data_count;)
    {
#pragma HLS PIPELINE II = 1
        if ((i_req < data_count) &&
            (input_port.read_addr.try_write(i_req))) {
        ++i_req;
        }
        if((!input_port.read_data.empty()))
        {
            data_read = input_port.read_data.read(nullptr);
            ++i_resp;
            outLstrm.write(data_read);
        }
    }
    waitToFinish:for(uint32_t i_req = 0, i_resp = 0; counter < wait_count;)
    {
#pragma HLS PIPELINE II = 1
        if((!input_port.read_data.empty()))
        {
            data_read = input_port.read_data.read(nullptr);
            ++i_resp;
            // outLstrm.write(data_read);
        }
        counter += 1;
    }
}
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
{
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
{
    _320b bufferWriteStrm = 0;
    uint32_t bufferUZZ = 0;
    uint32_t bufferWrite = 0;
    uint32_t bitShifter_32b = 0;
    uint32_t bitShifter_24b = 0;
    uint32_t bitShifter_16b = 0;
    uint32_t bitShifter_8b = 0;
    uint32_t bitSize = 0;
    // uint8_t myMeta = 0;
    ap_uint<64> myData = 0;
    SR_PROC:for( ;; )
    {
#pragma HLS pipeline II=1
        if((!outSR_Pstrm.empty()) && (!meta_out.empty()))
        {
            myData = outSR_Pstrm.read();
            bitSize = meta_out.read();
            // bitSize = myMeta.range(31,0);
            bitShifter_8b = bitSize - 8;
            bitShifter_16b = (bitSize <= 8) ? 40 : (bitSize - 16);
            bitShifter_24b = (bitSize <= 16) ? 40 : (bitSize - 24);
            bitShifter_32b = (bitSize <= 24) ? 40 : (bitSize - 32);
            //EndianChange
            bufferWrite = (myData.range(7,0) << bitShifter_8b) | (myData.range(15,8) << bitShifter_16b) |
                            (myData.range(23,16) << bitShifter_24b) | (myData.range(31,24) << bitShifter_32b);
            //Unzigzag
            bufferUZZ = (ap_int<32>)((bufferWrite >> 1) ^ (-1*(bufferWrite & 1)));
            //DataMultiplier for 10 times. Read runlength times from metadata
            DM_SR:for(int i = 0; i < 10; i++)
            {
#pragma HLS UNROLL
                bufferWriteStrm.range(((i*32)+31),(i*32)) = bufferUZZ;
            }
            SR_Dout.write(bufferWriteStrm);
        }
    }
}
void compute_delta(tapa::istream<_512b>& in_Cstrm,
                tapa::istream<_256b>& in_Trstrm,
                tapa::ostream<uint32_t>& out_Cmeta_strm,
                tapa::ostream<_512b>& out_Cstrm,
                tapa::ostream<_512b>& DI_strm,
                tapa::ostream<_512b>& PA_strm,
                tapa::ostream<uint32_t>& PA_meta_strm,
                uint32_t compD_ID)
{
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
{
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
{
    ap_uint<AXI_WIDTH> myNums;
    ap_uint<AXI_WIDTH> bufferWriteStrm;
    int32_t d[PEs] = {0};
    int32_t num[PEs] = {0};
    int32_t cin = 0;
    sum_deltas0:for( ; ; )
    {
#pragma HLS pipeline II=1
        if((!PA_Strm.empty()) && (!PA_BV_Strm.empty()))
        {
            myNums = PA_Strm.read();
            cin = PA_BV_Strm.read();
            delta_read:for(int i = 0; i < PEs; i++)
            {
#pragma HLS unroll
                d[i] = myNums.range(((i*32)+31),(i*32));
            }
            sumNum:for(int i = 0; i < PEs; i++)
            {
#pragma HLS UNROLL
                // #pragma HLS BIND_OP variable=num op=add impl=dsp
                num[i] = cin + d[i]; //cin can be negative as well. Used int
            }
            dWriter:for(int i = 0; i < PEs; i++)
            {
#pragma HLS UNROLL
                bufferWriteStrm.range(((i*32)+31),(i*32)) = num[i];
            }
            dataOutPA_Strm.write(bufferWriteStrm);
        }
    }
}
void Meta_Aligner(tapa::istream<uint64_t>& PA_metaStrm,
                tapa::istream<uint64_t>& All_meta_Strm,
                tapa::ostream<_128b>& meta_Out
                )
{
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
                tapa::async_mmap<_128b>& metaPort_Out
                // uint32_t KRNL_Data_Write
                )
{
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
{
    ap_uint<AXI_WIDTH> myNums;
    ap_uint<AXI_WIDTH> bufferWriteStrm;
    int32_t d[PEs] = {0};
    int32_t num[PEs] = {0};
    sum_deltas0:for( ; ; )
    {
#pragma HLS pipeline II=1
        if(!delta_Strm.empty())
        {
            myNums = delta_Strm.read();
            delta_read:for(int i = 0; i < PEs; i++)
            {
#pragma HLS unroll
                d[i] = myNums.range(((i*32)+31),(i*32));
            }
            num[0] = d[0];
            sumD:for(int i = 1; i < PEs; i++)
            {
#pragma HLS UNROLL
                // #pragma HLS BIND_OP variable=num op=add impl=dsp
                num[i] = num[i-1] + d[i];
            }
            CarryOut_Strm.write(num[15]);
            dWriter:for(int i = 0; i < PEs; i++)
            {
#pragma HLS UNROLL
                bufferWriteStrm.range(((i*32)+31),(i*32)) = num[i];
            }
            dataOut_Strm.write(bufferWriteStrm);
        }
    }
}
void delta_sumNC_all(tapa::istream<_512b>& delta_Strm,
                // tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostream<_512b>& dataOut_Strm
                )
{
    ap_uint<AXI_WIDTH> myNums;
    ap_uint<AXI_WIDTH> bufferWriteStrm;
    int32_t d[PEs] = {0};
    int32_t num[PEs] = {0};
    sum_deltas0:for( ; ; )
    {
#pragma HLS pipeline II=1
        if(!delta_Strm.empty())
        {
            myNums = delta_Strm.read();
            delta_read:for(int i = 0; i < PEs; i++)
            {
#pragma HLS unroll
                d[i] = myNums.range(((i*32)+31),(i*32));
            }
            num[0] = d[0];
            sumD:for(int i = 1; i < PEs; i++)
            {
#pragma HLS UNROLL
                // #pragma HLS BIND_OP variable=num op=add impl=dsp
                num[i] = num[i-1] + d[i];
            }
            dWriter:for(int i = 0; i < PEs; i++)
            {
#pragma HLS UNROLL
                bufferWriteStrm.range(((i*32)+31),(i*32)) = num[i];
            }
            dataOut_Strm.write(bufferWriteStrm);
        }
    }
}
void delta_sum_2out(tapa::istream<_512b>& delta_Strm,
                tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostream<_512b>& dataOut_Strm,
                tapa::ostream<uint32_t>& CarryOut_Strm,
                tapa::ostream<uint32_t>& CarryOut_Strm1
                )
{
    ap_uint<AXI_WIDTH> myNums;
    ap_uint<AXI_WIDTH> bufferWriteStrm;
    int32_t d[PEs] = {0};
    int32_t num[PEs] = {0};
    int32_t cin = 0;
    sum_deltas0:for( ; ; )
    {
#pragma HLS pipeline II=1
        if(!delta_Strm.empty())
        {
            myNums = delta_Strm.read();
            cin = CarryIn_Strm.read();
            delta_read:for(int i = 0; i < PEs; i++)
            {
#pragma HLS unroll
                d[i] = myNums.range(((i*32)+31),(i*32));
            }
            sumNum:for(int i = 0; i < PEs; i++)
            {
#pragma HLS UNROLL
                // #pragma HLS BIND_OP variable=num op=add impl=dsp
                num[i] = cin + d[i];
            }
            CarryOut_Strm.write(num[15]);
            CarryOut_Strm1.write(num[15]);
            dWriter:for(int i = 0; i < PEs; i++)
            {
#pragma HLS UNROLL
                bufferWriteStrm.range(((i*32)+31),(i*32)) = num[i];
            }
            dataOut_Strm.write(bufferWriteStrm);
        }
    }
}
void delta_sum_1out(tapa::istream<_512b>& delta_Strm,
                tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostream<_512b>& dataOut_Strm,
                tapa::ostream<uint32_t>& CarryOut_Strm
                )
{
    ap_uint<AXI_WIDTH> myNums;
    ap_uint<AXI_WIDTH> bufferWriteStrm;
    int32_t d[PEs] = {0};
    int32_t num[PEs] = {0};
    int32_t cin = 0;
    sum_deltas0:for( ; ; )
    {
#pragma HLS pipeline II=1
        if(!delta_Strm.empty())
        {
            myNums = delta_Strm.read();
            cin = CarryIn_Strm.read();
            delta_read:for(int i = 0; i < PEs; i++)
            {
#pragma HLS unroll
                d[i] = myNums.range(((i*32)+31),(i*32));
            }
            sumNum:for(int i = 0; i < PEs; i++)
            {
#pragma HLS UNROLL
                // #pragma HLS BIND_OP variable=num op=add impl=dsp
                num[i] = cin + d[i];
            }
            CarryOut_Strm.write(num[15]);
            dWriter:for(int i = 0; i < PEs; i++)
            {
#pragma HLS UNROLL
                bufferWriteStrm.range(((i*32)+31),(i*32)) = num[i];
            }
            dataOut_Strm.write(bufferWriteStrm);
        }
    }
}
void delta_sum_0out(tapa::istream<_512b>& delta_Strm,
                tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostream<_512b>& dataOut_Strm
                )
{
    ap_uint<AXI_WIDTH> myNums;
    ap_uint<AXI_WIDTH> bufferWriteStrm;
    int32_t d[PEs] = {0};
    int32_t num[PEs] = {0};
    int32_t cin = 0;
    sum_deltas0:for( ; ; )
    {
#pragma HLS pipeline II=1
        if(!delta_Strm.empty())
        {
            myNums = delta_Strm.read();
            cin = CarryIn_Strm.read();
            delta_read:for(int i = 0; i < PEs; i++)
            {
#pragma HLS unroll
                d[i] = myNums.range(((i*32)+31),(i*32));
            }
            sumNum:for(int i = 0; i < PEs; i++)
            {
#pragma HLS UNROLL
                // #pragma HLS BIND_OP variable=num op=add impl=dsp
                num[i] = cin + d[i];
            }
            dWriter:for(int i = 0; i < PEs; i++)
            {
#pragma HLS UNROLL
                bufferWriteStrm.range(((i*32)+31),(i*32)) = num[i];
            }
            dataOut_Strm.write(bufferWriteStrm);
        }
    }
}
void delta_Fsum(tapa::istreams<_512b, 4>& delta_Strm,
                tapa::istreams<uint32_t, 4>& meta_Strm,
                tapa::istream<uint32_t>& CarryIn_Strm,
                tapa::ostreams<_512b, 4>& dataOut_Strm
                )
{
    ap_uint<AXI_WIDTH> myNums[4];
    ap_uint<AXI_WIDTH> bufferWriteStrm[4];
    // uint32_t d[PEs] = {0};
    int32_t num0[PEs] = {0};
    int32_t num1[PEs] = {0};
    int32_t num2[PEs] = {0};
    int32_t num3[PEs] = {0};
    int32_t fnum0[PEs] = {0};
    int32_t fnum1[PEs] = {0};
    int32_t fnum2[PEs] = {0};
    int32_t fnum3[PEs] = {0};
    int32_t cin = 0;
    int32_t store_cin = 0;
    int32_t metaData = 0;
    bool BSF = 0;
    // #pragma HLS bind_storage variable=num0 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=num1 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=num2 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=num3 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=fnum0 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=fnum1 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=fnum2 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=fnum3 type=RAM_2P impl=bram
    sum_deltas1:for( ; ; )
    {
#pragma HLS pipeline II=1
        if((!delta_Strm[2].empty()) && (!delta_Strm[3].empty()))
        {
            metaData = meta_Strm[0].read();
            BSF = metaData & 0xFF;
            read_Nums:for(int i = 0; i < 4; i++)
            {
#pragma HLS UNROLL
                myNums[i] = delta_Strm[i].read();
            }
            if(BSF)
            {
                cin = 0;
                writeNums0:for(int i = 0; i < 4; i++)
                {
#pragma HLS UNROLL
                    dataOut_Strm[i].write(myNums[i]);
                }
            }
            else
            {
                cin = store_cin;
                // read_Nums:for(int i = 0; i < 4; i++)
                // {
                //     #pragma HLS UNROLL
                //     myNums[i] = delta_Strm[i].read();
                // }
                unPackNums:for(int i = 0; i < PEs; i++)
                {
#pragma HLS UNROLL
                    num0[i] = myNums[0].range((i*32) + 31, i*32);
                    num1[i] = myNums[1].range((i*32) + 31, i*32);
                    num2[i] = myNums[2].range((i*32) + 31, i*32);
                    num3[i] = myNums[3].range((i*32) + 31, i*32);
                }
                sumCIN:for(int i = 0; i < PEs; i++)
                {
#pragma HLS UNROLL
                    // #pragma HLS BIND_OP variable=fnum0 op=add impl=dsp
                    // #pragma HLS BIND_OP variable=fnum1 op=add impl=dsp
                    // #pragma HLS BIND_OP variable=fnum2 op=add impl=dsp
                    // #pragma HLS BIND_OP variable=fnum3 op=add impl=dsp
                    fnum0[i] = num0[i] + cin;
                    fnum1[i] = num1[i] + cin;
                    fnum2[i] = num2[i] + cin;
                    fnum3[i] = num3[i] + cin;
                }
                packNum:for(int i = 0; i < PEs; i++)
                {
                    bufferWriteStrm[0].range((i*32) + 31, i*32) = fnum0[i];
                    bufferWriteStrm[1].range((i*32) + 31, i*32) = fnum1[i];
                    bufferWriteStrm[2].range((i*32) + 31, i*32) = fnum2[i];
                    bufferWriteStrm[3].range((i*32) + 31, i*32) = fnum3[i];
                }
                writeNums1:for(int i = 0; i < 4; i++)
                {
#pragma HLS UNROLL
                    dataOut_Strm[i].write(bufferWriteStrm[i]);
                }
            }
            store_cin = CarryIn_Strm.read() + cin;
        }
    }
}
void Data_Aligner(tapa::istream<uint8_t>& inTrackStrm,
                tapa::istreams<_512b, 4>& inDEStrm,
                tapa::istreams<_512b, 4>& inDIStrm,
                tapa::istreams<_512b, 4>& inPAStrm,
                tapa::istream<_320b>& inSRStrm,
                tapa::ostreams<_512b, 4>& outWRStrm )
{
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
            tapa::async_mmap<_512b> &OUT0_32b_8b,
            tapa::async_mmap<_512b> &OUT1_16b_8b,
            tapa::async_mmap<_512b> &OUT2_16b_8b,
            tapa::async_mmap<_512b> &OUT3_8b)
{
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
void data_decoding(tapa::mmap<_512b> input_port,
                    tapa::mmap<_512b> output_port0_32b_8b,
                    tapa::mmap<_512b> output_port1_16b_8b,
                    tapa::mmap<_512b> output_port2_16b_8b,
                    tapa::mmap<_512b> output_port3_8b,
                    tapa::mmap<_128b> output_port4_Track,
                    uint32_t wait_count,
                    uint32_t data_count)
{
  tapa::streams<uint32_t, 2, 32> CarryOut_Strm0("CarryOut_Strm0");
  tapa::streams<_512b, 3, 32> dataOut_Strm0("dataOut_Strm0");
  tapa::streams<_512b, 4, 32> MydataOut("MydataOut");
  tapa::stream<uint32_t, 32> CarryOut0_Strm1("CarryOut0_Strm1");
  tapa::stream<uint32_t, 32> CarryOut1_Strm1("CarryOut1_Strm1");
  tapa::stream<_512b, 32> dataOut_Strm1("dataOut_Strm1");
  tapa::stream<uint32_t, 32> CarryOut0_Strm2("CarryOut0_Strm2");
  tapa::streams<_512b, 4, 32> DEOut_Strm("DEOut_Strm");
  tapa::streams<_512b, 4, 32> DIOut_Strm("DIOut_Strm");
  tapa::streams<_512b, 4, 32> dataOut_Strm("dataOut_Strm");
  tapa::stream<_512b, 32> outLstrm("outLstrm");
  tapa::streams<_512b, 4, 32> out_all_Cstrm("out_all_Cstrm");
  tapa::stream<_2048b, 32> outAll_Lstrm("outAll_Lstrm");
  tapa::stream<_256b, 32> out_strmC_Track("out_strmC_Track");
  tapa::streams<_512b, 4, 32> outAll_Pstrm("outAll_Pstrm");
  tapa::streams<_256b, 4, 32> meta_out("meta_out");
  tapa::stream<uint8_t, 32> SR_meta_out("SR_meta_out");
  tapa::stream<uint8_t, 32> out_DA_Track("out_DA_Track");
  tapa::stream<_512b, 32> PA_DATA("PA_DATA");
  tapa::stream<uint32_t, 32> PA_meta_Data("PA_meta_Data");
//   tapa::stream<uint32_t, 64> PA_Cnt_Strm("PA_Cnt_Strm");
//   tapa::stream<uint32_t, 64> data_Cnt("data_Cnt");
  tapa::streams<uint32_t, 4, 32> out_Cmeta_strm("out_Cmeta_strm");
  tapa::stream<uint64_t, 32> All_meta_out("All_meta_out");
  tapa::streams<_512b, 4, 32> PA_acc_strm("PA_acc_strm");
  tapa::streams<uint32_t, 4, 32> PA_acc_meta("PA_acc_meta");
  tapa::streams<_512b, 4, 32> dataOutPA_Strm("dataOutPA_Strm");
  tapa::stream<uint64_t, 32> metaOutPA_Strm("metaOutPA_Strm");
  tapa::stream<_128b, 32> meta_Writer_Out("meta_Writer_Out");
  tapa::stream<uint64_t, 32> outSR_Pstrm("outSR_Pstrm");
  tapa::stream<_320b, 32> SR_Dout("SR_Dout");
  tapa::stream<bool, 8> rstStrmL("rstStrmL");
  tapa::stream<bool, 8> rstStrmMeta("rstStrmMeta");
  tapa::stream<bool, 8> rstStrmStore("rstStrmStore");
  tapa::task()
      .invoke(mmap2s, input_port, outLstrm, rstStrmL, rstStrmMeta, rstStrmStore, wait_count, data_count)
      .invoke<tapa::detach>(load, outLstrm, rstStrmL, outAll_Lstrm, out_strmC_Track, PA_DATA, PA_meta_Data)
      .invoke<tapa::detach>(Meta_Writer, meta_Writer_Out, rstStrmMeta, output_port4_Track)
      .invoke<tapa::detach>(store_all, dataOut_Strm, rstStrmStore, output_port0_32b_8b, output_port1_16b_8b, output_port2_16b_8b, output_port3_8b)
      .invoke<tapa::detach>(Data_Aligner, out_DA_Track, DEOut_Strm, DIOut_Strm, dataOutPA_Strm, SR_Dout, dataOut_Strm)
      .invoke<tapa::detach>(data_Sender, outAll_Lstrm, out_strmC_Track, outAll_Pstrm, outSR_Pstrm, meta_out, SR_meta_out, All_meta_out, out_DA_Track)
      .invoke<tapa::detach>(compSR, outSR_Pstrm, SR_meta_out, SR_Dout)
      .invoke<tapa::detach, 4>(PA_sum_out, PA_acc_strm, PA_acc_meta, dataOutPA_Strm)
      .invoke<tapa::detach>(PA_meta_proc, PA_DATA, PA_meta_Data, metaOutPA_Strm)
      .invoke<tapa::detach>(Meta_Aligner, metaOutPA_Strm, All_meta_out, meta_Writer_Out)
      .invoke<tapa::detach>(compute_delta, outAll_Pstrm[0], meta_out[0], out_Cmeta_strm[0], out_all_Cstrm[0], DIOut_Strm[0], PA_acc_strm[0], PA_acc_meta[0], 0)
      .invoke<tapa::detach>(compute_delta, outAll_Pstrm[1], meta_out[1], out_Cmeta_strm[1], out_all_Cstrm[1], DIOut_Strm[1], PA_acc_strm[1], PA_acc_meta[1], 1)
      .invoke<tapa::detach>(compute_delta, outAll_Pstrm[2], meta_out[2], out_Cmeta_strm[2], out_all_Cstrm[2], DIOut_Strm[2], PA_acc_strm[2], PA_acc_meta[2], 2)
      .invoke<tapa::detach>(compute_delta, outAll_Pstrm[3], meta_out[3], out_Cmeta_strm[3], out_all_Cstrm[3], DIOut_Strm[3], PA_acc_strm[3], PA_acc_meta[3], 3)
    //   .invoke(Meta_Writer, meta_Writer_Out, PA_Cnt_Strm, output_port4_Track)
      .invoke<tapa::detach>(delta_sumNC_in, out_all_Cstrm[0], MydataOut[0], CarryOut_Strm0[0])
      .invoke<tapa::detach>(delta_sumNC_all, out_all_Cstrm[1], dataOut_Strm0[0])
      .invoke<tapa::detach>(delta_sumNC_in, out_all_Cstrm[2], dataOut_Strm0[1], CarryOut_Strm0[1])
      .invoke<tapa::detach>(delta_sumNC_all, out_all_Cstrm[3], dataOut_Strm0[2])
      .invoke<tapa::detach>(delta_sum_2out, dataOut_Strm0[0], CarryOut_Strm0[0], MydataOut[1], CarryOut0_Strm1, CarryOut1_Strm1)
      .invoke<tapa::detach>(delta_sum_0out, dataOut_Strm0[2], CarryOut_Strm0[1], dataOut_Strm1)
      .invoke<tapa::detach>(delta_sum_0out, dataOut_Strm0[1], CarryOut0_Strm1, MydataOut[2])
      .invoke<tapa::detach>(delta_sum_1out, dataOut_Strm1, CarryOut1_Strm1, MydataOut[3], CarryOut0_Strm2)
      .invoke<tapa::detach>(delta_Fsum, MydataOut, out_Cmeta_strm, CarryOut0_Strm2, DEOut_Strm);
    //   .invoke<tapa::detach>(Data_Aligner, out_DA_Track, DEOut_Strm, DIOut_Strm, dataOutPA_Strm, dataOut_Strm);
    //   .invoke(store_all, dataOut_Strm, dataCnt_strm,
    //                                     output_port0_32b_8b, output_port1_16b_8b, output_port2_16b_8b, output_port3_8b);
}
