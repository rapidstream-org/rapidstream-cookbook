
#ifndef __VADD_BW_H__
#define __VADD_BW_H__
#include <cstdint>

#include <tapa.h>
#include <ap_int.h>

typedef ap_uint<512> bit512;

void bandwidth23(
  tapa::mmap<bit512> ch_0,
  tapa::mmap<bit512> ch_1,
  tapa::mmap<bit512> ch_2,
  tapa::mmap<bit512> ch_3,
  tapa::mmap<bit512> ch_4,
  tapa::mmap<bit512> ch_5,
  tapa::mmap<bit512> ch_6,
  tapa::mmap<bit512> ch_7,
  tapa::mmap<bit512> ch_8,
  tapa::mmap<bit512> ch_9,
  tapa::mmap<bit512> ch_10,
  tapa::mmap<bit512> ch_11,
  tapa::mmap<bit512> ch_12,
  tapa::mmap<bit512> ch_13,
  tapa::mmap<bit512> ch_14,
  tapa::mmap<bit512> ch_15,
  tapa::mmap<bit512> ch_16,
  tapa::mmap<bit512> ch_17,
  tapa::mmap<bit512> ch_18,
  tapa::mmap<bit512> ch_19,
  tapa::mmap<bit512> ch_20,
  tapa::mmap<bit512> ch_21,
  tapa::mmap<bit512> ch_22,
  uint64_t n);

#endif
