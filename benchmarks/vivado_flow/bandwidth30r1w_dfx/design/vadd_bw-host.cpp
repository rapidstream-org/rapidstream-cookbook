#include <iostream>
#include <vector>

#include <gflags/gflags.h>
#include <tapa.h>
#include "vadd_bw.h"

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
  vector<bit512> wmem0(n);

  for (uint64_t i = 0; i < n; ++i) {
    rmem0[i] = 0 * i;
    rmem1[i] = 1 * i;
    rmem2[i] = 2 * i;
    rmem3[i] = 3 * i;
    rmem4[i] = 4 * i;
    rmem5[i] = 5 * i;
    rmem6[i] = 6 * i;
    rmem7[i] = 7 * i;
    rmem8[i] = 8 * i;
    rmem9[i] = 9 * i;
    rmem10[i] = 10 * i;
    rmem11[i] = 11 * i;
    rmem12[i] = 12 * i;
    rmem13[i] = 13 * i;
    rmem14[i] = 14 * i;
    rmem15[i] = 15 * i;
    rmem16[i] = 16 * i;
    rmem17[i] = 17 * i;
    rmem18[i] = 18 * i;
    rmem19[i] = 19 * i;
    rmem20[i] = 20 * i;
    rmem21[i] = 21 * i;
    rmem22[i] = 22 * i;
    rmem23[i] = 23 * i;
    rmem24[i] = 24 * i;
    rmem25[i] = 25 * i;
    rmem26[i] = 26 * i;
    rmem27[i] = 27 * i;
    rmem28[i] = 28 * i;
    rmem29[i] = 29 * i;
    wmem0[i] = 0;
  }
  int64_t kernel_time_ns = tapa::invoke(
      vadd_bw,
      FLAGS_bitstream, 
      tapa::read_only_mmap<const bit512>(rmem0),
      tapa::read_only_mmap<const bit512>(rmem1),
      tapa::read_only_mmap<const bit512>(rmem2),
      tapa::read_only_mmap<const bit512>(rmem3),
      tapa::read_only_mmap<const bit512>(rmem4),
      tapa::read_only_mmap<const bit512>(rmem5),
      tapa::read_only_mmap<const bit512>(rmem6),
      tapa::read_only_mmap<const bit512>(rmem7),
      tapa::read_only_mmap<const bit512>(rmem8),
      tapa::read_only_mmap<const bit512>(rmem9),
      tapa::read_only_mmap<const bit512>(rmem10),
      tapa::read_only_mmap<const bit512>(rmem11),
      tapa::read_only_mmap<const bit512>(rmem12),
      tapa::read_only_mmap<const bit512>(rmem13),
      tapa::read_only_mmap<const bit512>(rmem14),
      tapa::read_only_mmap<const bit512>(rmem15),
      tapa::read_only_mmap<const bit512>(rmem16),
      tapa::read_only_mmap<const bit512>(rmem17),
      tapa::read_only_mmap<const bit512>(rmem18),
      tapa::read_only_mmap<const bit512>(rmem19),
      tapa::read_only_mmap<const bit512>(rmem20),
      tapa::read_only_mmap<const bit512>(rmem21),
      tapa::read_only_mmap<const bit512>(rmem22),
      tapa::read_only_mmap<const bit512>(rmem23),
      tapa::read_only_mmap<const bit512>(rmem24),
      tapa::read_only_mmap<const bit512>(rmem25),
      tapa::read_only_mmap<const bit512>(rmem26),
      tapa::read_only_mmap<const bit512>(rmem27),
      tapa::read_only_mmap<const bit512>(rmem28),
      tapa::read_only_mmap<const bit512>(rmem29),
      tapa::write_only_mmap<bit512>(wmem0), n);
  clog << "kernel time: " << kernel_time_ns * 1e-9 << " s" << endl;

  uint64_t num_errors = 0;
  const uint64_t threshold = 10;  // only report up to these errors
  for (uint64_t i = 0; i < n; ++i) {
    bit8 temp0 = 0;
    bit8 temp1 = 0;
    bit8 temp2 = 0;
    bit8 temp3 = 0;
    bit8 temp4 = 0;
    bit8 temp5 = 0;
    bit8 temp6 = 0;
    bit8 temp7 = 0;
    bit8 temp8 = 0;
    bit8 temp9 = 0;
    bit8 temp10 = 0;
    bit8 temp11 = 0;
    bit8 temp12 = 0;
    bit8 temp13 = 0;
    bit8 temp14 = 0;
    bit8 temp15 = 0;
    bit8 temp16 = 0;
    bit8 temp17 = 0;
    bit8 temp18 = 0;
    bit8 temp19 = 0;
    bit8 temp20 = 0;
    bit8 temp21 = 0;
    bit8 temp22 = 0;
    bit8 temp23 = 0;
    bit8 temp24 = 0;
    bit8 temp25 = 0;
    bit8 temp26 = 0;
    bit8 temp27 = 0;
    bit8 temp28 = 0;
    bit8 temp29 = 0;
    bit8 out8;
    bit512 out512;

    for(int j=0; j<64; j++){
      temp0 = temp0 ^ rmem0[i](j*8+7, j*8);
      temp1 = temp1 ^ rmem1[i](j*8+7, j*8);
      temp2 = temp2 ^ rmem2[i](j*8+7, j*8);
      temp3 = temp3 ^ rmem3[i](j*8+7, j*8);
      temp4 = temp4 ^ rmem4[i](j*8+7, j*8);
      temp5 = temp5 ^ rmem5[i](j*8+7, j*8);
      temp6 = temp6 ^ rmem6[i](j*8+7, j*8);
      temp7 = temp7 ^ rmem7[i](j*8+7, j*8);
      temp8 = temp8 ^ rmem8[i](j*8+7, j*8);
      temp9 = temp9 ^ rmem9[i](j*8+7, j*8);
      temp10 = temp10 ^ rmem10[i](j*8+7, j*8);
      temp11 = temp11 ^ rmem11[i](j*8+7, j*8);
      temp12 = temp12 ^ rmem12[i](j*8+7, j*8);
      temp13 = temp13 ^ rmem13[i](j*8+7, j*8);
      temp14 = temp14 ^ rmem14[i](j*8+7, j*8);
      temp15 = temp15 ^ rmem15[i](j*8+7, j*8);
      temp16 = temp16 ^ rmem16[i](j*8+7, j*8);
      temp17 = temp17 ^ rmem17[i](j*8+7, j*8);
      temp18 = temp18 ^ rmem18[i](j*8+7, j*8);
      temp19 = temp19 ^ rmem19[i](j*8+7, j*8);
      temp20 = temp20 ^ rmem20[i](j*8+7, j*8);
      temp21 = temp21 ^ rmem21[i](j*8+7, j*8);
      temp22 = temp22 ^ rmem22[i](j*8+7, j*8);
      temp23 = temp23 ^ rmem23[i](j*8+7, j*8);
      temp24 = temp24 ^ rmem24[i](j*8+7, j*8);
      temp25 = temp25 ^ rmem25[i](j*8+7, j*8);
      temp26 = temp26 ^ rmem26[i](j*8+7, j*8);
      temp27 = temp27 ^ rmem27[i](j*8+7, j*8);
      temp28 = temp28 ^ rmem28[i](j*8+7, j*8);
      temp29 = temp29 ^ rmem29[i](j*8+7, j*8);
    }
    out8 = out8 = temp0 ^ temp1 ^ temp2 ^ temp3 ^ temp4 ^ temp5 ^ temp6 ^ temp7 ^ temp8 ^ temp9 ^ temp10 ^ temp11 ^ temp12 ^ temp13 ^ temp14 ^ temp15 ^ temp16 ^ temp17 ^ temp18 ^ temp19 ^ temp20 ^ temp21 ^ temp22 ^ temp23 ^ temp24 ^ temp25 ^ temp26 ^ temp27 ^ temp28 ^ temp29;
    for(int j=0; j<64; j++){
      out512(j*8+7, j*8) = out8;
    }
    if (wmem0[i] != out512) {
      if (num_errors < threshold) {
        clog << "error at " << i << ": expected " << wmem0[i] << ", got "
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
