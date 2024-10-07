#include <iostream>
#include <vector>

#include <gflags/gflags.h>
#include <tapa.h>
#include "bandwidth4.h"

using std::clog;
using std::endl;
using std::vector;

DEFINE_string(bitstream, "", "path to bitstream file, run csim if empty");

int main(int argc, char* argv[]) {
  gflags::ParseCommandLineFlags(&argc, &argv, /*remove_flags=*/true);

  const uint64_t n = argc > 1 ? atoll(argv[1]) : 1024 * 1024;

  vector<bit512> rmem0(n);
  vector<bit512> rmem1(n);
  vector<bit512> rmem2(n);
  vector<bit512> rmem3(n);


  for (uint64_t i = 0; i < n; ++i) {
    rmem0[i] = i;
    rmem1[i] = i;
    rmem2[i] = i;
    rmem3[i] = i;
  }
  int64_t kernel_time_ns = tapa::invoke(
      bandwidth4,
      FLAGS_bitstream,
      tapa::read_write_mmap<bit512>(rmem0),
      tapa::read_write_mmap<bit512>(rmem1),
      tapa::read_write_mmap<bit512>(rmem2),
      tapa::read_write_mmap<bit512>(rmem3),
      n);

  clog << "kernel time: " << kernel_time_ns * 1e-9 << " s" << endl;

  uint64_t num_errors = 0;
  const uint64_t threshold = 10;  // only report up to these errors
  for (uint64_t i = 0; i < n; ++i) {
    bit512 out512 = (i << 1);
    if (rmem0[i] != out512) {
      if (num_errors < threshold) {
        clog << "error at " << i << ": expected " << rmem0[i] << ", got "
             << out512 << endl;
      }
      ++num_errors;
    }
    if (rmem3[i] != out512) {
      if (num_errors < threshold) {
        clog << "error at " << i << ": expected " << rmem3[i] << ", got "
             << out512 << endl;
      }
      ++num_errors;
    }
  }
  if (num_errors == 0) {
    clog << "PASS!" << endl;
  } else {
    if (num_errors > threshold) {
      clog << " (+" << (num_errors - threshold) << " more errors)" << endl;
    }
    clog << "FAIL!" << endl;
  }
  return num_errors > 0 ? 1 : 0;
}
