#!/bin/bash
TARGET=hw
# TARGET=hw_emu
# DEBUG=-g

TOP=workload
XO='/home/ylxiao/workspace/rapidstream-cookbook/benchmarks/tapa_flow/bloomFilter/b3_8_5_8/design/generated/multistream_MurmurHash3.xo'
>&2 echo "Using the default clock target of the platform."
PLATFORM=""
if [ -z $PLATFORM ]; then echo Please edit this file and set a valid PLATFORM= on line "${LINENO}"; exit; fi

OUTPUT_DIR="$(pwd)/vitis_run_${TARGET}"

MAX_SYNTH_JOBS=8
STRATEGY="Explore"
PLACEMENT_STRATEGY="EarlyBlockPlacement"

v++ ${DEBUG} \
  --link \
  --output "${OUTPUT_DIR}/${TOP}_${PLATFORM}.xclbin" \
  --kernel ${TOP} \
  --platform ${PLATFORM} \
  --target ${TARGET} \
  --report_level 2 \
  --temp_dir "${OUTPUT_DIR}/${TOP}_${PLATFORM}.temp" \
  --optimize 3 \
  --connectivity.nk ${TOP}:1:${TOP} \
  --save-temps \
  "${XO}" \
  --vivado.synth.jobs ${MAX_SYNTH_JOBS} \
  --vivado.prop=run.impl_1.STEPS.PHYS_OPT_DESIGN.IS_ENABLED=1 \
  --vivado.prop=run.impl_1.STEPS.OPT_DESIGN.ARGS.DIRECTIVE=$STRATEGY \
  --vivado.prop=run.impl_1.STEPS.PLACE_DESIGN.ARGS.DIRECTIVE=$PLACEMENT_STRATEGY \
  --vivado.prop=run.impl_1.STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTIVE=$STRATEGY \
  --vivado.prop=run.impl_1.STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE=$STRATEGY \
