// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <ap_int.h>
#include <hls_stream.h>

typedef float data_t;
#define I 208
#define J 384
#define K 256


/* Data Type */
typedef ap_uint<512> A_t16;
typedef ap_uint<256> A_t8;
typedef ap_uint<512> B_t16;
typedef ap_uint<256> B_t8;
typedef ap_uint<512> C_t16;
typedef ap_uint<64> C_t2;
/* Data Type */

extern "C" { void kernel3(A_t16 *A, B_t16 *B, C_t16 *C); }
