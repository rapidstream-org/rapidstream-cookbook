# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR             := $(shell git rev-parse --show-toplevel)
PART_NUM             := xcu50-fsvh2104-2-e
HLSXX                := vitis_hls
HLS_SRC_DIR          := $(CURDIR)/design/hls
HLS_KERNELS          := kernel_add read_mem write_mem
TEMP_DIR             := $(CURDIR)/build
HLS_DIR_TARGETS      := $(foreach n, $(HLS_KERNELS), $(TEMP_DIR)/$(n)/solution/syn/verilog)
DCP_TARGET           := $(TEMP_DIR)/dse/candidate_0/route.dcp
KERNEL_CLK_PERIOD_NS := 4
TARGET               := hw
HLS_TCL              := $(ROOT_DIR)/common/tcl/hls2rtl.tcl
GRP_UTIL             := $(ROOT_DIR)/common/util/get_group.py
SUCCESS              := "Build Successful"
SLACK_GETTER         := $(ROOT_DIR)/common/util/get_slack.py
BUILD_LOG            := $(TEMP_DIR)/build.json

all: $(DCP_TARGET)
	rapidstream $(SLACK_GETTER) -i $(dir $<)/timing_summary.rpt -o $(BUILD_LOG)
	echo $(SUCCESS)

$(DCP_TARGET):$(HLS_DIR_TARGETS)
	rapidstream ./run.py

hls:$(HLS_DIR_TARGETS)

$(HLS_DIR_TARGETS):$(TEMP_DIR)/%/solution/syn/verilog:$(HLS_SRC_DIR)/VecAdd.cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(HLSXX)  $(HLS_TCL) \
	-l $(TEMP_DIR)/vitis_hls_$*.log \
	-tclargs \
	$(PART_NUM) \
	$(KERNEL_CLK_PERIOD_NS) \
	$* \
	0 \
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
