/*===============================================================*/
/*                                                               */
/*                          typedefs.h                           */
/*                                                               */
/*           Constant definitions and typedefs for host.         */
/*                                                               */
/*===============================================================*/
#ifndef __TYPEDEFS_H__
#define __TYPEDEFS_H__

#include <cstdint>
#include <tapa.h>

// dataset information
#define NUM_TRAINING  18000
#define CLASS_SIZE    1800
#define NUM_TEST      2000
#define DIGIT_WIDTH   4
#define PAR_FACTOR_NEW 20
// typedefs
typedef unsigned long long DigitType;
typedef unsigned char      LabelType;

#ifdef OCL
  #include <string>
  // target device
  // change here to map to a different device
  const std::string TARGET_DEVICE = "xilinx:aws-vu9p-f1:4ddr-xpr-2pr:4.0";
#endif

  #include "ap_int.h"
  #include <ap_axi_sdata.h>
  typedef ap_uint<512> bit512;
  typedef ap_uint<128> bit128;
  typedef ap_uint<64>  bit64;
  typedef ap_uint<32>  bit32;
  typedef ap_uint<16>  bit16;
  typedef ap_uint<8>   bit8;
  // sdsoc wide vector type
  typedef ap_uint<256>  WholeDigitType;

// parameters
#define K_CONST 3
#define PAR_FACTOR 40
#include <hls_stream.h>


#define CONFIG_SIZE 4
#define INPUT_SIZE ((NUM_TRAINING + NUM_TEST) * 8 / 16)
#define OUTPUT_SIZE (NUM_TEST)
#define DEBUG_SIZE 28

#endif
