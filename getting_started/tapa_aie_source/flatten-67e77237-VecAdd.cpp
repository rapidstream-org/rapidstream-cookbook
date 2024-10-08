// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// Includes
#include <cstdint> /* clang -E -fkeep-system-includes */

#include <tapa.h> /* clang -E -fkeep-system-includes */
[[tapa::target("aie", "xilinx")]] void read_mem(tapa::mmap<const uint32_t> f,
                                                tapa::ostream<uint32_t> &g) {
  for (int i = 0; i < 4096; i++) {
    g << f[i];
  }
}
[[tapa::target("aie", "xilinx")]] void add_kernel(tapa::istream<uint32_t> &a,
                                                  tapa::istream<uint32_t> &b,
                                                  tapa::ostream<uint32_t> &c) {
  // Compute the addition
  [[tapa::pipeline(1)]] for (int i = 0; i < 4096; i++) {
    c << (a.read() + b.read());
  }
}
[[tapa::target("aie", "xilinx")]] void write_mem(tapa::istream<uint32_t> &d,
                                                 tapa::mmap<uint32_t> e) {
  for (int i = 0; i < 4096; i++) {
    d >> e[i];
  }
}
[[tapa::target("aie", "xilinx")]] void
VecAdd(tapa::mmap<const uint32_t> mem_in1, tapa::mmap<const uint32_t> mem_in2,
       tapa::mmap<uint32_t> mem_out) {
  tapa::stream<uint32_t> stream_in1("input_stream_1");
  tapa::stream<uint32_t> stream_in2("input_stream_2");
  tapa::stream<uint32_t> stream_out("output_stream");
  tapa::task()
      .invoke(read_mem, mem_in1, stream_in1)
      .invoke(read_mem, mem_in2, stream_in2)
      .invoke(add_kernel, stream_in1, stream_in2, stream_out)
      .invoke(write_mem, stream_out, mem_out);
}
