// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


#include <cstdlib>
#include <stdint.h>
#include <stdio.h>
#include <iostream>
#include <vector>

#include <gflags/gflags.h>
#include <tapa.h>
#include "typedefs.h"
#include "training_data.h"
#include "testing_data.h"

using std::clog;
using std::endl;
using std::vector;

void digit_recognizer(tapa::mmap<bit512> mem_in1, tapa::mmap<bit512> mem_out);

DEFINE_string(bitstream, "", "path to bitstream file, run csim if empty");

void check_results(vector<bit512> &sresult, const LabelType* expected, int cnt);

int main(int argc, char **argv)
{

  vector<bit512> in2(INPUT_SIZE);
  vector<bit512> out2(OUTPUT_SIZE);

 // Prepare the input data
  for (int i = 0; i < NUM_TRAINING; i ++ )
  {
    WholeDigitType tmp;
    tmp.range(63 , 0  ) = training_data[i*DIGIT_WIDTH+0];
    tmp.range(127, 64 ) = training_data[i*DIGIT_WIDTH+1];
    tmp.range(191, 128) = training_data[i*DIGIT_WIDTH+2];
    tmp.range(255, 192) = training_data[i*DIGIT_WIDTH+3];
    int offset = i % 2;
    in2[i/2](offset*256+255, offset*256) = tmp(255, 0);
  }

  for (int i = 0; i < NUM_TEST; i ++ )
  {
    WholeDigitType tmp;
    tmp.range(63 , 0  ) = testing_data[i*DIGIT_WIDTH+0];
    tmp.range(127, 64 ) = testing_data[i*DIGIT_WIDTH+1];
    tmp.range(191, 128) = testing_data[i*DIGIT_WIDTH+2];
    tmp.range(255, 192) = testing_data[i*DIGIT_WIDTH+3];
    int offset = i % 2;
    in2[i/2+NUM_TRAINING/2](offset*256+255, offset*256) = tmp(255, 0);
  }

  int64_t kernel_time_ns = tapa::invoke(
    digit_recognizer,
    FLAGS_bitstream,
    tapa::read_only_mmap<bit512>(in2),
    tapa::write_only_mmap<bit512>(out2)
  );

  // Check the output results
  check_results(out2, expected, NUM_TEST );
  //clog << "kernel time: " << kernel_time_ns * 1e-9 << " s" << endl;
  printf("PASS!\n");
  return 0;
}


void check_results(vector<bit512> & result, const LabelType* expected, int cnt)
{
  int correct_cnt = 0;

  {
    for (int i = 0; i < cnt; i ++ )
    {
      LabelType tmp;
      tmp = result[i](7, 0);
      //std::cout << "Test " << i << ": expected = " << int(expected[i]) << ", result = " << int(tmp) << std::endl;
      if (tmp != expected[i])
        std::cout << "Test " << i << ": expected = " << int(expected[i]) << ", result = " << int(tmp) << std::endl;
      else
        correct_cnt ++;
    }

    std::cout << "\n\t " << correct_cnt << " / " << cnt << " correct!" << std::endl;
  }

}
