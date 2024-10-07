WORK_DIR=generated

tapa compile \
	--top Callipepla \
	--part-num xcu55c-fsvh2892-2L-e \
	--clock-period 3.33 \
	-o ${WORK_DIR}/Callipepla.xo \
	-f src/callipepla.cpp \
	2>&1 | tee tapa.log

# change `src/callipepla.cpp` to `src_noconst/callipepla.cpp` to generate the design without aggressively passing constants through handshake interfaces.
