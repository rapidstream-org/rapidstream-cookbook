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



extern "C" { void bandwidth23(
    bit512* ch_0,
    bit512* ch_1,
    bit512* ch_2,
    bit512* ch_3,
    bit512* ch_4,
    bit512* ch_5,
    bit512* ch_6,
    bit512* ch_7,
    bit512* ch_8,
    bit512* ch_9,
    bit512* ch_10,
    bit512* ch_11,
    bit512* ch_12,
    bit512* ch_13,
    bit512* ch_14,
    bit512* ch_15,
    bit512* ch_16,
    bit512* ch_17,
    bit512* ch_18,
    bit512* ch_19,
    bit512* ch_20,
    bit512* ch_21,
    bit512* ch_22,
    long n); }
