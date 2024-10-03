// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <ap_int.h>
#include <hls_stream.h>


/* Data Type */
typedef ap_uint<512> bit512;
typedef ap_uint<64> bit64;
typedef bit512 data_t ;
/* Data Type */



extern "C" { void bandwidth4(
    bit512* ch_0,
    bit512* ch_1,
    bit512* ch_2,
    bit512* ch_3,
    long n); }
