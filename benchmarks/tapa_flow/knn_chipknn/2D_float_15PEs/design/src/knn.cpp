#include "knn.h"
static inline DATA_TYPE absval(DATA_TYPE input){
    return (input > 0 ? input : static_cast<DATA_TYPE>(-1*input));
}

#define SORT_TO_HIERMERGE_STREAM_ARGS(PE, SEG) \
    sort_to_hiermerge_dist_stream_##PE[D2L_FACTOR_W*SEG + 0],  \
    sort_to_hiermerge_id_stream_##PE[D2L_FACTOR_W*SEG + 0]


#define INVOKE_PPS_UNITS_FOR_PE(PE) \
    .invoke(para_partial_sort, PE, 0, compute_to_sort_stream_##PE[0], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 0) ) \
    .invoke(para_partial_sort, PE, 1, compute_to_sort_stream_##PE[1], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 1) ) \
    .invoke(para_partial_sort, PE, 2, compute_to_sort_stream_##PE[2], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 2) ) \
    .invoke(para_partial_sort, PE, 3, compute_to_sort_stream_##PE[3], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 3) ) \
    .invoke(para_partial_sort, PE, 4, compute_to_sort_stream_##PE[4], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 4) ) \
    .invoke(para_partial_sort, PE, 5, compute_to_sort_stream_##PE[5], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 5) ) \
    .invoke(para_partial_sort, PE, 6, compute_to_sort_stream_##PE[6], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 6) ) \
    .invoke(para_partial_sort, PE, 7, compute_to_sort_stream_##PE[7], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 7) ) \
    .invoke(para_partial_sort, PE, 8, compute_to_sort_stream_##PE[8], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 8) ) \
    .invoke(para_partial_sort, PE, 9, compute_to_sort_stream_##PE[9], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 9) ) \
    .invoke(para_partial_sort, PE, 10, compute_to_sort_stream_##PE[10], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 10) ) \
    .invoke(para_partial_sort, PE, 11, compute_to_sort_stream_##PE[11], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 11) ) \
    .invoke(para_partial_sort, PE, 12, compute_to_sort_stream_##PE[12], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 12) ) \
    .invoke(para_partial_sort, PE, 13, compute_to_sort_stream_##PE[13], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 13) ) \
    .invoke(para_partial_sort, PE, 14, compute_to_sort_stream_##PE[14], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 14) ) \
    .invoke(para_partial_sort, PE, 15, compute_to_sort_stream_##PE[15], SORT_TO_HIERMERGE_STREAM_ARGS(PE, 15) ) \


#define HIERMERGE_STREAM_DECLS(PE) \
    tapa::streams<DATA_TYPE,    NUM_SEGMENTS*D2L_FACTOR_W/2    , TOP>    PE_##PE##_dist_stage1; \
    tapa::streams<int,          NUM_SEGMENTS*D2L_FACTOR_W/2    , TOP>    PE_##PE##_id_stage1; \
    tapa::streams<DATA_TYPE,    NUM_SEGMENTS*D2L_FACTOR_W/4    , TOP>    PE_##PE##_dist_stage2; \
    tapa::streams<int,          NUM_SEGMENTS*D2L_FACTOR_W/4    , TOP>    PE_##PE##_id_stage2; \
    tapa::streams<DATA_TYPE,    NUM_SEGMENTS*D2L_FACTOR_W/8    , TOP>    PE_##PE##_dist_stage3; \
    tapa::streams<int,          NUM_SEGMENTS*D2L_FACTOR_W/8    , TOP>    PE_##PE##_id_stage3; \


#define INVOKE_HIERMERGE_UNITS_FOR_PE(PE) \
    .invoke(merge_dual_streams, PE, 0, 1, sort_to_hiermerge_dist_stream_##PE[0], sort_to_hiermerge_id_stream_##PE  [0], sort_to_hiermerge_dist_stream_##PE[1], sort_to_hiermerge_id_stream_##PE  [1], PE_##PE##_dist_stage1[0], PE_##PE##_id_stage1[0]) \
    .invoke(merge_dual_streams, PE, 2, 1, sort_to_hiermerge_dist_stream_##PE[2], sort_to_hiermerge_id_stream_##PE  [2], sort_to_hiermerge_dist_stream_##PE[3], sort_to_hiermerge_id_stream_##PE  [3], PE_##PE##_dist_stage1[1], PE_##PE##_id_stage1[1]) \
    .invoke(merge_dual_streams, PE, 4, 1, sort_to_hiermerge_dist_stream_##PE[4], sort_to_hiermerge_id_stream_##PE  [4], sort_to_hiermerge_dist_stream_##PE[5], sort_to_hiermerge_id_stream_##PE  [5], PE_##PE##_dist_stage1[2], PE_##PE##_id_stage1[2]) \
    .invoke(merge_dual_streams, PE, 6, 1, sort_to_hiermerge_dist_stream_##PE[6], sort_to_hiermerge_id_stream_##PE  [6], sort_to_hiermerge_dist_stream_##PE[7], sort_to_hiermerge_id_stream_##PE  [7], PE_##PE##_dist_stage1[3], PE_##PE##_id_stage1[3]) \
    .invoke(merge_dual_streams, PE, 8, 1, sort_to_hiermerge_dist_stream_##PE[8], sort_to_hiermerge_id_stream_##PE  [8], sort_to_hiermerge_dist_stream_##PE[9], sort_to_hiermerge_id_stream_##PE  [9], PE_##PE##_dist_stage1[4], PE_##PE##_id_stage1[4]) \
    .invoke(merge_dual_streams, PE, 10, 1, sort_to_hiermerge_dist_stream_##PE[10], sort_to_hiermerge_id_stream_##PE  [10], sort_to_hiermerge_dist_stream_##PE[11], sort_to_hiermerge_id_stream_##PE  [11], PE_##PE##_dist_stage1[5], PE_##PE##_id_stage1[5]) \
    .invoke(merge_dual_streams, PE, 12, 1, sort_to_hiermerge_dist_stream_##PE[12], sort_to_hiermerge_id_stream_##PE  [12], sort_to_hiermerge_dist_stream_##PE[13], sort_to_hiermerge_id_stream_##PE  [13], PE_##PE##_dist_stage1[6], PE_##PE##_id_stage1[6]) \
    .invoke(merge_dual_streams, PE, 14, 1, sort_to_hiermerge_dist_stream_##PE[14], sort_to_hiermerge_id_stream_##PE  [14], sort_to_hiermerge_dist_stream_##PE[15], sort_to_hiermerge_id_stream_##PE  [15], PE_##PE##_dist_stage1[7], PE_##PE##_id_stage1[7]) \
    .invoke(merge_dual_streams, PE, 0, 2, PE_##PE##_dist_stage1[0], PE_##PE##_id_stage1[0], PE_##PE##_dist_stage1[1], PE_##PE##_id_stage1[1], PE_##PE##_dist_stage2[0], PE_##PE##_id_stage2[0]) \
    .invoke(merge_dual_streams, PE, 2, 2, PE_##PE##_dist_stage1[2], PE_##PE##_id_stage1[2], PE_##PE##_dist_stage1[3], PE_##PE##_id_stage1[3], PE_##PE##_dist_stage2[1], PE_##PE##_id_stage2[1]) \
    .invoke(merge_dual_streams, PE, 4, 2, PE_##PE##_dist_stage1[4], PE_##PE##_id_stage1[4], PE_##PE##_dist_stage1[5], PE_##PE##_id_stage1[5], PE_##PE##_dist_stage2[2], PE_##PE##_id_stage2[2]) \
    .invoke(merge_dual_streams, PE, 6, 2, PE_##PE##_dist_stage1[6], PE_##PE##_id_stage1[6], PE_##PE##_dist_stage1[7], PE_##PE##_id_stage1[7], PE_##PE##_dist_stage2[3], PE_##PE##_id_stage2[3]) \
    .invoke(merge_dual_streams, PE, 0, 3, PE_##PE##_dist_stage2[0], PE_##PE##_id_stage2[0], PE_##PE##_dist_stage2[1], PE_##PE##_id_stage2[1], PE_##PE##_dist_stage3[0], PE_##PE##_id_stage3[0]) \
    .invoke(merge_dual_streams, PE, 2, 3, PE_##PE##_dist_stage2[2], PE_##PE##_id_stage2[2], PE_##PE##_dist_stage2[3], PE_##PE##_id_stage2[3], PE_##PE##_dist_stage3[1], PE_##PE##_id_stage3[1]) \
    .invoke(merge_dual_streams, PE, 0, 4, PE_##PE##_dist_stage3[0], PE_##PE##_id_stage3[0], PE_##PE##_dist_stage3[1], PE_##PE##_id_stage3[1], L0_out_dist[PE],L0_out_id[PE])


/*************************************************/
/******************** LOADS: *********************/
/*************************************************/
void load_KNN(   int debug_PE_ID,
                 tapa::async_mmap<INTERFACE_WIDTH> & searchSpace,
                 tapa::ostream<INTERFACE_WIDTH>& load_to_compute_stream)
{
#pragma HLS INLINE OFF
    INTERFACE_WIDTH loaded_value = 0;


    LOAD_QUERY:
    for (int i_req = 0, i_resp = 0; i_resp < (INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1; ) {
        #pragma HLS loop_tripcount min=((INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1) max=((INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1)
        #pragma HLS pipeline II=1
        //Think of addr as an array index.
        int addr = i_req;
        if (i_req < (INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1 && searchSpace.read_addr.try_write(addr)) {
            i_req++;
        }

        if (!searchSpace.read_data.empty()) {
            loaded_value = searchSpace.read_data.read(nullptr);
            i_resp++;

            // DEBUGGING:
            #ifndef __SYNTHESIS__
            for (int i = 0; i < NUM_FEATURES_PER_READ; ++i)
            {
                DATA_TYPE cur_value = 0;
                TRANSFER_TYPE tmp;
                tmp.range(DATA_TYPE_TOTAL_SZ - 1, 0)
                    = loaded_value(i*DATA_TYPE_TOTAL_SZ + (DATA_TYPE_TOTAL_SZ - 1),
                                    i*DATA_TYPE_TOTAL_SZ);

                cur_value = *((DATA_TYPE*) (&tmp));
                if (cur_value < MAX_DATA_TYPE_VAL && debug_PE_ID == 0)
                {
                    printf("LOAD QUERY: value = %f, i_resp = %d\n", cur_value, i_resp);
                }
            }
            #endif


            load_to_compute_stream.write(loaded_value);
        }
    }

    LOAD_SEARCHSPACE:
    for (int i_req = 0, i_resp = 0; i_resp < PARTITION_LEN_IN_I; ) {
        #pragma HLS loop_tripcount min=PARTITION_LEN_IN_I max=PARTITION_LEN_IN_I
        #pragma HLS pipeline II=1
        //Think of addr as an array index.
        int addr = QUERY_DATA_RESERVE + i_req;
        if (i_req < PARTITION_LEN_IN_I && searchSpace.read_addr.try_write(addr)) {
            i_req++;
        }
        if (!searchSpace.read_data.empty()) {
            loaded_value = searchSpace.read_data.read(nullptr);
            i_resp++;

            //// DEBUGGING: Printing the loaded data:
            //#ifndef __SYNTHESIS__
            //for (int i = 0; i < NUM_FEATURES_PER_READ; ++i)
            //{
            //    DATA_TYPE cur_value = 0;
            //    TRANSFER_TYPE tmp;
            //    tmp.range(DATA_TYPE_TOTAL_SZ - 1, 0)
            //        = loaded_value(i*DATA_TYPE_TOTAL_SZ + (DATA_TYPE_TOTAL_SZ - 1),
            //                        i*DATA_TYPE_TOTAL_SZ);
            //    cur_value = *((DATA_TYPE*) (&tmp));
            //    if (cur_value < MAX_DATA_TYPE_VAL && debug_PE_ID == 0)
            //    {
            //        printf("LOAD SEARCHSPACE: value = %f, i_resp = %d\n", cur_value, i_resp);
            //    }
            //}
            //#endif

            //// DEBUGGING: Printing how many times we write to each stream:
            //#ifndef __SYNTHESIS__
            //if (debug_PE_ID == 0)
            //{
            //    printf("LOAD: Writing to load_to_compute_stream for the %d-th time\n",
            //            i_resp-1);
            //}
            //#endif

            load_to_compute_stream.write(loaded_value);
        }
    }
}
/*************************************************/
/******************* COMPUTES: *******************/
/*************************************************/

void compute_KNN(   int debug_pe_idx,
                    int debug_start_idx,
                    tapa::istream<INTERFACE_WIDTH>&     load_to_compute_stream,
                    tapa::ostreams<LOCAL_DIST_DTYPE, NUM_SEGMENTS>&     compute_to_sort_stream)
{
#pragma HLS INLINE OFF

    #ifndef __SYNTHESIS__
    int DEBUG_load_ctr = 0;
    #endif

    INTERFACE_WIDTH cur_data = 0;
    DATA_TYPE local_Query[INPUT_DIM];
    #pragma HLS ARRAY_PARTITION variable=local_Query complete dim=1

    #ifndef __SYNTHESIS__
    int DEBUG_write_counters[NUM_SEGMENTS] = {};
    #endif

    /***********************************************/

    GET_QUERYDATA:
    for (int i = 0 ; i < (INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1; ++i)
    {
        TRANSFER_TYPE tmp = 0;
        int input_dim_idx = 0;

        cur_data = load_to_compute_stream.read();

        for ( int j = 0;
              j < NUM_FEATURES_PER_READ && input_dim_idx < INPUT_DIM;
              ++j, ++input_dim_idx)
        {
            tmp.range(DATA_TYPE_TOTAL_SZ-1, 0)
                = cur_data.range(j*DATA_TYPE_TOTAL_SZ + (DATA_TYPE_TOTAL_SZ-1),
                                 j*DATA_TYPE_TOTAL_SZ);

            local_Query[input_dim_idx] = *((DATA_TYPE*)(&tmp));
        }
    }

    COMPUTE_DATA:
    for (int jj = 0; jj < SEGMENT_SIZE_IN_I; ++jj){

        for (int ii = 0 ; ii < NUM_SEGMENTS; ++ii){
            #pragma HLS PIPELINE II=1
            LOCAL_DIST_DTYPE aggregated_local_dists = 0;

            //#ifndef __SYNTHESIS__
            //if (debug_pe_idx == 0)
            //{
            //    printf("COMPUTE: Reading from load_to_compute_stream for the %d-th time\n",
            //            DEBUG_load_ctr++);
            //}
            //#endif

            cur_data = load_to_compute_stream.read();

            for (int l2i = 0; l2i < L2I_FACTOR_W; ++l2i)
            {
            #pragma HLS UNROLL
                for (int d2l = 0; d2l < D2L_FACTOR_W; ++d2l){
                #pragma HLS UNROLL
                    int d2i = d2l + D2L_FACTOR_W*l2i;

                    DATA_TYPE delta_squared_sum = 0.0;
                    int start_idx = d2i * INPUT_DIM;

                    for (int ll = 0; ll < INPUT_DIM; ++ll){
                        unsigned int sp_range_idx = (start_idx + ll) * DATA_TYPE_TOTAL_SZ;
                        DATA_TYPE sp_dim_item_value;
                        TRANSFER_TYPE tmp = 0;

                        tmp.range(DATA_TYPE_TOTAL_SZ-1, 0) =
                            cur_data.range(sp_range_idx + (DATA_TYPE_TOTAL_SZ-1),
                                                   sp_range_idx);

                        sp_dim_item_value = *((DATA_TYPE*) (&tmp));

                        #if DISTANCE_METRIC == 0 // manhattan
                        DATA_TYPE delta = absval(sp_dim_item_value - local_Query[ll]);
                        delta_squared_sum += delta;
                        #elif DISTANCE_METRIC == 1 // L2
                        DATA_TYPE delta = absval(sp_dim_item_value - local_Query[ll]);
                        delta_squared_sum += delta * delta;
                        #endif
                    }
                    aggregated_local_dists = delta_squared_sum;

                    //#ifndef __SYNTHESIS__
                    //if (delta_squared_sum < MAX_DATA_TYPE_VAL)
                    //{
                    //    printf("COMPUTE: At index %d, delta_squared_sum = %f\n",
                    //            debug_start_idx + ii*SEGMENT_SIZE_IN_D +
                    //            jj*D2I_FACTOR_W + d2i,
                    //            delta_squared_sum);
                    //}
                    //#endif
                }
                int stream_idx = (ii*L2I_FACTOR_W + l2i)%NUM_SEGMENTS;
                compute_to_sort_stream[stream_idx].write(aggregated_local_dists);

                //#ifndef __SYNTHESIS__
                //if (debug_pe_idx == 0)
                //{
                //    printf("COMPUTE: Writing the value %f to compute_to_sort_stream number %d, for the %d'th time\n",
                //            aggregated_local_dists,
                //            stream_idx,
                //            DEBUG_write_counters[stream_idx]++);
                //}
                //#endif

                aggregated_local_dists = 0;
            }
        }
    }
}


void swap(DATA_TYPE* a, DATA_TYPE* b,
               int* x, int* y)
{
#pragma HLS INLINE

    DATA_TYPE tmpdist_a;
    DATA_TYPE tmpdist_b;

    int tmpid_x;
    int tmpid_y;

    tmpdist_a = *a;
    tmpdist_b = *b;
    *b = tmpdist_a;
    *a = tmpdist_b;

    tmpid_x = *x;
    tmpid_y = *y;
    *x = tmpid_y;
    *y = tmpid_x;
}
void para_partial_sort(const int PE_idx,
                       int seg_idx,
                       tapa::istream<LOCAL_DIST_DTYPE>&     compute_to_sort_stream,
                       tapa::ostream<DATA_TYPE>&           sort_to_hiermerge_dist_stream_0,
                       tapa::ostream<int>&                 sort_to_hiermerge_id_stream_0)
{
#pragma HLS INLINE OFF

    #ifndef __SYNTHESIS__
    printf("SORT UNIT FOR PE #%d, SEGMENT #%d IS STARTING NOW.\n", PE_idx, seg_idx);
    #endif

    #ifdef __SYNTHESIS__
    static      // TAPA Known-issue: Static keyword fails CSIM because this is not thread-safe.
                //  but when running the HW build, it will instantiate several copies of this function. So this is OK.
    #endif
    DATA_TYPE local_kNearstDist[D2L_FACTOR_W][(TOP+1)];
    #pragma HLS ARRAY_PARTITION variable=local_kNearstDist complete dim=0

    #ifdef __SYNTHESIS__
    static
    #endif
    int local_kNearstId[D2L_FACTOR_W][(TOP+1)];
    #pragma HLS ARRAY_PARTITION variable=local_kNearstId complete dim=0

    #ifndef __SYNTHESIS__
    int DEBUG_stream_counters = 0;
    #endif

    /* Our segments used to be large chunks of each partition.
     * Now, however, our segments are cylically split, so our ID
     * logic has to change.
     */
    int start_id = PE_idx * NUM_SP_PTS_PER_KRNL_PADDED + seg_idx*D2L_FACTOR_W;

    /*******************************************/

    // Initialize all top-K distances to MAX, and their IDs to an invalid value.
    INIT_LOOP:
    for (int i = 0; i < D2L_FACTOR_W; ++i)
    {
        for (int j = 0; j < TOP+1; ++j)
        {
            local_kNearstId[i][j] = -1;
            local_kNearstDist[i][j] = MAX_DATA_TYPE_VAL;
        }
    }

    SORT_LOOP:
    for (int lvalue_idx = 0; lvalue_idx < (SEGMENT_SIZE_IN_L + TOP); ++lvalue_idx) {
    #pragma HLS PIPELINE II=2
        LOCAL_DIST_DTYPE cur_Lval = 0;
        int stream_idx = seg_idx;

        if (lvalue_idx >= SEGMENT_SIZE_IN_L) {
            cur_Lval = MAX_DATA_TYPE_VAL;
        } else {
            //#ifndef __SYNTHESIS__
            //if (PE_idx == 0)
            //{
            //    printf("PPS Unit %d: Reading from compute_to_sort_stream %d, for the %d-th time\n",
            //            seg_idx,
            //            stream_idx,
            //            DEBUG_stream_counters++);
            //}
            //#endif

            cur_Lval = compute_to_sort_stream.read();
        }

        for (int D_idx = 0; D_idx < D2L_FACTOR_W; ++D_idx)
        {
        #pragma HLS UNROLL

            unsigned char range_idx = (D_idx)*DATA_TYPE_TOTAL_SZ;
            DATA_TYPE cur_Dval;

            cur_Dval = cur_Lval;

            local_kNearstDist[D_idx][0] = cur_Dval;

            local_kNearstId[D_idx][0] = start_id + lvalue_idx*D2L_FACTOR_W*NUM_SEGMENTS + D_idx;

            //#ifndef __SYNTHESIS__
            //printf("SORT: Current ID = %d, cur_Dval = %f\n", start_id + lvalue_idx, cur_Dval);
            //printf("SORT: Best ID = %d, Best Dval = %f\n", local_kNearstId[D_idx][TOP], local_kNearstDist[D_idx][TOP]);
            //#endif


            //compare and swap odd
            for(int ii=1; ii<TOP; ii+=2){
            #pragma HLS UNROLL
            #pragma HLS DEPENDENCE variable="local_kNearstDist" inter false
            #pragma HLS DEPENDENCE variable="local_kNearstId" inter false

                if (local_kNearstDist[D_idx][ii] < local_kNearstDist[D_idx][ii+1]){
                    swap(&local_kNearstDist[D_idx][ii], &local_kNearstDist[D_idx][ii+1],
                              &local_kNearstId[D_idx][ii], &local_kNearstId[D_idx][ii+1]);
                }

            }


            //compare and swap even
            for(int ii=1; ii<TOP+1; ii+=2){
            #pragma HLS UNROLL
            #pragma HLS DEPENDENCE variable="local_kNearstDist" inter false
            #pragma HLS DEPENDENCE variable="local_kNearstId" inter false

                if (local_kNearstDist[D_idx][ii] > local_kNearstDist[D_idx][ii-1]){
                    swap(&local_kNearstDist[D_idx][ii], &local_kNearstDist[D_idx][ii-1],
                              &local_kNearstId[D_idx][ii], &local_kNearstId[D_idx][ii-1]);
                }

            }
        }
    }

    // Write data out
    OUTPUT_LOOP:
    for (int j = TOP; j > 0; --j)
    {
    #pragma HLS PIPELINE II=1
        sort_to_hiermerge_dist_stream_0.write(local_kNearstDist[0][j]);
        sort_to_hiermerge_id_stream_0.write(local_kNearstId[0][j]);
    }

    #ifndef __SYNTHESIS__
    for (int i = 0; i < D2L_FACTOR_W; ++i)
    {
        for (int j = 0; j < TOP+1; ++j)
        {
            printf("AFTER SORT: local_kNearst[%3d][%3d][%3d]:\n", seg_idx, i, j);
            printf("AFTER SORT:     Dist = %5.10f\n",   local_kNearstDist[i][j]);
            printf("AFTER SORT:     Id = %d\n",         local_kNearstId[i][j]);

        }
        printf("\n");
    }
    #endif

    REINITIALIZATION_LOOP:
    for (int i = 0; i < D2L_FACTOR_W; ++i){
        for (int j = 0; j < TOP+1; ++j){
        #pragma HLS UNROLL
            // Reset the kNearst values so we can run the next iteration.
            local_kNearstId[i][j] = -1;
            local_kNearstDist[i][j] = MAX_DATA_TYPE_VAL;
        }
    }
}




void merge_dual_streams(
                        int debug_PE_idx,
                        int debug_seg_d2l_idx,
                        int debug_stage_idx,
                        tapa::istream<DATA_TYPE>&   hiermerge_dist_istream_1,
                        tapa::istream<int>&         hiermerge_id_istream_1,
                        tapa::istream<DATA_TYPE>&   hiermerge_dist_istream_2,
                        tapa::istream<int>&         hiermerge_id_istream_2,
                        tapa::ostream<DATA_TYPE>&   hiermerge_dist_ostream,
                        tapa::ostream<int>&         hiermerge_id_ostream
)
{
    DATA_TYPE dist_1 = hiermerge_dist_istream_1.read();
    DATA_TYPE dist_2 = hiermerge_dist_istream_2.read();
    int id_1 = hiermerge_id_istream_1.read();
    int id_2 = hiermerge_id_istream_2.read();
    int stream1_read_count = 1;
    int stream2_read_count = 1;

    for (int k = TOP-1; k > 0; --k)
    {
        #ifndef __SYNTHESIS__
        if (debug_PE_idx == 0)
        {
            printf("KDEBUG: Hiermerge for PE %d, STAGE %d, seg_d2l = %d, stream1_read_count = %d, stream2_read_count = %d\n",
                    debug_PE_idx, debug_stage_idx, debug_seg_d2l_idx,
                    stream1_read_count, stream2_read_count);
        }
        #endif
        if (dist_1 <= dist_2)
        {
            hiermerge_dist_ostream.write(dist_1);
            hiermerge_id_ostream.write(id_1);

            if (stream1_read_count < TOP)
            {
                ++stream1_read_count;
                dist_1 = hiermerge_dist_istream_1.read();
                id_1 = hiermerge_id_istream_1.read();
            }
        }
        else
        {
            hiermerge_dist_ostream.write(dist_2);
            hiermerge_id_ostream.write(id_2);

            if (stream2_read_count < TOP)
            {
                ++stream2_read_count;
                dist_2 = hiermerge_dist_istream_2.read();
                id_2 = hiermerge_id_istream_2.read();
            }
        }
    }
    // Final write.
    if (dist_1 <= dist_2) {
        hiermerge_dist_ostream.write(dist_1);
        hiermerge_id_ostream.write(id_1);
    }
    else {
        hiermerge_dist_ostream.write(dist_2);
        hiermerge_id_ostream.write(id_2);
    }

    #ifndef __SYNTHESIS__
    if (debug_PE_idx == 0)
    {
        printf("KDEBUG: Hiermerge for PE %d, STAGE #%d, seg_d2l = %d, Emptying the input FIFOs now...\n",
                debug_PE_idx, debug_stage_idx, debug_seg_d2l_idx);
    }
    #endif
    // Empty the input streams.
    // NOTE: The total tripcount of these loops will be TOP.
    while (stream1_read_count < TOP)
    {
    #pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream1_read_count;
        dist_1 = hiermerge_dist_istream_1.read();
        id_1 = hiermerge_id_istream_1.read();
    }
    while (stream2_read_count < TOP)
    {
    #pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream2_read_count;
        dist_2 = hiermerge_dist_istream_2.read();
        id_2 = hiermerge_id_istream_2.read();
    }
}


void merge_trio_streams(
                        int debug_PE_idx,
                        int debug_seg_d2l_idx,
                        int debug_stage_idx,
                        tapa::istream<DATA_TYPE>&   hiermerge_dist_istream_1,
                        tapa::istream<int>&         hiermerge_id_istream_1,
                        tapa::istream<DATA_TYPE>&   hiermerge_dist_istream_2,
                        tapa::istream<int>&         hiermerge_id_istream_2,
                        tapa::istream<DATA_TYPE>&   hiermerge_dist_istream_3,
                        tapa::istream<int>&         hiermerge_id_istream_3,
                        tapa::ostream<DATA_TYPE>&   hiermerge_dist_ostream,
                        tapa::ostream<int>&         hiermerge_id_ostream
)
{
    DATA_TYPE dist_1 = hiermerge_dist_istream_1.read();
    DATA_TYPE dist_2 = hiermerge_dist_istream_2.read();
    DATA_TYPE dist_3 = hiermerge_dist_istream_3.read();
    int id_1 = hiermerge_id_istream_1.read();
    int id_2 = hiermerge_id_istream_2.read();
    int id_3 = hiermerge_id_istream_3.read();
    int stream1_read_count = 1;
    int stream2_read_count = 1;
    int stream3_read_count = 1;

    for (int k = TOP-1; k > 0; --k)
    {
        #ifndef __SYNTHESIS__
        if (debug_PE_idx == 0)
        {
            printf("KDEBUG: Hiermerge for PE %d, STAGE %d, seg_d2l = %d, stream1_read_count = %d, stream2_read_count = %d, stream3_read_count = %d\n",
                    debug_PE_idx, debug_stage_idx, debug_seg_d2l_idx,
                    stream1_read_count, stream2_read_count, stream3_read_count);
        }
        #endif

        if ( (dist_1 <= dist_2) && (dist_1 <= dist_3) )
        {
            hiermerge_dist_ostream.write(dist_1);
            hiermerge_id_ostream.write(id_1);

            if (stream1_read_count < TOP)
            {
                ++stream1_read_count;
                dist_1 = hiermerge_dist_istream_1.read();
                id_1 = hiermerge_id_istream_1.read();
            }
        }

        else if ( (dist_2 <= dist_3) && (dist_2 <= dist_1) )
        {
            hiermerge_dist_ostream.write(dist_2);
            hiermerge_id_ostream.write(id_2);

            if (stream2_read_count < TOP)
            {
                ++stream2_read_count;
                dist_2 = hiermerge_dist_istream_2.read();
                id_2 = hiermerge_id_istream_2.read();
            }
        }
        else
        {
            hiermerge_dist_ostream.write(dist_3);
            hiermerge_id_ostream.write(id_3);

            if (stream3_read_count < TOP)
            {
                ++stream3_read_count;
                dist_3 = hiermerge_dist_istream_3.read();
                id_3 = hiermerge_id_istream_3.read();
            }
        }
    }
    // Final write.
    if ( (dist_1 <= dist_2) && (dist_1 <= dist_3) ){
        hiermerge_dist_ostream.write(dist_1);
        hiermerge_id_ostream.write(id_1);
    }
    else if ( (dist_2 <= dist_3) && (dist_2 <= dist_1) ){
        hiermerge_dist_ostream.write(dist_2);
        hiermerge_id_ostream.write(id_2);
    }
    else{
        hiermerge_dist_ostream.write(dist_3);
        hiermerge_id_ostream.write(id_3);
    }

    #ifndef __SYNTHESIS__
    if (debug_PE_idx == 0)
    {
        printf("KDEBUG: Hiermerge for PE %d, STAGE #%d, seg_d2l = %d, Emptying the input FIFOs now...\n",
                debug_PE_idx, debug_stage_idx, debug_seg_d2l_idx);
    }
    #endif
    // Empty the input streams.
    // NOTE: The total tripcount of these loops will be 2*TOP.
    while (stream1_read_count < TOP)
    {
    #pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream1_read_count;
        dist_1 = hiermerge_dist_istream_1.read();
        id_1 = hiermerge_id_istream_1.read();
    }
    while (stream2_read_count < TOP)
    {
    #pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream2_read_count;
        dist_2 = hiermerge_dist_istream_2.read();
        id_2 = hiermerge_id_istream_2.read();
    }
    while (stream3_read_count < TOP)
    {
    #pragma HLS loop_tripcount min=TOP max=TOP
        ++stream3_read_count;
        dist_3 = hiermerge_dist_istream_3.read();
        id_3 = hiermerge_id_istream_3.read();
    }
}


void write_out_mmap(
                    tapa::async_mmap<DATA_TYPE>& output_knnDist,
                    tapa::async_mmap<int>&      output_knnId,
                    DATA_TYPE                   output_dist,
                    int                         output_id,
                    int&                        i_req_dist,
                    int&                        i_resp_dist,
                    int&                        i_req_id,
                    int&                        i_resp_id
) {
#pragma HLS INLINE

    // Writing the distance values:
    if (i_req_dist < TOP && i_req_dist >= 0 &&
        !output_knnDist.write_addr.full() &&
        !output_knnDist.write_data.full()
    ) {
      output_knnDist.write_addr.try_write(i_req_dist);
      output_knnDist.write_data.try_write(output_dist);

      --i_req_dist;
    }

    if (!output_knnDist.write_resp.empty()) {
      i_resp_dist += (unsigned int)(output_knnDist.write_resp.read(nullptr)) + 1;
    }


    // Writing the ID values:
    if (i_req_id < TOP && i_req_id >= 0 &&
        !output_knnId.write_addr.full() &&
        !output_knnId.write_data.full()
    ) {
      output_knnId.write_addr.try_write(i_req_id);
      output_knnId.write_data.try_write(output_id);

      --i_req_id;
    }

    if (!output_knnId.write_resp.empty()) {
      i_resp_id += (unsigned int)(output_knnId.write_resp.read(nullptr)) + 1;
    }
}


void merge_dual_streams_FINAL(
                        int debug_PE_idx,
                        int debug_seg_d2l_idx,
                        int debug_stage_idx,
                        tapa::istream<DATA_TYPE>&   hiermerge_dist_istream_1,
                        tapa::istream<int>&         hiermerge_id_istream_1,
                        tapa::istream<DATA_TYPE>&   hiermerge_dist_istream_2,
                        tapa::istream<int>&         hiermerge_id_istream_2,
                        tapa::async_mmap<DATA_TYPE>&    hiermerge_dist_output,
                        tapa::async_mmap<int>&      hiermerge_id_output
)
{
    DATA_TYPE dist_1 = hiermerge_dist_istream_1.read();
    DATA_TYPE dist_2 = hiermerge_dist_istream_2.read();
    int id_1 = hiermerge_id_istream_1.read();
    int id_2 = hiermerge_id_istream_2.read();
    int stream1_read_count = 1;
    int stream2_read_count = 1;
    int i_req_dist = TOP-1;
    int i_resp_dist = TOP-1;
    int i_req_id = TOP-1;
    int i_resp_id = TOP-1;

    for (int k = TOP-1; k > 0; --k)
    {
        #ifndef __SYNTHESIS__
        if (debug_PE_idx == 0)
        {
            printf("KDEBUG: FINAL Hiermerge, stream1_read_count = %d, stream2_read_count = %d\n",
                    stream1_read_count, stream2_read_count);
        }
        #endif
        if (dist_1 <= dist_2)
        {
            write_out_mmap( hiermerge_dist_output,
                            hiermerge_id_output,
                            dist_1,
                            id_1,
                            i_req_dist,
                            i_resp_dist,
                            i_req_id,
                            i_resp_id);

            if (stream1_read_count < TOP)
            {
                ++stream1_read_count;
                dist_1 = hiermerge_dist_istream_1.read();
                id_1 = hiermerge_id_istream_1.read();
            }
        }
        else
        {
            write_out_mmap( hiermerge_dist_output,
                            hiermerge_id_output,
                            dist_2,
                            id_2,
                            i_req_dist,
                            i_resp_dist,
                            i_req_id,
                            i_resp_id);

            if (stream2_read_count < TOP)
            {
                ++stream2_read_count;
                dist_2 = hiermerge_dist_istream_2.read();
                id_2 = hiermerge_id_istream_2.read();
            }
        }
    }
    // Final write.
    if (dist_1 <= dist_2) {
        write_out_mmap( hiermerge_dist_output,
                        hiermerge_id_output,
                        dist_1,
                        id_1,
                        i_req_dist,
                        i_resp_dist,
                        i_req_id,
                        i_resp_id);
    }
    else {
        write_out_mmap( hiermerge_dist_output,
                        hiermerge_id_output,
                        dist_2,
                        id_2,
                        i_req_dist,
                        i_resp_dist,
                        i_req_id,
                        i_resp_id);
    }

    #ifndef __SYNTHESIS__
    if (debug_PE_idx == 0)
    {
        printf("KDEBUG: FINAL Hiermerge, Emptying the input FIFOs now...\n");
    }
    #endif
    // Empty the input streams.
    while (stream1_read_count < TOP)
    {
    #pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream1_read_count;
        dist_1 = hiermerge_dist_istream_1.read();
        id_1 = hiermerge_id_istream_1.read();
    }
    while (stream2_read_count < TOP)
    {
    #pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream2_read_count;
        dist_2 = hiermerge_dist_istream_2.read();
        id_2 = hiermerge_id_istream_2.read();
    }
}


void merge_trio_streams_FINAL(
                        int debug_PE_idx,
                        int debug_seg_d2l_idx,
                        int debug_stage_idx,
                        tapa::istream<DATA_TYPE>&   hiermerge_dist_istream_1,
                        tapa::istream<int>&         hiermerge_id_istream_1,
                        tapa::istream<DATA_TYPE>&   hiermerge_dist_istream_2,
                        tapa::istream<int>&         hiermerge_id_istream_2,
                        tapa::istream<DATA_TYPE>&   hiermerge_dist_istream_3,
                        tapa::istream<int>&         hiermerge_id_istream_3,
                        tapa::async_mmap<DATA_TYPE>&    hiermerge_dist_output,
                        tapa::async_mmap<int>&      hiermerge_id_output
)
{
    DATA_TYPE dist_1 = hiermerge_dist_istream_1.read();
    DATA_TYPE dist_2 = hiermerge_dist_istream_2.read();
    DATA_TYPE dist_3 = hiermerge_dist_istream_3.read();
    int id_1 = hiermerge_id_istream_1.read();
    int id_2 = hiermerge_id_istream_2.read();
    int id_3 = hiermerge_id_istream_3.read();
    int stream1_read_count = 1;
    int stream2_read_count = 1;
    int stream3_read_count = 1;
    int i_req_dist = TOP-1;
    int i_resp_dist = TOP-1;
    int i_req_id = TOP-1;
    int i_resp_id = TOP-1;


    for (int k = TOP-1; k > 0; --k)
    {
        #ifndef __SYNTHESIS__
        if (debug_PE_idx == 0)
        {
            printf("KDEBUG: FINAL Hiermerge, stream1_read_count = %d, stream2_read_count = %d, stream3_read_count = %d\n",
                    stream1_read_count, stream2_read_count, stream3_read_count);
        }
        #endif

        if ( (dist_1 <= dist_2) && (dist_1 <= dist_3) )
        {
            write_out_mmap( hiermerge_dist_output,
                            hiermerge_id_output,
                            dist_1,
                            id_1,
                            i_req_dist,
                            i_resp_dist,
                            i_req_id,
                            i_resp_id);

            if (stream1_read_count < TOP)
            {
                ++stream1_read_count;
                dist_1 = hiermerge_dist_istream_1.read();
                id_1 = hiermerge_id_istream_1.read();
            }
        }

        else if ( (dist_2 <= dist_3) && (dist_2 <= dist_1) )
        {
            write_out_mmap( hiermerge_dist_output,
                            hiermerge_id_output,
                            dist_2,
                            id_2,
                            i_req_dist,
                            i_resp_dist,
                            i_req_id,
                            i_resp_id);

            if (stream2_read_count < TOP)
            {
                ++stream2_read_count;
                dist_2 = hiermerge_dist_istream_2.read();
                id_2 = hiermerge_id_istream_2.read();
            }
        }
        else
        {
            write_out_mmap( hiermerge_dist_output,
                            hiermerge_id_output,
                            dist_3,
                            id_3,
                            i_req_dist,
                            i_resp_dist,
                            i_req_id,
                            i_resp_id);

            if (stream3_read_count < TOP)
            {
                ++stream3_read_count;
                dist_3 = hiermerge_dist_istream_3.read();
                id_3 = hiermerge_id_istream_3.read();
            }
        }
    }
    // Final write.
    if ( (dist_1 <= dist_2) && (dist_1 <= dist_3) ){
        write_out_mmap( hiermerge_dist_output,
                        hiermerge_id_output,
                        dist_1,
                        id_1,
                        i_req_dist,
                        i_resp_dist,
                        i_req_id,
                        i_resp_id);
    }
    else if ( (dist_2 <= dist_3) && (dist_2 <= dist_1) ){
        write_out_mmap( hiermerge_dist_output,
                        hiermerge_id_output,
                        dist_2,
                        id_2,
                        i_req_dist,
                        i_resp_dist,
                        i_req_id,
                        i_resp_id);
    }
    else{
        write_out_mmap( hiermerge_dist_output,
                        hiermerge_id_output,
                        dist_3,
                        id_3,
                        i_req_dist,
                        i_resp_dist,
                        i_req_id,
                        i_resp_id);
    }

    #ifndef __SYNTHESIS__
    if (debug_PE_idx == 0)
    {
        printf("KDEBUG: FINAL Hiermerge, Emptying the input FIFOs now...\n");
    }
    #endif
    // Empty the input streams.
    while (stream1_read_count < TOP)
    {
    #pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream1_read_count;
        dist_1 = hiermerge_dist_istream_1.read();
        id_1 = hiermerge_id_istream_1.read();
    }
    while (stream2_read_count < TOP)
    {
    #pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream2_read_count;
        dist_2 = hiermerge_dist_istream_2.read();
        id_2 = hiermerge_id_istream_2.read();
    }
    while (stream3_read_count < TOP)
    {
    #pragma HLS loop_tripcount min=TOP max=TOP
        ++stream3_read_count;
        dist_3 = hiermerge_dist_istream_3.read();
        id_3 = hiermerge_id_istream_3.read();
    }
}




void Knn(
    tapa::mmap<INTERFACE_WIDTH> in_0,
    tapa::mmap<INTERFACE_WIDTH> in_1,
    tapa::mmap<INTERFACE_WIDTH> in_2,
    tapa::mmap<INTERFACE_WIDTH> in_3,
    tapa::mmap<INTERFACE_WIDTH> in_4,
    tapa::mmap<INTERFACE_WIDTH> in_5,
    tapa::mmap<INTERFACE_WIDTH> in_6,
    tapa::mmap<INTERFACE_WIDTH> in_7,
    tapa::mmap<INTERFACE_WIDTH> in_8,
    tapa::mmap<INTERFACE_WIDTH> in_9,
    tapa::mmap<INTERFACE_WIDTH> in_10,
    tapa::mmap<INTERFACE_WIDTH> in_11,
    tapa::mmap<INTERFACE_WIDTH> in_12,
    tapa::mmap<INTERFACE_WIDTH> in_13,
    tapa::mmap<INTERFACE_WIDTH> in_14,
    tapa::mmap<DATA_TYPE> final_out_dist,
    tapa::mmap<int> final_out_id
) {

    // Streams, for the global merge:
    tapa::streams<DATA_TYPE, 15, TOP> L0_out_dist;
    tapa::streams<int,       15, TOP> L0_out_id;
    tapa::streams<DATA_TYPE, 7, 2>   L1_out_dist;
    tapa::streams<int,       7, 2>   L1_out_id;
    tapa::streams<DATA_TYPE, 3, 2>   L2_out_dist;
    tapa::streams<int,       3, 2>   L2_out_id;
    // Streams, for load->compute->sort:
    tapa::streams<INTERFACE_WIDTH, NUM_PE, 2>           load_to_compute_stream;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_0;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_1;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_2;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_3;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_4;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_5;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_6;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_7;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_8;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_9;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_10;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_11;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_12;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_13;
    tapa::streams<LOCAL_DIST_DTYPE, NUM_SEGMENTS, 2>    compute_to_sort_stream_14;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_0;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_0;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_1;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_1;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_2;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_2;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_3;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_3;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_4;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_4;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_5;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_5;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_6;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_6;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_7;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_7;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_8;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_8;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_9;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_9;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_10;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_10;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_11;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_11;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_12;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_12;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_13;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_13;
    tapa::streams<DATA_TYPE, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                 sort_to_hiermerge_dist_stream_14;
    tapa::streams<int, NUM_SEGMENTS*D2L_FACTOR_W, TOP>                       sort_to_hiermerge_id_stream_14;

    HIERMERGE_STREAM_DECLS(0)
    HIERMERGE_STREAM_DECLS(1)
    HIERMERGE_STREAM_DECLS(2)
    HIERMERGE_STREAM_DECLS(3)
    HIERMERGE_STREAM_DECLS(4)
    HIERMERGE_STREAM_DECLS(5)
    HIERMERGE_STREAM_DECLS(6)
    HIERMERGE_STREAM_DECLS(7)
    HIERMERGE_STREAM_DECLS(8)
    HIERMERGE_STREAM_DECLS(9)
    HIERMERGE_STREAM_DECLS(10)
    HIERMERGE_STREAM_DECLS(11)
    HIERMERGE_STREAM_DECLS(12)
    HIERMERGE_STREAM_DECLS(13)
    HIERMERGE_STREAM_DECLS(14)


    tapa::task()
        .invoke( load_KNN, 0, in_0, load_to_compute_stream[0])
        .invoke( load_KNN, 1, in_1, load_to_compute_stream[1])
        .invoke( load_KNN, 2, in_2, load_to_compute_stream[2])
        .invoke( load_KNN, 3, in_3, load_to_compute_stream[3])
        .invoke( load_KNN, 4, in_4, load_to_compute_stream[4])
        .invoke( load_KNN, 5, in_5, load_to_compute_stream[5])
        .invoke( load_KNN, 6, in_6, load_to_compute_stream[6])
        .invoke( load_KNN, 7, in_7, load_to_compute_stream[7])
        .invoke( load_KNN, 8, in_8, load_to_compute_stream[8])
        .invoke( load_KNN, 9, in_9, load_to_compute_stream[9])
        .invoke( load_KNN, 10, in_10, load_to_compute_stream[10])
        .invoke( load_KNN, 11, in_11, load_to_compute_stream[11])
        .invoke( load_KNN, 12, in_12, load_to_compute_stream[12])
        .invoke( load_KNN, 13, in_13, load_to_compute_stream[13])
        .invoke( load_KNN, 14, in_14, load_to_compute_stream[14])

        .invoke( compute_KNN, 0, NUM_SP_PTS_PER_KRNL_PADDED*0, load_to_compute_stream[0 ], compute_to_sort_stream_0  )
        .invoke( compute_KNN, 1, NUM_SP_PTS_PER_KRNL_PADDED*1, load_to_compute_stream[1 ], compute_to_sort_stream_1  )
        .invoke( compute_KNN, 2, NUM_SP_PTS_PER_KRNL_PADDED*2, load_to_compute_stream[2 ], compute_to_sort_stream_2  )
        .invoke( compute_KNN, 3, NUM_SP_PTS_PER_KRNL_PADDED*3, load_to_compute_stream[3 ], compute_to_sort_stream_3  )
        .invoke( compute_KNN, 4, NUM_SP_PTS_PER_KRNL_PADDED*4, load_to_compute_stream[4 ], compute_to_sort_stream_4  )
        .invoke( compute_KNN, 5, NUM_SP_PTS_PER_KRNL_PADDED*5, load_to_compute_stream[5 ], compute_to_sort_stream_5  )
        .invoke( compute_KNN, 6, NUM_SP_PTS_PER_KRNL_PADDED*6, load_to_compute_stream[6 ], compute_to_sort_stream_6  )
        .invoke( compute_KNN, 7, NUM_SP_PTS_PER_KRNL_PADDED*7, load_to_compute_stream[7 ], compute_to_sort_stream_7  )
        .invoke( compute_KNN, 8, NUM_SP_PTS_PER_KRNL_PADDED*8, load_to_compute_stream[8 ], compute_to_sort_stream_8  )
        .invoke( compute_KNN, 9, NUM_SP_PTS_PER_KRNL_PADDED*9, load_to_compute_stream[9 ], compute_to_sort_stream_9  )
        .invoke( compute_KNN, 10, NUM_SP_PTS_PER_KRNL_PADDED*10, load_to_compute_stream[10 ], compute_to_sort_stream_10  )
        .invoke( compute_KNN, 11, NUM_SP_PTS_PER_KRNL_PADDED*11, load_to_compute_stream[11 ], compute_to_sort_stream_11  )
        .invoke( compute_KNN, 12, NUM_SP_PTS_PER_KRNL_PADDED*12, load_to_compute_stream[12 ], compute_to_sort_stream_12  )
        .invoke( compute_KNN, 13, NUM_SP_PTS_PER_KRNL_PADDED*13, load_to_compute_stream[13 ], compute_to_sort_stream_13  )
        .invoke( compute_KNN, 14, NUM_SP_PTS_PER_KRNL_PADDED*14, load_to_compute_stream[14 ], compute_to_sort_stream_14  )

        INVOKE_PPS_UNITS_FOR_PE(0)
        INVOKE_PPS_UNITS_FOR_PE(1)
        INVOKE_PPS_UNITS_FOR_PE(2)
        INVOKE_PPS_UNITS_FOR_PE(3)
        INVOKE_PPS_UNITS_FOR_PE(4)
        INVOKE_PPS_UNITS_FOR_PE(5)
        INVOKE_PPS_UNITS_FOR_PE(6)
        INVOKE_PPS_UNITS_FOR_PE(7)
        INVOKE_PPS_UNITS_FOR_PE(8)
        INVOKE_PPS_UNITS_FOR_PE(9)
        INVOKE_PPS_UNITS_FOR_PE(10)
        INVOKE_PPS_UNITS_FOR_PE(11)
        INVOKE_PPS_UNITS_FOR_PE(12)
        INVOKE_PPS_UNITS_FOR_PE(13)
        INVOKE_PPS_UNITS_FOR_PE(14)

        INVOKE_HIERMERGE_UNITS_FOR_PE(0)
        INVOKE_HIERMERGE_UNITS_FOR_PE(1)
        INVOKE_HIERMERGE_UNITS_FOR_PE(2)
        INVOKE_HIERMERGE_UNITS_FOR_PE(3)
        INVOKE_HIERMERGE_UNITS_FOR_PE(4)
        INVOKE_HIERMERGE_UNITS_FOR_PE(5)
        INVOKE_HIERMERGE_UNITS_FOR_PE(6)
        INVOKE_HIERMERGE_UNITS_FOR_PE(7)
        INVOKE_HIERMERGE_UNITS_FOR_PE(8)
        INVOKE_HIERMERGE_UNITS_FOR_PE(9)
        INVOKE_HIERMERGE_UNITS_FOR_PE(10)
        INVOKE_HIERMERGE_UNITS_FOR_PE(11)
        INVOKE_HIERMERGE_UNITS_FOR_PE(12)
        INVOKE_HIERMERGE_UNITS_FOR_PE(13)
        INVOKE_HIERMERGE_UNITS_FOR_PE(14)


        // INTER-PE HIERMERGE:

        .invoke( merge_dual_streams, -1, 0, -1, L0_out_dist[0], L0_out_id[0], L0_out_dist[1], L0_out_id[1], L1_out_dist[0], L1_out_id[0] )
        .invoke( merge_dual_streams, -1, 2, -1, L0_out_dist[2], L0_out_id[2], L0_out_dist[3], L0_out_id[3], L1_out_dist[1], L1_out_id[1] )
        .invoke( merge_dual_streams, -1, 4, -1, L0_out_dist[4], L0_out_id[4], L0_out_dist[5], L0_out_id[5], L1_out_dist[2], L1_out_id[2] )
        .invoke( merge_dual_streams, -1, 6, -1, L0_out_dist[6], L0_out_id[6], L0_out_dist[7], L0_out_id[7], L1_out_dist[3], L1_out_id[3] )
        .invoke( merge_dual_streams, -1, 8, -1, L0_out_dist[8], L0_out_id[8], L0_out_dist[9], L0_out_id[9], L1_out_dist[4], L1_out_id[4] )
        .invoke( merge_dual_streams, -1, 10, -1, L0_out_dist[10], L0_out_id[10], L0_out_dist[11], L0_out_id[11], L1_out_dist[5], L1_out_id[5] )
        .invoke( merge_trio_streams, -1, 12, -1, L0_out_dist[12], L0_out_id[12], L0_out_dist[13], L0_out_id[13], L0_out_dist[14], L0_out_id[14], L1_out_dist[6], L1_out_id[6] )

        .invoke( merge_dual_streams, -1, 0, 0, L1_out_dist[0], L1_out_id[0], L1_out_dist[1], L1_out_id[1], L2_out_dist[0], L2_out_id[0] )
        .invoke( merge_dual_streams, -1, 2, 0, L1_out_dist[2], L1_out_id[2], L1_out_dist[3], L1_out_id[3], L2_out_dist[1], L2_out_id[1] )
        .invoke( merge_trio_streams, -1, 4, 0, L1_out_dist[4], L1_out_id[4], L1_out_dist[5], L1_out_id[5], L1_out_dist[6], L1_out_id[6], L2_out_dist[2], L2_out_id[2] )

        .invoke( merge_trio_streams_FINAL, -1, 0, 1, L2_out_dist[0], L2_out_id[0], L2_out_dist[1], L2_out_id[1], L2_out_dist[2], L2_out_id[2], final_out_dist, final_out_id);
}
