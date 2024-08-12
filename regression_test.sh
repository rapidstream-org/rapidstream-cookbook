# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

GIT_ROOT=$(git rev-parse --show-toplevel)
TAPA_DIR="${GIT_ROOT}/benchmarks/tapa_flow"


cd "${TAPA_DIR}/digit_recognizer"
make clean
make all
