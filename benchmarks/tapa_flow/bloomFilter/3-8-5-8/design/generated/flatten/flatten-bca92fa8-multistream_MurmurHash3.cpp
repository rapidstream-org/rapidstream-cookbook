
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
        tapa::async_mmap<LOAD_DTYPE> & key_in
        ,tapa::ostreams<ap_uint<(32)>, (5)> & key_stream_kp0
        ,tapa::ostreams<ap_uint<(32)>, (5)> & key_stream_kp1
){
    LOAD_DTYPE cur_load;
    for (int i_req = 0, i_resp = 0;
            i_resp < KEYPAIRS_PER_STM; )
    {
#pragma HLS PIPELINE II=1
        if (i_req < KEYPAIRS_PER_STM && key_in.read_addr.try_write(i_req)) {
            ++i_req;
        }
        if (!key_in.read_data.empty()) {
            cur_load = key_in.read_data.read(nullptr);
            key_stream_kp0[0].write(cur_load.s0_k0); key_stream_kp1[0].write(cur_load.s0_k1);
            key_stream_kp0[1].write(cur_load.s1_k0); key_stream_kp1[1].write(cur_load.s1_k1);
            key_stream_kp0[2].write(cur_load.s2_k0); key_stream_kp1[2].write(cur_load.s2_k1);
            key_stream_kp0[3].write(cur_load.s3_k0); key_stream_kp1[3].write(cur_load.s3_k1);
            key_stream_kp0[4].write(cur_load.s4_k0); key_stream_kp1[4].write(cur_load.s4_k1);
            ++i_resp;
        }
    }
    return;
}
/*************************************************************************************/
void loadBV(
    tapa::async_mmap<BV_LOAD_DTYPE> & input_bv
    ,tapa::ostream<ap_uint<BV_PACKED_BITWIDTH> > & bv_load_stream_0
    ,tapa::ostream<ap_uint<BV_PACKED_BITWIDTH> > & bv_load_stream_1
    ,tapa::ostream<ap_uint<BV_PACKED_BITWIDTH> > & bv_load_stream_2
){
    int section_idx = 0;
    BV_LOAD_DTYPE cur_bv_val;
    for (int i_req = 0, i_resp = 0;
            i_resp < ( (BV_LENGTH-1)/(BV_PACKED_BITWIDTH * (3)) + 1); )
    {
#pragma HLS PIPELINE II=1
        if (i_req < ( (BV_LENGTH-1)/(BV_PACKED_BITWIDTH * (3)) + 1) && input_bv.read_addr.try_write(i_req)) {
            ++i_req;
        }
        if (!input_bv.read_data.empty()) {
            cur_bv_val = input_bv.read_data.read(nullptr);
            bv_load_stream_0.write(cur_bv_val.section0);
            bv_load_stream_1.write(cur_bv_val.section1);
            bv_load_stream_2.write(cur_bv_val.section2);
            ++i_resp;
        }
    }
    return;
}
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
){
    const int READ_STOP_COUNT = KEYPAIRS_PER_STM;
    const int WRITE_STOP_COUNT = KEYPAIRS_PER_STM*(3);
    int total_num_reads = 0;
    int total_num_writes = 0;
    int input_idx = 0;
    ap_uint<(32)> key;
    bool key_written[(3)];
#pragma HLS ARRAY_PARTITION variable=key_written dim=0 complete
    INIT_KEY_WRITTEN:
    for (int i = 0; i < (3); ++i) {
        key_written[i] = 1;
    }
    while (total_num_reads < READ_STOP_COUNT ||
            total_num_writes < WRITE_STOP_COUNT
    ) {
#pragma HLS PIPELINE II=1
        bool do_read = 1;
        HASH_RD_LOOP:
        for(int hash_idx = 0; hash_idx < (3); ++hash_idx){
            if (key_written[hash_idx] == 0) {
                do_read = 0;
            }
        }
        if (do_read &&
            input_idx < KEYPAIRS_PER_STM
        ){
            ///////////////////////////////////
            // READ LOGIC:
            // NOTE: This blocking read is ok because we only have one input stream
            key = key_in_stream.read();
            total_num_reads++;
            input_idx++;
            for (int j = 0; j < (3); ++j) {
                key_written[j] = 0;
            }
        }
        ///////////////////////////////////
        // WRITE LOGIC:
        for (int hash_idx = 0; hash_idx < (3); ++hash_idx) {
#pragma HLS UNROLL
            if (key_written[hash_idx] == 0) {
                if (key_out_stream[hash_idx].try_write(key)) {
                    total_num_writes++;
                    key_written[hash_idx] = 1;
                }
            }
        }
    }
    return;
}
void computeHash_Computer(
        int stm_idx,
        int hash_idx,
        int keypair_idx,
        tapa::istream<ap_uint<(32)> > & key_stream,
        tapa::ostream<ap_uint<HASHONLY_BITWIDTH> > & hash_stream
){
    int module_idx = stm_idx*(3) + hash_idx;
    const int WRITE_STOP_COUNT = KEYPAIRS_PER_STM;
    int total_num_writes = 0;
    int input_idx = 0;
    MAIN_LOOP:
    while ( total_num_writes < WRITE_STOP_COUNT){
#pragma HLS PIPELINE II=1
        ap_uint<(32)> key = key_stream.read();
        uint32_t hash = MurmurHash3_x86_32(key, hash_idx);
        hash %= ( (BV_LENGTH-1)/(3) + 1);
        hash_stream.write(hash);
        total_num_writes++;
    }
}
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
){
    typedef struct {
        ap_uint<1> valid;
        PACKED_HASH_DTYPE value;
        uint32_t target_partition_idx;
    } XBAR_DTYPE;
    const int READ_STOP_COUNT = (5) * KEYPAIRS_PER_STM;
    const int WRITE_STOP_COUNT = KEYPAIRS_PER_STM;
    int total_num_reads = 0;
    int total_num_writes = 0;
    int num_writes_per_stm[(5)];
#pragma HLS ARRAY_PARTITION variable=num_writes_per_stm dim=0 complete
    /* TAPA Known-issue: Static keyword fails CSIM because this
       isnt thread-safe. But when running the HW build, it will
       instantiate several copies of this function. So this is OK.
    */
    static
    ap_uint<INPUT_IDX_BITWIDTH> reads_per_input[(5)];
#pragma HLS ARRAY_PARTITION variable=reads_per_input dim=0 complete
    /* TAPA Known-issue: Static keyword fails CSIM because this
       isnt thread-safe. But when running the HW build, it will
       instantiate several copies of this function. So this is OK.
    */
    static
    XBAR_DTYPE xbar[(5)];
#pragma HLS ARRAY_PARTITION variable=xbar dim=0 complete
    INIT_LOOP:
    for (int i = 0; i < (5); ++i)
    {
        reads_per_input[i] = 0;
        num_writes_per_stm[i] = 0;
        xbar[i].valid = 0;
    }
    MAIN_LOOP:
    while (total_num_reads < READ_STOP_COUNT ||
            num_writes_per_stm[0] < WRITE_STOP_COUNT ||
            num_writes_per_stm[1] < WRITE_STOP_COUNT ||
            num_writes_per_stm[2] < WRITE_STOP_COUNT ||
            num_writes_per_stm[3] < WRITE_STOP_COUNT ||
            num_writes_per_stm[4] < WRITE_STOP_COUNT
    ) {
#pragma HLS PIPELINE II=1
        RD_LOGIC:
        for (int strm_idx = 0; strm_idx < (5); ++strm_idx) {
#pragma HLS UNROLL
            // Metadata:
            ap_uint<INPUT_IDX_BITWIDTH> cur_input_idx;
            ap_uint<STRM_IDX_BITWIDTH> cur_strm_idx;
            METADATA_DTYPE cur_metadata;
            PACKED_HASH_DTYPE packed_hashval;
            if (xbar[strm_idx].valid == 1)
            {
                // Dont replace this value.
            }
            else if (!hash_stream[strm_idx].empty())
            {
                // Hash and partition data:
                ap_uint<HASHONLY_BITWIDTH> tmp_hash = hash_stream[strm_idx].read();
                ap_uint<HASHONLY_BITWIDTH> idx_inside_partition = tmp_hash % ( (BV_LENGTH-1)/((3)*(8) /* each sub bv is further partitioned into this chunks*/) + 1);
                int partition_idx = (tmp_hash / ( (BV_LENGTH-1)/((3)*(8) /* each sub bv is further partitioned into this chunks*/) + 1));
                total_num_reads++;
                reads_per_input[strm_idx]++;
                // Pack metadata
                cur_metadata.sidx = strm_idx;
                cur_metadata.iidx = reads_per_input[strm_idx];
                // Pack final payload
                packed_hashval.md = cur_metadata;
                packed_hashval.hash = idx_inside_partition;
                xbar[strm_idx].valid = 1;
                xbar[strm_idx].value = packed_hashval;
                xbar[strm_idx].target_partition_idx = partition_idx;
            }
        }
        WR_LOGIC:
        for (int partition_idx = 0; partition_idx < (8) /* each sub bv is further partitioned into this chunks*/; ++partition_idx)
        {
#pragma HLS UNROLL
            bool found = false;
            uint32_t found_strm_idx = 0;
            for (int strm_idx = 0; strm_idx < (5); ++strm_idx)
            {
#pragma HLS UNROLL
                int out_fifo_idx = partition_idx*(5) + strm_idx;
                if (xbar[strm_idx].valid == 1 &&
                    xbar[strm_idx].target_partition_idx == partition_idx)
                {
                    if (arb_stream[out_fifo_idx].try_write( xbar[strm_idx].value ))
                    {
                        num_writes_per_stm[strm_idx]++;
                        xbar[strm_idx].valid = 0;
                    }
                }
            }
        }
    }
}
void bloom_hier_arbiter_atom(
        int arb_idx,
        int partition_idx,
        int kp_idx,
        int atom_ID,
        tapa::istream<RATEMON_FEEDBACK_DTYPE> & ratemon_stream,
        tapa::istream<PACKED_HASH_DTYPE> & in_stream0,
        tapa::istream<PACKED_HASH_DTYPE> & in_stream1,
        tapa::ostream<PACKED_HASH_DTYPE> & out_stream
){
    typedef struct {
        ap_uint<1> valid;
        PACKED_HASH_DTYPE value;
    } XBAR_DTYPE;
    XBAR_DTYPE xbar[2];
#pragma HLS ARRAY_PARTITION variable=xbar dim=0 complete
    RATEMON_FEEDBACK_DTYPE feedback;
    ap_uint<INPUT_IDX_BITWIDTH> min_output_idx_s0 = 0;
    ap_uint<INPUT_IDX_BITWIDTH> min_output_idx_s1 = 0;
    ap_uint<INPUT_IDX_BITWIDTH> min_output_idx_s2 = 0;
    ap_uint<INPUT_IDX_BITWIDTH> min_output_idx_s3 = 0;
    ap_uint<INPUT_IDX_BITWIDTH> min_output_idx_s4 = 0;
    /* Initialize for SW_EMU... but will this guaranteed work for HW builds?
     * It might not be needed for HW builds because each xbar entry should just
     * be invalidated anyways, after writing.
     */
    INIT_LOOP:
    for (int i = 0; i < 2; ++i) {
        xbar[i].valid = 0;
    }
    MAIN_LOOP:
    while (1) {
#pragma HLS PIPELINE II=1
        RATEMON_LOGIC:
        if (!ratemon_stream.empty()) {
            feedback = ratemon_stream.read();
    // Manually unroll the min_output_idx logic, to reduce latency within the atoms.
    // With only one variable this takes one more cycle.
            min_output_idx_s0 = feedback.strm0_out_idx;
            min_output_idx_s1 = feedback.strm1_out_idx;
            min_output_idx_s2 = feedback.strm2_out_idx;
            min_output_idx_s3 = feedback.strm3_out_idx;
            min_output_idx_s4 = feedback.strm4_out_idx;
        }
        RD_LOGIC:
        if (xbar[0].valid == 1) {
            // Dont overwrite it
        }
        else if (!in_stream0.empty()) {
            PACKED_HASH_DTYPE packed_val = in_stream0.read();
            xbar[0].value = packed_val;
            xbar[0].valid = 1;
        }
        if (xbar[1].valid == 1) {
            // Dont overwrite it
        }
        else if (!in_stream1.empty()) {
            PACKED_HASH_DTYPE packed_val = in_stream1.read();
            xbar[1].value = packed_val;
            xbar[1].valid = 1;
        }
        WR_LOGIC:
        int valid_idxes = 0;
        int allowed_idx_s0 = min_output_idx_s0 + ((8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/);
        int allowed_idx_s1 = min_output_idx_s1 + ((8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/);
        int allowed_idx_s2 = min_output_idx_s2 + ((8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/);
        int allowed_idx_s3 = min_output_idx_s3 + ((8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/);
        int allowed_idx_s4 = min_output_idx_s4 + ((8) /* Number of buffered elements we can have for each hash/partition, in the shuffle buffer.*/);
        if (xbar[0].valid &&
            xbar[0].value.md.iidx <= allowed_idx_s0 &&
            xbar[0].value.md.iidx <= allowed_idx_s1 &&
            xbar[0].value.md.iidx <= allowed_idx_s2 &&
            xbar[0].value.md.iidx <= allowed_idx_s3 &&
            xbar[0].value.md.iidx <= allowed_idx_s4
        ) { valid_idxes += 1; }
        if (xbar[1].valid &&
            xbar[1].value.md.iidx <= allowed_idx_s0 &&
            xbar[1].value.md.iidx <= allowed_idx_s1 &&
            xbar[1].value.md.iidx <= allowed_idx_s2 &&
            xbar[1].value.md.iidx <= allowed_idx_s3 &&
            xbar[1].value.md.iidx <= allowed_idx_s4
        ) { valid_idxes += 2; }
        if (valid_idxes == 3) {
            if (xbar[1].value.md.iidx <= xbar[0].value.md.iidx) {
                if (out_stream.try_write(xbar[1].value)) {
                    xbar[1].valid = 0;
                }
            }
            else {
                if (out_stream.try_write(xbar[0].value)) {
                    xbar[0].valid = 0;
                }
            }
        }
        else if (valid_idxes == 2) {
            if (out_stream.try_write(xbar[1].value)) {
                xbar[1].valid = 0;
            }
        }
        else if (valid_idxes == 1) {
            if (out_stream.try_write(xbar[0].value)) {
                xbar[0].valid = 0;
            }
        }
    }
}
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
) {
    tapa::streams<PACKED_HASH_DTYPE, 2> arb_stage1_outputs;
    tapa::streams<PACKED_HASH_DTYPE, 1> arb_stage2_outputs;
    tapa::task()
        .invoke<tapa::detach>(
                bloom_hier_arbiter_atom
                ,arb_idx
                ,partition_idx
                ,kp_idx
                ,'a'
                ,ratemon_feedback[0]
                ,arb_stm0
                ,arb_stm1
                ,arb_stage1_outputs[0]
        )
        .invoke<tapa::detach>(
                bloom_hier_arbiter_atom
                ,arb_idx
                ,partition_idx
                ,kp_idx
                ,'b'
                ,ratemon_feedback[1]
                ,arb_stm2
                ,arb_stm3
                ,arb_stage1_outputs[1]
        )
        .invoke<tapa::detach>(
                bloom_hier_arbiter_atom
                ,arb_idx
                ,partition_idx
                ,kp_idx
                ,'c'
                ,ratemon_feedback[2]
                ,arb_stage1_outputs[0]
                ,arb_stage1_outputs[1]
                ,arb_stage2_outputs[0]
        )
        .invoke<tapa::detach>(
                bloom_hier_arbiter_atom
                ,arb_idx
                ,partition_idx
                ,kp_idx
                ,'d'
                ,ratemon_feedback[3]
                ,arb_stage2_outputs[0]
                ,arb_stm4
                ,arbtree_out
        )
    ;
}
void bloom_single_arbiter(
        int arb_idx
        , int kp_idx
        , tapa::istreams<PACKED_HASH_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> &in_arb_streams
        , tapa::ostreams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> &bv_lookup_stream
) {
    tapa::streams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> arbtree_outputs;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> ratemon_fdbk_streams_p0;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> ratemon_fdbk_streams_p1;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> ratemon_fdbk_streams_p2;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> ratemon_fdbk_streams_p3;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> ratemon_fdbk_streams_p4;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> ratemon_fdbk_streams_p5;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> ratemon_fdbk_streams_p6;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, ((5) - 1)> ratemon_fdbk_streams_p7;
    tapa::task()
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,0
                ,kp_idx
                ,in_arb_streams[(5)*0 + 0]
                ,in_arb_streams[(5)*0 + 1]
                ,in_arb_streams[(5)*0 + 2]
                ,in_arb_streams[(5)*0 + 3]
                ,in_arb_streams[(5)*0 + 4]
                ,ratemon_fdbk_streams_p0
                ,arbtree_outputs[0]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,1
                ,kp_idx
                ,in_arb_streams[(5)*1 + 0]
                ,in_arb_streams[(5)*1 + 1]
                ,in_arb_streams[(5)*1 + 2]
                ,in_arb_streams[(5)*1 + 3]
                ,in_arb_streams[(5)*1 + 4]
                ,ratemon_fdbk_streams_p1
                ,arbtree_outputs[1]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,2
                ,kp_idx
                ,in_arb_streams[(5)*2 + 0]
                ,in_arb_streams[(5)*2 + 1]
                ,in_arb_streams[(5)*2 + 2]
                ,in_arb_streams[(5)*2 + 3]
                ,in_arb_streams[(5)*2 + 4]
                ,ratemon_fdbk_streams_p2
                ,arbtree_outputs[2]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,3
                ,kp_idx
                ,in_arb_streams[(5)*3 + 0]
                ,in_arb_streams[(5)*3 + 1]
                ,in_arb_streams[(5)*3 + 2]
                ,in_arb_streams[(5)*3 + 3]
                ,in_arb_streams[(5)*3 + 4]
                ,ratemon_fdbk_streams_p3
                ,arbtree_outputs[3]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,4
                ,kp_idx
                ,in_arb_streams[(5)*4 + 0]
                ,in_arb_streams[(5)*4 + 1]
                ,in_arb_streams[(5)*4 + 2]
                ,in_arb_streams[(5)*4 + 3]
                ,in_arb_streams[(5)*4 + 4]
                ,ratemon_fdbk_streams_p4
                ,arbtree_outputs[4]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,5
                ,kp_idx
                ,in_arb_streams[(5)*5 + 0]
                ,in_arb_streams[(5)*5 + 1]
                ,in_arb_streams[(5)*5 + 2]
                ,in_arb_streams[(5)*5 + 3]
                ,in_arb_streams[(5)*5 + 4]
                ,ratemon_fdbk_streams_p5
                ,arbtree_outputs[5]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,6
                ,kp_idx
                ,in_arb_streams[(5)*6 + 0]
                ,in_arb_streams[(5)*6 + 1]
                ,in_arb_streams[(5)*6 + 2]
                ,in_arb_streams[(5)*6 + 3]
                ,in_arb_streams[(5)*6 + 4]
                ,ratemon_fdbk_streams_p6
                ,arbtree_outputs[6]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,7
                ,kp_idx
                ,in_arb_streams[(5)*7 + 0]
                ,in_arb_streams[(5)*7 + 1]
                ,in_arb_streams[(5)*7 + 2]
                ,in_arb_streams[(5)*7 + 3]
                ,in_arb_streams[(5)*7 + 4]
                ,ratemon_fdbk_streams_p7
                ,arbtree_outputs[7]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_ratemonitor
                ,arb_idx
                ,kp_idx
                ,'a'
                ,arbtree_outputs
                ,bv_lookup_stream
                ,ratemon_fdbk_streams_p0
                ,ratemon_fdbk_streams_p1
                ,ratemon_fdbk_streams_p2
                ,ratemon_fdbk_streams_p3
                ,ratemon_fdbk_streams_p4
                ,ratemon_fdbk_streams_p5
                ,ratemon_fdbk_streams_p6
                ,ratemon_fdbk_streams_p7
        )
    ;
}
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
) {
    const int MAX_NUM_WRITES = (5)*KEYS_PER_STM;
    int num_writes = 0;
    int num_reads = 0;
    ap_uint<BV_PACKED_BITWIDTH> bv_buf_BRAMS[( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1)][( (BV_LENGTH-1)/((3)*BV_PACKED_BITWIDTH*(8) /* each sub bv is further partitioned into this chunks*/) + 1)];
#pragma HLS BIND_STORAGE variable=bv_buf_BRAMS type=RAM_T2P impl=bram
#pragma HLS ARRAY_PARTITION variable=bv_buf_BRAMS dim=1 complete
    ap_uint<BV_PACKED_BITWIDTH> bv_buf_URAMS[((8) /* each sub bv is further partitioned into this chunks*/ / 2)][( (BV_LENGTH-1)/((3)*BV_PACKED_BITWIDTH*(8) /* each sub bv is further partitioned into this chunks*/) + 1)];
#pragma HLS BIND_STORAGE variable=bv_buf_URAMS type=RAM_T2P impl=uram
#pragma HLS ARRAY_PARTITION variable=bv_buf_URAMS dim=1 complete
    ap_uint<BV_PACKED_BITWIDTH> cur_bv_val;
    typedef struct {
        ap_uint<1> valid;
        BV_PLUS_METADATA_PACKED_DTYPE data;
    } TO_WRITE_DTYPE;
    TO_WRITE_DTYPE bram_queried_vals_buf[( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1)][2];
#pragma HLS ARRAY_PARTITION variable=bram_queried_vals_buf dim=0 complete
    TO_WRITE_DTYPE uram_queried_vals_buf[((8) /* each sub bv is further partitioned into this chunks*/ / 2)][2];
#pragma HLS ARRAY_PARTITION variable=uram_queried_vals_buf dim=0 complete
    INIT_BRAM_QUERIED_VALS_BUF:
    for (int j = 0; j < ( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1); ++j) {
#pragma HLS UNROLL
        bram_queried_vals_buf[j][0].valid=0;
        bram_queried_vals_buf[j][1].valid=0;
    }
    INIT_URAM_QUERIED_VALS_BUF:
    for (int j = 0; j < ((8) /* each sub bv is further partitioned into this chunks*/ / 2); ++j) {
#pragma HLS UNROLL
        uram_queried_vals_buf[j][0].valid=0;
        uram_queried_vals_buf[j][1].valid=0;
    }
    LOAD_BV_VALUES:
    for (int i = 0; i < ( (BV_LENGTH-1)/((3)*BV_PACKED_BITWIDTH) + 1); ++i) {
#pragma HLS PIPELINE II=1
        cur_bv_val = bv_load_stream.read();
        int partition_idx = i/( (BV_LENGTH-1)/((3)*BV_PACKED_BITWIDTH*(8) /* each sub bv is further partitioned into this chunks*/) + 1);
        int element_idx = i%( (BV_LENGTH-1)/((3)*BV_PACKED_BITWIDTH*(8) /* each sub bv is further partitioned into this chunks*/) + 1);
        if (partition_idx < ( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1)) {
            bv_buf_BRAMS[partition_idx][element_idx] = cur_bv_val;
        }
        else {
            bv_buf_URAMS[partition_idx-( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1)][element_idx] = cur_bv_val;
        }
    }
    PROCESS_QUERIES:
    while (num_writes < MAX_NUM_WRITES){
#pragma HLS PIPELINE II=1
        BV_BRAM_PARTITION_LOOP:
        for (int bram_partition_idx = 0; bram_partition_idx < ( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1); ++bram_partition_idx) {
#pragma HLS UNROLL
            //////////////////////////////////////////////////////////
            // READ LOGIC
            // READ PORT 0
            if (!bv_lookup_stream_kp0[bram_partition_idx].empty() &&
                !bram_queried_vals_buf[bram_partition_idx][0].valid)
            {
                PACKED_HASH_DTYPE packed_hash;
                METADATA_DTYPE cur_metadata;
                ap_uint<HASHONLY_BITWIDTH> bv_lookup_idx;
                ap_uint<BIT_BITWIDTH> cur_bv_val;
                BV_PLUS_METADATA_PACKED_DTYPE data_to_write;
                ap_uint<HASHONLY_BITWIDTH> bv_outer_idx;
                ap_uint<HASHONLY_BITWIDTH> bv_inner_idx;
                packed_hash = bv_lookup_stream_kp0[bram_partition_idx].read();
                // Unpack the values
                cur_metadata = packed_hash.md;
                bv_lookup_idx = packed_hash.hash;
                // Read the bitvector
                bv_outer_idx = bv_lookup_idx/BV_PACKED_BITWIDTH;
                bv_inner_idx = bv_lookup_idx%BV_PACKED_BITWIDTH;
                cur_bv_val.range(0, 0) =
                    bv_buf_BRAMS[bram_partition_idx][bv_outer_idx].range(bv_inner_idx, bv_inner_idx);
                // Pack final payload
                data_to_write.md = cur_metadata;
                data_to_write.bv_val = cur_bv_val;
                bram_queried_vals_buf[bram_partition_idx][0].valid = 1;
                bram_queried_vals_buf[bram_partition_idx][0].data = data_to_write;
            }
            // READ PORT 1
            if (!bv_lookup_stream_kp1[bram_partition_idx].empty() &&
                !bram_queried_vals_buf[bram_partition_idx][1].valid)
            {
                PACKED_HASH_DTYPE packed_hash;
                METADATA_DTYPE cur_metadata;
                ap_uint<HASHONLY_BITWIDTH> bv_lookup_idx;
                ap_uint<BIT_BITWIDTH> cur_bv_val;
                BV_PLUS_METADATA_PACKED_DTYPE data_to_write;
                ap_uint<HASHONLY_BITWIDTH> bv_outer_idx;
                ap_uint<HASHONLY_BITWIDTH> bv_inner_idx;
                packed_hash = bv_lookup_stream_kp1[bram_partition_idx].read();
                // Unpack the values
                cur_metadata = packed_hash.md;
                bv_lookup_idx = packed_hash.hash;
                // Read the bitvector
                bv_outer_idx = bv_lookup_idx/BV_PACKED_BITWIDTH;
                bv_inner_idx = bv_lookup_idx%BV_PACKED_BITWIDTH;
                cur_bv_val.range(0, 0) =
                    bv_buf_BRAMS[bram_partition_idx][bv_outer_idx].range(bv_inner_idx, bv_inner_idx);
                // Pack final payload
                data_to_write.md = cur_metadata;
                data_to_write.bv_val = cur_bv_val;
                bram_queried_vals_buf[bram_partition_idx][1].valid = 1;
                bram_queried_vals_buf[bram_partition_idx][1].data = data_to_write;
            }
            //////////////////////////////////////////////////////////
            // WRITE LOGIC
            // WRITE PORT 0
            if (bram_queried_vals_buf[bram_partition_idx][0].valid &&
                query_bv_packed_stream_kp0[bram_partition_idx].try_write(
                    bram_queried_vals_buf[bram_partition_idx][0].data
                )
            ) {
                ++num_writes;
                bram_queried_vals_buf[bram_partition_idx][0].valid = 0;
            }
            // WRITE PORT 1
            if (bram_queried_vals_buf[bram_partition_idx][1].valid &&
                query_bv_packed_stream_kp1[bram_partition_idx].try_write(
                    bram_queried_vals_buf[bram_partition_idx][1].data
                )
            ) {
                ++num_writes;
                bram_queried_vals_buf[bram_partition_idx][1].valid = 0;
            }
        }
        BV_URAM_PARTITION_LOOP:
        for (int uram_partition_idx = 0; uram_partition_idx < ((8) /* each sub bv is further partitioned into this chunks*/ / 2); ++uram_partition_idx) {
#pragma HLS UNROLL
            //////////////////////////////////////////////////////////
            // READ LOGIC
            // READ PORT 0
            if (!bv_lookup_stream_kp0[uram_partition_idx + ( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1)].empty() &&
                !uram_queried_vals_buf[uram_partition_idx][0].valid)
            {
                PACKED_HASH_DTYPE packed_hash;
                METADATA_DTYPE cur_metadata;
                ap_uint<HASHONLY_BITWIDTH> bv_lookup_idx;
                ap_uint<BIT_BITWIDTH> cur_bv_val;
                BV_PLUS_METADATA_PACKED_DTYPE data_to_write;
                ap_uint<HASHONLY_BITWIDTH> bv_outer_idx;
                ap_uint<HASHONLY_BITWIDTH> bv_inner_idx;
                packed_hash = bv_lookup_stream_kp0[uram_partition_idx + ( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1)].read();
                // Unpack the values
                cur_metadata = packed_hash.md;
                bv_lookup_idx = packed_hash.hash;
                // Read the bitvector
                bv_outer_idx = bv_lookup_idx/BV_PACKED_BITWIDTH;
                bv_inner_idx = bv_lookup_idx%BV_PACKED_BITWIDTH;
                cur_bv_val.range(0, 0) =
                    bv_buf_URAMS[uram_partition_idx][bv_outer_idx].range(bv_inner_idx, bv_inner_idx);
                // Pack final payload
                data_to_write.md = cur_metadata;
                data_to_write.bv_val = cur_bv_val;
                uram_queried_vals_buf[uram_partition_idx][0].valid = 1;
                uram_queried_vals_buf[uram_partition_idx][0].data = data_to_write;
            }
            // READ PORT 1
            if (!bv_lookup_stream_kp1[uram_partition_idx + ( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1)].empty() &&
                !uram_queried_vals_buf[uram_partition_idx][1].valid)
            {
                PACKED_HASH_DTYPE packed_hash;
                METADATA_DTYPE cur_metadata;
                ap_uint<HASHONLY_BITWIDTH> bv_lookup_idx;
                ap_uint<BIT_BITWIDTH> cur_bv_val;
                BV_PLUS_METADATA_PACKED_DTYPE data_to_write;
                ap_uint<HASHONLY_BITWIDTH> bv_outer_idx;
                ap_uint<HASHONLY_BITWIDTH> bv_inner_idx;
                packed_hash = bv_lookup_stream_kp1[uram_partition_idx + ( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1)].read();
                // Unpack the values
                cur_metadata = packed_hash.md;
                bv_lookup_idx = packed_hash.hash;
                // Read the bitvector
                bv_outer_idx = bv_lookup_idx/BV_PACKED_BITWIDTH;
                bv_inner_idx = bv_lookup_idx%BV_PACKED_BITWIDTH;
                cur_bv_val.range(0, 0) =
                    bv_buf_URAMS[uram_partition_idx][bv_outer_idx].range(bv_inner_idx, bv_inner_idx);
                // Pack final payload
                data_to_write.md = cur_metadata;
                data_to_write.bv_val = cur_bv_val;
                uram_queried_vals_buf[uram_partition_idx][1].valid = 1;
                uram_queried_vals_buf[uram_partition_idx][1].data = data_to_write;
            }
            //////////////////////////////////////////////////////////
            // WRITE LOGIC
            // WRITE PORT 0
            if (uram_queried_vals_buf[uram_partition_idx][0].valid &&
                query_bv_packed_stream_kp0[uram_partition_idx + ( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1)].try_write(
                    uram_queried_vals_buf[uram_partition_idx][0].data
                )
            ) {
                ++num_writes;
                uram_queried_vals_buf[uram_partition_idx][0].valid = 0;
            }
            // WRITE PORT 1
            if (uram_queried_vals_buf[uram_partition_idx][1].valid &&
                query_bv_packed_stream_kp1[uram_partition_idx + ( ((8) /* each sub bv is further partitioned into this chunks*/-1)/2 + 1)].try_write(
                    uram_queried_vals_buf[uram_partition_idx][1].data
                )
            ) {
                ++num_writes;
                uram_queried_vals_buf[uram_partition_idx][1].valid = 0;
            }
        }
    }
    return;
}
/*************************************************************************************/
void shuffle_TtoS_per_hash(
        int shuffle_idx
        ,int kp_idx
        ,tapa::istreams<BV_PLUS_METADATA_PACKED_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/> & query_bv_packed_stream
        ,tapa::ostreams<BV_PLUS_IIDX_PACKED_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> & inter_shuffle_stream
){
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
{
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
){
    int num_writes_TOTAL = 0;
    int num_reads = 0;
    int all_hashes_available = 0;
    uint32_t result = 1;
    while (num_writes_TOTAL < KEYPAIRS_PER_STM)
    {
#pragma HLS PIPELINE=1
        // Check if all of our hash values are available:
        all_hashes_available = 1;
        for (int i = 0; i < (3); ++i) {
            if (reconstruct_stream[i].empty()) {
                all_hashes_available = 0;
            }
        }
        if (all_hashes_available)
        {
            result = 1;
            for (int i = 0; i < (3); ++i) {
                result &= reconstruct_stream[i].read();
            }
            num_reads++;
            aggregate_stream.write(result);
            num_writes_TOTAL++;
        }
    }
    return;
}
/*************************************************************************************/
void packOutput(
        int strm_idx
        ,int kp_idx
        ,tapa::istream<ap_uint<BIT_BITWIDTH> > & aggregate_stream
        ,tapa::ostream<ap_uint<((32))> > & packed_outputs_stream
) {
    int pk_idx;
    ap_uint<((32))> packed;
    ap_uint<BIT_BITWIDTH> val;
    for (int i = 0; i < KEYPAIRS_PER_STM; ++i) {
        pk_idx = i % ((32));
        val = aggregate_stream.read();
        packed.range(pk_idx, pk_idx) = val.range(0, 0);
        if (pk_idx == ((32)) - 1){
            packed_outputs_stream.write(packed);
            packed = 0;
        }
    }
}
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
        tapa::mmap<STORE_DTYPE> outmmap
){
    STORE_DTYPE to_store;
    for (int i = 0; i < PACKED_OUTPUTS_PER_STM; ++i) {
        to_store.s0_k0 = packed_outputs_stream_s0_kp0.read();
        to_store.s0_k1 = packed_outputs_stream_s0_kp1.read();
        to_store.s1_k0 = packed_outputs_stream_s1_kp0.read();
        to_store.s1_k1 = packed_outputs_stream_s1_kp1.read();
        to_store.s2_k0 = packed_outputs_stream_s2_kp0.read();
        to_store.s2_k1 = packed_outputs_stream_s2_kp1.read();
        to_store.s3_k0 = packed_outputs_stream_s3_kp0.read();
        to_store.s3_k1 = packed_outputs_stream_s3_kp1.read();
        to_store.s4_k0 = packed_outputs_stream_s4_kp0.read();
        to_store.s4_k1 = packed_outputs_stream_s4_kp1.read();
        outmmap[i] = to_store;
    }
}
/*************************************************************************************/
void workload(
    tapa::mmap<BV_LOAD_DTYPE> input_bv
    ,tapa::mmap<LOAD_DTYPE> key_in
    ,tapa::mmap<STORE_DTYPE> out_bits
     //Add a dummy, useless variable because TAPA fast-cosim doesnt work without it.
    ,int UNUSED_DUMMY
)
{
    //////////////////////////////////////////////////////////
    // Connections BETWEEN modules:
    tapa::streams<ap_uint<(32)>, (5), (( ((5)-1)/2 + 1))> key_stream_kp0;
    tapa::streams<ap_uint<(32)>, (5), (( ((5)-1)/2 + 1))> key_stream_kp1;
    // loadBV outputs
    tapa::stream<ap_uint<BV_PACKED_BITWIDTH>, (( ((5)-1)/2 + 1))> bv_load_stream_0;
    tapa::stream<ap_uint<BV_PACKED_BITWIDTH>, (( ((5)-1)/2 + 1))> bv_load_stream_1;
    tapa::stream<ap_uint<BV_PACKED_BITWIDTH>, (( ((5)-1)/2 + 1))> bv_load_stream_2;
    // Computehash outputs (kp stands for key-pair)
    tapa::streams<ap_uint<HASHONLY_BITWIDTH>, (5), (( ((5)-1)/2 + 1))> hash_stream_h0_kp0;
    tapa::streams<ap_uint<HASHONLY_BITWIDTH>, (5), (( ((5)-1)/2 + 1))> hash_stream_h0_kp1;
    tapa::streams<ap_uint<HASHONLY_BITWIDTH>, (5), (( ((5)-1)/2 + 1))> hash_stream_h1_kp0;
    tapa::streams<ap_uint<HASHONLY_BITWIDTH>, (5), (( ((5)-1)/2 + 1))> hash_stream_h1_kp1;
    tapa::streams<ap_uint<HASHONLY_BITWIDTH>, (5), (( ((5)-1)/2 + 1))> hash_stream_h2_kp0;
    tapa::streams<ap_uint<HASHONLY_BITWIDTH>, (5), (( ((5)-1)/2 + 1))> hash_stream_h2_kp1;
    // Arbiter outputs
    tapa::streams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> bv_lookup_stream_h0_kp0;
    tapa::streams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> bv_lookup_stream_h0_kp1;
    tapa::streams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> bv_lookup_stream_h1_kp0;
    tapa::streams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> bv_lookup_stream_h1_kp1;
    tapa::streams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> bv_lookup_stream_h2_kp0;
    tapa::streams<PACKED_HASH_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> bv_lookup_stream_h2_kp1;
    // Query unit outputs
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> query_bv_packed_stream_hash0_kp0;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> query_bv_packed_stream_hash0_kp1;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> query_bv_packed_stream_hash1_kp0;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> query_bv_packed_stream_hash1_kp1;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> query_bv_packed_stream_hash2_kp0;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, (8) /* each sub bv is further partitioned into this chunks*/, (( ((5)-1)/2 + 1))> query_bv_packed_stream_hash2_kp1;
    // Shuffle unit output
    tapa::streams<ap_uint<BIT_BITWIDTH>, (3), (( ((5)-1)/2 + 1))> reconstruct_stream_stm0_kp0;
    tapa::streams<ap_uint<BIT_BITWIDTH>, (3), (( ((5)-1)/2 + 1))> reconstruct_stream_stm0_kp1;
    tapa::streams<ap_uint<BIT_BITWIDTH>, (3), (( ((5)-1)/2 + 1))> reconstruct_stream_stm1_kp0;
    tapa::streams<ap_uint<BIT_BITWIDTH>, (3), (( ((5)-1)/2 + 1))> reconstruct_stream_stm1_kp1;
    tapa::streams<ap_uint<BIT_BITWIDTH>, (3), (( ((5)-1)/2 + 1))> reconstruct_stream_stm2_kp0;
    tapa::streams<ap_uint<BIT_BITWIDTH>, (3), (( ((5)-1)/2 + 1))> reconstruct_stream_stm2_kp1;
    tapa::streams<ap_uint<BIT_BITWIDTH>, (3), (( ((5)-1)/2 + 1))> reconstruct_stream_stm3_kp0;
    tapa::streams<ap_uint<BIT_BITWIDTH>, (3), (( ((5)-1)/2 + 1))> reconstruct_stream_stm3_kp1;
    tapa::streams<ap_uint<BIT_BITWIDTH>, (3), (( ((5)-1)/2 + 1))> reconstruct_stream_stm4_kp0;
    tapa::streams<ap_uint<BIT_BITWIDTH>, (3), (( ((5)-1)/2 + 1))> reconstruct_stream_stm4_kp1;
    // Aggregate output
    tapa::streams<ap_uint<BIT_BITWIDTH>, (5), (( ((5)-1)/2 + 1))> aggregate_stream_kp0;
    tapa::streams<ap_uint<BIT_BITWIDTH>, (5), (( ((5)-1)/2 + 1))> aggregate_stream_kp1;
    // Datapacked outputs
    tapa::streams<ap_uint<((32))>, (5), (( ((5)-1)/2 + 1))> packed_output_stm_kp0;
    tapa::streams<ap_uint<((32))>, (5), (( ((5)-1)/2 + 1))> packed_output_stm_kp1;
    //////////////////////////////////////////////////////////
    // Connections WITHIN modules:
    // FIFOS within compute:
    tapa::streams<ap_uint<(32)>, (3)> key_tmp_stream_0_kp0; tapa::streams<ap_uint<(32)>, (3)> key_tmp_stream_1_kp0; tapa::streams<ap_uint<(32)>, (3)> key_tmp_stream_2_kp0; tapa::streams<ap_uint<(32)>, (3)> key_tmp_stream_3_kp0; tapa::streams<ap_uint<(32)>, (3)> key_tmp_stream_4_kp0;
    tapa::streams<ap_uint<(32)>, (3)> key_tmp_stream_0_kp1; tapa::streams<ap_uint<(32)>, (3)> key_tmp_stream_1_kp1; tapa::streams<ap_uint<(32)>, (3)> key_tmp_stream_2_kp1; tapa::streams<ap_uint<(32)>, (3)> key_tmp_stream_3_kp1; tapa::streams<ap_uint<(32)>, (3)> key_tmp_stream_4_kp1;
    tapa::streams<PACKED_HASH_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> arb0_streams_kp0; tapa::streams<PACKED_HASH_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> arb1_streams_kp0; tapa::streams<PACKED_HASH_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> arb2_streams_kp0;
    tapa::streams<PACKED_HASH_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> arb0_streams_kp1; tapa::streams<PACKED_HASH_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> arb1_streams_kp1; tapa::streams<PACKED_HASH_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> arb2_streams_kp1;
    tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> inter_shuf0_stm_kp0; tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> inter_shuf1_stm_kp0; tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> inter_shuf2_stm_kp0;
    tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> inter_shuf0_stm_kp1; tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> inter_shuf1_stm_kp1; tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, (5)*(8) /* each sub bv is further partitioned into this chunks*/> inter_shuf2_stm_kp1;
    //////////////////////////////////////////////////////////
    // MODULE INVOCATIONS.
    tapa::task()
        .invoke(loadBV
                ,input_bv
                ,bv_load_stream_0
                ,bv_load_stream_1
                ,bv_load_stream_2
        )
        .invoke(loadKey, key_in, key_stream_kp0, key_stream_kp1)
        .invoke(computeHash_Feeder, 0, 0, key_stream_kp0[0], key_tmp_stream_0_kp0 ) .invoke(computeHash_Feeder, 1, 0, key_stream_kp0[1], key_tmp_stream_1_kp0 ) .invoke(computeHash_Feeder, 2, 0, key_stream_kp0[2], key_tmp_stream_2_kp0 ) .invoke(computeHash_Feeder, 3, 0, key_stream_kp0[3], key_tmp_stream_3_kp0 ) .invoke(computeHash_Feeder, 4, 0, key_stream_kp0[4], key_tmp_stream_4_kp0 ) /* Need NUM_STM of these^ invokes */ .invoke(computeHash_Computer, 0, 0, 0, key_tmp_stream_0_kp0[0], hash_stream_h0_kp0[0] ) .invoke(computeHash_Computer, 0, 1, 0, key_tmp_stream_0_kp0[1], hash_stream_h1_kp0[0] ) .invoke(computeHash_Computer, 0, 2, 0, key_tmp_stream_0_kp0[2], hash_stream_h2_kp0[0] ) .invoke(computeHash_Computer, 1, 0, 0, key_tmp_stream_1_kp0[0], hash_stream_h0_kp0[1] ) .invoke(computeHash_Computer, 1, 1, 0, key_tmp_stream_1_kp0[1], hash_stream_h1_kp0[1] ) .invoke(computeHash_Computer, 1, 2, 0, key_tmp_stream_1_kp0[2], hash_stream_h2_kp0[1] ) .invoke(computeHash_Computer, 2, 0, 0, key_tmp_stream_2_kp0[0], hash_stream_h0_kp0[2] ) .invoke(computeHash_Computer, 2, 1, 0, key_tmp_stream_2_kp0[1], hash_stream_h1_kp0[2] ) .invoke(computeHash_Computer, 2, 2, 0, key_tmp_stream_2_kp0[2], hash_stream_h2_kp0[2] ) .invoke(computeHash_Computer, 3, 0, 0, key_tmp_stream_3_kp0[0], hash_stream_h0_kp0[3] ) .invoke(computeHash_Computer, 3, 1, 0, key_tmp_stream_3_kp0[1], hash_stream_h1_kp0[3] ) .invoke(computeHash_Computer, 3, 2, 0, key_tmp_stream_3_kp0[2], hash_stream_h2_kp0[3] ) .invoke(computeHash_Computer, 4, 0, 0, key_tmp_stream_4_kp0[0], hash_stream_h0_kp0[4] ) .invoke(computeHash_Computer, 4, 1, 0, key_tmp_stream_4_kp0[1], hash_stream_h1_kp0[4] ) .invoke(computeHash_Computer, 4, 2, 0, key_tmp_stream_4_kp0[2], hash_stream_h2_kp0[4] ) /* Need NUM_STM of these^ invokes */
        .invoke(computeHash_Feeder, 0, 1, key_stream_kp1[0], key_tmp_stream_0_kp1 ) .invoke(computeHash_Feeder, 1, 1, key_stream_kp1[1], key_tmp_stream_1_kp1 ) .invoke(computeHash_Feeder, 2, 1, key_stream_kp1[2], key_tmp_stream_2_kp1 ) .invoke(computeHash_Feeder, 3, 1, key_stream_kp1[3], key_tmp_stream_3_kp1 ) .invoke(computeHash_Feeder, 4, 1, key_stream_kp1[4], key_tmp_stream_4_kp1 ) /* Need NUM_STM of these^ invokes */ .invoke(computeHash_Computer, 0, 0, 1, key_tmp_stream_0_kp1[0], hash_stream_h0_kp1[0] ) .invoke(computeHash_Computer, 0, 1, 1, key_tmp_stream_0_kp1[1], hash_stream_h1_kp1[0] ) .invoke(computeHash_Computer, 0, 2, 1, key_tmp_stream_0_kp1[2], hash_stream_h2_kp1[0] ) .invoke(computeHash_Computer, 1, 0, 1, key_tmp_stream_1_kp1[0], hash_stream_h0_kp1[1] ) .invoke(computeHash_Computer, 1, 1, 1, key_tmp_stream_1_kp1[1], hash_stream_h1_kp1[1] ) .invoke(computeHash_Computer, 1, 2, 1, key_tmp_stream_1_kp1[2], hash_stream_h2_kp1[1] ) .invoke(computeHash_Computer, 2, 0, 1, key_tmp_stream_2_kp1[0], hash_stream_h0_kp1[2] ) .invoke(computeHash_Computer, 2, 1, 1, key_tmp_stream_2_kp1[1], hash_stream_h1_kp1[2] ) .invoke(computeHash_Computer, 2, 2, 1, key_tmp_stream_2_kp1[2], hash_stream_h2_kp1[2] ) .invoke(computeHash_Computer, 3, 0, 1, key_tmp_stream_3_kp1[0], hash_stream_h0_kp1[3] ) .invoke(computeHash_Computer, 3, 1, 1, key_tmp_stream_3_kp1[1], hash_stream_h1_kp1[3] ) .invoke(computeHash_Computer, 3, 2, 1, key_tmp_stream_3_kp1[2], hash_stream_h2_kp1[3] ) .invoke(computeHash_Computer, 4, 0, 1, key_tmp_stream_4_kp1[0], hash_stream_h0_kp1[4] ) .invoke(computeHash_Computer, 4, 1, 1, key_tmp_stream_4_kp1[1], hash_stream_h1_kp1[4] ) .invoke(computeHash_Computer, 4, 2, 1, key_tmp_stream_4_kp1[2], hash_stream_h2_kp1[4] ) /* Need NUM_STM of these^ invokes */
        .invoke( bloom_arb_forwarder, 0, 0, hash_stream_h0_kp0, arb0_streams_kp0 ) .invoke( bloom_arb_forwarder, 1, 0, hash_stream_h1_kp0, arb1_streams_kp0 ) .invoke( bloom_arb_forwarder, 2, 0, hash_stream_h2_kp0, arb2_streams_kp0 ) .invoke( bloom_single_arbiter, 0, 0, arb0_streams_kp0, bv_lookup_stream_h0_kp0 ) .invoke( bloom_single_arbiter, 1, 0, arb1_streams_kp0, bv_lookup_stream_h1_kp0 ) .invoke( bloom_single_arbiter, 2, 0, arb2_streams_kp0, bv_lookup_stream_h2_kp0 )
        .invoke( bloom_arb_forwarder, 0, 1, hash_stream_h0_kp1, arb0_streams_kp1 ) .invoke( bloom_arb_forwarder, 1, 1, hash_stream_h1_kp1, arb1_streams_kp1 ) .invoke( bloom_arb_forwarder, 2, 1, hash_stream_h2_kp1, arb2_streams_kp1 ) .invoke( bloom_single_arbiter, 0, 1, arb0_streams_kp1, bv_lookup_stream_h0_kp1 ) .invoke( bloom_single_arbiter, 1, 1, arb1_streams_kp1, bv_lookup_stream_h1_kp1 ) .invoke( bloom_single_arbiter, 2, 1, arb2_streams_kp1, bv_lookup_stream_h2_kp1 )
        .invoke( queryResult_per_hash , 0 , bv_load_stream_0 , bv_lookup_stream_h0_kp0 , bv_lookup_stream_h0_kp1 , query_bv_packed_stream_hash0_kp0 , query_bv_packed_stream_hash0_kp1 ) .invoke( queryResult_per_hash , 1 , bv_load_stream_1 , bv_lookup_stream_h1_kp0 , bv_lookup_stream_h1_kp1 , query_bv_packed_stream_hash1_kp0 , query_bv_packed_stream_hash1_kp1 ) .invoke( queryResult_per_hash , 2 , bv_load_stream_2 , bv_lookup_stream_h2_kp0 , bv_lookup_stream_h2_kp1 , query_bv_packed_stream_hash2_kp0 , query_bv_packed_stream_hash2_kp1 )
        .invoke<tapa::detach>( shuffle_TtoS_per_hash , 0 , 0 , query_bv_packed_stream_hash0_kp0 , inter_shuf0_stm_kp0 ) .invoke<tapa::detach>( shuffle_TtoS_per_hash , 1 , 0 , query_bv_packed_stream_hash1_kp0 , inter_shuf1_stm_kp0 ) .invoke<tapa::detach>( shuffle_TtoS_per_hash , 2 , 0 , query_bv_packed_stream_hash2_kp0 , inter_shuf2_stm_kp0 ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,0 ,0 ,0 ,inter_shuf0_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*0] ,reconstruct_stream_stm0_kp0[0] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,0 ,1 ,0 ,inter_shuf0_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*1] ,reconstruct_stream_stm1_kp0[0] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,0 ,2 ,0 ,inter_shuf0_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*2] ,reconstruct_stream_stm2_kp0[0] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,0 ,3 ,0 ,inter_shuf0_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*3] ,reconstruct_stream_stm3_kp0[0] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,0 ,4 ,0 ,inter_shuf0_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*4] ,reconstruct_stream_stm4_kp0[0] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,1 ,0 ,0 ,inter_shuf1_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*0] ,reconstruct_stream_stm0_kp0[1] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,1 ,1 ,0 ,inter_shuf1_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*1] ,reconstruct_stream_stm1_kp0[1] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,1 ,2 ,0 ,inter_shuf1_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*2] ,reconstruct_stream_stm2_kp0[1] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,1 ,3 ,0 ,inter_shuf1_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*3] ,reconstruct_stream_stm3_kp0[1] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,1 ,4 ,0 ,inter_shuf1_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*4] ,reconstruct_stream_stm4_kp0[1] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,2 ,0 ,0 ,inter_shuf2_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*0] ,reconstruct_stream_stm0_kp0[2] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,2 ,1 ,0 ,inter_shuf2_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*1] ,reconstruct_stream_stm1_kp0[2] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,2 ,2 ,0 ,inter_shuf2_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*2] ,reconstruct_stream_stm2_kp0[2] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,2 ,3 ,0 ,inter_shuf2_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*3] ,reconstruct_stream_stm3_kp0[2] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,2 ,4 ,0 ,inter_shuf2_stm_kp0[0+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp0[1+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp0[2+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp0[3+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp0[4+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp0[5+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp0[6+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp0[7+(8) /* each sub bv is further partitioned into this chunks*/*4] ,reconstruct_stream_stm4_kp0[2] )
        .invoke<tapa::detach>( shuffle_TtoS_per_hash , 0 , 1 , query_bv_packed_stream_hash0_kp1 , inter_shuf0_stm_kp1 ) .invoke<tapa::detach>( shuffle_TtoS_per_hash , 1 , 1 , query_bv_packed_stream_hash1_kp1 , inter_shuf1_stm_kp1 ) .invoke<tapa::detach>( shuffle_TtoS_per_hash , 2 , 1 , query_bv_packed_stream_hash2_kp1 , inter_shuf2_stm_kp1 ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,0 ,0 ,1 ,inter_shuf0_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf0_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*0] ,reconstruct_stream_stm0_kp1[0] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,0 ,1 ,1 ,inter_shuf0_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf0_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*1] ,reconstruct_stream_stm1_kp1[0] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,0 ,2 ,1 ,inter_shuf0_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf0_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*2] ,reconstruct_stream_stm2_kp1[0] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,0 ,3 ,1 ,inter_shuf0_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf0_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*3] ,reconstruct_stream_stm3_kp1[0] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,0 ,4 ,1 ,inter_shuf0_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf0_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*4] ,reconstruct_stream_stm4_kp1[0] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,1 ,0 ,1 ,inter_shuf1_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf1_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*0] ,reconstruct_stream_stm0_kp1[1] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,1 ,1 ,1 ,inter_shuf1_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf1_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*1] ,reconstruct_stream_stm1_kp1[1] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,1 ,2 ,1 ,inter_shuf1_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf1_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*2] ,reconstruct_stream_stm2_kp1[1] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,1 ,3 ,1 ,inter_shuf1_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf1_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*3] ,reconstruct_stream_stm3_kp1[1] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,1 ,4 ,1 ,inter_shuf1_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf1_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*4] ,reconstruct_stream_stm4_kp1[1] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,2 ,0 ,1 ,inter_shuf2_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*0] ,inter_shuf2_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*0] ,reconstruct_stream_stm0_kp1[2] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,2 ,1 ,1 ,inter_shuf2_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*1] ,inter_shuf2_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*1] ,reconstruct_stream_stm1_kp1[2] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,2 ,2 ,1 ,inter_shuf2_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*2] ,inter_shuf2_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*2] ,reconstruct_stream_stm2_kp1[2] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,2 ,3 ,1 ,inter_shuf2_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*3] ,inter_shuf2_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*3] ,reconstruct_stream_stm3_kp1[2] ) .invoke<tapa::detach>( shuffle_reordering_per_hash ,2 ,4 ,1 ,inter_shuf2_stm_kp1[0+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp1[1+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp1[2+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp1[3+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp1[4+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp1[5+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp1[6+(8) /* each sub bv is further partitioned into this chunks*/*4] ,inter_shuf2_stm_kp1[7+(8) /* each sub bv is further partitioned into this chunks*/*4] ,reconstruct_stream_stm4_kp1[2] )
        .invoke(bloom_aggregate_SPLIT, 0, 0, reconstruct_stream_stm0_kp0, aggregate_stream_kp0[0] ) .invoke(bloom_aggregate_SPLIT, 1, 0, reconstruct_stream_stm1_kp0, aggregate_stream_kp0[1] ) .invoke(bloom_aggregate_SPLIT, 2, 0, reconstruct_stream_stm2_kp0, aggregate_stream_kp0[2] ) .invoke(bloom_aggregate_SPLIT, 3, 0, reconstruct_stream_stm3_kp0, aggregate_stream_kp0[3] ) .invoke(bloom_aggregate_SPLIT, 4, 0, reconstruct_stream_stm4_kp0, aggregate_stream_kp0[4] )
        .invoke(bloom_aggregate_SPLIT, 0, 1, reconstruct_stream_stm0_kp1, aggregate_stream_kp1[0] ) .invoke(bloom_aggregate_SPLIT, 1, 1, reconstruct_stream_stm1_kp1, aggregate_stream_kp1[1] ) .invoke(bloom_aggregate_SPLIT, 2, 1, reconstruct_stream_stm2_kp1, aggregate_stream_kp1[2] ) .invoke(bloom_aggregate_SPLIT, 3, 1, reconstruct_stream_stm3_kp1, aggregate_stream_kp1[3] ) .invoke(bloom_aggregate_SPLIT, 4, 1, reconstruct_stream_stm4_kp1, aggregate_stream_kp1[4] )
        .invoke(packOutput, 0, 0, aggregate_stream_kp0[0], packed_output_stm_kp0[0])
        .invoke(packOutput, 1, 0, aggregate_stream_kp0[1], packed_output_stm_kp0[1])
        .invoke(packOutput, 2, 0, aggregate_stream_kp0[2], packed_output_stm_kp0[2])
        .invoke(packOutput, 3, 0, aggregate_stream_kp0[3], packed_output_stm_kp0[3])
        .invoke(packOutput, 4, 0, aggregate_stream_kp0[4], packed_output_stm_kp0[4])
        .invoke(packOutput, 0, 1, aggregate_stream_kp1[0], packed_output_stm_kp1[0])
        .invoke(packOutput, 1, 1, aggregate_stream_kp1[1], packed_output_stm_kp1[1])
        .invoke(packOutput, 2, 1, aggregate_stream_kp1[2], packed_output_stm_kp1[2])
        .invoke(packOutput, 3, 1, aggregate_stream_kp1[3], packed_output_stm_kp1[3])
        .invoke(packOutput, 4, 1, aggregate_stream_kp1[4], packed_output_stm_kp1[4])
        .invoke(writeOutput_synchronous
                ,packed_output_stm_kp0[0]
                ,packed_output_stm_kp1[0]
                ,packed_output_stm_kp0[1]
                ,packed_output_stm_kp1[1]
                ,packed_output_stm_kp0[2]
                ,packed_output_stm_kp1[2]
                ,packed_output_stm_kp0[3]
                ,packed_output_stm_kp1[3]
                ,packed_output_stm_kp0[4]
                ,packed_output_stm_kp1[4]
                ,out_bits)
    ;
    return;
}
