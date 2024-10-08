// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


#include <cstdlib>
#include <stdint.h>
#include <stdio.h>
#include <iostream>
#include <vector>

#include <gflags/gflags.h>
#include <tapa.h>

using std::clog;
using std::endl;
using std::vector;

#define DATA_NUM 4096

void VecAdd(tapa::mmap<const uint32_t> mem_in1, tapa::mmap<const uint32_t> mem_in2, tapa::mmap<uint32_t> mem_out);
DEFINE_string(bitstream, "", "path to bitstream file, run csim if empty");

int main(int argc, char **argv)
{
  vector<uint32_t> mem_in1(DATA_NUM);
  vector<uint32_t> mem_in2(DATA_NUM);
  vector<uint32_t> mem_out(DATA_NUM);
  vector<uint32_t> out_golden(DATA_NUM);

  for(int i=0; i<DATA_NUM; i++){
    mem_in1[i] = static_cast<float>(rand() % DATA_NUM);
    mem_in2[i] = static_cast<float>(rand() % DATA_NUM);
    out_golden[i] = mem_in1[i] + mem_in2[i];
  }

  int64_t kernel_time_ns = tapa::invoke(
    VecAdd, FLAGS_bitstream, tapa::read_only_mmap<const uint32_t>(mem_in1),
      tapa::read_only_mmap<const uint32_t>(mem_in2), tapa::write_only_mmap<uint32_t>(mem_out));

  for(int i=0; i<DATA_NUM; i++){
    if(out_golden[i] != mem_out[i]){
      printf("out[%d] is wrong!\n", i);
      return 1;
    }
  }
  clog << "kernel time: " << kernel_time_ns * 1e-9 << " s" << endl;
  printf("PASS!\n");
  return 0;
}
