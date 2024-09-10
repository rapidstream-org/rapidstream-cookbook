WORK_DIR=work.out

tapa compile \
  --top workload \
  --part-num xcu55c-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/multistream_MurmurHash3.xo \
  -f src/multistream_MurmurHash3.cpp \
  2>&1 | tee tapa.log
