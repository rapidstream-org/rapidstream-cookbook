
//#ifndef __SYNTHESIS__
//    #include <time.h>
//#endif
//#include <hls_math.h>


 #include <stdint.h>

#include <inttypes.h>

#include <ap_int.h>

#include <tapa.h>

/*****************************/
// MACROS USED FOR CALCULATIONS
// Power of 2 rounding : https://stackoverflow.com/questions/466204/rounding-up-to-next-power-of-2
/*****************************/
/*****************************/
// CONFIGURE ME!
/*****************************/
// NOTE: IF THE BV_LENGTH IS NOT A POWER OF TWO, SOME MODULES MAY ACHIEVE POOR II.
const int HASHONLY_BITWIDTH = 32;
const int BV_PACKED_BITWIDTH = 32; //On-chip memory for BV, packing this many bits into one cell
const int BIT_BITWIDTH = 1;
typedef struct {
    ap_uint<(32)> k0;
    ap_uint<(32)> k1;
} TWOKEY_DTYPE;
typedef struct {
    ap_uint<BV_PACKED_BITWIDTH> section0;
    ap_uint<BV_PACKED_BITWIDTH> section1;
    ap_uint<BV_PACKED_BITWIDTH> section2;
    ap_uint<BV_PACKED_BITWIDTH> padding3;
} BV_LOAD_DTYPE;
    const int STRM_IDX_BITWIDTH = 8;
    const int INPUT_IDX_BITWIDTH = 24;
    const int MAX_INPUT_IDX = ( 1<<(INPUT_IDX_BITWIDTH) ) - 1;
    const int METADATA_BITWIDTH = INPUT_IDX_BITWIDTH + STRM_IDX_BITWIDTH;
    const int MAX_STRM_IDX = ( 1<<(STRM_IDX_BITWIDTH) ) - 1;
    const int PACKED_HASH_BITWIDTH = HASHONLY_BITWIDTH + METADATA_BITWIDTH;
    const int BV_PLUS_METADATA_BITWIDTH = BIT_BITWIDTH + METADATA_BITWIDTH;
    const int BV_PLUS_IIDX_BITWIDTH = BIT_BITWIDTH + INPUT_IDX_BITWIDTH;
    /************************/
    //// Packed datatypes.  Packed as follows (MSB to LSB): [STRM_IDX, INPUT_IDX, HASH_VALUE]
    //#define PACKED_HASH_DTYPE   ap_uint<PACKED_HASH_BITWIDTH>
    //#define BV_PLUS_METADATA_PACKED_DTYPE     ap_uint<BV_PLUS_METADATA_BITWIDTH>
    //#define METADATA_DTYPE      ap_uint<METADATA_BITWIDTH>
    typedef struct {
        ap_uint<INPUT_IDX_BITWIDTH> iidx;
        ap_uint<STRM_IDX_BITWIDTH> sidx;
    } METADATA_DTYPE;
    typedef struct {
        ap_uint<BIT_BITWIDTH> bv_val;
        METADATA_DTYPE md;
    } BV_PLUS_METADATA_PACKED_DTYPE;
    typedef struct {
        ap_uint<BIT_BITWIDTH> bv_val;
        ap_uint<INPUT_IDX_BITWIDTH> iidx;
    } BV_PLUS_IIDX_PACKED_DTYPE;
    typedef struct {
        ap_uint<HASHONLY_BITWIDTH> hash;
        METADATA_DTYPE md;
    } PACKED_HASH_DTYPE;
    /************************/
    const int _BV_ROUNDING_FACTOR_ = (3) * BV_PACKED_BITWIDTH * (8) /* each sub bv is further partitioned into this chunks*/;
    const int BV_LENGTH = ( (((1024*1024*4)*(3))-1)/_BV_ROUNDING_FACTOR_ + 1) * _BV_ROUNDING_FACTOR_;
typedef struct {
    ap_uint<(32)> s0_k0;
    ap_uint<(32)> s0_k1;
    ap_uint<(32)> s1_k0;
    ap_uint<(32)> s1_k1;
    ap_uint<(32)> s2_k0;
    ap_uint<(32)> s2_k1;
    ap_uint<(32)> s3_k0;
    ap_uint<(32)> s3_k1;
    ap_uint<(32)> s4_k0;
    ap_uint<(32)> s4_k1;
    ap_uint<(32)> padding_5_k0;
    ap_uint<(32)> padding_5_k1;
    ap_uint<(32)> padding_6_k0;
    ap_uint<(32)> padding_6_k1;
    ap_uint<(32)> padding_7_k0;
    ap_uint<(32)> padding_7_k1;
} LOAD_DTYPE;
// This naming is potentially confusing - we datapack TWICE.
// Within each key-stream we pack 32 elements together.
// Then, we coalesce among key-streams.
typedef struct {
    ap_uint<((32))> s0_k0;
    ap_uint<((32))> s0_k1;
    ap_uint<((32))> s1_k0;
    ap_uint<((32))> s1_k1;
    ap_uint<((32))> s2_k0;
    ap_uint<((32))> s2_k1;
    ap_uint<((32))> s3_k0;
    ap_uint<((32))> s3_k1;
    ap_uint<((32))> s4_k0;
    ap_uint<((32))> s4_k1;
    ap_uint<((32))> padding_5_k0;
    ap_uint<((32))> padding_5_k1;
    ap_uint<((32))> padding_6_k0;
    ap_uint<((32))> padding_6_k1;
    ap_uint<((32))> padding_7_k0;
    ap_uint<((32))> padding_7_k1;
} STORE_DTYPE;
/***************************************************/
/***************************************************/
/***************************************************/
/* STM_DEPTH: In the worst case, the arbiter can send all of the hashed values to the same FIFO.
 *  So that FIFO will get filled, and the shuffle unit wont be able to handle it.
 *  We need at least NUM_STM FIFO elements between arbiter and shuffle. */
const int KEYS_PER_STM = (( ( ( ( ( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) | (( ( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) >> 4) ) | (( ( ( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) | (( ( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) >> 4) ) >> 8) ) | (( ( ( ( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) | (( ( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) >> 4) ) | (( ( ( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) | (( ( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1024*8*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) >> 4) ) >> 8) ) >> 16 ) ))+1;
const int KEYPAIRS_PER_STM = KEYS_PER_STM/2; // 2 reads per cycle (2port bram)
const int TOTAL_NUM_KEYINPUT = KEYS_PER_STM * (5);
const int PACKED_OUTPUTS_PER_STM = ( (KEYPAIRS_PER_STM-1)/((32)) + 1);
const int PACKED_OUTPAIRS_PER_STM = PACKED_OUTPUTS_PER_STM * 2; // same number of outputs but half the stms if we pair them
const int NUM_PACKED_OUTPUTS = PACKED_OUTPUTS_PER_STM * (5) * 2; // 2 reads per cycle (2port bram)
typedef struct {
    ap_uint<INPUT_IDX_BITWIDTH> strm0_out_idx;
    ap_uint<INPUT_IDX_BITWIDTH> strm1_out_idx;
    ap_uint<INPUT_IDX_BITWIDTH> strm2_out_idx;
    ap_uint<INPUT_IDX_BITWIDTH> strm3_out_idx;
    ap_uint<INPUT_IDX_BITWIDTH> strm4_out_idx;
} RATEMON_FEEDBACK_DTYPE;
void loadKey(
        uint64_t  key_in
        ,tapa::ostreams<ap_uint<(32)>, (5)> & key_stream_kp0
        ,tapa::ostreams<ap_uint<(32)>, (5)> & key_stream_kp1
);
/*************************************************************************************/
void loadBV(
    uint64_t  input_bv
    ,tapa::ostream<ap_uint<BV_PACKED_BITWIDTH> > & bv_load_stream_0
    ,tapa::ostream<ap_uint<BV_PACKED_BITWIDTH> > & bv_load_stream_1
    ,tapa::ostream<ap_uint<BV_PACKED_BITWIDTH> > & bv_load_stream_2
);
/*************************************************************************************/
uint32_t MurmurHash3_x86_32 (
    ap_uint<(32)> key,
    uint32_t seed
){
#pragma HLS inline
    const int nblocks = ((32) / 8) / 4;
    uint32_t h1 = seed;
    const uint32_t c1 = 0xcc9e2d51;
    const uint32_t c2 = 0x1b873593;
    //length is limited as this:  KEY_SIZE_IN_BYTES / 4  <= KEY_SIZE_IN_BYTES
    BLOCK_DIVIDING:
    for( int i = 0; i < nblocks; i++){
#pragma HLS UNROLL
        ap_uint<(32)> tmp;
        tmp.range(31,0) = key.range(32*i+31, 32*i);
        uint32_t k1 = tmp;
        k1 *= c1;
        // copy-paste the body of the rotl() function, otherwise it doesn't work.
        //k1 = ROTL32(k1,15);
        k1 = ( (k1 << 15) | (k1 >> (17)) );
        k1 = k1*c2;
        h1 ^= k1;
        // copy-paste the body of the rotl() function, otherwise it doesn't work.
        //h1 = ROTL32(h1,13);
        h1 = ( (h1 << 13) | (h1 >> 19) );
        h1 = h1*5 + 0xe6546b64;
    }
    //Remainder from block division
    uint32_t tail = key[nblocks];
    //Finalization
    h1 ^= ((32) / 8);
    //h1 = fmix32(h1);
    h1 ^= h1>>16;
    h1 *= 0x85ebca6b;
    h1 ^= h1>>13;
    h1 *= 0xc2b2ae35;
    h1 ^= h1>>16;
    uint32_t retval;
    //retval = (uint32_t)key * (seed+3);
    retval = h1;
    return retval;
}
void computeHash_Feeder(
        int strm_idx,
        int keypair_idx,
        tapa::istream<ap_uint<(32)> > & key_in_stream,
        tapa::ostreams<ap_uint<(32)>, (3)> & key_out_stream
);
void computeHash_Computer(
        int stm_idx,
        int hash_idx,
        int keypair_idx,
        tapa::istream<ap_uint<(32)> > & key_stream,
        tapa::ostream<ap_uint<HASHONLY_BITWIDTH> > & hash_stream
);
// CONFIG: need NUM_HASH calls to INVOKE_COMPUTERS_FOR_HASH
/*************************************************************************************/
//////////////////////////////////////////////////
//////////////////////////////////////////////////
///////// Arbiter                           //////
//////////////////////////////////////////////////
//////////////////////////////////////////////////
void bloom_arb_forwarder(
        int arb_idx
        ,int kp_idx
        ,tapa::istreams<ap_uint<HASHONLY_BITWIDTH>, (5)> & hash_stream
        ,tapa::ostreams<PACKED_HASH_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> & arb_stream
);
void bloom_hier_arbiter_atom(
        int arb_idx,
        int partition_idx,
        int kp_idx,
        int atom_ID,
        tapa::istream<RATEMON_FEEDBACK_DTYPE> & ratemon_stream,
        tapa::istream<PACKED_HASH_DTYPE> & in_stream0,
        tapa::istream<PACKED_HASH_DTYPE> & in_stream1,
        tapa::ostream<PACKED_HASH_DTYPE> & out_stream
);
void bloom_arbiter_ratemonitor(
    int arb_idx
    ,int kp_idx
    ,char ratemon_ID
    ,tapa::istreams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> &arb_stream_in
    ,tapa::ostreams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> &arb_stream_out
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> &fdbk_stream_0
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> &fdbk_stream_1
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> &fdbk_stream_2
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> &fdbk_stream_3
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> &fdbk_stream_4
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> &fdbk_stream_5
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> &fdbk_stream_6
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> &fdbk_stream_7
){



#pragma HLS disaggregate variable = arb_stream_in
#pragma HLS array_partition variable = arb_stream_in complete
#pragma HLS interface ap_fifo port = arb_stream_in[0]._
#pragma HLS aggregate variable = arb_stream_in[0]._ bit
#pragma HLS interface ap_fifo port = arb_stream_in[0]._peek
#pragma HLS aggregate variable = arb_stream_in[0]._peek bit
void(arb_stream_in[0]._.empty());
void(arb_stream_in[0]._peek.empty());
#pragma HLS interface ap_fifo port = arb_stream_in[1]._
#pragma HLS aggregate variable = arb_stream_in[1]._ bit
#pragma HLS interface ap_fifo port = arb_stream_in[1]._peek
#pragma HLS aggregate variable = arb_stream_in[1]._peek bit
void(arb_stream_in[1]._.empty());
void(arb_stream_in[1]._peek.empty());
#pragma HLS interface ap_fifo port = arb_stream_in[2]._
#pragma HLS aggregate variable = arb_stream_in[2]._ bit
#pragma HLS interface ap_fifo port = arb_stream_in[2]._peek
#pragma HLS aggregate variable = arb_stream_in[2]._peek bit
void(arb_stream_in[2]._.empty());
void(arb_stream_in[2]._peek.empty());
#pragma HLS interface ap_fifo port = arb_stream_in[3]._
#pragma HLS aggregate variable = arb_stream_in[3]._ bit
#pragma HLS interface ap_fifo port = arb_stream_in[3]._peek
#pragma HLS aggregate variable = arb_stream_in[3]._peek bit
void(arb_stream_in[3]._.empty());
void(arb_stream_in[3]._peek.empty());
#pragma HLS interface ap_fifo port = arb_stream_in[4]._
#pragma HLS aggregate variable = arb_stream_in[4]._ bit
#pragma HLS interface ap_fifo port = arb_stream_in[4]._peek
#pragma HLS aggregate variable = arb_stream_in[4]._peek bit
void(arb_stream_in[4]._.empty());
void(arb_stream_in[4]._peek.empty());
#pragma HLS interface ap_fifo port = arb_stream_in[5]._
#pragma HLS aggregate variable = arb_stream_in[5]._ bit
#pragma HLS interface ap_fifo port = arb_stream_in[5]._peek
#pragma HLS aggregate variable = arb_stream_in[5]._peek bit
void(arb_stream_in[5]._.empty());
void(arb_stream_in[5]._peek.empty());
#pragma HLS interface ap_fifo port = arb_stream_in[6]._
#pragma HLS aggregate variable = arb_stream_in[6]._ bit
#pragma HLS interface ap_fifo port = arb_stream_in[6]._peek
#pragma HLS aggregate variable = arb_stream_in[6]._peek bit
void(arb_stream_in[6]._.empty());
void(arb_stream_in[6]._peek.empty());
#pragma HLS interface ap_fifo port = arb_stream_in[7]._
#pragma HLS aggregate variable = arb_stream_in[7]._ bit
#pragma HLS interface ap_fifo port = arb_stream_in[7]._peek
#pragma HLS aggregate variable = arb_stream_in[7]._peek bit
void(arb_stream_in[7]._.empty());
void(arb_stream_in[7]._peek.empty());

#pragma HLS disaggregate variable = arb_stream_out
#pragma HLS array_partition variable = arb_stream_out complete
#pragma HLS interface ap_fifo port = arb_stream_out[0]._
#pragma HLS aggregate variable = arb_stream_out[0]._ bit
void(arb_stream_out[0]._.full());
#pragma HLS interface ap_fifo port = arb_stream_out[1]._
#pragma HLS aggregate variable = arb_stream_out[1]._ bit
void(arb_stream_out[1]._.full());
#pragma HLS interface ap_fifo port = arb_stream_out[2]._
#pragma HLS aggregate variable = arb_stream_out[2]._ bit
void(arb_stream_out[2]._.full());
#pragma HLS interface ap_fifo port = arb_stream_out[3]._
#pragma HLS aggregate variable = arb_stream_out[3]._ bit
void(arb_stream_out[3]._.full());
#pragma HLS interface ap_fifo port = arb_stream_out[4]._
#pragma HLS aggregate variable = arb_stream_out[4]._ bit
void(arb_stream_out[4]._.full());
#pragma HLS interface ap_fifo port = arb_stream_out[5]._
#pragma HLS aggregate variable = arb_stream_out[5]._ bit
void(arb_stream_out[5]._.full());
#pragma HLS interface ap_fifo port = arb_stream_out[6]._
#pragma HLS aggregate variable = arb_stream_out[6]._ bit
void(arb_stream_out[6]._.full());
#pragma HLS interface ap_fifo port = arb_stream_out[7]._
#pragma HLS aggregate variable = arb_stream_out[7]._ bit
void(arb_stream_out[7]._.full());

#pragma HLS disaggregate variable = fdbk_stream_0
#pragma HLS array_partition variable = fdbk_stream_0 complete
#pragma HLS interface ap_fifo port = fdbk_stream_0[0]._
#pragma HLS aggregate variable = fdbk_stream_0[0]._ bit
void(fdbk_stream_0[0]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_0[1]._
#pragma HLS aggregate variable = fdbk_stream_0[1]._ bit
void(fdbk_stream_0[1]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_0[2]._
#pragma HLS aggregate variable = fdbk_stream_0[2]._ bit
void(fdbk_stream_0[2]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_0[3]._
#pragma HLS aggregate variable = fdbk_stream_0[3]._ bit
void(fdbk_stream_0[3]._.full());

#pragma HLS disaggregate variable = fdbk_stream_1
#pragma HLS array_partition variable = fdbk_stream_1 complete
#pragma HLS interface ap_fifo port = fdbk_stream_1[0]._
#pragma HLS aggregate variable = fdbk_stream_1[0]._ bit
void(fdbk_stream_1[0]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_1[1]._
#pragma HLS aggregate variable = fdbk_stream_1[1]._ bit
void(fdbk_stream_1[1]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_1[2]._
#pragma HLS aggregate variable = fdbk_stream_1[2]._ bit
void(fdbk_stream_1[2]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_1[3]._
#pragma HLS aggregate variable = fdbk_stream_1[3]._ bit
void(fdbk_stream_1[3]._.full());

#pragma HLS disaggregate variable = fdbk_stream_2
#pragma HLS array_partition variable = fdbk_stream_2 complete
#pragma HLS interface ap_fifo port = fdbk_stream_2[0]._
#pragma HLS aggregate variable = fdbk_stream_2[0]._ bit
void(fdbk_stream_2[0]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_2[1]._
#pragma HLS aggregate variable = fdbk_stream_2[1]._ bit
void(fdbk_stream_2[1]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_2[2]._
#pragma HLS aggregate variable = fdbk_stream_2[2]._ bit
void(fdbk_stream_2[2]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_2[3]._
#pragma HLS aggregate variable = fdbk_stream_2[3]._ bit
void(fdbk_stream_2[3]._.full());

#pragma HLS disaggregate variable = fdbk_stream_3
#pragma HLS array_partition variable = fdbk_stream_3 complete
#pragma HLS interface ap_fifo port = fdbk_stream_3[0]._
#pragma HLS aggregate variable = fdbk_stream_3[0]._ bit
void(fdbk_stream_3[0]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_3[1]._
#pragma HLS aggregate variable = fdbk_stream_3[1]._ bit
void(fdbk_stream_3[1]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_3[2]._
#pragma HLS aggregate variable = fdbk_stream_3[2]._ bit
void(fdbk_stream_3[2]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_3[3]._
#pragma HLS aggregate variable = fdbk_stream_3[3]._ bit
void(fdbk_stream_3[3]._.full());

#pragma HLS disaggregate variable = fdbk_stream_4
#pragma HLS array_partition variable = fdbk_stream_4 complete
#pragma HLS interface ap_fifo port = fdbk_stream_4[0]._
#pragma HLS aggregate variable = fdbk_stream_4[0]._ bit
void(fdbk_stream_4[0]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_4[1]._
#pragma HLS aggregate variable = fdbk_stream_4[1]._ bit
void(fdbk_stream_4[1]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_4[2]._
#pragma HLS aggregate variable = fdbk_stream_4[2]._ bit
void(fdbk_stream_4[2]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_4[3]._
#pragma HLS aggregate variable = fdbk_stream_4[3]._ bit
void(fdbk_stream_4[3]._.full());

#pragma HLS disaggregate variable = fdbk_stream_5
#pragma HLS array_partition variable = fdbk_stream_5 complete
#pragma HLS interface ap_fifo port = fdbk_stream_5[0]._
#pragma HLS aggregate variable = fdbk_stream_5[0]._ bit
void(fdbk_stream_5[0]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_5[1]._
#pragma HLS aggregate variable = fdbk_stream_5[1]._ bit
void(fdbk_stream_5[1]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_5[2]._
#pragma HLS aggregate variable = fdbk_stream_5[2]._ bit
void(fdbk_stream_5[2]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_5[3]._
#pragma HLS aggregate variable = fdbk_stream_5[3]._ bit
void(fdbk_stream_5[3]._.full());

#pragma HLS disaggregate variable = fdbk_stream_6
#pragma HLS array_partition variable = fdbk_stream_6 complete
#pragma HLS interface ap_fifo port = fdbk_stream_6[0]._
#pragma HLS aggregate variable = fdbk_stream_6[0]._ bit
void(fdbk_stream_6[0]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_6[1]._
#pragma HLS aggregate variable = fdbk_stream_6[1]._ bit
void(fdbk_stream_6[1]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_6[2]._
#pragma HLS aggregate variable = fdbk_stream_6[2]._ bit
void(fdbk_stream_6[2]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_6[3]._
#pragma HLS aggregate variable = fdbk_stream_6[3]._ bit
void(fdbk_stream_6[3]._.full());

#pragma HLS disaggregate variable = fdbk_stream_7
#pragma HLS array_partition variable = fdbk_stream_7 complete
#pragma HLS interface ap_fifo port = fdbk_stream_7[0]._
#pragma HLS aggregate variable = fdbk_stream_7[0]._ bit
void(fdbk_stream_7[0]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_7[1]._
#pragma HLS aggregate variable = fdbk_stream_7[1]._ bit
void(fdbk_stream_7[1]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_7[2]._
#pragma HLS aggregate variable = fdbk_stream_7[2]._ bit
void(fdbk_stream_7[2]._.full());
#pragma HLS interface ap_fifo port = fdbk_stream_7[3]._
#pragma HLS aggregate variable = fdbk_stream_7[3]._ bit
void(fdbk_stream_7[3]._.full());

    int WRITE_STOP_COUNT = 0;
    /* Depending on which level this ratemon is in,
     * it expects a different number of writes.
     */
    WRITE_STOP_COUNT = (5) * KEYPAIRS_PER_STM;
    int writes_per_partition[(8) /* each sub bv is further partitioned into this chunks*/] = {};
    int CRASH_COMPILATION_IF_MISTAKE;
    typedef struct {
        ap_uint<BIT_BITWIDTH> valid;
        PACKED_HASH_DTYPE value;
    } XBAR_DTYPE;
    typedef enum {
        WR_FEEDBACK,
        WR_OUTPUT
    } RATEMON_MODE;
    XBAR_DTYPE xbar[(8) /* each sub bv is further partitioned into this chunks*/];
#pragma HLS ARRAY_PARTITION variable=xbar dim=0 complete
    ap_uint<INPUT_IDX_BITWIDTH> min_output_idx[(5)];
#pragma HLS ARRAY_PARTITION variable=min_output_idx dim=0 complete
    ap_uint<BIT_BITWIDTH> idx_tracker[(5)][(8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/];
#pragma HLS ARRAY_PARTITION variable=idx_tracker dim=0 complete
    INIT_LOOP:
    for (int i = 0; i < (8) /* each sub bv is further partitioned into this chunks*/; ++i) {
        xbar[i].valid = 0;
        writes_per_partition[i] = 0;
    }
    INIT_LOOP_2:
    for (int i = 0; i < (5); ++i) {
        min_output_idx[i] = 0;
        for (int j = 0; j < (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; ++j) {
            idx_tracker[i][j] = 0;
        }
    }
    MAIN_LOOP:
    while (
            writes_per_partition[0] +
            writes_per_partition[1] +
            writes_per_partition[2] +
            writes_per_partition[3] +
            writes_per_partition[4] +
            writes_per_partition[5] +
            writes_per_partition[6] +
            writes_per_partition[7]
                                < WRITE_STOP_COUNT)
    {
#pragma HLS PIPELINE II=1
        RATEMON_FEEDBACK_DTYPE feedback;
        RD_INPUTS:
        for (int partition_idx = 0; partition_idx < (8) /* each sub bv is further partitioned into this chunks*/; ++partition_idx) {
            ap_uint<INPUT_IDX_BITWIDTH> cur_input_idx;
            ap_uint<STRM_IDX_BITWIDTH> cur_strm_idx;
            METADATA_DTYPE cur_metadata;
            if (xbar[partition_idx].valid == 0 &&
                !arb_stream_in[partition_idx].empty()
            ){
                xbar[partition_idx].valid = 1;
                xbar[partition_idx].value = arb_stream_in[partition_idx].read();
            }
        }
        ///////////////////////
        // WR_OUTPUTS:
        ///////////////////////
        for (int sidx = 0; sidx < (5); ++sidx) { int offset = (xbar[0].value.md.iidx) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (xbar[0].valid && xbar[0].value.md.sidx == sidx && !arb_stream_out[0].full()) { xbar[0].valid = 0; arb_stream_out[0].write(xbar[0].value); idx_tracker[sidx][offset] = 1; writes_per_partition[0]++; break; } }
        for (int sidx = 0; sidx < (5); ++sidx) { int offset = (xbar[1].value.md.iidx) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (xbar[1].valid && xbar[1].value.md.sidx == sidx && !arb_stream_out[1].full()) { xbar[1].valid = 0; arb_stream_out[1].write(xbar[1].value); idx_tracker[sidx][offset] = 1; writes_per_partition[1]++; break; } }
        for (int sidx = 0; sidx < (5); ++sidx) { int offset = (xbar[2].value.md.iidx) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (xbar[2].valid && xbar[2].value.md.sidx == sidx && !arb_stream_out[2].full()) { xbar[2].valid = 0; arb_stream_out[2].write(xbar[2].value); idx_tracker[sidx][offset] = 1; writes_per_partition[2]++; break; } }
        for (int sidx = 0; sidx < (5); ++sidx) { int offset = (xbar[3].value.md.iidx) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (xbar[3].valid && xbar[3].value.md.sidx == sidx && !arb_stream_out[3].full()) { xbar[3].valid = 0; arb_stream_out[3].write(xbar[3].value); idx_tracker[sidx][offset] = 1; writes_per_partition[3]++; break; } }
        for (int sidx = 0; sidx < (5); ++sidx) { int offset = (xbar[4].value.md.iidx) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (xbar[4].valid && xbar[4].value.md.sidx == sidx && !arb_stream_out[4].full()) { xbar[4].valid = 0; arb_stream_out[4].write(xbar[4].value); idx_tracker[sidx][offset] = 1; writes_per_partition[4]++; break; } }
        for (int sidx = 0; sidx < (5); ++sidx) { int offset = (xbar[5].value.md.iidx) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (xbar[5].valid && xbar[5].value.md.sidx == sidx && !arb_stream_out[5].full()) { xbar[5].valid = 0; arb_stream_out[5].write(xbar[5].value); idx_tracker[sidx][offset] = 1; writes_per_partition[5]++; break; } }
        for (int sidx = 0; sidx < (5); ++sidx) { int offset = (xbar[6].value.md.iidx) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (xbar[6].valid && xbar[6].value.md.sidx == sidx && !arb_stream_out[6].full()) { xbar[6].valid = 0; arb_stream_out[6].write(xbar[6].value); idx_tracker[sidx][offset] = 1; writes_per_partition[6]++; break; } }
        for (int sidx = 0; sidx < (5); ++sidx) { int offset = (xbar[7].value.md.iidx) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (xbar[7].valid && xbar[7].value.md.sidx == sidx && !arb_stream_out[7].full()) { xbar[7].valid = 0; arb_stream_out[7].write(xbar[7].value); idx_tracker[sidx][offset] = 1; writes_per_partition[7]++; break; } }
        ///////////////////////
        // UPDATE_IDCES:
        ///////////////////////
        int shuf_idx0 = (min_output_idx[0] + 1) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (idx_tracker[0][shuf_idx0] == 1) { min_output_idx[0] += 1; idx_tracker[0][shuf_idx0] = 0; } /*#ifdef __DO_DEBUG_PRINTS__                    //printf("ARBITER RATEMON %d %c kp%d - Updating min_output_idx[%d]=%d\n",                   //        arb_idx,                  //        ratemon_ID,                   //        kp_idx,                   //        STM,                  //        min_output_idx[STM].to_int()                  //);                    //#endif
*/ int shuf_idx1 = (min_output_idx[1] + 1) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (idx_tracker[1][shuf_idx1] == 1) { min_output_idx[1] += 1; idx_tracker[1][shuf_idx1] = 0; } /*#ifdef __DO_DEBUG_PRINTS__                    //printf("ARBITER RATEMON %d %c kp%d - Updating min_output_idx[%d]=%d\n",                   //        arb_idx,                  //        ratemon_ID,                   //        kp_idx,                   //        STM,                  //        min_output_idx[STM].to_int()                  //);                    //#endif
*/ int shuf_idx2 = (min_output_idx[2] + 1) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (idx_tracker[2][shuf_idx2] == 1) { min_output_idx[2] += 1; idx_tracker[2][shuf_idx2] = 0; } /*#ifdef __DO_DEBUG_PRINTS__                    //printf("ARBITER RATEMON %d %c kp%d - Updating min_output_idx[%d]=%d\n",                   //        arb_idx,                  //        ratemon_ID,                   //        kp_idx,                   //        STM,                  //        min_output_idx[STM].to_int()                  //);                    //#endif
*/ int shuf_idx3 = (min_output_idx[3] + 1) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (idx_tracker[3][shuf_idx3] == 1) { min_output_idx[3] += 1; idx_tracker[3][shuf_idx3] = 0; } /*#ifdef __DO_DEBUG_PRINTS__                    //printf("ARBITER RATEMON %d %c kp%d - Updating min_output_idx[%d]=%d\n",                   //        arb_idx,                  //        ratemon_ID,                   //        kp_idx,                   //        STM,                  //        min_output_idx[STM].to_int()                  //);                    //#endif
*/ int shuf_idx4 = (min_output_idx[4] + 1) % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (idx_tracker[4][shuf_idx4] == 1) { min_output_idx[4] += 1; idx_tracker[4][shuf_idx4] = 0; } /*#ifdef __DO_DEBUG_PRINTS__                    //printf("ARBITER RATEMON %d %c kp%d - Updating min_output_idx[%d]=%d\n",                   //        arb_idx,                  //        ratemon_ID,                   //        kp_idx,                   //        STM,                  //        min_output_idx[STM].to_int()                  //);                    //#endif
*/
        WRITE_FEEDBACK:
        /* For the ratemonitors NOT in the last level, we dont
         * have the data from all 4 streams. So dont attempt to ratelimit
         * based on data we cant get.
         */
        feedback.strm0_out_idx = min_output_idx[0];
        feedback.strm1_out_idx = min_output_idx[1];
        feedback.strm2_out_idx = min_output_idx[2];
        feedback.strm3_out_idx = min_output_idx[3];
        feedback.strm4_out_idx = min_output_idx[4];
        for (int i = 0; i < ((5) - 1); ++i) {
            fdbk_stream_0[i].try_write(feedback);
            fdbk_stream_1[i].try_write(feedback);
            fdbk_stream_2[i].try_write(feedback);
            fdbk_stream_3[i].try_write(feedback);
            fdbk_stream_4[i].try_write(feedback);
            fdbk_stream_5[i].try_write(feedback);
            fdbk_stream_6[i].try_write(feedback);
            fdbk_stream_7[i].try_write(feedback);
        }
    }
}
void bloom_arbiter_tree_singlepartition(
    int arb_idx
    ,int partition_idx
    ,int kp_idx
    ,tapa::istream<PACKED_HASH_DTYPE> &arb_stm0
    ,tapa::istream<PACKED_HASH_DTYPE> &arb_stm1
    ,tapa::istream<PACKED_HASH_DTYPE> &arb_stm2
    ,tapa::istream<PACKED_HASH_DTYPE> &arb_stm3
    ,tapa::istream<PACKED_HASH_DTYPE> &arb_stm4
    ,tapa::istreams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> &ratemon_feedback
    ,tapa::ostream<PACKED_HASH_DTYPE> &arbtree_out
) ;
void bloom_single_arbiter(
        int arb_idx
        , int kp_idx
        , tapa::istreams<PACKED_HASH_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> &in_arb_streams
        , tapa::ostreams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> &bv_lookup_stream
) ;
//////////////////////////////////////////////////
//////////////////////////////////////////////////
///////// END OF Arbiter                    //////
//////////////////////////////////////////////////
//////////////////////////////////////////////////
void queryResult_per_hash(
        int hash_idx
        ,tapa::istream<ap_uint<BV_PACKED_BITWIDTH> > & bv_load_stream
        ,tapa::istreams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> & bv_lookup_stream_kp0
        ,tapa::istreams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> & bv_lookup_stream_kp1
        ,tapa::ostreams<BV_PLUS_METADATA_PACKED_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> & query_bv_packed_stream_kp0
        ,tapa::ostreams<BV_PLUS_METADATA_PACKED_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> & query_bv_packed_stream_kp1
) ;
/*************************************************************************************/
void shuffle_TtoS_per_hash(
        int shuffle_idx
        ,int kp_idx
        ,tapa::istreams<BV_PLUS_METADATA_PACKED_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> & query_bv_packed_stream
        ,tapa::ostreams<BV_PLUS_IIDX_PACKED_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> & inter_shuffle_stream
);
void shuffle_reordering_per_hash(
        int shuffle_idx
        ,int stm_idx
        ,int kp_idx
        ,tapa::istream<BV_PLUS_IIDX_PACKED_DTYPE> & inter_shuffle_stream_p0
        ,tapa::istream<BV_PLUS_IIDX_PACKED_DTYPE> & inter_shuffle_stream_p1
        ,tapa::istream<BV_PLUS_IIDX_PACKED_DTYPE> & inter_shuffle_stream_p2
        ,tapa::istream<BV_PLUS_IIDX_PACKED_DTYPE> & inter_shuffle_stream_p3
        ,tapa::istream<BV_PLUS_IIDX_PACKED_DTYPE> & inter_shuffle_stream_p4
        ,tapa::istream<BV_PLUS_IIDX_PACKED_DTYPE> & inter_shuffle_stream_p5
        ,tapa::istream<BV_PLUS_IIDX_PACKED_DTYPE> & inter_shuffle_stream_p6
        ,tapa::istream<BV_PLUS_IIDX_PACKED_DTYPE> & inter_shuffle_stream_p7
        ,tapa::ostream<ap_uint<BIT_BITWIDTH> > & reconstruct_stream
)
;
void bloom_aggregate_SPLIT(
        int agg_idx,
        int kp_idx,
        tapa::istreams<ap_uint<BIT_BITWIDTH>, (3)> & reconstruct_stream,
        tapa::ostream<ap_uint<BIT_BITWIDTH> > & aggregate_stream
);
/*************************************************************************************/
void packOutput(
        int strm_idx
        ,int kp_idx
        ,tapa::istream<ap_uint<BIT_BITWIDTH> > & aggregate_stream
        ,tapa::ostream<ap_uint<((32))> > & packed_outputs_stream
) ;
void writeOutput_synchronous(
        tapa::istream<ap_uint<((32))> >& packed_outputs_stream_s0_kp0,
        tapa::istream<ap_uint<((32))> >& packed_outputs_stream_s0_kp1,
        tapa::istream<ap_uint<((32))> >& packed_outputs_stream_s1_kp0,
        tapa::istream<ap_uint<((32))> >& packed_outputs_stream_s1_kp1,
        tapa::istream<ap_uint<((32))> >& packed_outputs_stream_s2_kp0,
        tapa::istream<ap_uint<((32))> >& packed_outputs_stream_s2_kp1,
        tapa::istream<ap_uint<((32))> >& packed_outputs_stream_s3_kp0,
        tapa::istream<ap_uint<((32))> >& packed_outputs_stream_s3_kp1,
        tapa::istream<ap_uint<((32))> >& packed_outputs_stream_s4_kp0,
        tapa::istream<ap_uint<((32))> >& packed_outputs_stream_s4_kp1,
        uint64_t  outmmap
);
/*************************************************************************************/
void workload(
    uint64_t  input_bv
    ,uint64_t  key_in
    ,uint64_t  out_bits
     //Add a dummy, useless variable because TAPA fast-cosim doesnt work without it.
    ,int UNUSED_DUMMY
)
;
