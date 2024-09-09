
#ifndef __VADD_BW_H__
#define __VADD_BW_H__
#include <cstdint>

#include <tapa.h>
#include <ap_int.h>

typedef ap_uint<512> bit512;
typedef ap_uint<8> bit8;

void vadd_bw(
  tapa::mmap<const bit512> rmem0,
  tapa::mmap<const bit512> rmem1,
  tapa::mmap<const bit512> rmem2,
  tapa::mmap<const bit512> rmem3,
  tapa::mmap<const bit512> rmem4,
  tapa::mmap<const bit512> rmem5,
  tapa::mmap<const bit512> rmem6,
  tapa::mmap<const bit512> rmem7,
  tapa::mmap<const bit512> rmem8,
  tapa::mmap<const bit512> rmem9,
  tapa::mmap<const bit512> rmem10,
  tapa::mmap<const bit512> rmem11,
  tapa::mmap<const bit512> rmem12,
  tapa::mmap<const bit512> rmem13,
  tapa::mmap<const bit512> rmem14,
  tapa::mmap<const bit512> rmem15,
  tapa::mmap<const bit512> rmem16,
  tapa::mmap<const bit512> rmem17,
  tapa::mmap<const bit512> rmem18,
  tapa::mmap<const bit512> rmem19,
  tapa::mmap<const bit512> rmem20,
  tapa::mmap<const bit512> rmem21,
  tapa::mmap<const bit512> rmem22,
  tapa::mmap<const bit512> rmem23,
  tapa::mmap<const bit512> rmem24,
  tapa::mmap<const bit512> rmem25,
  tapa::mmap<const bit512> rmem26,
  tapa::mmap<const bit512> rmem27,
  tapa::mmap<const bit512> rmem28,
  tapa::mmap<const bit512> rmem29,
  tapa::mmap<bit512>       wmem0,
  uint64_t n);

#endif
