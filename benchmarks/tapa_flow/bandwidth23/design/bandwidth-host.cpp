#include <iostream>
#include <vector>

#include <gflags/gflags.h>
#include <tapa.h>
#include "bandwidth23.h"

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
  vector<bit512> rmem4(n);
  vector<bit512> rmem5(n);
  vector<bit512> rmem6(n);
  vector<bit512> rmem7(n);
  vector<bit512> rmem8(n);
  vector<bit512> rmem9(n);
  vector<bit512> rmem10(n);
  vector<bit512> rmem11(n);
  vector<bit512> rmem12(n);
  vector<bit512> rmem13(n);
  vector<bit512> rmem14(n);
  vector<bit512> rmem15(n);
  vector<bit512> rmem16(n);
  vector<bit512> rmem17(n);
  vector<bit512> rmem18(n);
  vector<bit512> rmem19(n);
  vector<bit512> rmem20(n);
  vector<bit512> rmem21(n);
  vector<bit512> rmem22(n);


  for (uint64_t i = 0; i < n; ++i) {
    rmem0[i] = i;
    rmem1[i] = i;
    rmem2[i] = i;
    rmem3[i] = i;
    rmem4[i] = i;
    rmem5[i] = i;
    rmem6[i] = i;
    rmem7[i] = i;
    rmem8[i] = i;
    rmem9[i] = i;
    rmem10[i] = i;
    rmem11[i] = i;
    rmem12[i] = i;
    rmem13[i] = i;
    rmem14[i] = i;
    rmem15[i] = i;
    rmem16[i] = i;
    rmem17[i] = i;
    rmem18[i] = i;
    rmem19[i] = i;
    rmem20[i] = i;
    rmem21[i] = i;
    rmem22[i] = i;
  }
  int64_t kernel_time_ns = tapa::invoke(
      bandwidth23,
      FLAGS_bitstream,
      tapa::read_write_mmap<bit512>(rmem0),
      tapa::read_write_mmap<bit512>(rmem1),
      tapa::read_write_mmap<bit512>(rmem2),
      tapa::read_write_mmap<bit512>(rmem3),
      tapa::read_write_mmap<bit512>(rmem4),
      tapa::read_write_mmap<bit512>(rmem5),
      tapa::read_write_mmap<bit512>(rmem6),
      tapa::read_write_mmap<bit512>(rmem7),
      tapa::read_write_mmap<bit512>(rmem8),
      tapa::read_write_mmap<bit512>(rmem9),
      tapa::read_write_mmap<bit512>(rmem10),
      tapa::read_write_mmap<bit512>(rmem11),
      tapa::read_write_mmap<bit512>(rmem12),
      tapa::read_write_mmap<bit512>(rmem13),
      tapa::read_write_mmap<bit512>(rmem14),
      tapa::read_write_mmap<bit512>(rmem15),
      tapa::read_write_mmap<bit512>(rmem16),
      tapa::read_write_mmap<bit512>(rmem17),
      tapa::read_write_mmap<bit512>(rmem18),
      tapa::read_write_mmap<bit512>(rmem19),
      tapa::read_write_mmap<bit512>(rmem20),
      tapa::read_write_mmap<bit512>(rmem21),
      tapa::read_write_mmap<bit512>(rmem22),
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
    if (rmem22[i] != out512) {
      if (num_errors < threshold) {
        clog << "error at " << i << ": expected " << rmem22[i] << ", got "
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
