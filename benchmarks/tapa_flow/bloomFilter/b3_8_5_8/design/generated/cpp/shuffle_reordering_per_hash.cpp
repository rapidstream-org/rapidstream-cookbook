
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
    const int BV_LENGTH = ( ((512*((3)))-1)/_BV_ROUNDING_FACTOR_ + 1) * _BV_ROUNDING_FACTOR_;
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
const int KEYS_PER_STM = (( ( ( ( ( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) | (( ( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) >> 4) ) | (( ( ( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) | (( ( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) >> 4) ) >> 8) ) | (( ( ( ( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) | (( ( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) >> 4) ) | (( ( ( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) | (( ( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) | (( ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 0) | ((( ((1024*1*(5))-1)/(5) + 1)-1) >> 1) ) >> 2) ) >> 4) ) >> 8) ) >> 16 ) ))+1;
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
{



#pragma HLS disaggregate variable = inter_shuffle_stream_p0
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p0._
#pragma HLS aggregate variable = inter_shuffle_stream_p0._ bit
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p0._peek
#pragma HLS aggregate variable = inter_shuffle_stream_p0._peek bit
void(inter_shuffle_stream_p0._.empty());
void(inter_shuffle_stream_p0._peek.empty());

#pragma HLS disaggregate variable = inter_shuffle_stream_p1
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p1._
#pragma HLS aggregate variable = inter_shuffle_stream_p1._ bit
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p1._peek
#pragma HLS aggregate variable = inter_shuffle_stream_p1._peek bit
void(inter_shuffle_stream_p1._.empty());
void(inter_shuffle_stream_p1._peek.empty());

#pragma HLS disaggregate variable = inter_shuffle_stream_p2
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p2._
#pragma HLS aggregate variable = inter_shuffle_stream_p2._ bit
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p2._peek
#pragma HLS aggregate variable = inter_shuffle_stream_p2._peek bit
void(inter_shuffle_stream_p2._.empty());
void(inter_shuffle_stream_p2._peek.empty());

#pragma HLS disaggregate variable = inter_shuffle_stream_p3
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p3._
#pragma HLS aggregate variable = inter_shuffle_stream_p3._ bit
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p3._peek
#pragma HLS aggregate variable = inter_shuffle_stream_p3._peek bit
void(inter_shuffle_stream_p3._.empty());
void(inter_shuffle_stream_p3._peek.empty());

#pragma HLS disaggregate variable = inter_shuffle_stream_p4
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p4._
#pragma HLS aggregate variable = inter_shuffle_stream_p4._ bit
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p4._peek
#pragma HLS aggregate variable = inter_shuffle_stream_p4._peek bit
void(inter_shuffle_stream_p4._.empty());
void(inter_shuffle_stream_p4._peek.empty());

#pragma HLS disaggregate variable = inter_shuffle_stream_p5
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p5._
#pragma HLS aggregate variable = inter_shuffle_stream_p5._ bit
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p5._peek
#pragma HLS aggregate variable = inter_shuffle_stream_p5._peek bit
void(inter_shuffle_stream_p5._.empty());
void(inter_shuffle_stream_p5._peek.empty());

#pragma HLS disaggregate variable = inter_shuffle_stream_p6
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p6._
#pragma HLS aggregate variable = inter_shuffle_stream_p6._ bit
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p6._peek
#pragma HLS aggregate variable = inter_shuffle_stream_p6._peek bit
void(inter_shuffle_stream_p6._.empty());
void(inter_shuffle_stream_p6._peek.empty());

#pragma HLS disaggregate variable = inter_shuffle_stream_p7
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p7._
#pragma HLS aggregate variable = inter_shuffle_stream_p7._ bit
#pragma HLS interface ap_fifo port = inter_shuffle_stream_p7._peek
#pragma HLS aggregate variable = inter_shuffle_stream_p7._peek bit
void(inter_shuffle_stream_p7._.empty());
void(inter_shuffle_stream_p7._peek.empty());

#pragma HLS disaggregate variable = reconstruct_stream
#pragma HLS interface ap_fifo port = reconstruct_stream._
#pragma HLS aggregate variable = reconstruct_stream._ bit
void(reconstruct_stream._.full());

    typedef struct {
        ap_uint<BIT_BITWIDTH> bv;
        ap_uint<INPUT_IDX_BITWIDTH> iidx;
        bool valid;
    } PEEKED_DTYPE;
    int next_output_idx = 1;
    PEEKED_DTYPE shufbuf[(8) /* each sub bv is further partitioned into this chunks*/][(8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/];
#pragma HLS ARRAY_PARTITION variable=shufbuf dim=0 complete
    PEEK_EMULATOR_INIT:
    for (int p = 0; p < (8) /* each sub bv is further partitioned into this chunks*/; ++p) {
        for (int i = 0; i < (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; ++i) {
            shufbuf[p][i].bv = 0;
            shufbuf[p][i].iidx = 0;
            shufbuf[p][i].valid = 0;
        }
    }
    MAIN_LOOP:
    while(1)
    {
#pragma HLS PIPELINE II=1
        /////////////////////////////
        // READ LOGIC
        /////////////////////////////
                //#ifdef __DO_DEBUG_PRINTS__
                //printf("SHUFFLE ORDERING stm%d kp%d hash%d - read BV %d from partition %d, iidx %d, into buf_idx %d\n",
                //        stm_idx, kp_idx, shuffle_idx,
                //        read_val.bv_val.to_int(),
                //        partition_idx,
                //        read_val.iidx.to_int(),
                //        rd_buf_idx
                //);
                //#endif
        bool peek_success_p0; int rd_buf_idx_p0; BV_PLUS_IIDX_PACKED_DTYPE read_val_p0; peek_success_p0 = inter_shuffle_stream_p0.try_peek(read_val_p0); rd_buf_idx_p0 = read_val_p0.iidx % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (peek_success_p0 && shufbuf[0][rd_buf_idx_p0].valid == 0 ) { inter_shuffle_stream_p0.read(); shufbuf[0][rd_buf_idx_p0].bv = read_val_p0.bv_val; shufbuf[0][rd_buf_idx_p0].iidx = read_val_p0.iidx; shufbuf[0][rd_buf_idx_p0].valid = 1; }
        bool peek_success_p1; int rd_buf_idx_p1; BV_PLUS_IIDX_PACKED_DTYPE read_val_p1; peek_success_p1 = inter_shuffle_stream_p1.try_peek(read_val_p1); rd_buf_idx_p1 = read_val_p1.iidx % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (peek_success_p1 && shufbuf[1][rd_buf_idx_p1].valid == 0 ) { inter_shuffle_stream_p1.read(); shufbuf[1][rd_buf_idx_p1].bv = read_val_p1.bv_val; shufbuf[1][rd_buf_idx_p1].iidx = read_val_p1.iidx; shufbuf[1][rd_buf_idx_p1].valid = 1; }
        bool peek_success_p2; int rd_buf_idx_p2; BV_PLUS_IIDX_PACKED_DTYPE read_val_p2; peek_success_p2 = inter_shuffle_stream_p2.try_peek(read_val_p2); rd_buf_idx_p2 = read_val_p2.iidx % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (peek_success_p2 && shufbuf[2][rd_buf_idx_p2].valid == 0 ) { inter_shuffle_stream_p2.read(); shufbuf[2][rd_buf_idx_p2].bv = read_val_p2.bv_val; shufbuf[2][rd_buf_idx_p2].iidx = read_val_p2.iidx; shufbuf[2][rd_buf_idx_p2].valid = 1; }
        bool peek_success_p3; int rd_buf_idx_p3; BV_PLUS_IIDX_PACKED_DTYPE read_val_p3; peek_success_p3 = inter_shuffle_stream_p3.try_peek(read_val_p3); rd_buf_idx_p3 = read_val_p3.iidx % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (peek_success_p3 && shufbuf[3][rd_buf_idx_p3].valid == 0 ) { inter_shuffle_stream_p3.read(); shufbuf[3][rd_buf_idx_p3].bv = read_val_p3.bv_val; shufbuf[3][rd_buf_idx_p3].iidx = read_val_p3.iidx; shufbuf[3][rd_buf_idx_p3].valid = 1; }
        bool peek_success_p4; int rd_buf_idx_p4; BV_PLUS_IIDX_PACKED_DTYPE read_val_p4; peek_success_p4 = inter_shuffle_stream_p4.try_peek(read_val_p4); rd_buf_idx_p4 = read_val_p4.iidx % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (peek_success_p4 && shufbuf[4][rd_buf_idx_p4].valid == 0 ) { inter_shuffle_stream_p4.read(); shufbuf[4][rd_buf_idx_p4].bv = read_val_p4.bv_val; shufbuf[4][rd_buf_idx_p4].iidx = read_val_p4.iidx; shufbuf[4][rd_buf_idx_p4].valid = 1; }
        bool peek_success_p5; int rd_buf_idx_p5; BV_PLUS_IIDX_PACKED_DTYPE read_val_p5; peek_success_p5 = inter_shuffle_stream_p5.try_peek(read_val_p5); rd_buf_idx_p5 = read_val_p5.iidx % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (peek_success_p5 && shufbuf[5][rd_buf_idx_p5].valid == 0 ) { inter_shuffle_stream_p5.read(); shufbuf[5][rd_buf_idx_p5].bv = read_val_p5.bv_val; shufbuf[5][rd_buf_idx_p5].iidx = read_val_p5.iidx; shufbuf[5][rd_buf_idx_p5].valid = 1; }
        bool peek_success_p6; int rd_buf_idx_p6; BV_PLUS_IIDX_PACKED_DTYPE read_val_p6; peek_success_p6 = inter_shuffle_stream_p6.try_peek(read_val_p6); rd_buf_idx_p6 = read_val_p6.iidx % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (peek_success_p6 && shufbuf[6][rd_buf_idx_p6].valid == 0 ) { inter_shuffle_stream_p6.read(); shufbuf[6][rd_buf_idx_p6].bv = read_val_p6.bv_val; shufbuf[6][rd_buf_idx_p6].iidx = read_val_p6.iidx; shufbuf[6][rd_buf_idx_p6].valid = 1; }
        bool peek_success_p7; int rd_buf_idx_p7; BV_PLUS_IIDX_PACKED_DTYPE read_val_p7; peek_success_p7 = inter_shuffle_stream_p7.try_peek(read_val_p7); rd_buf_idx_p7 = read_val_p7.iidx % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/; if (peek_success_p7 && shufbuf[7][rd_buf_idx_p7].valid == 0 ) { inter_shuffle_stream_p7.read(); shufbuf[7][rd_buf_idx_p7].bv = read_val_p7.bv_val; shufbuf[7][rd_buf_idx_p7].iidx = read_val_p7.iidx; shufbuf[7][rd_buf_idx_p7].valid = 1; }
        /////////////////////////////
        // WRITE LOGIC
        /////////////////////////////
        bool write_ready = 0;
        int wr_buf_idx = next_output_idx % (8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/;
        int ready_partition_idx = 0;
        for (int partition_idx = 0; partition_idx < (8) /* each sub bv is further partitioned into this chunks*/; ++partition_idx)
        {
            if (shufbuf[partition_idx][wr_buf_idx].valid == 1 &&
                shufbuf[partition_idx][wr_buf_idx].iidx == next_output_idx
            )
            {
                write_ready = 1;
                ready_partition_idx = partition_idx;
                break;
            }
        }
        if (write_ready){
            ap_uint<BIT_BITWIDTH> write_success;
            ap_uint<BIT_BITWIDTH> v = shufbuf[ready_partition_idx][wr_buf_idx].bv;
            write_success = reconstruct_stream.try_write(v);
            if (write_success) {
                shufbuf[ready_partition_idx][wr_buf_idx].valid = 0;
                if (next_output_idx == KEYPAIRS_PER_STM) {
                    next_output_idx = 1;
                }
                else {
                    next_output_idx++;
                }
            }
        }
    }
}
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
