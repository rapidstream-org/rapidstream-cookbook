// standard C/C++ headers
#include <cstdio>
#include <cstdlib>
#include <getopt.h>
#include <string>
#include <time.h>
#include <sys/time.h>

// benchmark headers
#include "../typedefs.h"
#include "../training_data.h"
#include "../testing_data.h"

// ------------------------------------------------------------------------------------
// Main program
// ------------------------------------------------------------------------------------
int main(int argc, char **argv)
{
  // Variables for time measurement
  struct timeval start, end;

  // Input and output temporary variables
  bit512 in;
  bit512 out[OUTPUT_SIZE];
  bit512 in2[INPUT_SIZE];
  bit512 out2[OUTPUT_SIZE];

  // The input and output variables for top kernel
  hls::stream< bit512 > Input_1("kernel_in");
  hls::stream< bit512 > Output_1("kernel_out");

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


  // run the kernel
  gettimeofday(&start, NULL);
  for(int k=0; k<10; k++){
    for(int i=0; i<14; i++){
      for(int j=0; j<14; j++){
        printf("%d ", (unsigned int) in2[0](255-i*14-j, 255-i*14-j));
      }
      std::cout << std::endl;
    }
    std::cout << std::endl;
    std::cout << std::endl;
  }
  gettimeofday(&end, NULL);

    // print time
  long long elapsed = (end.tv_sec - start.tv_sec) * 1000000LL + end.tv_usec - start.tv_usec;
  printf("elapsed time: %lld us\n", elapsed);


  return 0;
}
