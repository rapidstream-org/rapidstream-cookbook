#include <cstdint>

#include <tapa.h>
#include "vadd_bw.h"

void yxor(tapa::istream<bit8>& a, tapa::istream<bit8>& b,
         tapa::ostream<bit8>& c, uint64_t n) {
  for (uint64_t i = 0; i < n; ++i) {
    c << (a.read() ^ b.read());
  }
}

bit8 xor512_to_8(bit512 din){
    bit8 out;
    out = 0;
    for(int i = 0; i < 64; i++){
        out = out ^ din(i*8+7, i*8);
    }
    return out;
}

bit512 cp8_to_512(bit8 din){
    bit512 out;
    out = 0;
    for(int i = 0; i < 64; i++){
        out(i*8+7, i*8) = din;
    }
    return out;
}

void Mmap2Stream(
    tapa::mmap<const bit512> mmap,
    uint64_t n,
    tapa::ostream<bit8>& stream){

    for (uint64_t i = 0; i < n; ++i) {
        stream << xor512_to_8(mmap[i]);
    }
}

void Stream2Mmap(tapa::istream<bit8>& stream, tapa::mmap<bit512> mmap,
                 uint64_t n) {
  for (uint64_t i = 0; i < n; ++i) {
    bit8 tmp;
    stream >> tmp;
    mmap[i] = cp8_to_512(tmp);
  }
}

void vadd_bw(
  tapa::mmap<const bit512> rmem0,
  tapa::mmap<const bit512> rmem1,
  tapa::mmap<const bit512> rmem2,
  tapa::mmap<const bit512> rmem3,
  tapa::mmap<const bit512> rmem4,
  tapa::mmap<const bit512> rmem5,
  tapa::mmap<const bit512> rmem6,
  tapa::mmap<const bit512> rmem7,
  tapa::mmap<const bit512> rmem8,
  tapa::mmap<const bit512> rmem9,
  tapa::mmap<const bit512> rmem10,
  tapa::mmap<const bit512> rmem11,
  tapa::mmap<const bit512> rmem12,
  tapa::mmap<const bit512> rmem13,
  tapa::mmap<const bit512> rmem14,
  tapa::mmap<const bit512> rmem15,
  tapa::mmap<const bit512> rmem16,
  tapa::mmap<const bit512> rmem17,
  tapa::mmap<const bit512> rmem18,
  tapa::mmap<const bit512> rmem19,
  tapa::mmap<const bit512> rmem20,
  tapa::mmap<const bit512> rmem21,
  tapa::mmap<const bit512> rmem22,
  tapa::mmap<const bit512> rmem23,
  tapa::mmap<const bit512> rmem24,
  tapa::mmap<const bit512> rmem25,
  tapa::mmap<const bit512> rmem26,
  tapa::mmap<const bit512> rmem27,
  tapa::mmap<const bit512> rmem28,
  tapa::mmap<const bit512> rmem29,
  tapa::mmap<bit512>       wmem0,
  uint64_t n) {

  tapa::stream<bit8> q0("q0");
  tapa::stream<bit8> q1("q1");
  tapa::stream<bit8> q2("q2");
  tapa::stream<bit8> q3("q3");
  tapa::stream<bit8> q4("q4");
  tapa::stream<bit8> q5("q5");
  tapa::stream<bit8> q6("q6");
  tapa::stream<bit8> q7("q7");
  tapa::stream<bit8> q8("q8");
  tapa::stream<bit8> q9("q9");
  tapa::stream<bit8> q10("q10");
  tapa::stream<bit8> q11("q11");
  tapa::stream<bit8> q12("q12");
  tapa::stream<bit8> q13("q13");
  tapa::stream<bit8> q14("q14");
  tapa::stream<bit8> q15("q15");
  tapa::stream<bit8> q16("q16");
  tapa::stream<bit8> q17("q17");
  tapa::stream<bit8> q18("q18");
  tapa::stream<bit8> q19("q19");
  tapa::stream<bit8> q20("q20");
  tapa::stream<bit8> q21("q21");
  tapa::stream<bit8> q22("q22");
  tapa::stream<bit8> q23("q23");
  tapa::stream<bit8> q24("q24");
  tapa::stream<bit8> q25("q25");
  tapa::stream<bit8> q26("q26");
  tapa::stream<bit8> q27("q27");
  tapa::stream<bit8> q28("q28");
  tapa::stream<bit8> q29("q29");
  tapa::stream<bit8> q30("q30");

  tapa::stream<bit8> q0_1("q0_1");
  tapa::stream<bit8> q2_3("q2_3");
  tapa::stream<bit8> q4_5("q4_5");
  tapa::stream<bit8> q6_7("q6_7");
  tapa::stream<bit8> q8_9("q8_9");
  tapa::stream<bit8> q10_11("q10_11");
  tapa::stream<bit8> q12_13("q12_13");
  tapa::stream<bit8> q14_15("q14_15");
  tapa::stream<bit8> q16_17("q16_17");
  tapa::stream<bit8> q18_19("q18_19");
  tapa::stream<bit8> q20_21("q20_21");
  tapa::stream<bit8> q22_23("q22_23");
  tapa::stream<bit8> q24_25("q24_25");
  tapa::stream<bit8> q26_27("q26_27");
  tapa::stream<bit8> q28_29("q28_29");
  tapa::stream<bit8> q30_31("q30_31");

  tapa::stream<bit8> q0_3("q0_3");
  tapa::stream<bit8> q4_7("q4_7");
  tapa::stream<bit8> q8_11("q8_11");
  tapa::stream<bit8> q12_15("q12_15");
  tapa::stream<bit8> q16_19("q16_19");
  tapa::stream<bit8> q20_23("q20_23");
  tapa::stream<bit8> q24_27("q24_27");
  tapa::stream<bit8> q28_31("q28_31");

  tapa::stream<bit8> q0_7("q0_7");
  tapa::stream<bit8> q8_15("q8_15");
  tapa::stream<bit8> q16_23("q16_23");
  tapa::stream<bit8> q24_31("q24_31");

  tapa::stream<bit8> q0_15("q0_7");
  tapa::stream<bit8> q16_31("q16_23");

  tapa::stream<bit8> q0_31("q24_31");

  tapa::task()
      .invoke(Mmap2Stream, rmem0,  n, q0)
      .invoke(Mmap2Stream, rmem1,  n, q1)
      .invoke(Mmap2Stream, rmem2,  n, q2)
      .invoke(Mmap2Stream, rmem3,  n, q3)
      .invoke(Mmap2Stream, rmem4,  n, q4)
      .invoke(Mmap2Stream, rmem5,  n, q5)
      .invoke(Mmap2Stream, rmem6,  n, q6)
      .invoke(Mmap2Stream, rmem7,  n, q7)
      .invoke(Mmap2Stream, rmem8,  n, q8)
      .invoke(Mmap2Stream, rmem9,  n, q9)
      .invoke(Mmap2Stream, rmem10, n, q10)
      .invoke(Mmap2Stream, rmem11, n, q11)
      .invoke(Mmap2Stream, rmem12, n, q12)
      .invoke(Mmap2Stream, rmem13, n, q13)
      .invoke(Mmap2Stream, rmem14, n, q14)
      .invoke(Mmap2Stream, rmem15, n, q15)
      .invoke(Mmap2Stream, rmem16, n, q16)
      .invoke(Mmap2Stream, rmem17, n, q17)
      .invoke(Mmap2Stream, rmem18, n, q18)
      .invoke(Mmap2Stream, rmem19, n, q19)
      .invoke(Mmap2Stream, rmem20, n, q20)
      .invoke(Mmap2Stream, rmem21, n, q21)
      .invoke(Mmap2Stream, rmem22, n, q22)
      .invoke(Mmap2Stream, rmem23, n, q23)
      .invoke(Mmap2Stream, rmem24, n, q24)
      .invoke(Mmap2Stream, rmem25, n, q25)
      .invoke(Mmap2Stream, rmem26, n, q26)
      .invoke(Mmap2Stream, rmem27, n, q27)
      .invoke(Mmap2Stream, rmem28, n, q28)
      .invoke(Mmap2Stream, rmem29, n, q29)
      .invoke(yxor, q0,  q1,  q0_1,   n)
      .invoke(yxor, q2,  q3,  q2_3,   n)
      .invoke(yxor, q4,  q5,  q4_5,   n)
      .invoke(yxor, q6,  q7,  q6_7,   n)
      .invoke(yxor, q8,  q9,  q8_9,   n)
      .invoke(yxor, q10, q11, q10_11, n)
      .invoke(yxor, q12, q13, q12_13, n)
      .invoke(yxor, q14, q15, q14_15, n)
      .invoke(yxor, q16, q17, q16_17, n)
      .invoke(yxor, q18, q19, q18_19, n)
      .invoke(yxor, q20, q21, q20_21, n)
      .invoke(yxor, q22, q23, q22_23, n)
      .invoke(yxor, q24, q25, q24_25, n)
      .invoke(yxor, q26, q27, q26_27, n)
      .invoke(yxor, q28, q29, q28_29, n)
      .invoke(yxor, q0_1,   q2_3,   q0_3,   n)
      .invoke(yxor, q4_5,   q6_7,   q4_7,   n)
      .invoke(yxor, q8_9,   q10_11, q8_11,  n)
      .invoke(yxor, q12_13, q14_15, q12_15, n)
      .invoke(yxor, q16_17, q18_19, q16_19, n)
      .invoke(yxor, q20_21, q22_23, q20_23, n)
      .invoke(yxor, q24_25, q26_27, q24_27, n)
      .invoke(yxor, q0_3,   q4_7,   q0_7,   n)
      .invoke(yxor, q8_11,  q12_15, q8_15,  n)
      .invoke(yxor, q16_19, q20_23, q16_23, n)
      .invoke(yxor, q24_27, q28_29, q24_31, n)
      .invoke(yxor, q0_7,   q8_15,  q0_15,  n)
      .invoke(yxor, q16_23, q24_31, q16_31, n)
      .invoke(yxor, q0_15, q16_31, q0_31, n)
      .invoke(Stream2Mmap, q0_31, wmem0, n);
}
