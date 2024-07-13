
//#ifndef __SYNTHESIS__
//    #include <time.h>
//#endif

#include "MurmurHash3.h"

#if NAIVE_MULTISTREAM != 0
void crash_compilation(
crash compilation.
}
#endif



void loadKey(
        tapa::async_mmap<LOAD_DTYPE>            & key_in
        ,tapa::ostreams<KEY_DTYPE, NUM_STM>     & key_stream_kp0
        ,tapa::ostreams<KEY_DTYPE, NUM_STM>     & key_stream_kp1
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

            #define WRITE_SIDX(SIDX)    \
                key_stream_kp0[SIDX].write(cur_load.s##SIDX##_k0); \
                key_stream_kp1[SIDX].write(cur_load.s##SIDX##_k1);

            WRITE_SIDX(0)
            WRITE_SIDX(1)
            WRITE_SIDX(2)
            WRITE_SIDX(3)
            WRITE_SIDX(4)

            #if NUM_STM != 5
            crash on purpose(,
            #endif


            #ifdef __DO_DEBUG_PRINTS__
            printf("KDEBUG: LOADKEY - The %d'th keypair = %d, %d\n",
                    i_resp,
                    cur_keypair.k0.to_int(),
                    cur_keypair.k1.to_int()
            );
            #endif

            ++i_resp;
        }
    }

    #ifdef __DO_DEBUG_PRINTS__
    printf("\n\nLOADKEY - IS DONE NOW.\n\n");
    #endif
    return;
}


/*************************************************************************************/

void loadBV(
    tapa::async_mmap<BV_LOAD_DTYPE>    & input_bv
    ,tapa::ostream<BV_PACKED_DTYPE>    & bv_load_stream_0
    ,tapa::ostream<BV_PACKED_DTYPE>    & bv_load_stream_1
    ,tapa::ostream<BV_PACKED_DTYPE>    & bv_load_stream_2
    ,tapa::ostream<BV_PACKED_DTYPE>    & bv_load_stream_3
    ,tapa::ostream<BV_PACKED_DTYPE>    & bv_load_stream_4
    #if NUM_HASH != 5
    ,crash,
    #endif

    #if ENABLE_PERF_CTRS
    ,tapa::ostreams<PERFCTR_DTYPE, 1>                   & perfctr_out
    #endif
){

    #if BV_LOAD_BITWIDTH > 1024
    crash(); on purpose();
    // We need more sophisticated loading logic. AXI bitwidth shouldnt be higher than 1024.
    #endif

    int section_idx = 0;
    BV_LOAD_DTYPE  cur_bv_val;

    #if ENABLE_PERF_CTRS
    PERFCTR_DTYPE   load_cycles = 0;
    #endif

    for (int i_req = 0, i_resp = 0;
            i_resp < BV_NUM_LOADS; )
    {
        #pragma HLS PIPELINE II=1

        #if ENABLE_PERF_CTRS
        load_cycles += 1;
        #endif

        if (i_req < BV_NUM_LOADS && input_bv.read_addr.try_write(i_req)) {
            ++i_req;
        }
        if (!input_bv.read_data.empty()) {
            cur_bv_val = input_bv.read_data.read(nullptr);

            bv_load_stream_0.write(cur_bv_val.section0);
            bv_load_stream_1.write(cur_bv_val.section1);
            bv_load_stream_2.write(cur_bv_val.section2);
            bv_load_stream_3.write(cur_bv_val.section3);
            bv_load_stream_4.write(cur_bv_val.section4);
            #if NUM_HASH != 5
            crash!!
            #endif

            #ifdef __DO_DEBUG_PRINTS__
            for (int i = 0; i < BV_PACKED_BITWIDTH; ++i)
            {
                int total_idx = i_resp*BV_PACKED_BITWIDTH + i;
                BIT_DTYPE cur_bit;
                cur_bit.range(0,0) = cur_bv_val.section0.range(i, i);
                printf("KDEBUG: LOADBV - The %dth packed BV value of section 0 is %d
",
                        total_idx, cur_bit.to_int());
            }
            #endif

            ++i_resp;
        }
    }

    #if ENABLE_PERF_CTRS
    WRITE_PERF_CTRS:
    for (int i = 0; i < NUM_PERFCTR_OUTPUTS; ++i) {
    #pragma HLS PIPELINE II=1
        if (i == 0){
            perfctr_out[0].write(load_cycles);
        }
        else{
            perfctr_out[0].write(55555);
        }
    }
    #endif  // ENABLE_PERF_CTRS

    #ifdef __DO_DEBUG_PRINTS__
    printf("\n\nLOADBV IS DONE NOW.\n\n");
    #endif
    return;
}


/*************************************************************************************/


uint32_t MurmurHash3_x86_32 (
    KEY_DTYPE key,
    uint32_t seed
){
#pragma HLS inline
    const int nblocks = KEY_SIZE_IN_BYTES / 4;
    uint32_t h1 = seed;
    const uint32_t c1 = 0xcc9e2d51;
    const uint32_t c2 = 0x1b873593;

    //length is limited as this:  KEY_SIZE_IN_BYTES / 4  <= KEY_SIZE_IN_BYTES
    BLOCK_DIVIDING:
    for( int i = 0; i < nblocks; i++){
    #pragma HLS UNROLL
        KEY_DTYPE tmp;
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

        #if PRINT_HASH_VALUES
        printf("KERNEL DEBUG: key = %d, k = %d, h = %d, i = %d\n",
                key.to_int(), k1, h1, i
        );
        #endif

    }
    //Remainder from block division
    uint32_t tail = key[nblocks];

    //Finalization
    h1 ^= KEY_SIZE_IN_BYTES;
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
        int                                 strm_idx,
        int                                 keypair_idx,
        tapa::istream<KEY_DTYPE>            & key_in_stream,
        tapa::ostreams<KEY_DTYPE, NUM_HASH> & key_out_stream
){
    const int READ_STOP_COUNT =     KEYPAIRS_PER_STM;
    const int WRITE_STOP_COUNT =    KEYPAIRS_PER_STM*NUM_HASH;
    int total_num_reads = 0;
    int total_num_writes = 0;

    int input_idx = 0;

    KEY_DTYPE       key;
    bool            key_written[NUM_HASH];
    #pragma HLS ARRAY_PARTITION variable=key_written dim=0 complete

    INIT_KEY_WRITTEN:
    for (int i = 0; i < NUM_HASH; ++i) {
        key_written[i] = 1;
    }

    while (total_num_reads < READ_STOP_COUNT ||
            total_num_writes < WRITE_STOP_COUNT
    ) {
    #pragma HLS PIPELINE II=1

        bool do_read = 1;
        HASH_RD_LOOP:
        for(int hash_idx = 0; hash_idx < NUM_HASH; ++hash_idx){
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

            #ifdef __DO_DEBUG_PRINTS__
            printf("COMPUTEHASH_FEEDER #%d kp%d - Read input #%d, with value %d.\n",
                strm_idx, keypair_idx,
                input_idx, key.to_int()
            );
            #endif

            total_num_reads++;
            input_idx++;
            for (int j = 0; j < NUM_HASH; ++j) {
                key_written[j] = 0;
            }
        }
        ///////////////////////////////////
        // WRITE LOGIC:

        for (int hash_idx = 0; hash_idx < NUM_HASH; ++hash_idx) {
        #pragma HLS UNROLL
            if (key_written[hash_idx] == 0) {
                if (key_out_stream[hash_idx].try_write(key)) {
                    total_num_writes++;
                    key_written[hash_idx] = 1;
                }
            }
        }
    }

    #ifdef __DO_DEBUG_PRINTS__
    printf("\n\nCOMPUTEHASH_FEEDER #%d kp%d - DONE NOW.\n\n",
            strm_idx, keypair_idx
    );
    #endif
    return;
}



void computeHash_Computer(
        int                             stm_idx,
        int                             hash_idx,
        int                             keypair_idx,
        tapa::istream<KEY_DTYPE>        & key_stream,
        tapa::ostream<HASHONLY_DTYPE>   & hash_stream
){
    int module_idx = stm_idx*NUM_HASH + hash_idx;
    const int WRITE_STOP_COUNT =    KEYPAIRS_PER_STM;
    int total_num_writes = 0;
    int input_idx = 0;

    MAIN_LOOP:
    while ( total_num_writes < WRITE_STOP_COUNT){
    #pragma HLS PIPELINE II=1
        KEY_DTYPE key = key_stream.read();
        uint32_t hash = MurmurHash3_x86_32(key, hash_idx);
        hash %= BV_SECTION_LENGTH;
        hash_stream.write(hash);
        total_num_writes++;

        #ifdef __DO_DEBUG_PRINTS__
        printf("COMPUTEHASH_COMPUTER #%d kp%d - (STM %d, HASH %d): read input #%d, key %d, computed hash = %d\n",
                module_idx,
                keypair_idx,
                stm_idx,
                hash_idx,
                input_idx,
                key.to_int(),
                hash
        );
        input_idx++;
        #endif

    }
}

#define COMPUTEHASH_STREAM_DECLS_KP(KP_IDX)   \
    tapa::streams<KEY_DTYPE, NUM_HASH>      key_tmp_stream_0_kp##KP_IDX;\
    tapa::streams<KEY_DTYPE, NUM_HASH>      key_tmp_stream_1_kp##KP_IDX;\
    tapa::streams<KEY_DTYPE, NUM_HASH>      key_tmp_stream_2_kp##KP_IDX;\
    tapa::streams<KEY_DTYPE, NUM_HASH>      key_tmp_stream_3_kp##KP_IDX;\
    tapa::streams<KEY_DTYPE, NUM_HASH>      key_tmp_stream_4_kp##KP_IDX;\


#define INVOKE_COMPUTERS_FOR_HASH(HASH_IDX, STM_IDX, KP_IDX)\
    .invoke(computeHash_Computer,\
            STM_IDX,\
            HASH_IDX,\
            KP_IDX,\
            key_tmp_stream_##STM_IDX##_kp##KP_IDX[HASH_IDX],\
            hash_stream_h##HASH_IDX##_kp##KP_IDX[STM_IDX]\
    )


// CONFIG: need NUM_HASH calls to INVOKE_COMPUTERS_FOR_HASH
#define INVOKE_COMPUTERS_FOR_STM(STM_IDX, KP_IDX)\
    INVOKE_COMPUTERS_FOR_HASH(0, STM_IDX, KP_IDX)\
    INVOKE_COMPUTERS_FOR_HASH(1, STM_IDX, KP_IDX)\
    INVOKE_COMPUTERS_FOR_HASH(2, STM_IDX, KP_IDX)\
    INVOKE_COMPUTERS_FOR_HASH(3, STM_IDX, KP_IDX)\
    INVOKE_COMPUTERS_FOR_HASH(4, STM_IDX, KP_IDX)\


#define COMPUTEHASH_INVOKES_FOR_KP(KP_IDX)  \
        .invoke(computeHash_Feeder, \
                    0,  \
                    KP_IDX,    \
                    key_stream_kp##KP_IDX[0],   \
                    key_tmp_stream_0_kp##KP_IDX    \
        )   \
        .invoke(computeHash_Feeder, \
                    1,  \
                    KP_IDX,    \
                    key_stream_kp##KP_IDX[1],   \
                    key_tmp_stream_1_kp##KP_IDX    \
        )   \
        .invoke(computeHash_Feeder, \
                    2,  \
                    KP_IDX,    \
                    key_stream_kp##KP_IDX[2],   \
                    key_tmp_stream_2_kp##KP_IDX    \
        )   \
        .invoke(computeHash_Feeder, \
                    3,  \
                    KP_IDX,    \
                    key_stream_kp##KP_IDX[3],   \
                    key_tmp_stream_3_kp##KP_IDX    \
        )   \
        .invoke(computeHash_Feeder, \
                    4,  \
                    KP_IDX,    \
                    key_stream_kp##KP_IDX[4],   \
                    key_tmp_stream_4_kp##KP_IDX    \
        )   \
    /* Need NUM_STM of these^ invokes */ \
    INVOKE_COMPUTERS_FOR_STM(0, KP_IDX) \
    INVOKE_COMPUTERS_FOR_STM(1, KP_IDX) \
    INVOKE_COMPUTERS_FOR_STM(2, KP_IDX) \
    INVOKE_COMPUTERS_FOR_STM(3, KP_IDX) \
    INVOKE_COMPUTERS_FOR_STM(4, KP_IDX) \
    /* Need NUM_STM of these^ invokes */

#if NUM_STM != 5
void crash(){ crash compilation
#endif



/*************************************************************************************/





//////////////////////////////////////////////////
//////////////////////////////////////////////////
///////// Arbiter                           //////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


void bloom_arb_forwarder(
        int arb_idx
        ,int kp_idx
        ,tapa::istreams<HASHONLY_DTYPE, NUM_STM>                         & hash_stream
        ,tapa::ostreams<PACKED_HASH_DTYPE, NUM_STM*BV_NUM_PARTITIONS>    & arb_stream
){
    typedef struct {
        ap_uint<1>          valid;
        PACKED_HASH_DTYPE   value;
        uint32_t            target_partition_idx;
    } XBAR_DTYPE;

    const int READ_STOP_COUNT =     NUM_STM * KEYPAIRS_PER_STM;
    const int WRITE_STOP_COUNT =    KEYPAIRS_PER_STM;
    int total_num_reads = 0;
    int total_num_writes = 0;

    int num_writes_per_stm[NUM_STM];
    #pragma HLS ARRAY_PARTITION variable=num_writes_per_stm dim=0 complete

    #ifdef __SYNTHESIS__
    /* TAPA Known-issue: Static keyword fails CSIM because this
       isnt thread-safe. But when running the HW build, it will
       instantiate several copies of this function. So this is OK.
    */
    static
    #endif
    INPUT_IDX_DTYPE     reads_per_input[NUM_STM];
    #pragma HLS ARRAY_PARTITION variable=reads_per_input dim=0 complete
    #ifdef __SYNTHESIS__
    /* TAPA Known-issue: Static keyword fails CSIM because this
       isnt thread-safe. But when running the HW build, it will
       instantiate several copies of this function. So this is OK.
    */
    static
    #endif
    XBAR_DTYPE          xbar[NUM_STM];
    #pragma HLS ARRAY_PARTITION variable=xbar dim=0 complete

    #ifndef __SYNTHESIS__
    printf("NOTE: USING HIERARCHICAL ARBITER!!!\n");
    #endif

    INIT_LOOP:
    for (int i = 0; i < NUM_STM; ++i)
    {
        reads_per_input[i] = 0;
        num_writes_per_stm[i] = 0;
        xbar[i].valid = 0;
    }

    MAIN_LOOP:
    while (total_num_reads < READ_STOP_COUNT  ||
            num_writes_per_stm[0] < WRITE_STOP_COUNT  ||
            num_writes_per_stm[1] < WRITE_STOP_COUNT  ||
            num_writes_per_stm[2] < WRITE_STOP_COUNT  ||
            num_writes_per_stm[3] < WRITE_STOP_COUNT  ||
            num_writes_per_stm[4] < WRITE_STOP_COUNT
            #if NUM_STM != 5
             crash. ||
            #endif
    ) {
    #pragma HLS PIPELINE II=1
        RD_LOGIC:
        for (int strm_idx = 0; strm_idx < NUM_STM; ++strm_idx) {
        #pragma HLS UNROLL
            // Metadata:
            INPUT_IDX_DTYPE cur_input_idx;
            STRM_IDX_DTYPE cur_strm_idx;
            METADATA_DTYPE cur_metadata;
            PACKED_HASH_DTYPE packed_hashval;

            if (xbar[strm_idx].valid == 1)
            {
                // Dont replace this value.
            }
            else if (!hash_stream[strm_idx].empty())
            {
                // Hash and partition data:
                HASHONLY_DTYPE  tmp_hash = hash_stream[strm_idx].read();
                HASHONLY_DTYPE  idx_inside_partition = tmp_hash % BV_PARTITION_LENGTH;
                int             partition_idx = (tmp_hash / BV_PARTITION_LENGTH);

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

        #ifdef __DO_DEBUG_PRINTS__
        printf("ARBITER FORWARDER #%d kp%d - xbar[target_partition][strm_idx]\n",
            arb_idx, kp_idx
        );
        for (int strm = 0; strm < NUM_STM; ++strm)
        {
            printf("ARBITER FORWARDER #%d kp%d - xbar[%d][%d]: valid=%d, input_idx=%d\n",
                    arb_idx, kp_idx,
                    xbar[strm].target_partition_idx,
                    strm,
                    xbar[strm].valid.to_int(),
                    xbar[strm].value.md.iidx.to_int()
            );
        }
        #endif


        WR_LOGIC:
        for (int partition_idx = 0; partition_idx < BV_NUM_PARTITIONS; ++partition_idx)
        {
        #pragma HLS UNROLL
            bool                found = false;
            uint32_t            found_strm_idx = 0;

            for (int strm_idx = 0; strm_idx < NUM_STM; ++strm_idx)
            {
            #pragma HLS UNROLL
                int out_fifo_idx = partition_idx*NUM_STM + strm_idx;

                if (xbar[strm_idx].valid == 1 &&
                    xbar[strm_idx].target_partition_idx == partition_idx)
                {
                    if (arb_stream[out_fifo_idx].try_write( xbar[strm_idx].value ))
                    {
                        num_writes_per_stm[strm_idx]++;
                        xbar[strm_idx].valid = 0;

                        #ifdef __DO_DEBUG_PRINTS__
                        printf("ARBITER FORWARDER #%d kp%d - Wrote to outfifo %d\n",
                                arb_idx, kp_idx, out_fifo_idx
                        );
                        #endif
                    }
                    #ifdef __DO_DEBUG_PRINTS__
                    else{
                        printf("ARBITER FORWARDER #%d kp%d - Failed to write to outfifo %d\n",
                                arb_idx, kp_idx, out_fifo_idx
                        );
                    }
                    #endif
                }
            }
        }

    }

    #ifdef __DO_DEBUG_PRINTS__
    printf("\n\nARBITER FORWARDER #%d kp%d - DONE NOW.\n\n",
            arb_idx, kp_idx
    );
    #endif
}



void bloom_hier_arbiter_atom(
        int arb_idx,
        int partition_idx,
        int kp_idx,
        int atom_ID,
        tapa::istream<RATEMON_FEEDBACK_DTYPE>   & ratemon_stream,
        tapa::istream<PACKED_HASH_DTYPE>        & in_stream0,
        tapa::istream<PACKED_HASH_DTYPE>        & in_stream1,
        tapa::ostream<PACKED_HASH_DTYPE>        & out_stream
){
    typedef struct {
        ap_uint<1>          valid;
        PACKED_HASH_DTYPE   value;
    } XBAR_DTYPE;

    XBAR_DTYPE xbar[2];
    #pragma HLS ARRAY_PARTITION variable=xbar dim=0 complete

    RATEMON_FEEDBACK_DTYPE  feedback;
    INPUT_IDX_DTYPE         min_output_idx_s0 = 0;
    INPUT_IDX_DTYPE         min_output_idx_s1 = 0;
    INPUT_IDX_DTYPE         min_output_idx_s2 = 0;
    INPUT_IDX_DTYPE         min_output_idx_s3 = 0;
    INPUT_IDX_DTYPE         min_output_idx_s4 = 0;
    #ifdef __DO_DEBUG_PRINTS__
    bool    print_xbar = 0;
    #endif

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

            #ifdef __DO_DEBUG_PRINTS__
            //if (partition_idx == 0 && atom_ID == 'a')
            //{
            //    printf("ARBITER ATOM [%d][%d][%c] - feedback came in. %d, %d, %d, %d.\n",
            //            arb_idx, partition_idx, atom_ID,
            //            feedback.strm0_out_idx.to_int(),
            //            feedback.strm1_out_idx.to_int(),
            //            feedback.strm2_out_idx.to_int(),
            //            feedback.strm3_out_idx.to_int()
            //    );
            //}
            #endif

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
            PACKED_HASH_DTYPE   packed_val = in_stream0.read();

            xbar[0].value = packed_val;
            xbar[0].valid = 1;

            #ifdef __DO_DEBUG_PRINTS__
            printf("ARBITER ATOM [%d][%d][%c] kp%d - read from hash/part/strm (%d,%d,0)\n",
                    arb_idx, partition_idx, atom_ID,
                    kp_idx,
                    arb_idx, partition_idx
            );
            print_xbar = 1;
            #endif
        }
        if (xbar[1].valid == 1) {
            // Dont overwrite it
        }
        else if (!in_stream1.empty()) {
            PACKED_HASH_DTYPE   packed_val = in_stream1.read();

            xbar[1].value = packed_val;
            xbar[1].valid = 1;

            #ifdef __DO_DEBUG_PRINTS__
            printf("ARBITER ATOM [%d][%d][%c] kp%d - read from hash/part/strm (%d,%d,1)\n",
                    arb_idx, partition_idx, atom_ID,
                    kp_idx,
                    arb_idx, partition_idx
            );
            print_xbar = 1;
            #endif
        }

        #ifdef __DO_DEBUG_PRINTS__
        if (print_xbar){
            for (int i = 0; i < 2; ++i)
            {
                printf("ARBITER ATOM [%d][%d][%c] kp%d - xbar[%d]: valid=%d, input_idx=%d, strm_idx=%d, bv_idx=%d\n",
                        arb_idx, partition_idx, atom_ID,
                        kp_idx,
                        i,
                        xbar[i].valid.to_int(),
                        xbar[i].value.md.iidx.to_int(),
                        xbar[i].value.md.sidx.to_int(),
                        xbar[i].value.hash.to_int()
                );
            }
            printf("ARBITER ATOM [%d][%d][%c] kp%d - min_output_idx = %d\n",
                    arb_idx, partition_idx, atom_ID,
                    kp_idx,
                    min_output_idx.to_int()
            );
        }
        #endif

        WR_LOGIC:
        #ifdef __DO_DEBUG_PRINTS__
        int     print_xbar_idx = -1;
        #endif
        int     valid_idxes = 0;
        int allowed_idx_s0 = min_output_idx_s0 + (SHUFFLEBUF_SZ);
        int allowed_idx_s1 = min_output_idx_s1 + (SHUFFLEBUF_SZ);
        int allowed_idx_s2 = min_output_idx_s2 + (SHUFFLEBUF_SZ);
        int allowed_idx_s3 = min_output_idx_s3 + (SHUFFLEBUF_SZ);
        int allowed_idx_s4 = min_output_idx_s4 + (SHUFFLEBUF_SZ);
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
        #if NUM_STM != 5
        crash!
        #endif

        if (valid_idxes == 3) {
            if (xbar[1].value.md.iidx <= xbar[0].value.md.iidx) {
                if (out_stream.try_write(xbar[1].value)) {
                    xbar[1].valid = 0;
                    #ifdef __DO_DEBUG_PRINTS__
                    print_xbar_idx = 1;
                    #endif
                }
            }
            else {
                if (out_stream.try_write(xbar[0].value)) {
                    xbar[0].valid = 0;
                    #ifdef __DO_DEBUG_PRINTS__
                    print_xbar_idx = 0;
                    #endif
                }
            }
        }
        else if (valid_idxes == 2) {
            if (out_stream.try_write(xbar[1].value)) {
                xbar[1].valid = 0;
                #ifdef __DO_DEBUG_PRINTS__
                print_xbar_idx = 1;
                #endif
            }
        }
        else if (valid_idxes == 1) {
            if (out_stream.try_write(xbar[0].value)) {
                xbar[0].valid = 0;
                #ifdef __DO_DEBUG_PRINTS__
                print_xbar_idx = 0;
                #endif
            }
        }

        #ifdef __DO_DEBUG_PRINTS__
        if (print_xbar_idx != -1) {
            printf("ARBITER ATOM [%d][%d][%c] kp%d - WROTE from xbar %d. hash/part/strm = (%d,%d,%d), input_idx=%d, allowed_idx=%d\n",
                    arb_idx, partition_idx, atom_ID,
                    kp_idx,
                    print_xbar_idx,
                    arb_idx,
                    partition_idx,
                    xbar[1].value.md.sidx.to_int(),
                    xbar[1].value.md.iidx.to_int(),
                    allowed_idx
            );
        }
        #endif

    }
}



void bloom_arbiter_ratemonitor(
    int arb_idx
    ,int kp_idx
    ,char ratemon_ID
    ,tapa::istreams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS>       &arb_stream_in
    ,tapa::ostreams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS>       &arb_stream_out

    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>  &fdbk_stream_0
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>  &fdbk_stream_1
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>  &fdbk_stream_2
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>  &fdbk_stream_3
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>  &fdbk_stream_4
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>  &fdbk_stream_5
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>  &fdbk_stream_6
    ,tapa::ostreams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>  &fdbk_stream_7
    #if BV_NUM_PARTITIONS != 8
    crash!
    #endif

    #if ENABLE_PERF_CTRS
    ,tapa::ostream<PERFCTR_DTYPE>                               &perfctr_out
    #endif
){
    int WRITE_STOP_COUNT = 0;

    /* Depending on which level this ratemon is in,
     * it expects a different number of writes.
     */
    WRITE_STOP_COUNT = NUM_STM * KEYPAIRS_PER_STM;
    int writes_per_partition[BV_NUM_PARTITIONS] = {};

    #if ENABLE_PERF_CTRS
    BIT_DTYPE       did_read;
    BIT_DTYPE       did_write;

    PERFCTR_DTYPE   stall_cycles = 0;
    PERFCTR_DTYPE   readonly_cycles = 0;
    PERFCTR_DTYPE   writeonly_cycles = 0;
    PERFCTR_DTYPE   readwrite_cycles = 0;
    PERFCTR_DTYPE   total_cycles = 0;
    #else
    int             CRASH_COMPILATION_IF_MISTAKE;
    #endif

    typedef struct {
        BIT_DTYPE           valid;
        PACKED_HASH_DTYPE   value;
    } XBAR_DTYPE;

    typedef enum {
        WR_FEEDBACK,
        WR_OUTPUT
    } RATEMON_MODE;

    XBAR_DTYPE              xbar[BV_NUM_PARTITIONS];
    #pragma HLS ARRAY_PARTITION variable=xbar dim=0 complete
    INPUT_IDX_DTYPE         min_output_idx[NUM_STM];
    #pragma HLS ARRAY_PARTITION variable=min_output_idx dim=0 complete
    BIT_DTYPE               idx_tracker[NUM_STM][SHUFFLEBUF_SZ];
    #pragma HLS ARRAY_PARTITION variable=idx_tracker dim=0 complete

    INIT_LOOP:
    for (int i = 0; i < BV_NUM_PARTITIONS; ++i) {
        xbar[i].valid = 0;
        writes_per_partition[i] = 0;
    }

    INIT_LOOP_2:
    for (int i = 0; i < NUM_STM; ++i) {
        min_output_idx[i] = 0;

        for (int j = 0; j < SHUFFLEBUF_SZ; ++j) {
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

        #if BV_NUM_PARTITIONS != (8)       // BECAUSE OF THE LOOP BOUND ^
        crash(crash
        #endif

        #if ENABLE_PERF_CTRS
        did_read = 0;
        did_write = 0;
        #endif

        RATEMON_FEEDBACK_DTYPE  feedback;

        RD_INPUTS:
        for (int partition_idx = 0; partition_idx < BV_NUM_PARTITIONS; ++partition_idx) {
            INPUT_IDX_DTYPE     cur_input_idx;
            STRM_IDX_DTYPE      cur_strm_idx;
            METADATA_DTYPE      cur_metadata;

            if (xbar[partition_idx].valid == 0 &&
                !arb_stream_in[partition_idx].empty()
            ){
                xbar[partition_idx].valid = 1;
                xbar[partition_idx].value = arb_stream_in[partition_idx].read();

                #ifdef __DO_DEBUG_PRINTS__
                printf("ARBITER RATEMON %d %c kp%d - Read from     h/p/s=(%d,%d,%d), input_idx=%d\n",
                        arb_idx,
                        ratemon_ID,
                        kp_idx,
                        arb_idx,
                        partition_idx,
                        xbar[partition_idx].value.md.sidx.to_int(),
                        xbar[partition_idx].value.md.iidx.to_int()
                );
                #endif
                #if ENABLE_PERF_CTRS
                did_read = 1;
                #endif
            }
        }

        ///////////////////////
        // WR_OUTPUTS:
        ///////////////////////

        #define RATEMON_WR_OUTPUT_FOR_PART(PART)    \
            for (int sidx = 0; sidx < NUM_STM; ++sidx) {    \
                int offset = (xbar[PART].value.md.iidx) % SHUFFLEBUF_SZ;    \
                if (xbar[PART].valid && \
                    xbar[PART].value.md.sidx == sidx && \
                    !arb_stream_out[PART].full())   \
                {   \
                    xbar[PART].valid = 0;   \
                    arb_stream_out[PART].write(xbar[PART].value);   \
                    idx_tracker[sidx][offset] = 1;  \
                    writes_per_partition[PART]++;   \
                    break;  \
                }   \
            }


        RATEMON_WR_OUTPUT_FOR_PART(0)
        RATEMON_WR_OUTPUT_FOR_PART(1)
        RATEMON_WR_OUTPUT_FOR_PART(2)
        RATEMON_WR_OUTPUT_FOR_PART(3)
        RATEMON_WR_OUTPUT_FOR_PART(4)
        RATEMON_WR_OUTPUT_FOR_PART(5)
        RATEMON_WR_OUTPUT_FOR_PART(6)
        RATEMON_WR_OUTPUT_FOR_PART(7)
            #if BV_NUM_PARTITIONS != 8
            crash!
            #endif


        ///////////////////////
        // UPDATE_IDCES:
        ///////////////////////
        #define RATEMON_UPDATE_IDX_FOR_STM(STM)     \
            int shuf_idx##STM = (min_output_idx[STM] + 1) % SHUFFLEBUF_SZ;   \
            if (idx_tracker[STM][shuf_idx##STM] == 1) {  \
                min_output_idx[STM] += 1;   \
                idx_tracker[STM][shuf_idx##STM] = 0;     \
            }   \
                //#ifdef __DO_DEBUG_PRINTS__    \
                //printf("ARBITER RATEMON %d %c kp%d - Updating min_output_idx[%d]=%d\n",   \
                //        arb_idx,  \
                //        ratemon_ID,   \
                //        kp_idx,   \
                //        STM,  \
                //        min_output_idx[STM].to_int()  \
                //);    \
                //#endif    \

        RATEMON_UPDATE_IDX_FOR_STM(0)
        RATEMON_UPDATE_IDX_FOR_STM(1)
        RATEMON_UPDATE_IDX_FOR_STM(2)
        RATEMON_UPDATE_IDX_FOR_STM(3)
        RATEMON_UPDATE_IDX_FOR_STM(4)

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
        #if NUM_STM != 5
        crash!
        #endif

        for (int i = 0; i < NUM_ARBITER_ATOMS; ++i) {
            fdbk_stream_0[i].try_write(feedback);
            fdbk_stream_1[i].try_write(feedback);
            fdbk_stream_2[i].try_write(feedback);
            fdbk_stream_3[i].try_write(feedback);
            fdbk_stream_4[i].try_write(feedback);
            fdbk_stream_5[i].try_write(feedback);
            fdbk_stream_6[i].try_write(feedback);
            fdbk_stream_7[i].try_write(feedback);
            #if BV_NUM_PARTITIONS != 8
            crash!
            #endif
        }

        #if ENABLE_PERF_CTRS
        UPDATE_PERF_CTRS:
        total_cycles++;

        if (did_write && !did_read){
            writeonly_cycles++;
        }
        else if (did_read && !did_write){
            readonly_cycles++;
        }
        else if (!did_read && !did_write){
            stall_cycles++;
        }
        else if (did_read && did_write){
            readwrite_cycles++;
        }
        #endif
    }


    #if ENABLE_PERF_CTRS
    WRITE_PERF_CTRS:
    for (int i = 0; i < NUM_PERFCTR_OUTPUTS; ++i) {
    #pragma HLS PIPELINE II=1
        if (i == 0){
            perfctr_out.write(stall_cycles);
        }
        else if (i == 1){
            perfctr_out.write(readonly_cycles);
        }
        else if (i == 2){
            perfctr_out.write(writeonly_cycles);
        }
        else if (i == 3){
            perfctr_out.write(readwrite_cycles);
        }
        else if (i == 4){
            perfctr_out.write(total_cycles);
        }
        else{
            perfctr_out.write(55555);
        }
    }


    #ifdef __DO_DEBUG_PRINTS__
    printf("ARBITER RATEMON %d %c kp%d - stall_cycles       = %25lu\n",
        arb_idx, ratemon_ID, kp_idx, stall_cycles
    );
    printf("ARBITER RATEMON %d %c kp%d - readonly_cycles    = %25lu\n",
        arb_idx, ratemon_ID, kp_idx, readonly_cycles
    );
    printf("ARBITER RATEMON %d %c kp%d - writeonly_cycles   = %25lu\n",
        arb_idx, ratemon_ID, kp_idx, writeonly_cycles
    );
    printf("ARBITER RATEMON %d %c kp%d - readwrite_cycles   = %25lu\n",
        arb_idx, ratemon_ID, kp_idx, readwrite_cycles
    );
    printf("ARBITER RATEMON %d %c kp%d - total_cycles       = %25lu\n",
        arb_idx, ratemon_ID, kp_idx, total_cycles
    );
    #endif

    #endif  // ENABLE_PERF_CTRS

    #ifdef __DO_DEBUG_PRINTS__
    printf("ARBITER RATEMON %d %c - DONE NOW!\n", arb_idx, ratemon_ID);
    #endif
}



void bloom_arbiter_tree_singlepartition(
    int arb_idx
    ,int partition_idx
    ,int kp_idx

    ,tapa::istream<PACKED_HASH_DTYPE>           &arb_stm0
    ,tapa::istream<PACKED_HASH_DTYPE>           &arb_stm1
    ,tapa::istream<PACKED_HASH_DTYPE>           &arb_stm2
    ,tapa::istream<PACKED_HASH_DTYPE>           &arb_stm3
    ,tapa::istream<PACKED_HASH_DTYPE>           &arb_stm4
    #if NUM_STM != 5
    crash!
    #endif

    ,tapa::istreams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>  &ratemon_feedback
    ,tapa::ostream<PACKED_HASH_DTYPE>                           &arbtree_out
) {
    tapa::streams<PACKED_HASH_DTYPE, 2>     arb_stage1_outputs;
    tapa::streams<PACKED_HASH_DTYPE, 1>     arb_stage2_outputs;
    #if NUM_ARBITER_ATOMS != 4
    crash!
    #endif

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
        #if NUM_ARBITER_ATOMS != 4
        crash!
        #endif
    ;
}



void bloom_single_arbiter(
        int arb_idx
        , int kp_idx
        , tapa::istreams<PACKED_HASH_DTYPE, NUM_STM*BV_NUM_PARTITIONS>  &in_arb_streams
        , tapa::ostreams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS>          &bv_lookup_stream

        #if ENABLE_PERF_CTRS
        ,tapa::ostreams<PERFCTR_DTYPE, NUM_ARBITER_ATOMS>           &perfctr_out
        #endif
) {
    tapa::streams<PACKED_HASH_DTYPE,    BV_NUM_PARTITIONS>      arbtree_outputs;

    tapa::streams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>    ratemon_fdbk_streams_p0;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>    ratemon_fdbk_streams_p1;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>    ratemon_fdbk_streams_p2;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>    ratemon_fdbk_streams_p3;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>    ratemon_fdbk_streams_p4;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>    ratemon_fdbk_streams_p5;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>    ratemon_fdbk_streams_p6;
    tapa::streams<RATEMON_FEEDBACK_DTYPE, NUM_ARBITER_ATOMS>    ratemon_fdbk_streams_p7;
    #if BV_NUM_PARTITIONS != 8
    crash!
    #endif


    tapa::task()
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,0
                ,kp_idx
                ,in_arb_streams[NUM_STM*0 + 0]
                ,in_arb_streams[NUM_STM*0 + 1]
                ,in_arb_streams[NUM_STM*0 + 2]
                ,in_arb_streams[NUM_STM*0 + 3]
                ,in_arb_streams[NUM_STM*0 + 4]
                ,ratemon_fdbk_streams_p0
                ,arbtree_outputs[0]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,1
                ,kp_idx
                ,in_arb_streams[NUM_STM*1 + 0]
                ,in_arb_streams[NUM_STM*1 + 1]
                ,in_arb_streams[NUM_STM*1 + 2]
                ,in_arb_streams[NUM_STM*1 + 3]
                ,in_arb_streams[NUM_STM*1 + 4]
                ,ratemon_fdbk_streams_p1
                ,arbtree_outputs[1]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,2
                ,kp_idx
                ,in_arb_streams[NUM_STM*2 + 0]
                ,in_arb_streams[NUM_STM*2 + 1]
                ,in_arb_streams[NUM_STM*2 + 2]
                ,in_arb_streams[NUM_STM*2 + 3]
                ,in_arb_streams[NUM_STM*2 + 4]
                ,ratemon_fdbk_streams_p2
                ,arbtree_outputs[2]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,3
                ,kp_idx
                ,in_arb_streams[NUM_STM*3 + 0]
                ,in_arb_streams[NUM_STM*3 + 1]
                ,in_arb_streams[NUM_STM*3 + 2]
                ,in_arb_streams[NUM_STM*3 + 3]
                ,in_arb_streams[NUM_STM*3 + 4]
                ,ratemon_fdbk_streams_p3
                ,arbtree_outputs[3]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,4
                ,kp_idx
                ,in_arb_streams[NUM_STM*4 + 0]
                ,in_arb_streams[NUM_STM*4 + 1]
                ,in_arb_streams[NUM_STM*4 + 2]
                ,in_arb_streams[NUM_STM*4 + 3]
                ,in_arb_streams[NUM_STM*4 + 4]
                ,ratemon_fdbk_streams_p4
                ,arbtree_outputs[4]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,5
                ,kp_idx
                ,in_arb_streams[NUM_STM*5 + 0]
                ,in_arb_streams[NUM_STM*5 + 1]
                ,in_arb_streams[NUM_STM*5 + 2]
                ,in_arb_streams[NUM_STM*5 + 3]
                ,in_arb_streams[NUM_STM*5 + 4]
                ,ratemon_fdbk_streams_p5
                ,arbtree_outputs[5]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,6
                ,kp_idx
                ,in_arb_streams[NUM_STM*6 + 0]
                ,in_arb_streams[NUM_STM*6 + 1]
                ,in_arb_streams[NUM_STM*6 + 2]
                ,in_arb_streams[NUM_STM*6 + 3]
                ,in_arb_streams[NUM_STM*6 + 4]
                ,ratemon_fdbk_streams_p6
                ,arbtree_outputs[6]
        )
        .invoke<tapa::detach>(
                bloom_arbiter_tree_singlepartition
                ,arb_idx
                ,7
                ,kp_idx
                ,in_arb_streams[NUM_STM*7 + 0]
                ,in_arb_streams[NUM_STM*7 + 1]
                ,in_arb_streams[NUM_STM*7 + 2]
                ,in_arb_streams[NUM_STM*7 + 3]
                ,in_arb_streams[NUM_STM*7 + 4]
                ,ratemon_fdbk_streams_p7
                ,arbtree_outputs[7]
        )
    #if BV_NUM_PARTITIONS != 8
    crash!
    #endif
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



#define ARBITER_STREAM_DECLS_KP(KP_IDX)    \
    tapa::streams<PACKED_HASH_DTYPE, NUM_STM*BV_NUM_PARTITIONS> arb0_streams_kp##KP_IDX;   \
    tapa::streams<PACKED_HASH_DTYPE, NUM_STM*BV_NUM_PARTITIONS> arb1_streams_kp##KP_IDX;   \
    tapa::streams<PACKED_HASH_DTYPE, NUM_STM*BV_NUM_PARTITIONS> arb2_streams_kp##KP_IDX;   \
    tapa::streams<PACKED_HASH_DTYPE, NUM_STM*BV_NUM_PARTITIONS> arb3_streams_kp##KP_IDX;   \
    tapa::streams<PACKED_HASH_DTYPE, NUM_STM*BV_NUM_PARTITIONS> arb4_streams_kp##KP_IDX;   \

#if NUM_HASH != (5)
crash!,
#endif


#define ARBITER_INVOKES_FOR_KP(KP_IDX)  \
        .invoke( bloom_arb_forwarder,   \
                    0,  \
                    KP_IDX, \
                    hash_stream_h0_kp##KP_IDX,  \
                    arb0_streams_kp##KP_IDX    \
        )   \
        .invoke( bloom_arb_forwarder,   \
                    1,  \
                    KP_IDX, \
                    hash_stream_h1_kp##KP_IDX,  \
                    arb1_streams_kp##KP_IDX    \
        )   \
        .invoke( bloom_arb_forwarder,   \
                    2,  \
                    KP_IDX, \
                    hash_stream_h2_kp##KP_IDX,  \
                    arb2_streams_kp##KP_IDX    \
        )   \
        .invoke( bloom_arb_forwarder,   \
                    3,  \
                    KP_IDX, \
                    hash_stream_h3_kp##KP_IDX,  \
                    arb3_streams_kp##KP_IDX    \
        )   \
        .invoke( bloom_arb_forwarder,   \
                    4,  \
                    KP_IDX, \
                    hash_stream_h4_kp##KP_IDX,  \
                    arb4_streams_kp##KP_IDX    \
        )   \
\
        .invoke( bloom_single_arbiter,  \
                    0,  \
                    KP_IDX, \
                    arb0_streams_kp##KP_IDX,   \
                    bv_lookup_stream_h0_kp##KP_IDX  \
        )   \
        .invoke( bloom_single_arbiter,  \
                    1,  \
                    KP_IDX, \
                    arb1_streams_kp##KP_IDX,   \
                    bv_lookup_stream_h1_kp##KP_IDX  \
        )   \
        .invoke( bloom_single_arbiter,  \
                    2,  \
                    KP_IDX, \
                    arb2_streams_kp##KP_IDX,   \
                    bv_lookup_stream_h2_kp##KP_IDX  \
        )   \
        .invoke( bloom_single_arbiter,  \
                    3,  \
                    KP_IDX, \
                    arb3_streams_kp##KP_IDX,   \
                    bv_lookup_stream_h3_kp##KP_IDX  \
        )   \
        .invoke( bloom_single_arbiter,  \
                    4,  \
                    KP_IDX, \
                    arb4_streams_kp##KP_IDX,   \
                    bv_lookup_stream_h4_kp##KP_IDX  \
        )   \


#if NUM_HASH != (5)
crash!,
#endif




//////////////////////////////////////////////////
//////////////////////////////////////////////////
///////// END OF Arbiter                    //////
//////////////////////////////////////////////////
//////////////////////////////////////////////////




void queryResult_per_hash(
        int hash_idx
        ,tapa::istream<BV_PACKED_DTYPE>                                 & bv_load_stream
        ,tapa::istreams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS>           & bv_lookup_stream_kp0
        ,tapa::istreams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS>           & bv_lookup_stream_kp1
        ,tapa::ostreams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS>   & query_bv_packed_stream_kp0
        ,tapa::ostreams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS>   & query_bv_packed_stream_kp1
) {
    const int MAX_NUM_WRITES = NUM_STM*KEYS_PER_STM;
    int num_writes = 0;
    int num_reads = 0;

    BV_PACKED_DTYPE     bv_buf_BRAMS[BV_NUM_BRAM_PARTITIONS][BV_PARTITION_LENGTH_IN_PACKED_ELEMS];
    #pragma HLS BIND_STORAGE variable=bv_buf_BRAMS type=RAM_T2P impl=bram
    #pragma HLS ARRAY_PARTITION variable=bv_buf_BRAMS dim=1 complete

    BV_PACKED_DTYPE     bv_buf_URAMS[BV_NUM_URAM_PARTITIONS][BV_PARTITION_LENGTH_IN_PACKED_ELEMS];
    #pragma HLS BIND_STORAGE variable=bv_buf_URAMS type=RAM_T2P impl=uram
    #pragma HLS ARRAY_PARTITION variable=bv_buf_URAMS dim=1 complete
    #ifndef __SYNTHESIS__
    printf("WARNING WARNING WARNING\n");
    printf("queryBV is not properly datapacking the URAMs.\n");
    #endif

    BV_PACKED_DTYPE cur_bv_val;

    typedef struct {
        ap_uint<1>      valid;
        BV_PLUS_METADATA_PACKED_DTYPE data;
    } TO_WRITE_DTYPE;

    TO_WRITE_DTYPE bram_queried_vals_buf[BV_NUM_BRAM_PARTITIONS][2];
    #pragma HLS ARRAY_PARTITION variable=bram_queried_vals_buf dim=0 complete

    TO_WRITE_DTYPE uram_queried_vals_buf[BV_NUM_URAM_PARTITIONS][2];
    #pragma HLS ARRAY_PARTITION variable=uram_queried_vals_buf dim=0 complete

    #ifndef __SYNTHESIS__
    printf("INFO: We are using the SPLIT QUERY unit!\n");
    #endif

    INIT_BRAM_QUERIED_VALS_BUF:
    for (int j = 0; j < BV_NUM_BRAM_PARTITIONS; ++j) {
    #pragma HLS UNROLL
        bram_queried_vals_buf[j][0].valid=0;
        bram_queried_vals_buf[j][1].valid=0;
    }

    INIT_URAM_QUERIED_VALS_BUF:
    for (int j = 0; j < BV_NUM_URAM_PARTITIONS; ++j) {
    #pragma HLS UNROLL
        uram_queried_vals_buf[j][0].valid=0;
        uram_queried_vals_buf[j][1].valid=0;
    }

    LOAD_BV_VALUES:
    for (int i = 0; i < BV_SECTION_LENGTH_IN_PACKED_ELEMS; ++i) {
        #pragma HLS PIPELINE II=1
        cur_bv_val = bv_load_stream.read();

        int partition_idx = i/BV_PARTITION_LENGTH_IN_PACKED_ELEMS;
        int element_idx = i%BV_PARTITION_LENGTH_IN_PACKED_ELEMS;

        if (partition_idx < BV_NUM_BRAM_PARTITIONS) {
            bv_buf_BRAMS[partition_idx][element_idx] = cur_bv_val;

            #ifdef __DO_DEBUG_PRINTS__
            printf("QUERY UNIT %d - %d, %d\n",
                    hash_idx, partition_idx, element_idx);
            for (int j = 0; j < BV_PACKED_BITWIDTH; ++j) {
                BIT_DTYPE tmp;
                tmp.range(0,0) = bv_buf_BRAMS[partition_idx][element_idx].range(j,j);
                printf("QUERY UNIT %d - bv[%d] = %d\n",
                        hash_idx,
                        i*BV_PACKED_BITWIDTH+j,
                        tmp.to_int()
                );
            }
            #endif

        }
        else {
            bv_buf_URAMS[partition_idx-BV_NUM_BRAM_PARTITIONS][element_idx] = cur_bv_val;

            #ifdef __DO_DEBUG_PRINTS__
            printf("QUERY UNIT %d - %d, %d\n",
                    hash_idx, partition_idx, element_idx);
            for (int j = 0; j < BV_PACKED_BITWIDTH; ++j) {
                BIT_DTYPE tmp;
                tmp.range(0,0) = bv_buf_URAMS[partition_idx][element_idx].range(j,j);
                printf("QUERY UNIT %d - bv[%d] = %d\n",
                        hash_idx,
                        i*BV_PACKED_BITWIDTH+j,
                        tmp.to_int()
                );
            }
            #endif

        }
    }


    PROCESS_QUERIES:
    while (num_writes < MAX_NUM_WRITES){
    #pragma HLS PIPELINE II=1

        BV_BRAM_PARTITION_LOOP:
        for (int bram_partition_idx = 0; bram_partition_idx < BV_NUM_BRAM_PARTITIONS; ++bram_partition_idx) {
        #pragma HLS UNROLL

            //////////////////////////////////////////////////////////
            // READ LOGIC

            // READ PORT 0
            if (!bv_lookup_stream_kp0[bram_partition_idx].empty() &&
                !bram_queried_vals_buf[bram_partition_idx][0].valid)
            {
                PACKED_HASH_DTYPE   packed_hash;
                METADATA_DTYPE      cur_metadata;
                HASHONLY_DTYPE      bv_lookup_idx;
                BIT_DTYPE           cur_bv_val;
                BV_PLUS_METADATA_PACKED_DTYPE     data_to_write;

                HASHONLY_DTYPE      bv_outer_idx;
                HASHONLY_DTYPE      bv_inner_idx;

                packed_hash = bv_lookup_stream_kp0[bram_partition_idx].read();

                // Unpack the values
                cur_metadata = packed_hash.md;
                bv_lookup_idx = packed_hash.hash;

                // Read the bitvector
                bv_outer_idx = bv_lookup_idx/BV_PACKED_BITWIDTH;
                bv_inner_idx = bv_lookup_idx%BV_PACKED_BITWIDTH;
                cur_bv_val.range(0, 0) =
                    bv_buf_BRAMS[bram_partition_idx][bv_outer_idx].range(bv_inner_idx, bv_inner_idx);

                #ifdef __DO_DEBUG_PRINTS__
                printf("QUERY UNIT %d kp%d - h/p/s=(%d,%d,%d). input idx %d: This gave a bit value of %d.\n",
                        hash_idx,
                        0,
                        hash_idx,
                        bram_partition_idx,
                        cur_metadata.sidx.to_int(),
                        cur_metadata.iidx.to_int(),
                        cur_bv_val.to_int()
                );
                #endif

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
                PACKED_HASH_DTYPE   packed_hash;
                METADATA_DTYPE      cur_metadata;
                HASHONLY_DTYPE      bv_lookup_idx;
                BIT_DTYPE           cur_bv_val;
                BV_PLUS_METADATA_PACKED_DTYPE     data_to_write;

                HASHONLY_DTYPE      bv_outer_idx;
                HASHONLY_DTYPE      bv_inner_idx;

                packed_hash = bv_lookup_stream_kp1[bram_partition_idx].read();

                // Unpack the values
                cur_metadata = packed_hash.md;
                bv_lookup_idx = packed_hash.hash;

                // Read the bitvector
                bv_outer_idx = bv_lookup_idx/BV_PACKED_BITWIDTH;
                bv_inner_idx = bv_lookup_idx%BV_PACKED_BITWIDTH;
                cur_bv_val.range(0, 0) =
                    bv_buf_BRAMS[bram_partition_idx][bv_outer_idx].range(bv_inner_idx, bv_inner_idx);

                #ifdef __DO_DEBUG_PRINTS__
                printf("QUERY UNIT %d kp%d - h/p/s=(%d,%d,%d). input idx %d: This gave a bit value of %d.\n",
                        hash_idx,
                        1,
                        hash_idx,
                        bram_partition_idx,
                        cur_metadata.sidx.to_int(),
                        cur_metadata.iidx.to_int(),
                        cur_bv_val.to_int()
                );
                #endif

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
        for (int uram_partition_idx = 0; uram_partition_idx < BV_NUM_URAM_PARTITIONS; ++uram_partition_idx) {
        #pragma HLS UNROLL

            //////////////////////////////////////////////////////////
            // READ LOGIC

            // READ PORT 0
            if (!bv_lookup_stream_kp0[uram_partition_idx + BV_NUM_BRAM_PARTITIONS].empty() &&
                !uram_queried_vals_buf[uram_partition_idx][0].valid)
            {
                PACKED_HASH_DTYPE   packed_hash;
                METADATA_DTYPE      cur_metadata;
                HASHONLY_DTYPE      bv_lookup_idx;
                BIT_DTYPE           cur_bv_val;
                BV_PLUS_METADATA_PACKED_DTYPE     data_to_write;

                HASHONLY_DTYPE      bv_outer_idx;
                HASHONLY_DTYPE      bv_inner_idx;

                packed_hash = bv_lookup_stream_kp0[uram_partition_idx + BV_NUM_BRAM_PARTITIONS].read();

                // Unpack the values
                cur_metadata = packed_hash.md;
                bv_lookup_idx = packed_hash.hash;

                // Read the bitvector
                bv_outer_idx = bv_lookup_idx/BV_PACKED_BITWIDTH;
                bv_inner_idx = bv_lookup_idx%BV_PACKED_BITWIDTH;
                cur_bv_val.range(0, 0) =
                    bv_buf_URAMS[uram_partition_idx][bv_outer_idx].range(bv_inner_idx, bv_inner_idx);

                #ifdef __DO_DEBUG_PRINTS__
                printf("QUERY UNIT %d kp%d - h/p/s=(%d,%d,%d). input idx %d: This gave a bit value of %d.\n",
                        hash_idx,
                        0,
                        hash_idx,
                        uram_partition_idx + BV_NUM_BRAM_PARTITIONS,
                        cur_metadata.sidx.to_int(),
                        cur_metadata.iidx.to_int(),
                        cur_bv_val.to_int()
                );
                #endif

                // Pack final payload
                data_to_write.md = cur_metadata;
                data_to_write.bv_val = cur_bv_val;

                uram_queried_vals_buf[uram_partition_idx][0].valid = 1;
                uram_queried_vals_buf[uram_partition_idx][0].data = data_to_write;
            }

            // READ PORT 1
            if (!bv_lookup_stream_kp1[uram_partition_idx + BV_NUM_BRAM_PARTITIONS].empty() &&
                !uram_queried_vals_buf[uram_partition_idx][1].valid)
            {
                PACKED_HASH_DTYPE   packed_hash;
                METADATA_DTYPE      cur_metadata;
                HASHONLY_DTYPE      bv_lookup_idx;
                BIT_DTYPE           cur_bv_val;
                BV_PLUS_METADATA_PACKED_DTYPE     data_to_write;

                HASHONLY_DTYPE      bv_outer_idx;
                HASHONLY_DTYPE      bv_inner_idx;

                packed_hash = bv_lookup_stream_kp1[uram_partition_idx + BV_NUM_BRAM_PARTITIONS].read();

                // Unpack the values
                cur_metadata = packed_hash.md;
                bv_lookup_idx = packed_hash.hash;

                // Read the bitvector
                bv_outer_idx = bv_lookup_idx/BV_PACKED_BITWIDTH;
                bv_inner_idx = bv_lookup_idx%BV_PACKED_BITWIDTH;
                cur_bv_val.range(0, 0) =
                    bv_buf_URAMS[uram_partition_idx][bv_outer_idx].range(bv_inner_idx, bv_inner_idx);

                #ifdef __DO_DEBUG_PRINTS__
                printf("QUERY UNIT %d kp%d - h/p/s=(%d,%d,%d). input idx %d: This gave a bit value of %d.\n",
                        hash_idx,
                        1,
                        hash_idx,
                        uram_partition_idx + BV_NUM_BRAM_PARTITIONS,
                        cur_metadata.sidx.to_int(),
                        cur_metadata.iidx.to_int(),
                        cur_bv_val.to_int()
                );
                #endif

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
                query_bv_packed_stream_kp0[uram_partition_idx + BV_NUM_BRAM_PARTITIONS].try_write(
                    uram_queried_vals_buf[uram_partition_idx][0].data
                )
            ) {
                ++num_writes;
                uram_queried_vals_buf[uram_partition_idx][0].valid = 0;
            }

            // WRITE PORT 1
            if (uram_queried_vals_buf[uram_partition_idx][1].valid &&
                query_bv_packed_stream_kp1[uram_partition_idx + BV_NUM_BRAM_PARTITIONS].try_write(
                    uram_queried_vals_buf[uram_partition_idx][1].data
                )
            ) {
                ++num_writes;
                uram_queried_vals_buf[uram_partition_idx][1].valid = 0;
            }
        }

    }

    #ifdef __DO_DEBUG_PRINTS__
    printf("\n\nQUERY UNIT %d - DONE NOW.\n\n",
            hash_idx
    );
    #endif

    return;


}



#define QUERY_INVOKES   \
        .invoke(\
                queryResult_per_hash\
                , 0\
                , bv_load_stream_0\
                , bv_lookup_stream_h0_kp0\
                , bv_lookup_stream_h0_kp1\
                , query_bv_packed_stream_hash0_kp0\
                , query_bv_packed_stream_hash0_kp1\
        )\
        .invoke(\
                queryResult_per_hash\
                , 1\
                , bv_load_stream_1\
                , bv_lookup_stream_h1_kp0\
                , bv_lookup_stream_h1_kp1\
                , query_bv_packed_stream_hash1_kp0\
                , query_bv_packed_stream_hash1_kp1\
        )\
        .invoke(\
                queryResult_per_hash\
                , 2\
                , bv_load_stream_2\
                , bv_lookup_stream_h2_kp0\
                , bv_lookup_stream_h2_kp1\
                , query_bv_packed_stream_hash2_kp0\
                , query_bv_packed_stream_hash2_kp1\
        )\
        .invoke(\
                queryResult_per_hash\
                , 3\
                , bv_load_stream_3\
                , bv_lookup_stream_h3_kp0\
                , bv_lookup_stream_h3_kp1\
                , query_bv_packed_stream_hash3_kp0\
                , query_bv_packed_stream_hash3_kp1\
        )\
        .invoke(\
                queryResult_per_hash\
                , 4\
                , bv_load_stream_4\
                , bv_lookup_stream_h4_kp0\
                , bv_lookup_stream_h4_kp1\
                , query_bv_packed_stream_hash4_kp0\
                , query_bv_packed_stream_hash4_kp1\
        )\


/*************************************************************************************/


void shuffle_TtoS_per_hash(
        int shuffle_idx
        ,int kp_idx

        ,tapa::istreams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS> & query_bv_packed_stream
        ,tapa::ostreams<BV_PLUS_IIDX_PACKED_DTYPE, NUM_STM*BV_NUM_PARTITIONS> & inter_shuffle_stream

        #if ENABLE_PERF_CTRS
        ,tapa::ostream<PERFCTR_DTYPE>   &perfctr_out
        #endif
){
    #ifndef __SYNTHESIS__
    printf("INFO: Using bifurcated shuffle.\n");
    #endif

    typedef struct {
        BIT_DTYPE       BV;
        INPUT_IDX_DTYPE     input_idx;
        bool                valid;
    } PEEKED_DTYPE;

    //int next_output_idx[NUM_STM];
    //#pragma HLS ARRAY_PARTITION variable=next_output_idx dim=0 complete

    // This is a buffer for data from each partition.
    // We also introduce a NUM_STM dimension, otherwise we hang.
    PEEKED_DTYPE shuffle_peek_emulator[BV_NUM_PARTITIONS][NUM_STM];
    #pragma HLS ARRAY_PARTITION variable=shuffle_peek_emulator dim=0 complete

    #if ENABLE_PERF_CTRS
    BIT_DTYPE       did_read;
    BIT_DTYPE       did_write;

    PERFCTR_DTYPE   stall_cycles = 0;
    PERFCTR_DTYPE   readonly_cycles = 0;
    PERFCTR_DTYPE   writeonly_cycles = 0;
    PERFCTR_DTYPE   readwrite_cycles = 0;
    PERFCTR_DTYPE   total_cycles = 0;
    #endif


    //NEXT_OUTPUT_IDX_INIT:
    //for (int i = 0; i < NUM_STM; ++i) {
    //#pragma HLS UNROLL
    //    next_output_idx[i] = 1;
    //}

    PEEK_EMULATOR_INITIALIZATION:
    for (int j=0; j<BV_NUM_PARTITIONS; ++j){
    #pragma HLS UNROLL
        for (int k=0; k<NUM_STM; ++k) {
        #pragma HLS UNROLL
            shuffle_peek_emulator[j][k].BV = 0;
            shuffle_peek_emulator[j][k].input_idx = 0;
            shuffle_peek_emulator[j][k].valid = 0;
        }
    }


    while(1)
    {
    #pragma HLS PIPELINE II=1

        #if ENABLE_PERF_CTRS
        did_read = 0;
        did_write = 0;
        #endif

        ////////////////////////////////////////////
        // READ LOGIC. Read from each partition stream
        ////////////////////////////////////////////
        RD_BV_PARTITION_LOOP:
        for (int partition_idx = 0;
                partition_idx < BV_NUM_PARTITIONS;
                ++partition_idx)
        {
        #pragma HLS UNROLL

            // DATAPACKED TRANSFER:
            INPUT_IDX_DTYPE     cur_input_idx;
            STRM_IDX_DTYPE      cur_strm_idx;
            BIT_DTYPE           cur_bv_val;
            METADATA_DTYPE      cur_metadata;
            BV_PLUS_METADATA_PACKED_DTYPE     cur_packed_data;
            bool                peek_success;

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

                    #ifdef __DO_DEBUG_PRINTS__
                    printf("SHUFFLE TtoS #%d kp%d - (Strm #%d): Read from (hash, partition, stream) [%d][%d][%d], input_idx=%d\n",
                        shuffle_idx,
                        kp_idx,
                        cur_strm_idx.to_int(),
                        shuffle_idx,
                        partition_idx,
                        cur_strm_idx.to_int(),
                        cur_input_idx.to_int()
                    );
                    #endif

                    #if ENABLE_PERF_CTRS
                    did_read = 1;
                    #endif
                }
                #ifdef __DO_DEBUG_PRINTS__
                else if (!peek_success)
                {
                    // do nothing
                } else {
                    printf("SHUFFLE TtoS #%d kp%d - peeked value is valid for hash %d, partition %d, strm %d\n",
                            shuffle_idx,
                            kp_idx,
                            shuffle_idx,
                            partition_idx,
                            cur_strm_idx.to_int()
                    );
                }
                #endif
        }

        ////////////////////////////////////////////
        // WRITE OUTPUTS from the shuffle-buffer
        ////////////////////////////////////////////
        WR_STM_LOOP:
        for (int strm_idx = 0; strm_idx < NUM_STM; ++strm_idx)
        {
            WR_BV_PARTITION_LOOP:
            for (int partition_idx = 0;
                    partition_idx < BV_NUM_PARTITIONS;
                    ++partition_idx)
            {
            #pragma HLS UNROLL
                BV_PLUS_IIDX_PACKED_DTYPE   outval;
                outval.bv_val = shuffle_peek_emulator[partition_idx][strm_idx].BV;
                outval.iidx = shuffle_peek_emulator[partition_idx][strm_idx].input_idx;

                if (shuffle_peek_emulator[partition_idx][strm_idx].valid == 1 &&
                    inter_shuffle_stream[strm_idx*BV_NUM_PARTITIONS + partition_idx].try_write(outval)
                ) {
                    shuffle_peek_emulator[partition_idx][strm_idx].valid = 0;

                    #ifdef __DO_DEBUG_PRINTS__
                    INPUT_IDX_DTYPE     cur_input_idx;
                    cur_input_idx = shuffle_peek_emulator[partition_idx][strm_idx].input_idx;
                    printf("SHUFFLE TtoS #%d kp%d - (Strm #%d): Outputting BV_val=%d to partition=%d. From hash=%d, input_idx=%d\n",
                            shuffle_idx,
                            kp_idx,
                            strm_idx,
                            outval.bv_val.to_int(),
                            partition_idx,
                            shuffle_idx,
                            cur_input_idx.to_int()
                    );
                    #endif
                }
            }
        }

        #if ENABLE_PERF_CTRS
        UPDATE_PERF_CTRS:
        total_cycles++;

        if (did_write && !did_read){
            writeonly_cycles++;
        }
        else if (did_read && !did_write){
            readonly_cycles++;
        }
        else if (!did_read && !did_write){
            stall_cycles++;
        }
        else if (did_read && did_write){
            readwrite_cycles++;
        }
        #endif
    }

    #if ENABLE_PERF_CTRS
    WRITE_PERF_CTRS:
    for (int i = 0; i < NUM_PERFCTR_OUTPUTS; ++i) {
    #pragma HLS PIPELINE II=1
        if (i == 0){
            perfctr_out.write(stall_cycles);
        }
        else if (i == 1){
            perfctr_out.write(readonly_cycles);
        }
        else if (i == 2){
            perfctr_out.write(writeonly_cycles);
        }
        else if (i == 3){
            perfctr_out.write(readwrite_cycles);
        }
        else if (i == 4){
            perfctr_out.write(total_cycles);
        }
        else{
            perfctr_out.write(55555);
        }
    }


    #ifdef __DO_DEBUG_PRINTS__
    printf("SHUFFLE TtoS #%d kp%d -  stall_cycles         = %25lu\n",
        shuffle_idx, kp_idx, stall_cycles
    );
    printf("SHUFFLE TtoS #%d kp%d -  readonly_cycles      = %25lu\n",
        shuffle_idx, kp_idx, readonly_cycles
    );
    printf("SHUFFLE TtoS #%d kp%d -  writeonly_cycles     = %25lu\n",
        shuffle_idx, kp_idx, writeonly_cycles
    );
    printf("SHUFFLE TtoS #%d kp%d -  readwrite_cycles     = %25lu\n",
        shuffle_idx, kp_idx, readwrite_cycles
    );
    printf("SHUFFLE TtoS #%d kp%d -  total_cycles         = %25lu\n",
        shuffle_idx, kp_idx, total_cycles
    );
    #endif

    #endif  // ENABLE_PERF_CTRS



    #ifdef __DO_DEBUG_PRINTS__
    printf("\n\nSHUFFLE TtoS #%d kp%d - DONE NOW.\n\n",
            shuffle_idx, kp_idx
    );
    #endif

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

        #if BV_NUM_PARTITIONS != 8
        crash!,,,
        #endif

        ,tapa::ostream<BIT_DTYPE> & reconstruct_stream
)
{
    typedef struct {
        BIT_DTYPE           bv;
        INPUT_IDX_DTYPE     iidx;
        bool                valid;
    } PEEKED_DTYPE;

    int next_output_idx = 1;

    PEEKED_DTYPE                shufbuf[BV_NUM_PARTITIONS][SHUFFLEBUF_SZ];
    #pragma HLS ARRAY_PARTITION variable=shufbuf dim=0 complete

    #ifdef __DO_DEBUG_PRINTS__
    printf("HELLO from shuffle-ordering, hash %d, stm %d, kp %d!\n",
            shuffle_idx, stm_idx, kp_idx);
    #endif

    PEEK_EMULATOR_INIT:
    for (int p = 0; p < BV_NUM_PARTITIONS; ++p) {
        for (int i = 0; i < SHUFFLEBUF_SZ; ++i) {
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

        #define READ_PARTITION(PART)    \
            bool                        peek_success_p##PART;   \
            int                         rd_buf_idx_p##PART; \
            BV_PLUS_IIDX_PACKED_DTYPE   read_val_p##PART;   \
            \
            peek_success_p##PART = inter_shuffle_stream_p##PART.try_peek(read_val_p##PART);   \
            rd_buf_idx_p##PART = read_val_p##PART.iidx % SHUFFLEBUF_SZ; \
            if (peek_success_p##PART && \
                shufbuf[PART][rd_buf_idx_p##PART].valid == 0  \
            ) { \
                inter_shuffle_stream_p##PART.read();  \
            \
                shufbuf[PART][rd_buf_idx_p##PART].bv = read_val_p##PART.bv_val;   \
                shufbuf[PART][rd_buf_idx_p##PART].iidx = read_val_p##PART.iidx;   \
                shufbuf[PART][rd_buf_idx_p##PART].valid = 1;  \
            }   \

                //#ifdef __DO_DEBUG_PRINTS__
                //printf("SHUFFLE ORDERING stm%d kp%d hash%d - read BV %d from partition %d, iidx %d, into buf_idx %d\n",
                //        stm_idx, kp_idx, shuffle_idx,
                //        read_val.bv_val.to_int(),
                //        partition_idx,
                //        read_val.iidx.to_int(),
                //        rd_buf_idx
                //);
                //#endif

        READ_PARTITION(0)
        READ_PARTITION(1)
        READ_PARTITION(2)
        READ_PARTITION(3)
        READ_PARTITION(4)
        READ_PARTITION(5)
        READ_PARTITION(6)
        READ_PARTITION(7)

        #if BV_NUM_PARTITIONS != 8
        crash();
        #endif



        /////////////////////////////
        // WRITE LOGIC
        /////////////////////////////
        bool    write_ready = 0;
        int     wr_buf_idx = next_output_idx % SHUFFLEBUF_SZ;
        int     ready_partition_idx = 0;

        for (int partition_idx = 0; partition_idx < BV_NUM_PARTITIONS; ++partition_idx)
        {
            if (shufbuf[partition_idx][wr_buf_idx].valid    == 1 &&
                shufbuf[partition_idx][wr_buf_idx].iidx     == next_output_idx
            )
            {
                write_ready = 1;
                ready_partition_idx = partition_idx;
                break;
            }
        }

        if (write_ready){
            BIT_DTYPE write_success;
            BIT_DTYPE v = shufbuf[ready_partition_idx][wr_buf_idx].bv;

            write_success = reconstruct_stream.try_write(v);

            if (write_success) {
                shufbuf[ready_partition_idx][wr_buf_idx].valid = 0;

                if (next_output_idx == KEYPAIRS_PER_STM) {
                    next_output_idx = 1;
                }
                else {
                    next_output_idx++;
                }

                #ifdef __DO_DEBUG_PRINTS__
                printf("SHUFFLE ORDERING stm%d kp%d hash%d - write BV %d from buf_idx %d\n",
                        stm_idx, kp_idx, shuffle_idx,
                        v.to_int(),
                        wr_buf_idx
                );
                #endif
            }
        }
    }
}
#define SHUFFLE_STREAM_DECLS_KP(KP_IDX)    \
    tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, NUM_STM*BV_NUM_PARTITIONS> inter_shuf0_stm_kp##KP_IDX;   \
    tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, NUM_STM*BV_NUM_PARTITIONS> inter_shuf1_stm_kp##KP_IDX;   \
    tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, NUM_STM*BV_NUM_PARTITIONS> inter_shuf2_stm_kp##KP_IDX;   \
    tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, NUM_STM*BV_NUM_PARTITIONS> inter_shuf3_stm_kp##KP_IDX;   \
    tapa::streams<BV_PLUS_IIDX_PACKED_DTYPE, NUM_STM*BV_NUM_PARTITIONS> inter_shuf4_stm_kp##KP_IDX;   \

#if NUM_HASH != 5
crash!,
#endif


#define SHUFFLE_REORDER_INVOKES_FOR_SHUF_KP(SHUF_IDX, KP_IDX)      \
        .invoke<tapa::detach>(  \
            shuffle_reordering_per_hash \
            ,SHUF_IDX   \
            ,0  \
            ,KP_IDX \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[0+BV_NUM_PARTITIONS*0]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[1+BV_NUM_PARTITIONS*0]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[2+BV_NUM_PARTITIONS*0]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[3+BV_NUM_PARTITIONS*0]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[4+BV_NUM_PARTITIONS*0]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[5+BV_NUM_PARTITIONS*0]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[6+BV_NUM_PARTITIONS*0]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[7+BV_NUM_PARTITIONS*0]    \
            ,reconstruct_stream_stm0_kp##KP_IDX[SHUF_IDX] \
        )   \
        .invoke<tapa::detach>(  \
            shuffle_reordering_per_hash \
            ,SHUF_IDX   \
            ,1  \
            ,KP_IDX \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[0+BV_NUM_PARTITIONS*1]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[1+BV_NUM_PARTITIONS*1]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[2+BV_NUM_PARTITIONS*1]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[3+BV_NUM_PARTITIONS*1]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[4+BV_NUM_PARTITIONS*1]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[5+BV_NUM_PARTITIONS*1]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[6+BV_NUM_PARTITIONS*1]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[7+BV_NUM_PARTITIONS*1]    \
            ,reconstruct_stream_stm1_kp##KP_IDX[SHUF_IDX] \
        )   \
        .invoke<tapa::detach>(  \
            shuffle_reordering_per_hash \
            ,SHUF_IDX   \
            ,2  \
            ,KP_IDX \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[0+BV_NUM_PARTITIONS*2]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[1+BV_NUM_PARTITIONS*2]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[2+BV_NUM_PARTITIONS*2]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[3+BV_NUM_PARTITIONS*2]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[4+BV_NUM_PARTITIONS*2]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[5+BV_NUM_PARTITIONS*2]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[6+BV_NUM_PARTITIONS*2]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[7+BV_NUM_PARTITIONS*2]    \
            ,reconstruct_stream_stm2_kp##KP_IDX[SHUF_IDX] \
        )   \
        .invoke<tapa::detach>(  \
            shuffle_reordering_per_hash \
            ,SHUF_IDX   \
            ,3  \
            ,KP_IDX \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[0+BV_NUM_PARTITIONS*3]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[1+BV_NUM_PARTITIONS*3]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[2+BV_NUM_PARTITIONS*3]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[3+BV_NUM_PARTITIONS*3]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[4+BV_NUM_PARTITIONS*3]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[5+BV_NUM_PARTITIONS*3]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[6+BV_NUM_PARTITIONS*3]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[7+BV_NUM_PARTITIONS*3]    \
            ,reconstruct_stream_stm3_kp##KP_IDX[SHUF_IDX] \
        )   \
        .invoke<tapa::detach>(  \
            shuffle_reordering_per_hash \
            ,SHUF_IDX   \
            ,4  \
            ,KP_IDX \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[0+BV_NUM_PARTITIONS*4]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[1+BV_NUM_PARTITIONS*4]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[2+BV_NUM_PARTITIONS*4]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[3+BV_NUM_PARTITIONS*4]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[4+BV_NUM_PARTITIONS*4]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[5+BV_NUM_PARTITIONS*4]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[6+BV_NUM_PARTITIONS*4]    \
            ,inter_shuf##SHUF_IDX##_stm_kp##KP_IDX[7+BV_NUM_PARTITIONS*4]    \
            ,reconstruct_stream_stm4_kp##KP_IDX[SHUF_IDX] \
        )   \

#if BV_NUM_PARTITIONS != 8
crash!,
#endif
#if NUM_STM != 5
crash!,
#endif


#define SHUFFLE_INVOKES_FOR_KP(KP_IDX)     \
        .invoke<tapa::detach>(    \
            shuffle_TtoS_per_hash    \
            , 0 \
            , KP_IDX    \
            , query_bv_packed_stream_hash0_kp##KP_IDX  \
            , inter_shuf0_stm_kp##KP_IDX \
            \
        )   \
        .invoke<tapa::detach>(    \
            shuffle_TtoS_per_hash    \
            , 1 \
            , KP_IDX    \
            , query_bv_packed_stream_hash1_kp##KP_IDX  \
            , inter_shuf1_stm_kp##KP_IDX \
            \
        )   \
        .invoke<tapa::detach>(    \
            shuffle_TtoS_per_hash    \
            , 2 \
            , KP_IDX    \
            , query_bv_packed_stream_hash2_kp##KP_IDX  \
            , inter_shuf2_stm_kp##KP_IDX \
            \
        )   \
        .invoke<tapa::detach>(    \
            shuffle_TtoS_per_hash    \
            , 3 \
            , KP_IDX    \
            , query_bv_packed_stream_hash3_kp##KP_IDX  \
            , inter_shuf3_stm_kp##KP_IDX \
            \
        )   \
        .invoke<tapa::detach>(    \
            shuffle_TtoS_per_hash    \
            , 4 \
            , KP_IDX    \
            , query_bv_packed_stream_hash4_kp##KP_IDX  \
            , inter_shuf4_stm_kp##KP_IDX \
            \
        )   \
        SHUFFLE_REORDER_INVOKES_FOR_SHUF_KP(0, KP_IDX)  \
        SHUFFLE_REORDER_INVOKES_FOR_SHUF_KP(1, KP_IDX)  \
        SHUFFLE_REORDER_INVOKES_FOR_SHUF_KP(2, KP_IDX)  \
        SHUFFLE_REORDER_INVOKES_FOR_SHUF_KP(3, KP_IDX)  \
        SHUFFLE_REORDER_INVOKES_FOR_SHUF_KP(4, KP_IDX)  \

#if NUM_HASH != 5
crash!
#endif

void bloom_aggregate_SPLIT(
        int     agg_idx,
        int     kp_idx,
        tapa::istreams<BIT_DTYPE, NUM_HASH>   & reconstruct_stream,
        tapa::ostream<BIT_DTYPE>   & aggregate_stream
){
    #ifndef __SYNTHESIS__
    //printf("NOTE: Using SPLIT AGGREGATE!!\n");
    #endif

    int num_writes_TOTAL = 0;
    int num_reads = 0;
    int all_hashes_available = 0;
    uint32_t result = 1;

    while (num_writes_TOTAL < KEYPAIRS_PER_STM)
    {
    #pragma HLS PIPELINE=1
        // Check if all of our hash values are available:
        all_hashes_available = 1;

        for (int i = 0; i < NUM_HASH; ++i) {
            if (reconstruct_stream[i].empty()) {
                all_hashes_available = 0;
            }
        }

        if (all_hashes_available)
        {
            result = 1;
            for (int i = 0; i < NUM_HASH; ++i) {
                result &= reconstruct_stream[i].read();
            }

            num_reads++;
            #ifdef __DO_DEBUG_PRINTS__
            printf("AGGREGATE #%d kp%d - input query %d got a value of %d\n",
                    agg_idx, kp_idx, num_reads, result
            );
            #endif

            aggregate_stream.write(result);
            num_writes_TOTAL++;
        }
    }

    #ifdef __DO_DEBUG_PRINTS__
    printf("\n\nAGGREGATE #%d kp%d - DONE NOW.\n\n",
            agg_idx, kp_idx
    );
    #endif
    return;
}



#define AGGREGATE_INVOKES_FOR_KP(KP_IDX)    \
        .invoke(bloom_aggregate_SPLIT,  \
                    0,  \
                    KP_IDX, \
                    reconstruct_stream_stm0_kp##KP_IDX, \
                    aggregate_stream_kp##KP_IDX[0]  \
        )   \
        .invoke(bloom_aggregate_SPLIT,  \
                    1,  \
                    KP_IDX, \
                    reconstruct_stream_stm1_kp##KP_IDX, \
                    aggregate_stream_kp##KP_IDX[1]  \
        )   \
        .invoke(bloom_aggregate_SPLIT,  \
                    2,  \
                    KP_IDX, \
                    reconstruct_stream_stm2_kp##KP_IDX, \
                    aggregate_stream_kp##KP_IDX[2]  \
        )   \
        .invoke(bloom_aggregate_SPLIT,  \
                    3,  \
                    KP_IDX, \
                    reconstruct_stream_stm3_kp##KP_IDX, \
                    aggregate_stream_kp##KP_IDX[3]  \
        )   \
        .invoke(bloom_aggregate_SPLIT,  \
                    4,  \
                    KP_IDX, \
                    reconstruct_stream_stm4_kp##KP_IDX, \
                    aggregate_stream_kp##KP_IDX[4]  \
        )   \

#if NUM_STM != 5
crash!!!
#endif


/*************************************************************************************/


void packOutput(
        int strm_idx
        ,int kp_idx
        ,tapa::istream<BIT_DTYPE>           & aggregate_stream
        ,tapa::ostream<OUT_PACKED_DTYPE>    & packed_outputs_stream
) {
    int                 pk_idx;
    OUT_PACKED_DTYPE    packed;
    BIT_DTYPE           val;

    #ifdef __DO_DEBUG_PRINTS__
    int num_writes = 0;
    #endif

    for (int i = 0; i < KEYPAIRS_PER_STM; ++i) {
        pk_idx = i % OUT_PACKED_BITWIDTH;

        val = aggregate_stream.read();
        packed.range(pk_idx, pk_idx) = val.range(0, 0);

        if (pk_idx == OUT_PACKED_BITWIDTH - 1){
            packed_outputs_stream.write(packed);
            packed = 0;

            #ifdef __DO_DEBUG_PRINTS__
            num_writes += 1;
            #endif
        }
    }

    #ifdef __DO_DEBUG_PRINTS__
    printf("PACKOUTPUT #%d kp%d - finishing after writing %d times.\n",
            strm_idx, kp_idx, num_writes
    );
    #endif
}



void writeOutput_synchronous(
        tapa::istream<OUT_PACKED_DTYPE>&  packed_outputs_stream_s0_kp0,
        tapa::istream<OUT_PACKED_DTYPE>&  packed_outputs_stream_s0_kp1,
        tapa::istream<OUT_PACKED_DTYPE>&  packed_outputs_stream_s1_kp0,
        tapa::istream<OUT_PACKED_DTYPE>&  packed_outputs_stream_s1_kp1,
        tapa::istream<OUT_PACKED_DTYPE>&  packed_outputs_stream_s2_kp0,
        tapa::istream<OUT_PACKED_DTYPE>&  packed_outputs_stream_s2_kp1,
        tapa::istream<OUT_PACKED_DTYPE>&  packed_outputs_stream_s3_kp0,
        tapa::istream<OUT_PACKED_DTYPE>&  packed_outputs_stream_s3_kp1,
        tapa::istream<OUT_PACKED_DTYPE>&  packed_outputs_stream_s4_kp0,
        tapa::istream<OUT_PACKED_DTYPE>&  packed_outputs_stream_s4_kp1,
        tapa::mmap<STORE_DTYPE>      outmmap
){
    STORE_DTYPE     to_store;

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

    #ifdef __DO_DEBUG_PRINTS__
    printf("WRITEOUTPUT - (synchronous version) exiting now\n",
    );
    #endif
}


/*************************************************************************************/

void workload(
    tapa::mmap<BV_LOAD_DTYPE>       input_bv
    ,tapa::mmap<LOAD_DTYPE>         key_in
    ,tapa::mmap<STORE_DTYPE>        out_bits
    #if NUM_STM != 5
    , crash! //crash on purpose; we may need more streams.
    #endif

    #if ENABLE_PERF_CTRS
    ,tapa::mmap<PERFCTR_DTYPE>       perfctr_mmap
    #endif

     //Add a dummy, useless variable because TAPA fast-cosim doesnt work without it.
    ,int UNUSED_DUMMY
)


{
    //////////////////////////////////////////////////////////
    // Connections BETWEEN modules:
    tapa::streams<KEY_DTYPE, NUM_STM, STM_DEPTH> key_stream_kp0;
    tapa::streams<KEY_DTYPE, NUM_STM, STM_DEPTH> key_stream_kp1;

    // loadBV outputs
    tapa::stream<BV_PACKED_DTYPE, STM_DEPTH> bv_load_stream_0;
    tapa::stream<BV_PACKED_DTYPE, STM_DEPTH> bv_load_stream_1;
    tapa::stream<BV_PACKED_DTYPE, STM_DEPTH> bv_load_stream_2;
    tapa::stream<BV_PACKED_DTYPE, STM_DEPTH> bv_load_stream_3;
    tapa::stream<BV_PACKED_DTYPE, STM_DEPTH> bv_load_stream_4;
    #if NUM_HASH != 5
    crash!
    #endif

    // Computehash outputs (kp stands for key-pair)
    tapa::streams<HASHONLY_DTYPE, NUM_STM, STM_DEPTH> hash_stream_h0_kp0;
    tapa::streams<HASHONLY_DTYPE, NUM_STM, STM_DEPTH> hash_stream_h0_kp1;
    tapa::streams<HASHONLY_DTYPE, NUM_STM, STM_DEPTH> hash_stream_h1_kp0;
    tapa::streams<HASHONLY_DTYPE, NUM_STM, STM_DEPTH> hash_stream_h1_kp1;
    tapa::streams<HASHONLY_DTYPE, NUM_STM, STM_DEPTH> hash_stream_h2_kp0;
    tapa::streams<HASHONLY_DTYPE, NUM_STM, STM_DEPTH> hash_stream_h2_kp1;
    tapa::streams<HASHONLY_DTYPE, NUM_STM, STM_DEPTH> hash_stream_h3_kp0;
    tapa::streams<HASHONLY_DTYPE, NUM_STM, STM_DEPTH> hash_stream_h3_kp1;
    tapa::streams<HASHONLY_DTYPE, NUM_STM, STM_DEPTH> hash_stream_h4_kp0;
    tapa::streams<HASHONLY_DTYPE, NUM_STM, STM_DEPTH> hash_stream_h4_kp1;
    #if NUM_HASH != 5
    crash!
    #endif

    // Arbiter outputs
    tapa::streams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> bv_lookup_stream_h0_kp0;
    tapa::streams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> bv_lookup_stream_h0_kp1;
    tapa::streams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> bv_lookup_stream_h1_kp0;
    tapa::streams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> bv_lookup_stream_h1_kp1;
    tapa::streams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> bv_lookup_stream_h2_kp0;
    tapa::streams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> bv_lookup_stream_h2_kp1;
    tapa::streams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> bv_lookup_stream_h3_kp0;
    tapa::streams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> bv_lookup_stream_h3_kp1;
    tapa::streams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> bv_lookup_stream_h4_kp0;
    tapa::streams<PACKED_HASH_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> bv_lookup_stream_h4_kp1;
    #if NUM_HASH != 5
    crash!
    #endif

    // Query unit outputs
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> query_bv_packed_stream_hash0_kp0;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> query_bv_packed_stream_hash0_kp1;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> query_bv_packed_stream_hash1_kp0;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> query_bv_packed_stream_hash1_kp1;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> query_bv_packed_stream_hash2_kp0;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> query_bv_packed_stream_hash2_kp1;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> query_bv_packed_stream_hash3_kp0;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> query_bv_packed_stream_hash3_kp1;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> query_bv_packed_stream_hash4_kp0;
    tapa::streams<BV_PLUS_METADATA_PACKED_DTYPE, BV_NUM_PARTITIONS, STM_DEPTH> query_bv_packed_stream_hash4_kp1;
    #if NUM_HASH != 5
    crash!!!
    #endif

    // Shuffle unit output
    tapa::streams<BIT_DTYPE, NUM_HASH, STM_DEPTH> reconstruct_stream_stm0_kp0;
    tapa::streams<BIT_DTYPE, NUM_HASH, STM_DEPTH> reconstruct_stream_stm0_kp1;
    tapa::streams<BIT_DTYPE, NUM_HASH, STM_DEPTH> reconstruct_stream_stm1_kp0;
    tapa::streams<BIT_DTYPE, NUM_HASH, STM_DEPTH> reconstruct_stream_stm1_kp1;
    tapa::streams<BIT_DTYPE, NUM_HASH, STM_DEPTH> reconstruct_stream_stm2_kp0;
    tapa::streams<BIT_DTYPE, NUM_HASH, STM_DEPTH> reconstruct_stream_stm2_kp1;
    tapa::streams<BIT_DTYPE, NUM_HASH, STM_DEPTH> reconstruct_stream_stm3_kp0;
    tapa::streams<BIT_DTYPE, NUM_HASH, STM_DEPTH> reconstruct_stream_stm3_kp1;
    tapa::streams<BIT_DTYPE, NUM_HASH, STM_DEPTH> reconstruct_stream_stm4_kp0;
    tapa::streams<BIT_DTYPE, NUM_HASH, STM_DEPTH> reconstruct_stream_stm4_kp1;
    #if NUM_STM != 5
    crash!!!!!!!
    #endif

    // Aggregate output
    tapa::streams<BIT_DTYPE,        NUM_STM, STM_DEPTH>     aggregate_stream_kp0;
    tapa::streams<BIT_DTYPE,        NUM_STM, STM_DEPTH>     aggregate_stream_kp1;

    // Datapacked outputs
    tapa::streams<OUT_PACKED_DTYPE,   NUM_STM, STM_DEPTH>     packed_output_stm_kp0;
    tapa::streams<OUT_PACKED_DTYPE,   NUM_STM, STM_DEPTH>     packed_output_stm_kp1;

    #if ENABLE_PERF_CTRS
    tapa::streams<PERFCTR_DTYPE, 1, NUM_PERFCTR_OUTPUTS>            perfctr_streams_loadBV;
    tapa::streams<PERFCTR_DTYPE, NUM_ARBITER_ATOMS, NUM_PERFCTR_OUTPUTS>   perfctr_streams_ArbRateMon_0;
    tapa::streams<PERFCTR_DTYPE, NUM_ARBITER_ATOMS, NUM_PERFCTR_OUTPUTS>   perfctr_streams_ArbRateMon_1;
    tapa::streams<PERFCTR_DTYPE, NUM_ARBITER_ATOMS, NUM_PERFCTR_OUTPUTS>   perfctr_streams_ArbRateMon_2;
    tapa::streams<PERFCTR_DTYPE, NUM_ARBITER_ATOMS, NUM_PERFCTR_OUTPUTS>   perfctr_streams_ArbRateMon_3;
    tapa::streams<PERFCTR_DTYPE, NUM_ARBITER_ATOMS, NUM_PERFCTR_OUTPUTS>   perfctr_streams_ArbRateMon_4;
    tapa::streams<PERFCTR_DTYPE, NUM_ARBITER_ATOMS, NUM_PERFCTR_OUTPUTS>   perfctr_streams_ArbRateMon_5;
    tapa::streams<PERFCTR_DTYPE, NUM_ARBITER_ATOMS, NUM_PERFCTR_OUTPUTS>   perfctr_streams_ArbRateMon_6;
    tapa::streams<PERFCTR_DTYPE, NUM_ARBITER_ATOMS, NUM_PERFCTR_OUTPUTS>   perfctr_streams_ArbRateMon_7;
        #if BV_NUM_PARTITIONS != 8
        crash!
        #endif
    #endif


    //////////////////////////////////////////////////////////
    // Connections WITHIN modules:

    // FIFOS within compute:
    COMPUTEHASH_STREAM_DECLS_KP(0)
    COMPUTEHASH_STREAM_DECLS_KP(1)

    ARBITER_STREAM_DECLS_KP(0)
    ARBITER_STREAM_DECLS_KP(1)

    SHUFFLE_STREAM_DECLS_KP(0)
    SHUFFLE_STREAM_DECLS_KP(1)

    //////////////////////////////////////////////////////////
    // MODULE INVOCATIONS.
    tapa::task()
        .invoke(loadBV
                ,input_bv
                ,bv_load_stream_0
                ,bv_load_stream_1
                ,bv_load_stream_2
                ,bv_load_stream_3
                ,bv_load_stream_4
                #if NUM_HASH != 5
                crash!
                #endif

                #if ENABLE_PERF_CTRS
                ,perfctr_streams_loadBV
                #endif
        )

        .invoke(loadKey, key_in, key_stream_kp0, key_stream_kp1)



        COMPUTEHASH_INVOKES_FOR_KP(0)
        COMPUTEHASH_INVOKES_FOR_KP(1)


        ARBITER_INVOKES_FOR_KP(0)
        ARBITER_INVOKES_FOR_KP(1)


        QUERY_INVOKES


        SHUFFLE_INVOKES_FOR_KP(0)
        SHUFFLE_INVOKES_FOR_KP(1)


        AGGREGATE_INVOKES_FOR_KP(0)
        AGGREGATE_INVOKES_FOR_KP(1)


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




        #if ENABLE_PERF_CTRS
        .invoke(write_perfctrs
            ,perfctr_streams_loadBV
            ,perfctr_streams_ArbRateMon_0
            ,perfctr_streams_ArbRateMon_1
            ,perfctr_streams_ArbRateMon_2
            ,perfctr_streams_ArbRateMon_3
            ,perfctr_streams_shuffle
            ,perfctr_mmap
        )
        #endif


    ;
    return;
}
