WORK_DIR=work.out

tapa compile \
  --top unikernel \
  --part-num xcu55c-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/unikernel.xo \
  -f src/unikernel.cpp \
  2>&1 | tee tapa.log
