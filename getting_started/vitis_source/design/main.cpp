// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


#include <cstdlib>
#include <stdint.h>
#include <stdio.h>
#include "VecAdd.h"

int main(int argc, char **argv)
{
  uint32_t mem_in1[DATA_SIZE];
  uint32_t mem_in2[DATA_SIZE];
  uint32_t mem_out[DATA_SIZE];
  uint32_t out_golden[DATA_SIZE];

  for(int i=0; i<DATA_SIZE; i++){
    mem_in1[i] = rand() % DATA_SIZE;
    mem_in2[i] = rand() % DATA_SIZE;
    out_golden[i] = mem_in1[i] + mem_in2[i];
  }

  VecAdd(mem_in1, mem_in2, mem_out);

  for(int i=0; i<DATA_SIZE; i++){
    if(out_golden[i] != mem_out[i]){
      printf("out[%d] is wrong!\n", i);
      return 1;
    }
  }
  printf("PASS!\n");
  return 0;
}
