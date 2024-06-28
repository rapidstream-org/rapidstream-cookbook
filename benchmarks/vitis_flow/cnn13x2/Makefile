# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

PLATFORM := xilinx_u50_gen3x16_xdma_5_202210_1
KERNEL_NAME=kernel3
SRC_DIR=design
TARGET=hw
TEMP_DIR=build
KERNEL_XO=$(TEMP_DIR)/$(KERNEL_NAME).xo
KERNEL_XCLBIN=$(TEMP_DIR)/$(KERNEL_NAME).xclbin
INCLUDE=-I $(XILINX_HLS)/include
CFLAGS=$(INCLUDE) $(OPT_LEVEL)
CXX=g++
HOST=app.exe
HLS2XO_TCL=../../common/tcl/hls2xo.tcl
CLK_PERIOD_NS=4

ifeq ($(PLATFORM), xilinx_u50_gen3x16_xdma_5_202210_1)
PART := xcu50-fsvh2104-2-e
else ifeq ($(PLATFORM), xilinx_u55c_gen3x16_xdma_3_202210_1)
PART := xcu55c-fsvh2892-2L-e
else ifeq ($(PLATFORM), xilinx_u250_gen3x16_xdma_4_1_202210_1)
PART := xcu250-figd2104-2L-e
else ifeq ($(PLATFORM), xilinx_u280_gen3x16_xdma_1_202211_1)
PART := xcu280-fsvh2892-2L-e
else
    $(error PLATFORM not supported)
endif

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
ifeq ($(TARGET), hw)
	mkdir -p $(TEMP_DIR)
	vitis_hls $(HLS2XO_TCL) \
	-l $(TEMP_DIR)/vitis_hls_$(KERNEL_NAME).log \
	-tclargs $(PART) $(CLK_PERIOD_NS) $(KERNEL_NAME) $^
else
	v++ -c -t ${TARGET} \
	--platform $(PLATFORM) \
	-k $(KERNEL_NAME) \
	--temp_dir $(TEMP_DIR) \
	-o $@ \
	$^
endif


host:$(HOST)

$(HOST): $(SRC_DIR)/host.cpp $(SRC_DIR)/kernel3.h
	$(CXX) -Wall -g -std=c++11 $^ -o app.exe \
		-I${XILINX_XRT}/include/ \
		-I${XILINX_HLS}/include/ \
		-L${XILINX_XRT}/lib/ -lOpenCL -pthread -lrt -lstdc++

csim:$(SRC_DIR)/main.cpp $(SRC_DIR)/$(KERNEL_NAME).cpp
	$(CXX) $(CFLAGS) $^ -o main.exe
	./main.exe



clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
