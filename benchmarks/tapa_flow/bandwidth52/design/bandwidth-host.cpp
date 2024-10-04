#include <iostream>
#include <vector>

#include <gflags/gflags.h>
#include <tapa.h>
#include "bandwidth52.h"

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
  vector<bit512> rmem23(n);
  vector<bit512> rmem24(n);
  vector<bit512> rmem25(n);
  vector<bit512> rmem26(n);
  vector<bit512> rmem27(n);
  vector<bit512> rmem28(n);
  vector<bit512> rmem29(n);
  vector<bit512> rmem30(n);
  vector<bit512> rmem31(n);
  vector<bit512> rmem32(n);
  vector<bit512> rmem33(n);
  vector<bit512> rmem34(n);
  vector<bit512> rmem35(n);
  vector<bit512> rmem36(n);
  vector<bit512> rmem37(n);
  vector<bit512> rmem38(n);
  vector<bit512> rmem39(n);
  vector<bit512> rmem40(n);
  vector<bit512> rmem41(n);
  vector<bit512> rmem42(n);
  vector<bit512> rmem43(n);
  vector<bit512> rmem44(n);
  vector<bit512> rmem45(n);
  vector<bit512> rmem46(n);
  vector<bit512> rmem47(n);
  vector<bit512> rmem48(n);
  vector<bit512> rmem49(n);
  vector<bit512> rmem50(n);
  vector<bit512> rmem51(n);

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
    rmem23[i] = i;
    rmem24[i] = i;
    rmem25[i] = i;
    rmem26[i] = i;
    rmem27[i] = i;
    rmem28[i] = i;
    rmem29[i] = i;
    rmem30[i] = i;
    rmem31[i] = i;
    rmem32[i] = i;
    rmem33[i] = i;
    rmem34[i] = i;
    rmem35[i] = i;
    rmem36[i] = i;
    rmem37[i] = i;
    rmem38[i] = i;
    rmem39[i] = i;
    rmem40[i] = i;
    rmem41[i] = i;
    rmem42[i] = i;
    rmem43[i] = i;
    rmem44[i] = i;
    rmem45[i] = i;
    rmem46[i] = i;
    rmem47[i] = i;
    rmem48[i] = i;
    rmem49[i] = i;
    rmem50[i] = i;
    rmem51[i] = i;
  }
  int64_t kernel_time_ns = tapa::invoke(
      bandwidth52,
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
      tapa::read_write_mmap<bit512>(rmem23),
      tapa::read_write_mmap<bit512>(rmem24),
      tapa::read_write_mmap<bit512>(rmem25),
      tapa::read_write_mmap<bit512>(rmem26),
      tapa::read_write_mmap<bit512>(rmem27),
      tapa::read_write_mmap<bit512>(rmem28),
      tapa::read_write_mmap<bit512>(rmem29),
      tapa::read_write_mmap<bit512>(rmem30),
      tapa::read_write_mmap<bit512>(rmem31),
      tapa::read_write_mmap<bit512>(rmem32),
      tapa::read_write_mmap<bit512>(rmem33),
      tapa::read_write_mmap<bit512>(rmem34),
      tapa::read_write_mmap<bit512>(rmem35),
      tapa::read_write_mmap<bit512>(rmem36),
      tapa::read_write_mmap<bit512>(rmem37),
      tapa::read_write_mmap<bit512>(rmem38),
      tapa::read_write_mmap<bit512>(rmem39),
      tapa::read_write_mmap<bit512>(rmem40),
      tapa::read_write_mmap<bit512>(rmem41),
      tapa::read_write_mmap<bit512>(rmem42),
      tapa::read_write_mmap<bit512>(rmem43),
      tapa::read_write_mmap<bit512>(rmem44),
      tapa::read_write_mmap<bit512>(rmem45),
      tapa::read_write_mmap<bit512>(rmem46),
      tapa::read_write_mmap<bit512>(rmem47),
      tapa::read_write_mmap<bit512>(rmem48),
      tapa::read_write_mmap<bit512>(rmem49),
      tapa::read_write_mmap<bit512>(rmem50),
      tapa::read_write_mmap<bit512>(rmem51),
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
    if (rmem51[i] != out512) {
      if (num_errors < threshold) {
        clog << "error at " << i << ": expected " << rmem51[i] << ", got "
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
