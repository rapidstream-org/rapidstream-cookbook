WORK_DIR=work.out

tapa compile \
  --top digit_recognizer \
  --part-num xcu55c-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/digit_recognizer.xo \
  -f digit_recognizer.cpp \
  2>&1 | tee tapa.log
