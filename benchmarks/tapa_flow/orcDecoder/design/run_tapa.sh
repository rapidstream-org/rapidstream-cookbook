WORK_DIR=generated

tapac \
  --work-dir ${WORK_DIR} \
  --top data_decoding \
  --part-num xcu280-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/data_decoding.xo \
  --connectivity config/link_config.ini \
  src/data_decoder.cpp \
  2>&1 | tee tapa.log
