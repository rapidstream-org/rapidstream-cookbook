# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

# README:
# This script is used to run regression tests for the getting started and benchmarks.

# TORUN:
# 1. Source Vivado 2023.2 settings64.sh before running this script.
# 2. Replace "RSXX" with the path to the rapidstream repo root.
# 3. sh ./regression_test.sh
# 4. Check the "build.json" file in the corresponding directory to see if the test is passed.


# Rapidstream command path
#RSXX="rapidstream"
RSPATH="/home/vagrantxiao24/ws_222/rapidstream_worktree/rapidstream"
RSPYTHON="poetry run python"
RSXX="poetry run rapidstream"
CLEAN_TEST="clean_test"
NOCLEAN_TEST="no_clean_test"

single_make_test(){
	app=$1
	rs_script=${app}/$2
	mode=$3
	echo "Testing ${app}"
	cd ${app}
	if [ "${mode}" = "${CLEAN_TEST}" ]; then
		echo "Will clean metadata for ${app}"
		make RS_SCRIPT="${rs_script}" clean
	fi
	make RSPATH="${RSPATH}" RSPYTHON="${RSPYTHON}" RSXX="${RSXX}" RS_SCRIPT="${rs_script}" all
	cd -
}

cd rapidstream-cookbook
GIT_ROOT=$(git rev-parse --show-toplevel)
START_DIR="${GIT_ROOT}/getting_started"
TAPA_DIR="${GIT_ROOT}/benchmarks/tapa_flow"
VITIS_DIR="${GIT_ROOT}/benchmarks/vitis_flow"


#single_make_test "${START_DIR}/mixed_sources" "run.py" ${CLEAN_TEST} &
#single_make_test "${START_DIR}/vitis_source" "run.py" ${CLEAN_TEST} &
#single_make_test "${START_DIR}/tapa_source" "run.py" ${CLEAN_TEST}

#single_make_test "${TAPA_DIR}/bloomFilter/b3_8_5_8" "run.py" ${CLEAN_TEST}
#single_make_test "${TAPA_DIR}/bloomFilter/b5_8_5_8" "run.py" ${CLEAN_TEST}
#single_make_test "${TAPA_DIR}/bloomFilter/b7_8_4_16" "run.py" ${CLEAN_TEST}

#single_make_test "${TAPA_DIR}/knn_chipknn/k16D_float_27PEs" "run.py" ${CLEAN_TEST}
#single_make_test "${TAPA_DIR}/knn_chipknn/k64D_8bit_30PEs" "run.py" ${CLEAN_TEST}
#single_make_test "${TAPA_DIR}/knn_chipknn/k2D_float_8PEs" "run.py" ${CLEAN_TEST}
#single_make_test "${TAPA_DIR}/knn_chipknn/k2D_float_15PEs" "run.py" ${CLEAN_TEST}

#single_make_test "${TAPA_DIR}/orcDecoder" "run.py" ${CLEAN_TEST}
single_make_test "${TAPA_DIR}/stencil_sasa/low_congestion" "run.py" ${CLEAN_TEST}

#single_make_test "${TAPA_DIR}/digit_recognizer" "run_u55c.py" ${CLEAN_TEST}
#single_make_test "${TAPA_DIR}/digit_recognizer" "run_u55c_x0y0_x1y0.py"  ${CLEAN_TEST}
#single_make_test "${TAPA_DIR}/digit_recognizer" "run_u55c_x0y0_x1y2.py"  ${CLEAN_TEST}
#single_make_test "${TAPA_DIR}/digit_recognizer" "run_u55c_top_bottom.py" ${CLEAN_TEST}
#single_make_test "${TAPA_DIR}/digit_recognizer" "run_u55c_right_left.py" ${CLEAN_TEST}

#single_make_test "${TAPA_DIR}/sextans" "run.py"  ${CLEAN_TEST} &
#single_make_test "${VITIS_DIR}/LLM" "run_u280.py"  ${CLEAN_TEST}

#single_make_test "${VITIS_DIR}/cnn13x2" "run_u50.py"  ${CLEAN_TEST} &
#single_make_test "${VITIS_DIR}/cnn13x4_16/cnn13x4" "run.py"  ${CLEAN_TEST} &
#single_make_test "${VITIS_DIR}/cnn13x4_16/cnn13x6" "run.py"  ${CLEAN_TEST}
