// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include <assert.h>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include  <iomanip>
#include "kernel_kernel.h"

#include "kernel.h"

int main(int argc, char **argv) {
//  data_t A[I][K], B[K][J], C[I][J], C_golden[I][J];
  data_t A[I][K], B[J][K], C[I][J], C_golden[I][J];

  for (int i = 0; i < I; i++)
    for (int k = 0; k < K; k++) {
      A[i][k] = k;
    }

  for (int j = 0; j < J; j++)
    for (int k = 0; k < K; k++) {
      B[j][k] = k;
    }

  {
    // Allocate memory in host memory
    float *dev_A_unserialized = (float *)malloc((208) * (256) * sizeof(float));
    float *dev_A = (float *)malloc(53248 * sizeof(float));
    float *dev_B_unserialized = (float *)malloc((512) * (256) * sizeof(float));
    float *dev_B = (float *)malloc(131072 * sizeof(float));
    float *dev_C_unserialized = (float *)malloc((208) * (512) * sizeof(float));
    float *dev_C = (float *)malloc(106496 * sizeof(float));

    // Initialize host buffers
    memcpy(dev_A_unserialized, A, (208) * (256) * sizeof(float));
    memcpy(dev_B_unserialized, B, (512) * (256) * sizeof(float));
    memcpy(dev_C_unserialized, C, (208) * (512) * sizeof(float));
    host_serialize_A(dev_A, dev_A_unserialized);
    host_serialize_B(dev_B, dev_B_unserialized);

    // Allocate buffers in device memory
    std::vector<A_t16 *> buffer_A;
    std::vector<B_t16 *> buffer_B;
    std::vector<C_t16 *> buffer_C;
    for (int i = 0; i < 1; i++) {
        A_t16 *buffer_A_tmp = (A_t16 *)malloc((53248) * sizeof(float));
        buffer_A.push_back(buffer_A_tmp);
    }
    for (int i = 0; i < 1; i++) {
        B_t16 *buffer_B_tmp = (B_t16 *)malloc((131072) * sizeof(float));
        buffer_B.push_back(buffer_B_tmp);
    }
    for (int i = 0; i < 1; i++) {
        C_t16 *buffer_C_tmp = (C_t16 *)malloc((106496) * sizeof(float));
        buffer_C.push_back(buffer_C_tmp);
    }

    for (int i = 0; i < 1; i++) {
        memcpy(buffer_A[i], dev_A, (53248) * sizeof(float));
    }

    for (int i = 0; i < 1; i++) {
        memcpy(buffer_B[i], dev_B, (131072) * sizeof(float));
    }

    {
      std::ofstream file;
      // a
      file.open("mem_a.h");
      ap_uint<64>* buffer_A_0 = (ap_uint<64>*)(buffer_A[0]);
      for (int i=0; i<I*K/2;i++){
        file << std::setfill('0') << std::setw(16) << std::right << std::hex << (long)buffer_A_0[i] << std::endl;
      }
      file.close();
      // b
      file.open("mem_b.h");
      ap_uint<64>* buffer_B_0 = (ap_uint<64>*)buffer_B[0];
      for (int i=0; i<J*K/2;i++){
        file << std::setfill('0') << std::setw(16) << std::right << std::hex << (long)buffer_B_0[i] << std::endl;
      }
      file.close();
      // Launch the kernel
      kernel3(buffer_A[0], buffer_B[0], buffer_C[0]);
      // c
      file.open("mem_c.h");
      ap_uint<64>* buffer_C_0 = (ap_uint<64>*)(buffer_C[0]);
      for (int i=0; i<I*J/2;i++){
        file << std::setfill('0') << std::setw(16) << std::right << std::hex << (long)buffer_C_0[i] << std::endl;
      }
      file.close();
    }
    for (int i = 0; i < 1; i++) {
        memcpy(dev_C, buffer_C[i], (106496) * sizeof(float));
    }

    host_deserialize_C(dev_C_unserialized, dev_C);
    // Restore data from host buffers
    memcpy(C, dev_C_unserialized, (208) * (512) * sizeof(float));

    // Clean up resources
    for (int i = 0; i < 1; i++) {
        free(buffer_A[i]);
    }
    for (int i = 0; i < 1; i++) {
        free(buffer_B[i]);
    }
    for (int i = 0; i < 1; i++) {
        free(buffer_C[i]);
    }
    free(dev_A);
    free(dev_A_unserialized);
    free(dev_B);
    free(dev_B_unserialized);
    free(dev_C);
    free(dev_C_unserialized);
  }

  for (int i = 0; i < I; i++)
    for (int j = 0; j < J; j++) {
      C_golden[i][j] = 0;
      for (int k = 0; k < K; k++) {
        C_golden[i][j] = C_golden[i][j] + A[i][k] * B[j][k];
      }
    }

  int err = 0;
  for (int i = 0; i < I; i++)
    for (int j = 0; j < J; j++) {
      if (fabs((float)C_golden[i][j] - (float)C[i][j]) > 0.001)
        err++;
    }

  if (err)
    printf("Failed with %d errors!\n", err);
  else
    printf("Passed!\n");

  return 0;
}
