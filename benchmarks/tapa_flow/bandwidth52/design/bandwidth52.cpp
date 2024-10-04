#include <cstdint>

#include <tapa.h>
#include "bandwidth52.h"

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

void bandwidth52(
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
  tapa::mmap<bit512> ch_23,
  tapa::mmap<bit512> ch_24,
  tapa::mmap<bit512> ch_25,
  tapa::mmap<bit512> ch_26,
  tapa::mmap<bit512> ch_27,
  tapa::mmap<bit512> ch_28,
  tapa::mmap<bit512> ch_29,
  tapa::mmap<bit512> ch_30,
  tapa::mmap<bit512> ch_31,
  tapa::mmap<bit512> ch_32,
  tapa::mmap<bit512> ch_33,
  tapa::mmap<bit512> ch_34,
  tapa::mmap<bit512> ch_35,
  tapa::mmap<bit512> ch_36,
  tapa::mmap<bit512> ch_37,
  tapa::mmap<bit512> ch_38,
  tapa::mmap<bit512> ch_39,
  tapa::mmap<bit512> ch_40,
  tapa::mmap<bit512> ch_41,
  tapa::mmap<bit512> ch_42,
  tapa::mmap<bit512> ch_43,
  tapa::mmap<bit512> ch_44,
  tapa::mmap<bit512> ch_45,
  tapa::mmap<bit512> ch_46,
  tapa::mmap<bit512> ch_47,
  tapa::mmap<bit512> ch_48,
  tapa::mmap<bit512> ch_49,
  tapa::mmap<bit512> ch_50,
  tapa::mmap<bit512> ch_51,
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
  tapa::stream<bit512> qr23("qr23");
  tapa::stream<bit512> qr24("qr24");
  tapa::stream<bit512> qr25("qr25");
  tapa::stream<bit512> qr26("qr26");
  tapa::stream<bit512> qr27("qr27");
  tapa::stream<bit512> qr28("qr28");
  tapa::stream<bit512> qr29("qr29");
  tapa::stream<bit512> qr30("qr30");
  tapa::stream<bit512> qr31("qr31");
  tapa::stream<bit512> qr32("qr32");
  tapa::stream<bit512> qr33("qr33");
  tapa::stream<bit512> qr34("qr34");
  tapa::stream<bit512> qr35("qr35");
  tapa::stream<bit512> qr36("qr36");
  tapa::stream<bit512> qr37("qr37");
  tapa::stream<bit512> qr38("qr38");
  tapa::stream<bit512> qr39("qr39");
  tapa::stream<bit512> qr40("qr40");
  tapa::stream<bit512> qr41("qr41");
  tapa::stream<bit512> qr42("qr42");
  tapa::stream<bit512> qr43("qr43");
  tapa::stream<bit512> qr44("qr44");
  tapa::stream<bit512> qr45("qr45");
  tapa::stream<bit512> qr46("qr46");
  tapa::stream<bit512> qr47("qr47");
  tapa::stream<bit512> qr48("qr48");
  tapa::stream<bit512> qr49("qr49");
  tapa::stream<bit512> qr50("qr50");
  tapa::stream<bit512> qr51("qr51");

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
  tapa::stream<bit512> qw23("qw23");
  tapa::stream<bit512> qw24("qw24");
  tapa::stream<bit512> qw25("qw25");
  tapa::stream<bit512> qw26("qw26");
  tapa::stream<bit512> qw27("qw27");
  tapa::stream<bit512> qw28("qw28");
  tapa::stream<bit512> qw29("qw29");
  tapa::stream<bit512> qw30("qw30");
  tapa::stream<bit512> qw31("qw31");
  tapa::stream<bit512> qw32("qw32");
  tapa::stream<bit512> qw33("qw33");
  tapa::stream<bit512> qw34("qw34");
  tapa::stream<bit512> qw35("qw35");
  tapa::stream<bit512> qw36("qw36");
  tapa::stream<bit512> qw37("qw37");
  tapa::stream<bit512> qw38("qw38");
  tapa::stream<bit512> qw39("qw39");
  tapa::stream<bit512> qw40("qw40");
  tapa::stream<bit512> qw41("qw41");
  tapa::stream<bit512> qw42("qw42");
  tapa::stream<bit512> qw43("qw43");
  tapa::stream<bit512> qw44("qw44");
  tapa::stream<bit512> qw45("qw45");
  tapa::stream<bit512> qw46("qw46");
  tapa::stream<bit512> qw47("qw47");
  tapa::stream<bit512> qw48("qw48");
  tapa::stream<bit512> qw49("qw49");
  tapa::stream<bit512> qw50("qw50");
  tapa::stream<bit512> qw51("qw51");


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
      .invoke(Mmap2Stream, ch_23, n, qr23)
      .invoke(Mmap2Stream, ch_24, n, qr24)
      .invoke(Mmap2Stream, ch_25, n, qr25)
      .invoke(Mmap2Stream, ch_26, n, qr26)
      .invoke(Mmap2Stream, ch_27, n, qr27)
      .invoke(Mmap2Stream, ch_28, n, qr28)
      .invoke(Mmap2Stream, ch_29, n, qr29)
      .invoke(Mmap2Stream, ch_30, n, qr30)
      .invoke(Mmap2Stream, ch_31, n, qr31)
      .invoke(Mmap2Stream, ch_32, n, qr32)
      .invoke(Mmap2Stream, ch_33, n, qr33)
      .invoke(Mmap2Stream, ch_34, n, qr34)
      .invoke(Mmap2Stream, ch_35, n, qr35)
      .invoke(Mmap2Stream, ch_36, n, qr36)
      .invoke(Mmap2Stream, ch_37, n, qr37)
      .invoke(Mmap2Stream, ch_38, n, qr38)
      .invoke(Mmap2Stream, ch_39, n, qr39)
      .invoke(Mmap2Stream, ch_40, n, qr40)
      .invoke(Mmap2Stream, ch_41, n, qr41)
      .invoke(Mmap2Stream, ch_42, n, qr42)
      .invoke(Mmap2Stream, ch_43, n, qr43)
      .invoke(Mmap2Stream, ch_44, n, qr44)
      .invoke(Mmap2Stream, ch_45, n, qr45)
      .invoke(Mmap2Stream, ch_46, n, qr46)
      .invoke(Mmap2Stream, ch_47, n, qr47)
      .invoke(Mmap2Stream, ch_48, n, qr48)
      .invoke(Mmap2Stream, ch_49, n, qr49)
      .invoke(Mmap2Stream, ch_50, n, qr50)
      .invoke(Mmap2Stream, ch_51, n, qr51)
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
      .invoke(yshift, qr23, qw23, n)
      .invoke(yshift, qr24, qw24, n)
      .invoke(yshift, qr25, qw25, n)
      .invoke(yshift, qr26, qw26, n)
      .invoke(yshift, qr27, qw27, n)
      .invoke(yshift, qr28, qw28, n)
      .invoke(yshift, qr29, qw29, n)
      .invoke(yshift, qr30, qw30, n)
      .invoke(yshift, qr31, qw31, n)
      .invoke(yshift, qr32, qw32, n)
      .invoke(yshift, qr33, qw33, n)
      .invoke(yshift, qr34, qw34, n)
      .invoke(yshift, qr35, qw35, n)
      .invoke(yshift, qr36, qw36, n)
      .invoke(yshift, qr37, qw37, n)
      .invoke(yshift, qr38, qw38, n)
      .invoke(yshift, qr39, qw39, n)
      .invoke(yshift, qr40, qw40, n)
      .invoke(yshift, qr41, qw41, n)
      .invoke(yshift, qr42, qw42, n)
      .invoke(yshift, qr43, qw43, n)
      .invoke(yshift, qr44, qw44, n)
      .invoke(yshift, qr45, qw45, n)
      .invoke(yshift, qr46, qw46, n)
      .invoke(yshift, qr47, qw47, n)
      .invoke(yshift, qr48, qw48, n)
      .invoke(yshift, qr49, qw49, n)
      .invoke(yshift, qr50, qw50, n)
      .invoke(yshift, qr51, qw51, n)
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
      .invoke(Stream2Mmap, qw22, ch_22, n)
      .invoke(Stream2Mmap, qw23, ch_23, n)
      .invoke(Stream2Mmap, qw24, ch_24, n)
      .invoke(Stream2Mmap, qw25, ch_25, n)
      .invoke(Stream2Mmap, qw26, ch_26, n)
      .invoke(Stream2Mmap, qw27, ch_27, n)
      .invoke(Stream2Mmap, qw28, ch_28, n)
      .invoke(Stream2Mmap, qw29, ch_29, n)
      .invoke(Stream2Mmap, qw30, ch_30, n)
      .invoke(Stream2Mmap, qw31, ch_31, n)
      .invoke(Stream2Mmap, qw32, ch_32, n)
      .invoke(Stream2Mmap, qw33, ch_33, n)
      .invoke(Stream2Mmap, qw34, ch_34, n)
      .invoke(Stream2Mmap, qw35, ch_35, n)
      .invoke(Stream2Mmap, qw36, ch_36, n)
      .invoke(Stream2Mmap, qw37, ch_37, n)
      .invoke(Stream2Mmap, qw38, ch_38, n)
      .invoke(Stream2Mmap, qw39, ch_39, n)
      .invoke(Stream2Mmap, qw40, ch_40, n)
      .invoke(Stream2Mmap, qw41, ch_41, n)
      .invoke(Stream2Mmap, qw42, ch_42, n)
      .invoke(Stream2Mmap, qw43, ch_43, n)
      .invoke(Stream2Mmap, qw44, ch_44, n)
      .invoke(Stream2Mmap, qw45, ch_45, n)
      .invoke(Stream2Mmap, qw46, ch_46, n)
      .invoke(Stream2Mmap, qw47, ch_47, n)
      .invoke(Stream2Mmap, qw48, ch_48, n)
      .invoke(Stream2Mmap, qw49, ch_49, n)
      .invoke(Stream2Mmap, qw50, ch_50, n)
      .invoke(Stream2Mmap, qw51, ch_51, n);
}
