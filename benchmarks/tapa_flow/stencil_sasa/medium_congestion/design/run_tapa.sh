WORK_DIR=generated

tapac \
  --work-dir ${WORK_DIR} \
  --top unikernel \
  --part-num xcu280-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/unikernel.xo \
  --connectivity config/link_config.ini \
  src/unikernel.cpp \
  2>&1 | tee tapa.log
