# Copyright 2024 RapidStream Design Automation, Inc.
# All Rights Reserved.

WORK_DIR=generated

tapac \
  --work-dir ${WORK_DIR} \
  --top Sextans \
  --part-num xcu280-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/Sextans.xo \
  --connectivity config/link_config.ini \
  src/sextans.cpp \
  2>&1 | tee ${WORK_DIR}/tapa.log

# change `src/sextans.cpp` to `src/sextans-no-const-para.cpp` to generate the design without aggressively passing constants through handshake interfaces.
