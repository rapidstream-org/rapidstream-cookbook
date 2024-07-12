WORK_DIR=generated

tapac \
  --work-dir ${WORK_DIR} \
  --top workload \
  --part-num xcu280-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/multistream_MurmurHash3.xo \
  --connectivity config/link_config.ini \
  src/multistream_MurmurHash3.cpp \
  2>&1 | tee ${WORK_DIR}/tapa.log
