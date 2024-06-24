# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

PLATFORM := xilinx_u280_gen3x16_xdma_1_202211_1
KERNEL_NAME=VecAdd
SRC_DIR=design
TARGET=hw
TEMP_DIR=build
KERNEL_XO=$(TEMP_DIR)/$(KERNEL_NAME).xo
KERNEL_XCLBIN=$(TEMP_DIR)/$(KERNEL_NAME).xclbin
INCLUDE=-I $(XILINX_HLS)/include
CFLAGS=$(INCLUDE) $(OPT_LEVEL)
CXX=g++
HOST=app.exe

all:rs_opt

sw_emu: $(KERNEL_XCLBIN) $(HOST)
	XCL_EMULATION_MODE=sw_emu ./app.exe $<

hw: $(KERNEL_XCLBIN) $(HOST)

rs_opt:$(KERNEL_XO)
	rapidstream ./run.py

$(KERNEL_XCLBIN): $(KERNEL_XO)
	v++ -l -t ${TARGET} \
	--platform $(PLATFORM) \
	--kernel $(KERNEL_NAME) \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	--config $(SRC_DIR)/link_config.ini \
	--temp_dir $(TEMP_DIR) \
	-o $@ \
	$^

xo:$(KERNEL_XO)

$(KERNEL_XO): $(SRC_DIR)/$(KERNEL_NAME).cpp $(SRC_DIR)/$(KERNEL_NAME).h
	v++ -c -t ${TARGET} \
	--platform $(PLATFORM) \
	-k $(KERNEL_NAME) \
	--temp_dir $(TEMP_DIR) \
	-o $@ \
	$^

host:$(HOST)

$(HOST): $(SRC_DIR)/host.cpp
	$(CXX) -Wall -g -std=c++11 $^ -o app.exe \
		-I${XILINX_XRT}/include/ \
		-I${XILINX_VIVADO}/include/ \
		-L${XILINX_XRT}/lib/ -lOpenCL -lpthread -lrt -lstdc++

csim:$(SRC_DIR)/main.cpp $(SRC_DIR)/VecAdd.cpp
	$(CXX) $(CFLAGS) $^ -o main.exe
	./main.exe



clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
