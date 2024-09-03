# Copyright 2024 RapidStream Design Automation, Inc.
# All Rights Reserved.

WORK_DIR=generated

tapac \
  --work-dir ${WORK_DIR} \
  --top Serpens \
  --part-num xcu280-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/Serpens.xo \
  --connectivity config/link_config_a24.ini \
  src/serpens-noconst.cpp \
  2>&1 | tee ${WORK_DIR}/tapa.log

# change `src/sextans.cpp` to `src/serpens-noconst.cpp` to generate the design without aggressively passing constants through handshake interfaces.
