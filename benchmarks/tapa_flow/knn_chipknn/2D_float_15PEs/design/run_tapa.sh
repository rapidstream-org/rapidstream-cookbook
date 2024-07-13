WORK_DIR=generated

tapac \
  --work-dir ${WORK_DIR} \
  --top Knn \
  --part-num xcu280-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/knn.xo \
  --connectivity config/link_config.ini \
  src/knn.cpp \
  2>&1 | tee tapa.log
