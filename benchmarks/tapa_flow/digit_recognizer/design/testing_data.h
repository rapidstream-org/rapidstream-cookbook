/*===============================================================*/
/*                                                               */
/*                       testing_data.h                          */
/*                                                               */
/*              Constant array for test instances.               */
/*                                                               */
/*===============================================================*/


#ifndef TESTING_DATA_H
#define TESTING_DATA_H

const DigitType testing_data[2000 * DIGIT_WIDTH] = {
  #include "196data/test_set.dat"
};

const LabelType expected[2000] = {
  #include "196data/expected.dat"
};

#endif
