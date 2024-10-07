WORK_DIR=work.out

tapa compile \
  --top data_decoding \
  --part-num xcu55c-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/data_decoding.xo \
  -f src/data_decoder.cpp \
  2>&1 | tee tapa.log
