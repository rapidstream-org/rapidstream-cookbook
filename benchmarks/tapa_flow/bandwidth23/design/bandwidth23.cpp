#include <cstdint>

#include <tapa.h>
#include "bandwidth23.h"

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

void bandwidth23(
  tapa::mmap<bit512> ch_0,
  tapa::mmap<bit512> ch_1,
  tapa::mmap<bit512> ch_2,
  tapa::mmap<bit512> ch_3,
  tapa::mmap<bit512> ch_4,
  tapa::mmap<bit512> ch_5,
  tapa::mmap<bit512> ch_6,
  tapa::mmap<bit512> ch_7,
  tapa::mmap<bit512> ch_8,
  tapa::mmap<bit512> ch_9,
  tapa::mmap<bit512> ch_10,
  tapa::mmap<bit512> ch_11,
  tapa::mmap<bit512> ch_12,
  tapa::mmap<bit512> ch_13,
  tapa::mmap<bit512> ch_14,
  tapa::mmap<bit512> ch_15,
  tapa::mmap<bit512> ch_16,
  tapa::mmap<bit512> ch_17,
  tapa::mmap<bit512> ch_18,
  tapa::mmap<bit512> ch_19,
  tapa::mmap<bit512> ch_20,
  tapa::mmap<bit512> ch_21,
  tapa::mmap<bit512> ch_22,
  uint64_t n) {

  tapa::stream<bit512> qr0("qr0");
  tapa::stream<bit512> qr1("qr1");
  tapa::stream<bit512> qr2("qr2");
  tapa::stream<bit512> qr3("qr3");
  tapa::stream<bit512> qr4("qr4");
  tapa::stream<bit512> qr5("qr5");
  tapa::stream<bit512> qr6("qr6");
  tapa::stream<bit512> qr7("qr7");
  tapa::stream<bit512> qr8("qr8");
  tapa::stream<bit512> qr9("qr9");
  tapa::stream<bit512> qr10("qr10");
  tapa::stream<bit512> qr11("qr11");
  tapa::stream<bit512> qr12("qr12");
  tapa::stream<bit512> qr13("qr13");
  tapa::stream<bit512> qr14("qr14");
  tapa::stream<bit512> qr15("qr15");
  tapa::stream<bit512> qr16("qr16");
  tapa::stream<bit512> qr17("qr17");
  tapa::stream<bit512> qr18("qr18");
  tapa::stream<bit512> qr19("qr19");
  tapa::stream<bit512> qr20("qr20");
  tapa::stream<bit512> qr21("qr21");
  tapa::stream<bit512> qr22("qr22");

  tapa::stream<bit512> qw0("qw0");
  tapa::stream<bit512> qw1("qw1");
  tapa::stream<bit512> qw2("qw2");
  tapa::stream<bit512> qw3("qw3");
  tapa::stream<bit512> qw4("qw4");
  tapa::stream<bit512> qw5("qw5");
  tapa::stream<bit512> qw6("qw6");
  tapa::stream<bit512> qw7("qw7");
  tapa::stream<bit512> qw8("qw8");
  tapa::stream<bit512> qw9("qw9");
  tapa::stream<bit512> qw10("qw10");
  tapa::stream<bit512> qw11("qw11");
  tapa::stream<bit512> qw12("qw12");
  tapa::stream<bit512> qw13("qw13");
  tapa::stream<bit512> qw14("qw14");
  tapa::stream<bit512> qw15("qw15");
  tapa::stream<bit512> qw16("qw16");
  tapa::stream<bit512> qw17("qw17");
  tapa::stream<bit512> qw18("qw18");
  tapa::stream<bit512> qw19("qw19");
  tapa::stream<bit512> qw20("qw20");
  tapa::stream<bit512> qw21("qw21");
  tapa::stream<bit512> qw22("qw22");

  tapa::task()
      .invoke(Mmap2Stream, ch_0, n, qr0)
      .invoke(Mmap2Stream, ch_1, n, qr1)
      .invoke(Mmap2Stream, ch_2, n, qr2)
      .invoke(Mmap2Stream, ch_3, n, qr3)
      .invoke(Mmap2Stream, ch_4, n, qr4)
      .invoke(Mmap2Stream, ch_5, n, qr5)
      .invoke(Mmap2Stream, ch_6, n, qr6)
      .invoke(Mmap2Stream, ch_7, n, qr7)
      .invoke(Mmap2Stream, ch_8, n, qr8)
      .invoke(Mmap2Stream, ch_9, n, qr9)
      .invoke(Mmap2Stream, ch_10, n, qr10)
      .invoke(Mmap2Stream, ch_11, n, qr11)
      .invoke(Mmap2Stream, ch_12, n, qr12)
      .invoke(Mmap2Stream, ch_13, n, qr13)
      .invoke(Mmap2Stream, ch_14, n, qr14)
      .invoke(Mmap2Stream, ch_15, n, qr15)
      .invoke(Mmap2Stream, ch_16, n, qr16)
      .invoke(Mmap2Stream, ch_17, n, qr17)
      .invoke(Mmap2Stream, ch_18, n, qr18)
      .invoke(Mmap2Stream, ch_19, n, qr19)
      .invoke(Mmap2Stream, ch_20, n, qr20)
      .invoke(Mmap2Stream, ch_21, n, qr21)
      .invoke(Mmap2Stream, ch_22, n, qr22)
      .invoke(yshift, qr0, qw0, n)
      .invoke(yshift, qr1, qw1, n)
      .invoke(yshift, qr2, qw2, n)
      .invoke(yshift, qr3, qw3, n)
      .invoke(yshift, qr4, qw4, n)
      .invoke(yshift, qr5, qw5, n)
      .invoke(yshift, qr6, qw6, n)
      .invoke(yshift, qr7, qw7, n)
      .invoke(yshift, qr8, qw8, n)
      .invoke(yshift, qr9, qw9, n)
      .invoke(yshift, qr10, qw10, n)
      .invoke(yshift, qr11, qw11, n)
      .invoke(yshift, qr12, qw12, n)
      .invoke(yshift, qr13, qw13, n)
      .invoke(yshift, qr14, qw14, n)
      .invoke(yshift, qr15, qw15, n)
      .invoke(yshift, qr16, qw16, n)
      .invoke(yshift, qr17, qw17, n)
      .invoke(yshift, qr18, qw18, n)
      .invoke(yshift, qr19, qw19, n)
      .invoke(yshift, qr20, qw20, n)
      .invoke(yshift, qr21, qw21, n)
      .invoke(yshift, qr22, qw22, n)
      .invoke(Stream2Mmap, qw0, ch_0, n)
      .invoke(Stream2Mmap, qw1, ch_1, n)
      .invoke(Stream2Mmap, qw2, ch_2, n)
      .invoke(Stream2Mmap, qw3, ch_3, n)
      .invoke(Stream2Mmap, qw4, ch_4, n)
      .invoke(Stream2Mmap, qw5, ch_5, n)
      .invoke(Stream2Mmap, qw6, ch_6, n)
      .invoke(Stream2Mmap, qw7, ch_7, n)
      .invoke(Stream2Mmap, qw8, ch_8, n)
      .invoke(Stream2Mmap, qw9, ch_9, n)
      .invoke(Stream2Mmap, qw10, ch_10, n)
      .invoke(Stream2Mmap, qw11, ch_11, n)
      .invoke(Stream2Mmap, qw12, ch_12, n)
      .invoke(Stream2Mmap, qw13, ch_13, n)
      .invoke(Stream2Mmap, qw14, ch_14, n)
      .invoke(Stream2Mmap, qw15, ch_15, n)
      .invoke(Stream2Mmap, qw16, ch_16, n)
      .invoke(Stream2Mmap, qw17, ch_17, n)
      .invoke(Stream2Mmap, qw18, ch_18, n)
      .invoke(Stream2Mmap, qw19, ch_19, n)
      .invoke(Stream2Mmap, qw20, ch_20, n)
      .invoke(Stream2Mmap, qw21, ch_21, n)
      .invoke(Stream2Mmap, qw22, ch_22, n);
}
