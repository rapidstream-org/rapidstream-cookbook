# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

# README:
# This script is used to run regression tests for the getting started and benchmarks.

# TORUN:
# 1. Source Vivado 2023.2 settings64.sh before running this script.
# 2. Replace "RS_ROOT" with the path to the rapidstream repo root.
# 3. sh ./regression_test.sh
# 4. Check the "build.json" file in the corresponding directory to see if the test passed.


# repidstream repo root
RS_ROOT="/home/vagrantxiao24/ws_222/rapidstream_worktree/rapidstream_local"
CLEAN_TEST="clean_test"
NOCLEN_TEST="no_clean_test"

single_make_test(){
	app=$1
	script=$2
	MODE=$3
	echo "Testing ${app}"
	cd ${app}
	if [ "${MODE}" = "clean_test" ]; then
		echo "Will clean metadata for ${app}"
		make clean
	fi
	#make all
	cd -
	cd ${RS_ROOT}
	poetry run python ${app}/${script}
	cd -
}

GIT_ROOT=$(git rev-parse --show-toplevel)
START_DIR="${GIT_ROOT}/getting_started"
TAPA_DIR="${GIT_ROOT}/benchmarks/tapa_flow"

single_make_test "${START_DIR}/tapa_source"     "run.py"                 ${CLEAN_TEST}
single_make_test "${TAPA_DIR}/digit_recognizer" "run.py"                 ${CLEAN_TEST}
single_make_test "${TAPA_DIR}/digit_recognizer" "run_u280_x0y0_x1y0.py"  ${NOCLEN_TEST}
single_make_test "${TAPA_DIR}/digit_recognizer" "run_u280_right_left.py" ${NOCLEN_TEST}
single_make_test "${TAPA_DIR}/digit_recognizer" "run_u280_top_bottom.py" ${NOCLEN_TEST}
single_make_test "${TAPA_DIR}/digit_recognizer" "run_u280_x0y0_x1y2.py"  ${NOCLEN_TEST}
single_make_test "${TAPA_DIR}/sextans" "run.py"                          ${CLEAN_TEST}
