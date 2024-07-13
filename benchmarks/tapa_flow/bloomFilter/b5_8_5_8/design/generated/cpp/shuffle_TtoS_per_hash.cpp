
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
    ap_uint<BV_PACKED_BITWIDTH> section3;
    ap_uint<BV_PACKED_BITWIDTH> section4;
    ap_uint<BV_PACKED_BITWIDTH> padding5;
    ap_uint<BV_PACKED_BITWIDTH> padding6;
    ap_uint<BV_PACKED_BITWIDTH> padding7;
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
    const int _BV_ROUNDING_FACTOR_ = (5) * BV_PACKED_BITWIDTH * (8) /* each sub bv is further partitioned into this chunks*/;
    const int BV_LENGTH = ( (((1024*1024*4)*(5))-1)/_BV_ROUNDING_FACTOR_ + 1) * _BV_ROUNDING_FACTOR_;
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
    ,tapa::ostream<ap_uint<BV_PACKED_BITWIDTH> > & bv_load_stream_3
    ,tapa::ostream<ap_uint<BV_PACKED_BITWIDTH> > & bv_load_stream_4
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
        tapa::ostreams<ap_uint<(32)>, (5)> & key_out_stream
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
);
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
){


#pragma HLS disaggregate variable = query_bv_packed_stream
#pragma HLS array_partition variable = query_bv_packed_stream complete
#pragma HLS interface ap_fifo port = query_bv_packed_stream[0]._
#pragma HLS aggregate variable = query_bv_packed_stream[0]._ bit
#pragma HLS interface ap_fifo port = query_bv_packed_stream[0]._peek
#pragma HLS aggregate variable = query_bv_packed_stream[0]._peek bit
void(query_bv_packed_stream[0]._.empty());
void(query_bv_packed_stream[0]._peek.empty());
#pragma HLS interface ap_fifo port = query_bv_packed_stream[1]._
#pragma HLS aggregate variable = query_bv_packed_stream[1]._ bit
#pragma HLS interface ap_fifo port = query_bv_packed_stream[1]._peek
#pragma HLS aggregate variable = query_bv_packed_stream[1]._peek bit
void(query_bv_packed_stream[1]._.empty());
void(query_bv_packed_stream[1]._peek.empty());
#pragma HLS interface ap_fifo port = query_bv_packed_stream[2]._
#pragma HLS aggregate variable = query_bv_packed_stream[2]._ bit
#pragma HLS interface ap_fifo port = query_bv_packed_stream[2]._peek
#pragma HLS aggregate variable = query_bv_packed_stream[2]._peek bit
void(query_bv_packed_stream[2]._.empty());
void(query_bv_packed_stream[2]._peek.empty());
#pragma HLS interface ap_fifo port = query_bv_packed_stream[3]._
#pragma HLS aggregate variable = query_bv_packed_stream[3]._ bit
#pragma HLS interface ap_fifo port = query_bv_packed_stream[3]._peek
#pragma HLS aggregate variable = query_bv_packed_stream[3]._peek bit
void(query_bv_packed_stream[3]._.empty());
void(query_bv_packed_stream[3]._peek.empty());
#pragma HLS interface ap_fifo port = query_bv_packed_stream[4]._
#pragma HLS aggregate variable = query_bv_packed_stream[4]._ bit
#pragma HLS interface ap_fifo port = query_bv_packed_stream[4]._peek
#pragma HLS aggregate variable = query_bv_packed_stream[4]._peek bit
void(query_bv_packed_stream[4]._.empty());
void(query_bv_packed_stream[4]._peek.empty());
#pragma HLS interface ap_fifo port = query_bv_packed_stream[5]._
#pragma HLS aggregate variable = query_bv_packed_stream[5]._ bit
#pragma HLS interface ap_fifo port = query_bv_packed_stream[5]._peek
#pragma HLS aggregate variable = query_bv_packed_stream[5]._peek bit
void(query_bv_packed_stream[5]._.empty());
void(query_bv_packed_stream[5]._peek.empty());
#pragma HLS interface ap_fifo port = query_bv_packed_stream[6]._
#pragma HLS aggregate variable = query_bv_packed_stream[6]._ bit
#pragma HLS interface ap_fifo port = query_bv_packed_stream[6]._peek
#pragma HLS aggregate variable = query_bv_packed_stream[6]._peek bit
void(query_bv_packed_stream[6]._.empty());
void(query_bv_packed_stream[6]._peek.empty());
#pragma HLS interface ap_fifo port = query_bv_packed_stream[7]._
#pragma HLS aggregate variable = query_bv_packed_stream[7]._ bit
#pragma HLS interface ap_fifo port = query_bv_packed_stream[7]._peek
#pragma HLS aggregate variable = query_bv_packed_stream[7]._peek bit
void(query_bv_packed_stream[7]._.empty());
void(query_bv_packed_stream[7]._peek.empty());

#pragma HLS disaggregate variable = inter_shuffle_stream
#pragma HLS array_partition variable = inter_shuffle_stream complete
#pragma HLS interface ap_fifo port = inter_shuffle_stream[0]._
#pragma HLS aggregate variable = inter_shuffle_stream[0]._ bit
void(inter_shuffle_stream[0]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[1]._
#pragma HLS aggregate variable = inter_shuffle_stream[1]._ bit
void(inter_shuffle_stream[1]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[2]._
#pragma HLS aggregate variable = inter_shuffle_stream[2]._ bit
void(inter_shuffle_stream[2]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[3]._
#pragma HLS aggregate variable = inter_shuffle_stream[3]._ bit
void(inter_shuffle_stream[3]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[4]._
#pragma HLS aggregate variable = inter_shuffle_stream[4]._ bit
void(inter_shuffle_stream[4]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[5]._
#pragma HLS aggregate variable = inter_shuffle_stream[5]._ bit
void(inter_shuffle_stream[5]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[6]._
#pragma HLS aggregate variable = inter_shuffle_stream[6]._ bit
void(inter_shuffle_stream[6]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[7]._
#pragma HLS aggregate variable = inter_shuffle_stream[7]._ bit
void(inter_shuffle_stream[7]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[8]._
#pragma HLS aggregate variable = inter_shuffle_stream[8]._ bit
void(inter_shuffle_stream[8]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[9]._
#pragma HLS aggregate variable = inter_shuffle_stream[9]._ bit
void(inter_shuffle_stream[9]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[10]._
#pragma HLS aggregate variable = inter_shuffle_stream[10]._ bit
void(inter_shuffle_stream[10]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[11]._
#pragma HLS aggregate variable = inter_shuffle_stream[11]._ bit
void(inter_shuffle_stream[11]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[12]._
#pragma HLS aggregate variable = inter_shuffle_stream[12]._ bit
void(inter_shuffle_stream[12]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[13]._
#pragma HLS aggregate variable = inter_shuffle_stream[13]._ bit
void(inter_shuffle_stream[13]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[14]._
#pragma HLS aggregate variable = inter_shuffle_stream[14]._ bit
void(inter_shuffle_stream[14]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[15]._
#pragma HLS aggregate variable = inter_shuffle_stream[15]._ bit
void(inter_shuffle_stream[15]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[16]._
#pragma HLS aggregate variable = inter_shuffle_stream[16]._ bit
void(inter_shuffle_stream[16]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[17]._
#pragma HLS aggregate variable = inter_shuffle_stream[17]._ bit
void(inter_shuffle_stream[17]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[18]._
#pragma HLS aggregate variable = inter_shuffle_stream[18]._ bit
void(inter_shuffle_stream[18]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[19]._
#pragma HLS aggregate variable = inter_shuffle_stream[19]._ bit
void(inter_shuffle_stream[19]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[20]._
#pragma HLS aggregate variable = inter_shuffle_stream[20]._ bit
void(inter_shuffle_stream[20]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[21]._
#pragma HLS aggregate variable = inter_shuffle_stream[21]._ bit
void(inter_shuffle_stream[21]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[22]._
#pragma HLS aggregate variable = inter_shuffle_stream[22]._ bit
void(inter_shuffle_stream[22]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[23]._
#pragma HLS aggregate variable = inter_shuffle_stream[23]._ bit
void(inter_shuffle_stream[23]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[24]._
#pragma HLS aggregate variable = inter_shuffle_stream[24]._ bit
void(inter_shuffle_stream[24]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[25]._
#pragma HLS aggregate variable = inter_shuffle_stream[25]._ bit
void(inter_shuffle_stream[25]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[26]._
#pragma HLS aggregate variable = inter_shuffle_stream[26]._ bit
void(inter_shuffle_stream[26]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[27]._
#pragma HLS aggregate variable = inter_shuffle_stream[27]._ bit
void(inter_shuffle_stream[27]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[28]._
#pragma HLS aggregate variable = inter_shuffle_stream[28]._ bit
void(inter_shuffle_stream[28]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[29]._
#pragma HLS aggregate variable = inter_shuffle_stream[29]._ bit
void(inter_shuffle_stream[29]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[30]._
#pragma HLS aggregate variable = inter_shuffle_stream[30]._ bit
void(inter_shuffle_stream[30]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[31]._
#pragma HLS aggregate variable = inter_shuffle_stream[31]._ bit
void(inter_shuffle_stream[31]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[32]._
#pragma HLS aggregate variable = inter_shuffle_stream[32]._ bit
void(inter_shuffle_stream[32]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[33]._
#pragma HLS aggregate variable = inter_shuffle_stream[33]._ bit
void(inter_shuffle_stream[33]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[34]._
#pragma HLS aggregate variable = inter_shuffle_stream[34]._ bit
void(inter_shuffle_stream[34]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[35]._
#pragma HLS aggregate variable = inter_shuffle_stream[35]._ bit
void(inter_shuffle_stream[35]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[36]._
#pragma HLS aggregate variable = inter_shuffle_stream[36]._ bit
void(inter_shuffle_stream[36]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[37]._
#pragma HLS aggregate variable = inter_shuffle_stream[37]._ bit
void(inter_shuffle_stream[37]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[38]._
#pragma HLS aggregate variable = inter_shuffle_stream[38]._ bit
void(inter_shuffle_stream[38]._.full());
#pragma HLS interface ap_fifo port = inter_shuffle_stream[39]._
#pragma HLS aggregate variable = inter_shuffle_stream[39]._ bit
void(inter_shuffle_stream[39]._.full());

    typedef struct {
        ap_uint<BIT_BITWIDTH> BV;
        ap_uint<INPUT_IDX_BITWIDTH> input_idx;
        bool valid;
    } PEEKED_DTYPE;
    //int next_output_idx[NUM_STM];
    //#pragma HLS ARRAY_PARTITION variable=next_output_idx dim=0 complete
    // This is a buffer for data from each partition.
    // We also introduce a NUM_STM dimension, otherwise we hang.
    PEEKED_DTYPE shuffle_peek_emulator[(8) /* each sub bv is further partitioned into this chunks*/][(5)];
#pragma HLS ARRAY_PARTITION variable=shuffle_peek_emulator dim=0 complete
    //NEXT_OUTPUT_IDX_INIT:
    //for (int i = 0; i < NUM_STM; ++i) {
    //#pragma HLS UNROLL
    //    next_output_idx[i] = 1;
    //}
    PEEK_EMULATOR_INITIALIZATION:
    for (int j=0; j<(8) /* each sub bv is further partitioned into this chunks*/; ++j){
#pragma HLS UNROLL
        for (int k=0; k<(5); ++k) {
#pragma HLS UNROLL
            shuffle_peek_emulator[j][k].BV = 0;
            shuffle_peek_emulator[j][k].input_idx = 0;
            shuffle_peek_emulator[j][k].valid = 0;
        }
    }
    while(1)
    {
#pragma HLS PIPELINE II=1
        ////////////////////////////////////////////
        // READ LOGIC. Read from each partition stream
        ////////////////////////////////////////////
        RD_BV_PARTITION_LOOP:
        for (int partition_idx = 0;
                partition_idx < (8) /* each sub bv is further partitioned into this chunks*/;
                ++partition_idx)
        {
#pragma HLS UNROLL
            // DATAPACKED TRANSFER:
            ap_uint<INPUT_IDX_BITWIDTH> cur_input_idx;
            ap_uint<STRM_IDX_BITWIDTH> cur_strm_idx;
            ap_uint<BIT_BITWIDTH> cur_bv_val;
            METADATA_DTYPE cur_metadata;
            BV_PLUS_METADATA_PACKED_DTYPE cur_packed_data;
            bool peek_success;
            peek_success = query_bv_packed_stream[partition_idx].try_peek(
                cur_packed_data
            );
            cur_metadata = cur_packed_data.md;
            cur_bv_val = cur_packed_data.bv_val;
            // Unpack metadata
            cur_strm_idx = cur_metadata.sidx;
            cur_input_idx = cur_metadata.iidx;
                // If the current "peeked" value is not valid, overwrite it
                // with valid data.
                if (peek_success &&
                    shuffle_peek_emulator[partition_idx][cur_strm_idx].valid == 0
                )
                {
                    query_bv_packed_stream[partition_idx].read();
                    // Write it into the buffer
                    shuffle_peek_emulator[partition_idx]
                        [cur_strm_idx].valid = 1;
                    shuffle_peek_emulator[partition_idx]
                        [cur_strm_idx].BV = cur_bv_val;
                    shuffle_peek_emulator[partition_idx]
                        [cur_strm_idx].input_idx = cur_input_idx;
                }
        }
        ////////////////////////////////////////////
        // WRITE OUTPUTS from the shuffle-buffer
        ////////////////////////////////////////////
        WR_STM_LOOP:
        for (int strm_idx = 0; strm_idx < (5); ++strm_idx)
        {
            WR_BV_PARTITION_LOOP:
            for (int partition_idx = 0;
                    partition_idx < (8) /* each sub bv is further partitioned into this chunks*/;
                    ++partition_idx)
            {
#pragma HLS UNROLL
                BV_PLUS_IIDX_PACKED_DTYPE outval;
                outval.bv_val = shuffle_peek_emulator[partition_idx][strm_idx].BV;
                outval.iidx = shuffle_peek_emulator[partition_idx][strm_idx].input_idx;
                if (shuffle_peek_emulator[partition_idx][strm_idx].valid == 1 &&
                    inter_shuffle_stream[strm_idx*(8) /* each sub bv is further partitioned into this chunks*/ + partition_idx].try_write(outval)
                ) {
                    shuffle_peek_emulator[partition_idx][strm_idx].valid = 0;
                }
            }
        }
    }
    return;
}
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
        tapa::istreams<ap_uint<BIT_BITWIDTH>, (5)> & reconstruct_stream,
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
