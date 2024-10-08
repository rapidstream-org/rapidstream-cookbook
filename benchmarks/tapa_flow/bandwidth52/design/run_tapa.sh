WORK_DIR=work.out

tapa compile \
  --top bandwidth52 \
  --part-num xcu55c-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/bandwidth52.xo \
  -f src/bandwidth52.cpp \
  2>&1 | tee tapa.log
