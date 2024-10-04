
#ifndef __VADD_BW_H__
#define __VADD_BW_H__
#include <cstdint>

#include <tapa.h>
#include <ap_int.h>

typedef ap_uint<512> bit512;

void bandwidth52(
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
  tapa::mmap<bit512> ch_23,
  tapa::mmap<bit512> ch_24,
  tapa::mmap<bit512> ch_25,
  tapa::mmap<bit512> ch_26,
  tapa::mmap<bit512> ch_27,
  tapa::mmap<bit512> ch_28,
  tapa::mmap<bit512> ch_29,
  tapa::mmap<bit512> ch_30,
  tapa::mmap<bit512> ch_31,
  tapa::mmap<bit512> ch_32,
  tapa::mmap<bit512> ch_33,
  tapa::mmap<bit512> ch_34,
  tapa::mmap<bit512> ch_35,
  tapa::mmap<bit512> ch_36,
  tapa::mmap<bit512> ch_37,
  tapa::mmap<bit512> ch_38,
  tapa::mmap<bit512> ch_39,
  tapa::mmap<bit512> ch_40,
  tapa::mmap<bit512> ch_41,
  tapa::mmap<bit512> ch_42,
  tapa::mmap<bit512> ch_43,
  tapa::mmap<bit512> ch_44,
  tapa::mmap<bit512> ch_45,
  tapa::mmap<bit512> ch_46,
  tapa::mmap<bit512> ch_47,
  tapa::mmap<bit512> ch_48,
  tapa::mmap<bit512> ch_49,
  tapa::mmap<bit512> ch_50,
  tapa::mmap<bit512> ch_51,
  uint64_t n);

#endif
