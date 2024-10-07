
#ifndef __VADD_BW_H__
#define __VADD_BW_H__
#include <cstdint>

#include <tapa.h>
#include <ap_int.h>

typedef ap_uint<512> bit512;

void bandwidth4(
  tapa::mmap<bit512> ch_0,
  tapa::mmap<bit512> ch_1,
  tapa::mmap<bit512> ch_2,
  tapa::mmap<bit512> ch_3,
  uint64_t n);

#endif
