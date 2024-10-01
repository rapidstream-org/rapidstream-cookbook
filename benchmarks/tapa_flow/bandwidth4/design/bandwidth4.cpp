#include <cstdint>

#include <tapa.h>
#include "bandwidth4.h"

void yshift(tapa::istream<bit512>& a, tapa::ostream<bit512>& b, uint64_t n) {
  for (uint64_t i = 0; i < n; ++i) {
    bit512 tmp;
    tmp = a.read();
    tmp = (tmp << 1);
    b.write(tmp);
  }
}

void Mmap2Stream(
    tapa::mmap<bit512> mmap,
    uint64_t n,
    tapa::ostream<bit512>& stream){

    for (uint64_t i = 0; i < n; ++i) {
        stream << mmap[i];
    }
}

void Stream2Mmap(tapa::istream<bit512>& stream, tapa::mmap<bit512> mmap,
                 uint64_t n) {
  for (uint64_t i = 0; i < n; ++i) {
    mmap[i] = stream.read();
  }
}

void bandwidth4(
  tapa::mmap<bit512> ch_0,
  tapa::mmap<bit512> ch_1,
  tapa::mmap<bit512> ch_2,
  tapa::mmap<bit512> ch_3,
  uint64_t n) {

  tapa::stream<bit512> qr0("qr0");
  tapa::stream<bit512> qr1("qr1");
  tapa::stream<bit512> qr2("qr2");
  tapa::stream<bit512> qr3("qr3");

  tapa::stream<bit512> qw0("qw0");
  tapa::stream<bit512> qw1("qw1");
  tapa::stream<bit512> qw2("qw2");
  tapa::stream<bit512> qw3("qw3");

  tapa::task()
      .invoke(Mmap2Stream, ch_0, n, qr0)
      .invoke(Mmap2Stream, ch_1, n, qr1)
      .invoke(Mmap2Stream, ch_2, n, qr2)
      .invoke(Mmap2Stream, ch_3, n, qr3)
      .invoke(yshift, qr0, qw0, n)
      .invoke(yshift, qr1, qw1, n)
      .invoke(yshift, qr2, qw2, n)
      .invoke(yshift, qr3, qw3, n)
      .invoke(Stream2Mmap, qw0, ch_0, n)
      .invoke(Stream2Mmap, qw1, ch_1, n)
      .invoke(Stream2Mmap, qw2, ch_2, n)
      .invoke(Stream2Mmap, qw3, ch_3, n);
}
