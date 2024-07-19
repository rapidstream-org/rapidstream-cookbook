# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
PLATFORM         := xilinx_u280_gen3x16_xdma_1_202211_1
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
KERNEL_NAME      := VecAdd
SRC_DIR          := design
TARGET           := hw
TEMP_DIR         := $(CURDIR)/build
KERNEL_XO        := $(TEMP_DIR)/$(KERNEL_NAME).xo
KERNEL_XCLBIN    := $(TEMP_DIR)/$(KERNEL_NAME).xclbin
RS_KERNEL_XCLBIN := $(TEMP_DIR)/$(KERNEL_NAME)_rs.xclbin
INCLUDE          := -I $(XILINX_HLS)/include
CFLAGS           := $(INCLUDE) $(OPT_LEVEL)
CXX              := g++
HOST             := app.exe
RS_TARGET        := $(TEMP_DIR)/dse/candidate_0/exported/VecAdd.xo
TIMING_RPT       := $(TEMP_DIR)/reports/link/imp/impl_1_hw_bb_locked_timing_summary_routed.rpt
SUCCESS          := "Build Successful"
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py

all: $(RS_KERNEL_XCLBIN)
	rapidstream	$(SLACK_GETTER) -i $(TIMING_RPT)
	echo $(SUCCESS)


$(RS_KERNEL_XCLBIN): $(RS_TARGET)
	v++ -l -t ${TARGET} \
	--platform $(PLATFORM) \
	--kernel $(KERNEL_NAME) \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	--config $(SRC_DIR)/link_config.ini \
	--temp_dir $(TEMP_DIR) \
	-o $@ \
	$^

rs_opt:$(RS_TARGET)

$(RS_TARGET): $(KERNEL_XO)
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

sw_emu: $(KERNEL_XCLBIN) $(HOST)
	XCL_EMULATION_MODE=sw_emu ./app.exe $<

hw: $(KERNEL_XCLBIN) $(HOST)

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

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv


clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
