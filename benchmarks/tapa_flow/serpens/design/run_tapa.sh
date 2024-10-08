# Copyright 2024 RapidStream Design Automation, Inc.
# All Rights Reserved.

tapa compile \
  --top Serpens \
  --part-num xcu55c-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o generated/Serpens.xo \
  -f src/serpens.cpp \
  2>&1 | tee tapa.log

# change `src/serpens.cpp` to `src/serpens-noconst.cpp` to generate the design without aggressively passing constants through handshake interfaces.
