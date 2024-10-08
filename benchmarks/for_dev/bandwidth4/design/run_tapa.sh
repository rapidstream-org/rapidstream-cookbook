WORK_DIR=work.out

tapa compile \
  --top bandwidth4 \
  --part-num xcu55c-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/bandwidth4.xo \
  -f src/bandwidth4.cpp \
  2>&1 | tee tapa.log
