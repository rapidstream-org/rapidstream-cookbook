# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.


single_make_test(){
	APP=$1
	SCRIPT=$2
	MODE=$3
	echo "Testing ${APP}"
	cd ${APP}
	if [ "${MODE}" = "clean_test" ]; then
		echo "Will clean metadata for ${APP}"
		make clean
	fi
	#make all
	cd -
	cd /home/vagrantxiao24/ws_222/rapidstream_worktree/rapidstream_local
	poetry run python ${APP}/${SCRIPT}
	cd -
}


GIT_ROOT=$(git rev-parse --show-toplevel)
START_DIR="${GIT_ROOT}/getting_started"
TAPA_DIR="${GIT_ROOT}/benchmarks/tapa_flow"
#MODE="clean_test"
MODE=""

#single_make_test "${START_DIR}/tapa_source"     "run.py" "${MODE}"
#single_make_test "${TAPA_DIR}/digit_recognizer" "run.py" "${MODE}"
single_make_test "${TAPA_DIR}/digit_recognizer" "run_u280_x0y0_x1y0.py" "${MODE}"
