# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

PLATFORM := xilinx_u280_gen3x16_xdma_1_202211_1
KERNEL_NAME=VecAdd
SRC_DIR=design
TARGET=hw
TEMP_DIR=build
KERNEL_XO=$(TEMP_DIR)/$(KERNEL_NAME).xo
INCLUDE=-I ${XILINX_HLS}/include
CFLAGS=$(INCLUDE) $(OPT_LEVEL)
CXX=g++


all: $(KERNEL_XO)
	rapidstream ./run.py

xo:$(KERNEL_XO)

$(KERNEL_XO): $(SRC_DIR)/$(KERNEL_NAME).cpp
	v++ -c -t ${TARGET} --platform $(PLATFORM) -k $(KERNEL_NAME) -o $(KERNEL_XO) --temp_dir $(TEMP_DIR) $^

csim:$(SRC_DIR)/main.cpp $(SRC_DIR)/VecAdd.cpp
	$(CXX) $(CFLAGS) $^ -o main.exe
	./main.exe



clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil
	rm -rf *.exe
