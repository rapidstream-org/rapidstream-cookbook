#include <algorithm>
#include <cstring>
#include <iostream>
#include <string>
#include <unistd.h>
#include <vector>
#include <cmath>
#include <stdio.h>
#include <set>
// This file is required for OpenCL C++ wrapper APIs
//#include "xcl2.hpp"

#include "MurmurHash3.h"
#include "SW_MurmurHash3.cpp"

#ifndef NAIVE_MULTISTREAM
void crash_compilation(
    crash compilation
    You need to define NAIVE_MULTISTREAM when compiling!
}
#endif

using std::chrono::high_resolution_clock;
DEFINE_string(bitstream, "", "Path to bitstream file. Run SW_EMU if empty.");


// https://stackoverflow.com/questions/9907160/how-to-convert-enum-names-to-string-in-c
#define __PREPROC__(FUNC) \
    FUNC(INPUT_GEN_MODE_RANDOM), \
    FUNC(INPUT_GEN_MODE_NO_CLASH), \
    FUNC(INPUT_GEN_MODE_CYCLIC_CLASH), \
    FUNC(INPUT_GEN_MODE_ALL_CLASH)

#define GENERATE_ENUM(ENUM) ENUM
#define GENERATE_STRING(STRING) #STRING

typedef enum {
    __PREPROC__(GENERATE_ENUM)
} INPUT_GEN_MODE_ENUM;
static const char *INPUT_GEN_MODE_STRINGS[] = {
    __PREPROC__(GENERATE_STRING)
};

void workload(
    tapa::mmap<BV_LOAD_DTYPE>       input_bv
    ,tapa::mmap<LOAD_DTYPE>         key_in
    ,tapa::mmap<STORE_DTYPE>        out_bits
    #if NUM_STM != 4
    , crash! //crash on purpose; we may need more streams.
    #endif

    #if ENABLE_PERF_CTRS
    ,tapa::mmap<PERFCTR_DTYPE>       perfctr_mmap
    #endif

     //Add a dummy, useless variable because TAPA fast-cosim doesnt work without it.
    ,int UNUSED_DUMMY
)


;
void datapack_bv(
    BIT_DTYPE *bv
    ,BV_LOAD_DTYPE *packed_bv
) {
    std::vector<BV_PACKED_DTYPE> bv_section0(BV_SECTION_LENGTH_IN_PACKED_ELEMS);
    std::vector<BV_PACKED_DTYPE> bv_section1(BV_SECTION_LENGTH_IN_PACKED_ELEMS);
    std::vector<BV_PACKED_DTYPE> bv_section2(BV_SECTION_LENGTH_IN_PACKED_ELEMS);
    std::vector<BV_PACKED_DTYPE> bv_section3(BV_SECTION_LENGTH_IN_PACKED_ELEMS);
    std::vector<BV_PACKED_DTYPE> bv_section4(BV_SECTION_LENGTH_IN_PACKED_ELEMS);
    std::vector<BV_PACKED_DTYPE> bv_section5(BV_SECTION_LENGTH_IN_PACKED_ELEMS);
    std::vector<BV_PACKED_DTYPE> bv_section6(BV_SECTION_LENGTH_IN_PACKED_ELEMS);
    // Datapack the bitvector
    for (int i = 0; i < BV_LENGTH; ++i) {
        int section_idx     = (i/BV_PACKED_BITWIDTH) / BV_SECTION_LENGTH_IN_PACKED_ELEMS;
        int array_idx       = (i/BV_PACKED_BITWIDTH) % BV_SECTION_LENGTH_IN_PACKED_ELEMS;
        int bit_idx         = (i%BV_PACKED_BITWIDTH);

        if (section_idx == 0) {
            bv_section0[array_idx].range(bit_idx, bit_idx) = bv[i].range(0, 0);
        }
        else if (section_idx == 1) {
            bv_section1[array_idx].range(bit_idx, bit_idx) = bv[i].range(0, 0);
        }
        else if (section_idx == 2) {
            bv_section2[array_idx].range(bit_idx, bit_idx) = bv[i].range(0, 0);
        }
        else if (section_idx == 3) {
            bv_section3[array_idx].range(bit_idx, bit_idx) = bv[i].range(0, 0);
        }
        else if (section_idx == 4) {
            bv_section4[array_idx].range(bit_idx, bit_idx) = bv[i].range(0, 0);
        }
        else if (section_idx == 5) {
            bv_section5[array_idx].range(bit_idx, bit_idx) = bv[i].range(0, 0);
        }
        else if (section_idx == 6) {
            bv_section6[array_idx].range(bit_idx, bit_idx) = bv[i].range(0, 0);
        }
        else {
            printf("Something went wrong with the BV datapacking computation...\n");
            exit(-1);
        }
        #if NUM_HASH != 7
        crash();
        #endif
    }

    // Pack the sections into the final BV.
    for (int i = 0; i < BV_SECTION_LENGTH_IN_PACKED_ELEMS; ++i) {
        packed_bv[i].section0 = bv_section0[i];
        packed_bv[i].section1 = bv_section1[i];
        packed_bv[i].section2 = bv_section2[i];
        packed_bv[i].section3 = bv_section3[i];
        packed_bv[i].section4 = bv_section4[i];
        packed_bv[i].section5 = bv_section5[i];
        packed_bv[i].section6 = bv_section6[i];
        #if NUM_HASH != 7
        crash();
        #endif
    }
}

bool min(int in1, int in2) {
    return (in1 < in2 ? in1 : in2);
}

uint32_t bv_size(float fp, int insert_num){
    //fp: false positive rate, number of insertion to bit vector, the bit vector size m should be: m = -(insert_num) * ln(fp) / ( (ln2)^2 )
    float tmp1 = -(insert_num) * (log(fp)) / (log(2) * log(2) );
    int tmp2 = (int)ceil(tmp1);

    return tmp2;
}


void generate_keys(
    INPUT_GEN_MODE_ENUM     input_generation_mode
    ,KEY_DTYPE              *keys
    ,std::vector<uint32_t>  seed
) {
    const int NOT_TAKEN = -1;

    static bool     computed_unclashing_keys = 0;
    static KEY_DTYPE unclashing_keys[NUM_STM];

    int taken_by_stmidx[NUM_HASH][BV_NUM_PARTITIONS] = {};

    for (int i = 0; i < NUM_HASH; ++i) {
        for (int j = 0; j < BV_NUM_PARTITIONS; ++j) {
            taken_by_stmidx[i][j] = NOT_TAKEN;
        }
    }

    if (!computed_unclashing_keys) {
        /* For each hash function, ensure that different streams will output
         *  to different partitions.
         */
        if (input_generation_mode != INPUT_GEN_MODE_RANDOM)
        {
            if (NUM_STM > BV_NUM_PARTITIONS){
                printf("minor warning: NUM_STM > BV_NUM_PARTITIONS. Generating invalid unclashing keys.\n");
                for (int stm_idx = 0; stm_idx < NUM_STM; ++stm_idx) {
                    unclashing_keys[stm_idx] = 5;
                }
            }
            else {
                for (int stm_idx = 0; stm_idx < NUM_STM; ++stm_idx)
                {
                    int found = 0;
                    KEY_DTYPE proposed_key = 0;
                    int taken_partition_idces[NUM_HASH] = {};

                    while (!found) {
                        found = 1;
                        proposed_key++;
                        for (int i = 0; i < NUM_HASH; ++i) {
                            taken_partition_idces[i] = 0;
                        }

                        for (int hash_idx = 0; hash_idx < NUM_HASH; ++hash_idx) {
                            uint32_t bv_index = SW_MurmurHash3_x86_32(
                                proposed_key,
                                KEY_SIZE_IN_BYTES,
                                seed[hash_idx]
                            );
                            bv_index %= BV_SECTION_LENGTH;
                            uint32_t bv_partition_idx = bv_index / BV_PARTITION_LENGTH;

                            if (taken_by_stmidx[hash_idx][bv_partition_idx] == NOT_TAKEN) {
                                taken_partition_idces[hash_idx] = bv_partition_idx;
                            }
                            else {
                                // One stream will clash.
                                found = 0;
                            }
                        }
                    }

                    /////////
                    // FOUND.
                    unclashing_keys[stm_idx] = proposed_key;
                    for (int hash_idx = 0; hash_idx < NUM_HASH; ++hash_idx) {
                        taken_by_stmidx[hash_idx][ taken_partition_idces[hash_idx] ] = stm_idx;
                    }

                    #ifdef __DO_THIS_DEBUG_PRINTS__
                    printf("FOUND an unclashing query (%d) for stm %d\n", proposed_key.to_int(), stm_idx);
                    for (int hash_idx = 0; hash_idx < NUM_HASH; ++hash_idx) {
                        for (int pidx = 0; pidx < BV_NUM_PARTITIONS; ++pidx) {

                            if (taken_by_stmidx[hash_idx][pidx] == NOT_TAKEN) {
                                printf("%5c", '-');
                            }
                            else {
                                printf("%5d", taken_by_stmidx[hash_idx][pidx]);
                            }

                        }
                        printf("\n");
                    }
                    #endif
                }
            }
        }
        computed_unclashing_keys = 1;
    }


    if (input_generation_mode == INPUT_GEN_MODE_RANDOM) {
        for (uint32_t input_idx = 0; input_idx < TOTAL_NUM_KEYINPUT; ++input_idx) {
            KEY_DTYPE in = static_cast<KEY_DTYPE>(rand());
            keys[input_idx] = in;
        }
    }
    else if (input_generation_mode == INPUT_GEN_MODE_NO_CLASH) {
        /* Each stream sends the exact same data over and over,
         * and each stream basically has it's own dedicated partition.
         */
        for (int i=0; i < KEYPAIRS_PER_STM; ++i) {
            for (int j = 0; j < NUM_STM; ++j) {
                for (int kpidx = 0; kpidx < 2; kpidx++) {
                    keys[i*2*NUM_STM + j*2 + kpidx] = unclashing_keys[j];
                }
            }
        }
    }
    else if (input_generation_mode == INPUT_GEN_MODE_CYCLIC_CLASH) {
        /* Each input index is an N-clash, but the partitions on which
         * they clash is always cycling around.
         */
        for (int i = 0; i < KEYPAIRS_PER_STM; ++i) {
            for (int j = 0; j < NUM_STM; ++j) {
                for (int kpidx = 0; kpidx < 2; kpidx++) {
                    keys[i*2*NUM_STM + j*2 + kpidx] = unclashing_keys[i%NUM_STM];
                }
            }
        }
    }
    else if (input_generation_mode == INPUT_GEN_MODE_ALL_CLASH) {
        /* For each hash function, ensure that each stream will hash to the
         * SAME partition, so it always clashes every single time.
         */
        for (int i = 0; i < KEYPAIRS_PER_STM; ++i) {
            for (int j = 0; j < NUM_STM; ++j) {
                for (int kpidx = 0; kpidx < 2; kpidx++) {
                    keys[i*2*NUM_STM + j*2 + kpidx] = 5;
                }
            }
        }
    }
    else {
        // Crash - unsupported case.
        assert(1 == 2);
    }
}



void populate_bv(
    BIT_DTYPE *bv
    ,std::vector<uint32_t>   seed
    ,KEY_DTYPE *keys
    ,std::set<KEY_DTYPE>     &unique_inserted_keys
) {
    int input_idces_to_add[NUM_POPULATION_INPUTS];

    /* Knuth's algorithm for unique random number generation in an integer array.
     *  https://stackoverflow.com/questions/1608181/unique-random-number-generation-in-an-integer-array
     */
    for (int in = 0, im = 0;
            in < TOTAL_NUM_KEYINPUT && im < NUM_POPULATION_INPUTS;
            ++in) {
        int rn = TOTAL_NUM_KEYINPUT - in;
        int rm = NUM_POPULATION_INPUTS - im;
        if (rand() % rn < rm){
            input_idces_to_add[im++] = in;
        }
    }

    // Use those input indices to populate the BV.
    for (uint32_t i = 0; i < NUM_POPULATION_INPUTS; ++i) {
        int         add_idx = input_idces_to_add[i];
        uint32_t    bv_index = 0;

        unique_inserted_keys.insert(keys[add_idx]);

        for(int hash_idx = 0; hash_idx < NUM_HASH; hash_idx ++){
            bv_index = SW_MurmurHash3_x86_32(
                keys[add_idx],
                KEY_SIZE_IN_BYTES,  // length of each key in bytes
                seed[hash_idx]
            );
            bv_index %= BV_SECTION_LENGTH;
            bv_index += (hash_idx*BV_SECTION_LENGTH);

            bv[bv_index] = 1;


            #ifdef __DO_DEBUG_PRINTS__
            printf("HOST: Populating bit vector to have input_idx=%d be a hit. So we set bv[%d]=1.\n",
                        add_idx, bv_index
            );
            #endif
        }
    }
}


void compute_expected_outputs(
    BIT_DTYPE               *bv
    ,std::vector<uint32_t>  seed
    ,KEY_DTYPE              *keys
    ,std::set<KEY_DTYPE>    &unique_hit_keys
    ,BIT_DTYPE              *sw_results
) {
    for (uint32_t input_idx = 0; input_idx < TOTAL_NUM_KEYINPUT; ++input_idx)
    {
        uint32_t    bv_index = 0;
        BIT_DTYPE   cur_result = 1;

        for(int hash_idx = 0; hash_idx < NUM_HASH; hash_idx ++){
            bv_index = SW_MurmurHash3_x86_32(
                keys[input_idx],
                4,      // length of each key in bytes
                seed[hash_idx]
            );
            bv_index %= BV_SECTION_LENGTH;
            bv_index += (hash_idx*BV_SECTION_LENGTH);
            cur_result &= bv[bv_index];

            #ifdef __DO_DEBUG_PRINTS__
            printf("HOST: For input %d, hash #%d, this looked up BV[%d]=%d\n",
                    input_idx,
                    hash_idx,
                    bv_index,
                    bv[bv_index].to_int()
            );
            #endif
        }
        if (cur_result) {
            unique_hit_keys.insert(keys[input_idx]);
        }

        sw_results[input_idx] = cur_result;
    }

}






bool verify(
    BIT_DTYPE   *sw_results,
    BIT_DTYPE   *hw_results
) {
    const int MAX_REPORTED_FAILS = 100;
    bool match = true;
    int errcount = 0;
    int failed_indices[MAX_REPORTED_FAILS] = {0};
    int cur_failed_idx = 0;


    for (int i = 0; i < TOTAL_NUM_KEYINPUT; ++i) {
        if (hw_results[i] != sw_results[i]) {
            if (errcount < MAX_REPORTED_FAILS-1) {
                failed_indices[errcount] = i;
            }
            errcount ++;

            match = false;
        }
    }

    std::cout << "TEST " << (match ? "PASSED" : "FAILED") << std::endl;
    if (!match)
    {
        std::cout << "Num failures: " << (errcount) << std::endl;

        std::cout << "(THIS ERR REPORTING IS STILL BUGGY)"<<
                " Failed on the following indices (reporting up to the first " <<
                MAX_REPORTED_FAILS << "):" <<  std::endl;
        for (int i = 0; i < (MAX_REPORTED_FAILS); ++i) {
            std::cout << failed_indices[i] << ", ";
        }
    }

    std::cout << std::endl;

    return match;
}


#if ENABLE_PERF_CTRS
void print_perf_ctrs(PERFCTR_DTYPE* perfctrs) {
    for (int i = 0; i < NUM_PERFCTRS; ++i)
    {
        for (int j = 0; j < NUM_PERFCTR_OUTPUTS; ++j)
        {
            printf("perfctr[%5d][%5d] = %25lu\n",
                    i, j, perfctrs[i*NUM_PERFCTR_OUTPUTS + j]
            );
        }

        // CHECKING TO MAKE SURE THE CYCLES MATCH UP AS EXPECTED:
        int idx = i*NUM_PERFCTR_OUTPUTS;
        PERFCTR_DTYPE sum = perfctrs[idx + 0] +
                            perfctrs[idx + 1] +
                            perfctrs[idx + 2] +
                            perfctrs[idx + 3];

        if ( sum != perfctrs[idx + 4] )
        {
            printf("ERROR: SOMETHING IS WEIRD! My sum = %lu, total cycles = %lu\n",
                    sum, perfctrs[idx + 4]
            );
        }
        if (perfctrs[idx+0] == 0 ||
            perfctrs[idx+1] == 0 ||
            perfctrs[idx+2] == 0 ||
            perfctrs[idx+3] == 0 ||
            perfctrs[idx+4] == 0)
        {
            printf("ERROR: Why is one or more of the perfcrs zero?\n");
        }


        printf("\n");
    }
}
#endif



int reset(
    INPUT_GEN_MODE_ENUM input_generation_mode
    ,bool       do_verif
    ,KEY_DTYPE *keys
    ,BIT_DTYPE *sw_results
    ,BIT_DTYPE *bv
    ,BV_LOAD_DTYPE *packed_bv
) {
    /*
        These 3 sets are used to compute the false-pos rate.
        Think about it this way: if our input keys only contain 5 unique
        values but they look like this:
            [1, 2, 3, 4, 5, 5, 5, 5, 5...]
        and we insert (1,2,3). And suppose 4 is NOT a false-positive, but 5 IS.
            - if we don't consider unique entries and only ask "how many indices hit?"
              our false-positive rate would be 99%.
            - If we consider unique entries, then our false-positive rate will be
              50%, which is correct.
     */
    std::set<KEY_DTYPE>     unique_inserted_keys;
    std::set<KEY_DTYPE>     unique_uninserted_keys;
    std::set<KEY_DTYPE>     unique_hit_keys;

    std::vector<uint32_t> seed(NUM_HASH);
    int num_desired_hits = 0;

    // Populate the seeds, for each hash function.
    for(int hash_idx = 0; hash_idx < NUM_HASH; hash_idx ++){
        seed[hash_idx] = hash_idx;
    }

    // Initialize the bitvector to all zeroes.
    for (uint32_t bv_idx = 0; bv_idx < BV_LENGTH; bv_idx++) {
        bv[bv_idx] = 0;
    }

    // Initialize the input keys
    generate_keys(input_generation_mode, keys, seed);

    if (do_verif)
    {
        // Populate the bitvector
        populate_bv(bv, seed, keys, unique_inserted_keys);

        // Datapack the bitvector
        datapack_bv(bv, packed_bv);

        // Use the populated bitvector to calculate the ACTUAL expected outputs.
        compute_expected_outputs(bv, seed, keys, unique_hit_keys, sw_results);

        for (uint32_t input_idx = 0; input_idx < TOTAL_NUM_KEYINPUT; ++input_idx) {
            KEY_DTYPE k = keys[input_idx];

            if (unique_inserted_keys.count(k) == 0) {
                unique_uninserted_keys.insert(k);
            }
        }

        int unique_hits     = unique_hit_keys.size();
        int unique_inserts  = unique_inserted_keys.size();
        int unique_uninserted = unique_uninserted_keys.size();

        printf("The number of inserted elements is %d, but the number of HIT elements is %d.\n",
                unique_inserts,
                unique_hits
        );
        printf("Therefore, we have %d false positives out of %d uninserted .\n",
                (unique_hits - unique_inserts),
                unique_uninserted
        );

        if (unique_inserts > unique_hits) {
            printf(" SOMETHING IS WRONG WITH THE FP RATE ANALYSIS.\n");
            assert(1==2);
        }
    }


    /*********************/
    // DEBUG: print the bv.
    //#ifdef __DO_DEBUG_PRINTS__
    //for (int i = 0; i < BV_LENGTH; ++i) {
    //    printf("HOST: BV[%d] = %d\n",
    //            i, bv[i].to_int()
    //    );
    //}
    //#endif
    #ifdef __DO_DEBUG_PRINTS__
    const int START_DEBUG_PRINTS = 0;
    const int END_DEBUG_PRINTS = 3;
    for (int i = START_DEBUG_PRINTS; i < END_DEBUG_PRINTS; ++i) {
        printf("HOST: packed_BV[%d] = %x\n", i, packed_bv_0[i].to_int());
        for (int j = 0; j < BV_PACKED_BITWIDTH; ++j) {
            int total_idx = i*BV_PACKED_BITWIDTH + j;
            printf("HOST: BV[%d] = %d\n", total_idx, bv[total_idx].to_int());
        }
        printf("\n");
    }
    #endif

    return 0;
}



int main(int argc, char **argv) {
    gflags::ParseCommandLineFlags(&argc, &argv, /*remove_flags=*/true);

    bool match = 1;
    const int NUM_TESTS_TO_RUN = 10;
    int test_number = 0;
    INPUT_GEN_MODE_ENUM     gen_data_mode;

    //gen_data_mode = INPUT_GEN_MODE_RANDOM;
    //gen_data_mode = INPUT_GEN_MODE_NO_CLASH;
    gen_data_mode = INPUT_GEN_MODE_ALL_CLASH;

    // I/O Data Vectors
    std::vector<KEY_DTYPE, tapa::aligned_allocator<KEY_DTYPE>>
        keys(TOTAL_NUM_KEYINPUT);
    std::vector<BIT_DTYPE, tapa::aligned_allocator<BIT_DTYPE>>
        krnl_merged_out(TOTAL_NUM_KEYINPUT);

    std::vector<BIT_DTYPE, tapa::aligned_allocator<BIT_DTYPE>>          source_bv(BV_LENGTH);
    std::vector<BV_LOAD_DTYPE, tapa::aligned_allocator<BV_LOAD_DTYPE>>  source_PACKED_bv(BV_NUM_LOADS);
    std::vector<BIT_DTYPE>                                              sw_results(TOTAL_NUM_KEYINPUT);

    std::vector<LOAD_DTYPE, tapa::aligned_allocator<LOAD_DTYPE>>        krnl_key_in;
    std::vector<STORE_DTYPE, tapa::aligned_allocator<STORE_DTYPE>>      krnl_out;

    #if ENABLE_PERF_CTRS
    const int TOTAL_NUM_PERFCTR_OUTPUTS = NUM_PERFCTRS * NUM_PERFCTR_OUTPUTS;
    std::vector<PERFCTR_DTYPE, tapa::aligned_allocator<PERFCTR_DTYPE>>    perfctrs(TOTAL_NUM_PERFCTR_OUTPUTS);
    #endif

    // SANITY CHECKS:
    if (BV_LENGTH % BV_PACKED_BITWIDTH != 0) {
        printf("ERROR: The BV_LENGTH (%d) must be a multiple of the BV datapacking bitwidth (%d)\n",
                BV_LENGTH, BV_PACKED_BITWIDTH
        );
        exit(-1);
    }
    if (BV_NUM_BRAM_PARTITIONS + BV_NUM_URAM_PARTITIONS != BV_NUM_PARTITIONS) {
        printf("ERROR: Something went very wrong with the BV_PARTITION into BRAMs and URAMs computation.\n");
        printf("    %d, %d, %d\n",
                BV_NUM_BRAM_PARTITIONS,
                BV_NUM_URAM_PARTITIONS,
                BV_NUM_PARTITIONS
        );
        exit(-1);
    }
    if (OUT_PACKED_BITWIDTH != 32      &&
        OUT_PACKED_BITWIDTH != 64      &&
        OUT_PACKED_BITWIDTH != 128     &&
        OUT_PACKED_BITWIDTH != 256     &&
        OUT_PACKED_BITWIDTH != 512     &&
        OUT_PACKED_BITWIDTH != 1024)
    {
        printf("ERROR: The OUT_PACKED_BITWIDTH must be a power of 2, between 32 and 1024.\n");
        printf("       Otherwise Vivado will have errors.\n");
        exit(-1);
    }

    while (test_number < NUM_TESTS_TO_RUN)
    //while (match && test_number < NUM_TESTS_TO_RUN)
    {
        // Seed the random number generator so we have replicatable input vectors.
        srand(1+test_number++);

        // Only do verif if were using a random input sequence
        bool do_verif = 0;

        if (test_number == 1) {
            gen_data_mode = INPUT_GEN_MODE_NO_CLASH;
        }
        else if (test_number == 2) {
            gen_data_mode = INPUT_GEN_MODE_CYCLIC_CLASH;
        }
        else if (test_number == 3) {
            gen_data_mode = INPUT_GEN_MODE_ALL_CLASH;
        }
        else {
            gen_data_mode = INPUT_GEN_MODE_RANDOM;

            if (test_number == 4) {
                do_verif = 1;
            }
        }

        ///////////////////////////////////
        // DEBUG PRINTS:
        printf("KDEBUG: TOTAL_NUM_KEYINPUT is %d\n", TOTAL_NUM_KEYINPUT);
        printf("KDEBUG: NUM_POPULATION_INPUTS is %d\n", NUM_POPULATION_INPUTS);
        printf("KDEBUG: BV_LENGTH is %d\n", BV_LENGTH);
        printf("KDEBUG: BV_SECTION_LENGTH is %d\n",
                    BV_SECTION_LENGTH);
        printf("KDEBUG: BV_PARTITION_LENGTH_IN_PACKED_ELEMS is %d\n",
                    BV_PARTITION_LENGTH_IN_PACKED_ELEMS);

        printf("\n");
        printf("KDEBUG: NUM_HASH is %d\n", NUM_HASH);
        printf("KDEBUG: BV_NUM_PARTITIONS is %d\n", BV_NUM_PARTITIONS);
        printf("KDEBUG: NUM_STM is %d\n", NUM_STM);
        printf("KDEBUG: SHUFFLEBUF_SZ is %d\n", SHUFFLEBUF_SZ);
        printf("\n");
        printf("KDEBUG: STM_DEPTH is %d\n\n", STM_DEPTH);

        #if ENABLE_PERF_CTRS
        printf("WARNING! PERFORMANCE COUNTERS ARE ENABLED! WARNING!\n");
        #endif
        if (NAIVE_MULTISTREAM) {
            printf("WARNING! using NAIVE multistream! WARNING!\n");
        }
        else {
            printf("Using our BV-sharing multistream design.\n");
        }


        if (gen_data_mode != INPUT_GEN_MODE_RANDOM) {
            printf("WARNING: ");
        }
        printf("gen_data_mode IS %s\n\n", INPUT_GEN_MODE_STRINGS[gen_data_mode]);

        ///////////////////////////////////

        krnl_key_in.clear();
        krnl_out.clear();

        #if ENABLE_PERF_CTRS
        perfctrs.clear();
        for (int i = 0; i < TOTAL_NUM_PERFCTR_OUTPUTS; ++i) {
            perfctrs.push_back(987654321);
        }
        #endif

        reset(
            gen_data_mode
            ,do_verif
            ,keys.data()
            ,sw_results.data()
            ,source_bv.data()
            ,source_PACKED_bv.data()
        );

        // Pack the key inputs for the kernel.
        for (int i = 0; i < KEYPAIRS_PER_STM; ++i)
        {
            LOAD_DTYPE cur_packed_input;

            cur_packed_input.s0_k0 = keys[i*2*NUM_STM + 2*0 + 0];
            cur_packed_input.s0_k1 = keys[i*2*NUM_STM + 2*0 + 1];

            cur_packed_input.s1_k0 = keys[i*2*NUM_STM + 2*1 + 0];
            cur_packed_input.s1_k1 = keys[i*2*NUM_STM + 2*1 + 1];

            cur_packed_input.s2_k0 = keys[i*2*NUM_STM + 2*2 + 0];
            cur_packed_input.s2_k1 = keys[i*2*NUM_STM + 2*2 + 1];

            cur_packed_input.s3_k0 = keys[i*2*NUM_STM + 2*3 + 0];
            cur_packed_input.s3_k1 = keys[i*2*NUM_STM + 2*3 + 1];

            #if NUM_STM != 4
            crash on purpose(,
            #endif

            krnl_key_in.push_back(cur_packed_input);
        }
        for (int j = 0; j < PACKED_OUTPUTS_PER_STM; ++j) {
            // Fill the kernels output bufs with some initial values to help debug.
            STORE_DTYPE dummy;
            dummy.s0_k0 = 123123;
            dummy.s0_k1 = 123123;
            dummy.s1_k0 = 123123;
            dummy.s1_k1 = 123123;
            dummy.s2_k0 = 123123;
            dummy.s2_k1 = 123123;
            dummy.s3_k0 = 123123;
            dummy.s3_k1 = 123123;
            krnl_out.push_back(dummy);
        }

        auto start = high_resolution_clock::now();
        int64_t kernel_time_ns = tapa::invoke(
            workload,
            FLAGS_bitstream,
             tapa::read_only_mmap<BV_LOAD_DTYPE>(source_PACKED_bv)

            ,tapa::read_only_mmap<LOAD_DTYPE>(krnl_key_in)
            ,tapa::write_only_mmap<STORE_DTYPE>(krnl_out)

            #if NUM_STM != 4
            , ! //crash on purpose; we need to manually add more streams.
            #endif

            #if ENABLE_PERF_CTRS
            ,tapa::write_only_mmap<PERFCTR_DTYPE>(perfctrs)
            #endif

            , 12345
        );

        std::cout << "KERNEL time: " << kernel_time_ns * 1e-9 << " s" << std::endl;

        if (do_verif){
            // Merge the kernel outputs into one big array.
            int out_bit_idx = 0;
            for (int i = 0; i < PACKED_OUTPUTS_PER_STM; ++i)
            {
                for (int j = 0; j < OUT_PACKED_BITWIDTH; ++j)
                {
                        krnl_merged_out[out_bit_idx++].range(0, 0) =
                            krnl_out[i].s0_k0.range(j, j);
                        krnl_merged_out[out_bit_idx++].range(0, 0) =
                            krnl_out[i].s0_k1.range(j, j);

                        krnl_merged_out[out_bit_idx++].range(0, 0) =
                            krnl_out[i].s1_k0.range(j, j);
                        krnl_merged_out[out_bit_idx++].range(0, 0) =
                            krnl_out[i].s1_k1.range(j, j);

                        krnl_merged_out[out_bit_idx++].range(0, 0) =
                            krnl_out[i].s2_k0.range(j, j);
                        krnl_merged_out[out_bit_idx++].range(0, 0) =
                            krnl_out[i].s2_k1.range(j, j);

                        krnl_merged_out[out_bit_idx++].range(0, 0) =
                            krnl_out[i].s3_k0.range(j, j);
                        krnl_merged_out[out_bit_idx++].range(0, 0) =
                            krnl_out[i].s3_k1.range(j, j);

                }
            }

            match = verify(
                sw_results.data(),
                krnl_merged_out.data()
            );
        }

        std::cout << "------------------------------------------" << std::endl;
        std::cout << "------------------------------------------" << std::endl;
        std::cout << "------------------------------------------" << std::endl;
        std::cout << "------------------------------------------" << std::endl;

        #if ENABLE_PERF_CTRS
        print_perf_ctrs(perfctrs.data());
        #endif
    }

    printf("\n\n\n\n\n\n\n\nHost is now exiting.\n\n\n\n\n\n\n\n");
    return (match ? EXIT_SUCCESS : EXIT_FAILURE);
}
