#include <assert.h>
#include <stdio.h>

#include "kernel3.h"


/* Helper Function */
inline void host_serialize_A(float *A_to, float *A_from){
    /* Variable Declaration */
    unsigned int cnt = 0;
    /* Variable Declaration */

    // array
    // io_L3
    for (int c3 = 0; c3 <= 12; c3 += 1) {
      // io_L2
      for (int c4 = 0; c4 <= 15; c4 += 1)
        for (int c5 = 0; c5 <= 255; c5 += 1)
          A_to[cnt++] = A_from[(16 * c3 + c4) * 256 + c5];
    }
}
/* Helper Function */

/* Helper Function */
inline void host_serialize_B(float *B_to, float *B_from){
    /* Variable Declaration */
    unsigned int cnt = 0;
    /* Variable Declaration */

    // array
    // io_L3
    for (int c3 = 0; c3 <= 11; c3 += 1) {
      // io_L2
      for (int c4 = 0; c4 <= 63; c4 += 1)
        for (int c5 = 0; c5 <= 255; c5 += 1)
          B_to[cnt++] = B_from[(64 * c3 + c4) * 256 + c5];
    }
}
/* Helper Function */

/* Helper Function */
inline void host_deserialize_C(float *C_to, float *C_from){
    /* Variable Declaration */
    unsigned int cnt = 0;
    /* Variable Declaration */

    // array
    // io_L3
    for (int c3 = 0; c3 <= 11; c3 += 1) {
      // io_L2
      for (int c4 = 0; c4 <= 12; c4 += 1) {
        // io_L1
        // pe
        for (int c5 = 0; c5 <= 15; c5 += 1)
          for (int c6 = 0; c6 <= 63; c6 += 1)
            C_to[(16 * c4 + c5) * 768 + (64 * c3 + c6)] = C_from[cnt++];
      }
    }
}
/* Helper Function */

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
    float *dev_B_unserialized = (float *)malloc((768) * (256) * sizeof(float));
    float *dev_B = (float *)malloc(196608 * sizeof(float));
    float *dev_C_unserialized = (float *)malloc((208) * (768) * sizeof(float));
    float *dev_C = (float *)malloc(159744 * sizeof(float));

    // Initialize host buffers
    memcpy(dev_A_unserialized, A, (208) * (256) * sizeof(float));
    memcpy(dev_B_unserialized, B, (768) * (256) * sizeof(float));
    memcpy(dev_C_unserialized, C, (208) * (768) * sizeof(float));
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
        B_t16 *buffer_B_tmp = (B_t16 *)malloc((196608) * sizeof(float));
        buffer_B.push_back(buffer_B_tmp);
    }
    for (int i = 0; i < 1; i++) {
        C_t16 *buffer_C_tmp = (C_t16 *)malloc((159744) * sizeof(float));
        buffer_C.push_back(buffer_C_tmp);
    }

    for (int i = 0; i < 1; i++) {
        memcpy(buffer_A[i], dev_A, (53248) * sizeof(float));
    }

    for (int i = 0; i < 1; i++) {
        memcpy(buffer_B[i], dev_B, (196608) * sizeof(float));
    }

    {
      // Launch the kernel
      kernel3(buffer_A[0], buffer_B[0], buffer_C[0]);
    }
    for (int i = 0; i < 1; i++) {
        memcpy(dev_C, buffer_C[i], (159744) * sizeof(float));
    }

    host_deserialize_C(dev_C_unserialized, dev_C);
    // Restore data from host buffers
    memcpy(C, dev_C_unserialized, (208) * (768) * sizeof(float));

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
