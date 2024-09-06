WORK_DIR=generated

tapac \
  --work-dir ${WORK_DIR} \
  --top Callipepla \
  --part-num xcu280-fsvh2892-2L-e \
  --clock-period 4.30 \
  -o ${WORK_DIR}/Callipepla.xo \
  --connectivity config/link_config.ini \
  --read-only-args edge_list_ptr \
  --read-only-args edge_list_ch* \
  --read-only-args vec_digA \
  --write-only-args vec_res \
  src/callipepla.cpp \
  2>&1 | tee tapa.log

# change `src/callipepla.cpp` to `src_noconst/callipepla.cpp` to generate the design without aggressively passing constants through handshake interfaces.
