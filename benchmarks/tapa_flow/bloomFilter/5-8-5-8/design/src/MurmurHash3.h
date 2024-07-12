#ifndef _MURMURHASH3_H_
#define _MURMURHASH3_H_
//#include <hls_math.h>
#include <stdint.h>
#include <inttypes.h>
#include <ap_int.h>
#include <tapa.h>


/*****************************/
// MACROS USED FOR CALCULATIONS
#define CEIL_DIVISION(X, Y) ( (X-1)/Y + 1)
// Power of 2 rounding : https://stackoverflow.com/questions/466204/rounding-up-to-next-power-of-2
#define K_MSH_(X,Y)             ((X-1) >> Y)
#define K_R1_(X)                ( K_MSH_(X,0)   | K_MSH_(X, 1) )
#define K_R2_(X)                ( K_R1_(X)      | (K_R1_(X) >> 2) )
#define K_R3_(X)                ( K_R2_(X)      | (K_R2_(X) >> 4) )
#define K_R4_(X)                ( K_R3_(X)      | (K_R3_(X) >> 8) )
#define K_R5_(X)                ( K_R4_(X)      | (K_R4_(X) >> 16 ) )
#define ROUND_UP_TO_NEXT_POW_TWO(X)   (K_R5_(X))+1
/*****************************/

/*****************************/
// CONFIGURE ME!
#define MULTI_STREAMS_ENABLED (1)
#define ENABLE_PERF_CTRS (0)
#define NUM_HASH (5)

#define NAIVE_MULTISTREAM (0)

#ifndef __SYNTHESIS__
    //#define __DO_DEBUG_PRINTS__
    #define __DO_THIS_DEBUG_PRINTS__
#endif
/*****************************/

// NOTE: IF THE BV_LENGTH IS NOT A POWER OF TWO, SOME MODULES MAY ACHIEVE POOR II.

#define NUM_DESIRED_INPUT_KEYS (1024*1024*8*NUM_STM)
#define BV_DESIRED_LENGTH ((1024*1024*4)*NUM_HASH)

#define NUM_POPULATION_INPUTS (NUM_DESIRED_INPUT_KEYS>>8)

#define KEY_BITWIDTH            (32)
const int HASHONLY_BITWIDTH     = 32;
const int BV_PACKED_BITWIDTH    = 32; //On-chip memory for BV, packing this many bits into one cell
#define BV_LOAD_BITWIDTH        (BV_PACKED_BITWIDTH * NUM_HASH)
#define OUT_PACKED_BITWIDTH     (KEY_BITWIDTH)
const int BIT_BITWIDTH          = 1;
#define KEY_SIZE_IN_BYTES       (KEY_BITWIDTH / 8)
#define KEY_DTYPE               ap_uint<KEY_BITWIDTH>
#define HASHONLY_DTYPE          ap_uint<HASHONLY_BITWIDTH>
#define BV_PACKED_DTYPE         ap_uint<BV_PACKED_BITWIDTH>
#define OUT_PACKED_DTYPE        ap_uint<OUT_PACKED_BITWIDTH>
#define BIT_DTYPE               ap_uint<BIT_BITWIDTH>

typedef struct {
    KEY_DTYPE   k0;
    KEY_DTYPE   k1;
} TWOKEY_DTYPE;

typedef struct {
    BV_PACKED_DTYPE section0;

    BV_PACKED_DTYPE section1;

    BV_PACKED_DTYPE section2;

    BV_PACKED_DTYPE section3;

    BV_PACKED_DTYPE section4;

    BV_PACKED_DTYPE padding5;
    BV_PACKED_DTYPE padding6;
    BV_PACKED_DTYPE padding7;

    #if NUM_HASH != 5
    crash_compilation();
    #endif
} BV_LOAD_DTYPE;

#if ENABLE_PERF_CTRS
    // For each arb-ratemonitor
    // For each shuffle unit
    // For each query unit
    #define NUM_PERFCTRS ((NUM_ARBITER_ATOMS*BV_NUM_PARTITIONS) + (NUM_HASH) + (1))

    #define PERFCTR_DTYPE uint64_t

    // Make "enough" space in the buffer for the performance counter to give info.
    #define NUM_PERFCTR_OUTPUTS (8)
#endif

#if MULTI_STREAMS_ENABLED
    #define BV_NUM_PARTITIONS (8) // each sub bv is further partitioned into this chunks
    #define NUM_STM (5)

    #define SHUFFLEBUF_SZ (8)   // Number of buffered elements we can have for each hash/partition, in the shuffle buffer.

    #define DEBUG_ARBITER_SINK  (0)

    #define USING_HIER_ARBITER  (0)
    #define USE_SPLIT_QUERY (1)

    const int STRM_IDX_BITWIDTH = 8;
    const int INPUT_IDX_BITWIDTH = 24;
    const int MAX_INPUT_IDX = ( 1<<(INPUT_IDX_BITWIDTH) ) - 1;
    const int METADATA_BITWIDTH = INPUT_IDX_BITWIDTH + STRM_IDX_BITWIDTH;
    const int MAX_STRM_IDX = ( 1<<(STRM_IDX_BITWIDTH) ) - 1;
    const int PACKED_HASH_BITWIDTH = HASHONLY_BITWIDTH + METADATA_BITWIDTH;
    const int BV_PLUS_METADATA_BITWIDTH = BIT_BITWIDTH + METADATA_BITWIDTH;
    const int BV_PLUS_IIDX_BITWIDTH     = BIT_BITWIDTH + INPUT_IDX_BITWIDTH;

    #define STRM_IDX_DTYPE      ap_uint<STRM_IDX_BITWIDTH>
    #define INPUT_IDX_DTYPE     ap_uint<INPUT_IDX_BITWIDTH>
    /************************/
    //// Packed datatypes.  Packed as follows (MSB to LSB): [STRM_IDX, INPUT_IDX, HASH_VALUE]
    //#define PACKED_HASH_DTYPE   ap_uint<PACKED_HASH_BITWIDTH>
    //#define BV_PLUS_METADATA_PACKED_DTYPE     ap_uint<BV_PLUS_METADATA_BITWIDTH>
    //#define METADATA_DTYPE      ap_uint<METADATA_BITWIDTH>

    typedef struct {
        INPUT_IDX_DTYPE     iidx;
        STRM_IDX_DTYPE      sidx;
    } METADATA_DTYPE;

    typedef struct {
        BIT_DTYPE           bv_val;
        METADATA_DTYPE      md;
    } BV_PLUS_METADATA_PACKED_DTYPE;

    typedef struct {
        BIT_DTYPE           bv_val;
        INPUT_IDX_DTYPE     iidx;
    } BV_PLUS_IIDX_PACKED_DTYPE;

    typedef struct {
        HASHONLY_DTYPE      hash;
        METADATA_DTYPE      md;
    } PACKED_HASH_DTYPE;
    /************************/
    const int _BV_ROUNDING_FACTOR_ = NUM_HASH * BV_PACKED_BITWIDTH * BV_NUM_PARTITIONS;
    const int BV_LENGTH = CEIL_DIVISION(BV_DESIRED_LENGTH, _BV_ROUNDING_FACTOR_) * _BV_ROUNDING_FACTOR_;

    #define BV_NUM_BRAM_PARTITIONS               CEIL_DIVISION(BV_NUM_PARTITIONS, 2)
    #define BV_NUM_URAM_PARTITIONS               (BV_NUM_PARTITIONS / 2)

    #define BV_NUM_LOADS                            CEIL_DIVISION(BV_LENGTH, BV_LOAD_BITWIDTH)
    #define BV_SECTION_LENGTH                       CEIL_DIVISION(BV_LENGTH, NUM_HASH)
    #define BV_SECTION_LENGTH_IN_PACKED_ELEMS       CEIL_DIVISION(BV_LENGTH, (NUM_HASH*BV_PACKED_BITWIDTH))
    #define BV_PARTITION_LENGTH                     CEIL_DIVISION(BV_LENGTH, (NUM_HASH*BV_NUM_PARTITIONS))
    #define BV_PARTITION_LENGTH_IN_PACKED_ELEMS     CEIL_DIVISION(BV_LENGTH, (NUM_HASH*BV_PACKED_BITWIDTH*BV_NUM_PARTITIONS))

#else // MULTI_STREAMS_ENABLED
    #define NUM_STM (1)
    #define BV_NUM_PARTITIONS (1)

#endif // MULTI_STREAMS_ENABLED


typedef struct {
    KEY_DTYPE    s0_k0;
    KEY_DTYPE    s0_k1;

    KEY_DTYPE    s1_k0;
    KEY_DTYPE    s1_k1;

    KEY_DTYPE    s2_k0;
    KEY_DTYPE    s2_k1;

    KEY_DTYPE    s3_k0;
    KEY_DTYPE    s3_k1;

    KEY_DTYPE    s4_k0;
    KEY_DTYPE    s4_k1;

    KEY_DTYPE    padding_5_k0;
    KEY_DTYPE    padding_5_k1;

    KEY_DTYPE    padding_6_k0;
    KEY_DTYPE    padding_6_k1;

    KEY_DTYPE    padding_7_k0;
    KEY_DTYPE    padding_7_k1;

    #if NUM_STM != 5
    crash on purpose(,
    #endif
} LOAD_DTYPE;
#if KEY_BITWIDTH != 32
crash on purpose(,
We need to add support for different key-bitwidths in the LOAD_DTYPE!!
#endif
// This naming is potentially confusing - we datapack TWICE.
// Within each key-stream we pack 32 elements together.
// Then, we coalesce among key-streams.
typedef struct {
    OUT_PACKED_DTYPE    s0_k0;
    OUT_PACKED_DTYPE    s0_k1;

    OUT_PACKED_DTYPE    s1_k0;
    OUT_PACKED_DTYPE    s1_k1;

    OUT_PACKED_DTYPE    s2_k0;
    OUT_PACKED_DTYPE    s2_k1;

    OUT_PACKED_DTYPE    s3_k0;
    OUT_PACKED_DTYPE    s3_k1;

    OUT_PACKED_DTYPE    s4_k0;
    OUT_PACKED_DTYPE    s4_k1;

    OUT_PACKED_DTYPE    padding_5_k0;
    OUT_PACKED_DTYPE    padding_5_k1;

    OUT_PACKED_DTYPE    padding_6_k0;
    OUT_PACKED_DTYPE    padding_6_k1;

    OUT_PACKED_DTYPE    padding_7_k0;
    OUT_PACKED_DTYPE    padding_7_k1;

    #if NUM_STM != 5
    crash on purpose(,
    #endif
} STORE_DTYPE;
#if OUT_PACKED_BITWIDTH!= 32
crash on purpose(,
We need to add support for different out-packing-bitwidths in the STORE_DTYPE!!
#endif


/***************************************************/
/***************************************************/
/***************************************************/

/* STM_DEPTH: In the worst case, the arbiter can send all of the hashed values to the same FIFO.
 *  So that FIFO will get filled, and the shuffle unit wont be able to handle it.
 *  We need at least NUM_STM FIFO elements between arbiter and shuffle. */
#if (CEIL_DIVISION(NUM_STM, 2) < 2)
    #define STM_DEPTH (2)   // If less than 2, CSIM is very slow.
#else
    #define STM_DEPTH (CEIL_DIVISION(NUM_STM, 2))
#endif //(CEIL_DIVISION(NUM_STM, 2) < 2)

const int KEYS_PER_STM              = ROUND_UP_TO_NEXT_POW_TWO( CEIL_DIVISION(NUM_DESIRED_INPUT_KEYS, NUM_STM) );
const int KEYPAIRS_PER_STM          = KEYS_PER_STM/2;   // 2 reads per cycle (2port bram)
const int TOTAL_NUM_KEYINPUT        = KEYS_PER_STM * NUM_STM;
const int PACKED_OUTPUTS_PER_STM    = CEIL_DIVISION(KEYPAIRS_PER_STM, OUT_PACKED_BITWIDTH);
const int PACKED_OUTPAIRS_PER_STM   = PACKED_OUTPUTS_PER_STM * 2;   // same number of outputs but half the stms if we pair them
const int NUM_PACKED_OUTPUTS        = PACKED_OUTPUTS_PER_STM * NUM_STM * 2;   // 2 reads per cycle (2port bram)

#define NUM_ARBITER_ATOMS       (NUM_STM - 1)
typedef struct {
    INPUT_IDX_DTYPE strm0_out_idx;
    INPUT_IDX_DTYPE strm1_out_idx;
    INPUT_IDX_DTYPE strm2_out_idx;
    INPUT_IDX_DTYPE strm3_out_idx;
    INPUT_IDX_DTYPE strm4_out_idx;
    #if NUM_STM != 5
    crash!
    #endif
} RATEMON_FEEDBACK_DTYPE;


#endif  // _MURMURHASH3_H_
