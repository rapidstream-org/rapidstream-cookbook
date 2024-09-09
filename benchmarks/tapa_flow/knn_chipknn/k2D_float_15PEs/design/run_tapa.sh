WORK_DIR=work.out

tapa compile \
  --top Knn \
  --part-num xcu55c-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/knn.xo \
  -f src/knn.cpp \
  2>&1 | tee tapa.log
