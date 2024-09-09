#include "ap_int.h"
#include "ap_axi_sdata.h"
#include <tapa.h>
#include <inttypes.h>
#include <stdlib.h>


// CEIL_DIVISION(X, Y) = ceil(x/y).
#define CEIL_DIVISION(X, Y) ( (X-1)/Y + 1 )
// ROUND_TO_NEXT_MULTIPLE(X, Y) rounds X up to the nearest multiple of Y.
#define ROUND_TO_NEXT_MULTIPLE(X, Y) (CEIL_DIVISION(X,Y) * Y)


const int IWIDTH = 512;
#define INTERFACE_WIDTH ap_uint<IWIDTH>
const int  INPUT_DIM = 2;
const int  TOP = 10;
#define NUM_SP_PTS (4194304)
#define DISTANCE_METRIC (1)
#define NUM_PE (8)

#define DATA_TYPE_TOTAL_SZ 32
#define DATA_TYPE float
#define LOCAL_DIST_SZ   (32)
#define LOCAL_DIST_DTYPE float
#define TRANSFER_TYPE ap_uint<DATA_TYPE_TOTAL_SZ>

/***************************************************************/

// L2I = Local to Interface
const int L2I_FACTOR_W = CEIL_DIVISION( IWIDTH, (INPUT_DIM * LOCAL_DIST_SZ) );
// D2L = Data_Type to Local
const int D2L_FACTOR_W = CEIL_DIVISION(LOCAL_DIST_SZ , DATA_TYPE_TOTAL_SZ);
// D2I = Data_Type to Interface
const int D2I_FACTOR_W = CEIL_DIVISION(IWIDTH, (INPUT_DIM * DATA_TYPE_TOTAL_SZ));
// I2D = Interface to Data_type
const int I2D_FACTOR_W = CEIL_DIVISION( (INPUT_DIM * DATA_TYPE_TOTAL_SZ), IWIDTH);
// // DEBUG NOTE: BW_FACTOR = 1.1349753694581282
#define USING_LTYPES 1
#define USING_SEGMENTS (1)
#define NUM_SEGMENTS (L2I_FACTOR_W * 2)

// Round up to the nearest multiple, because otherwise some logic breaks (incorrect sizes => bad logic in edgecases)
#define NUM_SP_PTS_PER_KRNL_PADDED ROUND_TO_NEXT_MULTIPLE(CEIL_DIVISION(NUM_SP_PTS, NUM_PE), (NUM_SEGMENTS*D2I_FACTOR_W))
#define NUM_BITS_PER_KRNL_PADDED (NUM_SP_PTS_PER_KRNL_PADDED * DATA_TYPE_TOTAL_SZ * INPUT_DIM)

// We partition the input points, so each PE gets it's own partition, to maximize parallelization.
const int PARTITION_LEN_IN_I = (NUM_BITS_PER_KRNL_PADDED / IWIDTH);
const int PARTITION_LEN_IN_D = (NUM_BITS_PER_KRNL_PADDED / (INPUT_DIM * DATA_TYPE_TOTAL_SZ));
const int PARTITION_LEN_IN_L = (NUM_BITS_PER_KRNL_PADDED / (INPUT_DIM * LOCAL_DIST_SZ));
// We name each sub-array of the local_distance arrays a "segment".
#define SEGMENT_SIZE_IN_I (PARTITION_LEN_IN_I / NUM_SEGMENTS)
#define SEGMENT_SIZE_IN_L (PARTITION_LEN_IN_L / NUM_SEGMENTS)
#define SEGMENT_SIZE_IN_D (PARTITION_LEN_IN_D / NUM_SEGMENTS)

//const int SWIDTH = DATA_TYPE_TOTAL_SZ;
//typedef ap_axiu<SWIDTH, 0, 0, 0> pkt;
//typedef ap_axiu<32, 0, 0, 0>    id_pkt;
//#define STREAM_WIDTH ap_uint<SWIDTH>

const int NUM_FEATURES_PER_READ = (IWIDTH/DATA_TYPE_TOTAL_SZ);
const int QUERY_FEATURE_RESERVE = (128);
#define QUERY_DATA_RESERVE (QUERY_FEATURE_RESERVE / NUM_FEATURES_PER_READ)
#define MAX_DATA_TYPE_VAL (3.402823e+38f)
#define FLOOR_SQRT_MAX_DATA_TYPE_VAL (1.8446742e+19f)
