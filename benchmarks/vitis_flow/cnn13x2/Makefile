# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.


ROOT_DIR         := $(shell git rev-parse --show-toplevel)
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
PLATFORM         := xilinx_u50_gen3x16_xdma_5_202210_1
KERNEL_NAME      := kernel3
SRC_DIR          := $(CURDIR)/design
TARGET           := hw
TEMP_DIR         := $(CURDIR)/build
KERNEL_XO        := $(TEMP_DIR)/$(KERNEL_NAME).xo
KERNEL_XCLBIN    := $(TEMP_DIR)/$(KERNEL_NAME).xclbin
RS_KERNEL_XCLBIN := $(TEMP_DIR)/$(KERNEL_NAME)_rs.xclbin
INCLUDE          := -I $(XILINX_HLS)/include
CFLAGS           := $(INCLUDE) $(OPT_LEVEL)
CXX              := g++
HOST             := app.exe
HLS2XO_TCL       := $(ROOT_DIR)/common/tcl/hls2rtl.tcl
CLK_PERIOD_NS    := 4
RS_TARGET        := $(TEMP_DIR)/dse/candidate_0/exported/$(KERNEL_NAME).xo
BUILD_LOG        := $(TEMP_DIR)/build.json
SUCCESS          := "Build Successful"
TIMING_RPT       := $(TEMP_DIR)/reports/link/imp/impl_1_hw_bb_locked_timing_summary_routed.rpt
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py

ifeq ($(PLATFORM), xilinx_u50_gen3x16_xdma_5_202210_1)
PART := xcu50-fsvh2104-2-e
RUN_FILE := run_u50.py
LINK_FILE := link_config_hbm.ini
else ifeq ($(PLATFORM), xilinx_u55c_gen3x16_xdma_3_202210_1)
PART := xcu55c-fsvh2892-2L-e
RUN_FILE := run_u55c.py
LINK_FILE := link_config_hbm.ini
else ifeq ($(PLATFORM), xilinx_u280_gen3x16_xdma_1_202211_1)
PART := xcu280-fsvh2892-2L-e
RUN_FILE := run_u280.py
LINK_FILE := link_config_hbm.ini
else ifeq ($(PLATFORM), xilinx_u250_gen3x16_xdma_4_1_202210_1)
PART := xcu250-figd2104-2L-e
RUN_FILE := run_u250.py
LINK_FILE := link_config_ddr.ini
else
    $(error PLATFORM not supported)
endif

all: $(RS_KERNEL_XCLBIN)
	rapidstream $(SLACK_GETTER) -i $(TIMING_RPT) -o $(BUILD_LOG)
	echo $(SUCCESS)

sw_emu: $(KERNEL_XCLBIN) $(HOST)
	XCL_EMULATION_MODE=sw_emu ./app.exe $<

hw: $(KERNEL_XCLBIN) $(HOST)

$(RS_KERNEL_XCLBIN): $(RS_TARGET)
	v++ -l -t ${TARGET} \
	--platform $(PLATFORM) \
	--kernel $(KERNEL_NAME) \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	--config $(SRC_DIR)/$(LINK_FILE) \
	--temp_dir $(TEMP_DIR) \
	-o $@ \
	$^

rs_opt:$(RS_TARGET)

$(RS_TARGET): $(KERNEL_XO)
	rapidstream $(RUN_FILE)

$(KERNEL_XCLBIN): $(KERNEL_XO)
	v++ -l -t ${TARGET} \
	--platform $(PLATFORM) \
	--kernel $(KERNEL_NAME) \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	--config $(SRC_DIR)/$(LINK_FILE) \
	--temp_dir $(TEMP_DIR) \
	-o $@ \
	$^

xo:$(KERNEL_XO)

$(KERNEL_XO): $(SRC_DIR)/$(KERNEL_NAME).cpp $(SRC_DIR)/$(KERNEL_NAME).h
ifeq ($(TARGET), hw)
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && vitis_hls $(HLS2XO_TCL) \
	-l $(TEMP_DIR)/vitis_hls_$(KERNEL_NAME).log \
	-tclargs $(PART) $(CLK_PERIOD_NS) $(KERNEL_NAME) 1 \
	$^
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

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv



clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
