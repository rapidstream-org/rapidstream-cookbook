# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
PLATFORM         := xilinx_u280_gen3x16_xdma_1_202211_1
KERNEL_NAME      := bert_all
HLSXX            := vitis_hls
HLS_SRC_DIR      := $(CURDIR)/design
HLS_SRC_FILES    := $(foreach n, $(shell seq 1 3 ), $(HLS_SRC_DIR)/bert_region_$(n).cpp)
HLS_SRC_FILES    += $(foreach n, $(shell seq 1 3 ), $(HLS_SRC_DIR)/bert_region_$(n).h)
HLS_SRC_FILES    += $(HLS_SRC_DIR)/bert_all.cpp $(HLS_SRC_DIR)/kernel.h

TEMP_DIR         := $(CURDIR)/build
KERNEL_XO        := $(TEMP_DIR)/$(KERNEL_NAME).xo
KERNEL_XCLBIN    := $(TEMP_DIR)/$(KERNEL_NAME).xclbin
RS_XCLBIN        := $(TEMP_DIR)/dse/candidate_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).xclbin
CLK_PERIOD_NS    := 3
TARGET           := hw
HLS2RTL_TCL	     := $(ROOT_DIR)/common/tcl/hls2rtl.tcl
GEN_XO           := 1

BUILD_LOG        := $(TEMP_DIR)/build.json
SUCCESS          := "Build Successful"
TIMING_RPT       := $(TEMP_DIR)/dse/candidate_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).temp/reports/link/imp/impl_1_hw_bb_locked_timing_summary_routed.rpt
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

all: $(RS_XCLBIN)
	rapidstream $(SLACK_GETTER) -i $(TIMING_RPT) -o $(BUILD_LOG)
	echo $(SUCCESS)

$(RS_XCLBIN):$(KERNEL_XO)
	rapidstream $(RUN_FILE)

hw: $(KERNEL_XCLBIN)

$(KERNEL_XCLBIN): $(KERNEL_XO)
	v++ -l -t ${TARGET} \
	--platform $(PLATFORM) \
	--kernel $(KERNEL_NAME) \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	--config $(HLS_SRC_DIR)/$(LINK_FILE) \
	--temp_dir $(TEMP_DIR) \
	-o $@ \
	$^

xo: $(KERNEL_XO)

$(KERNEL_XO): $(HLS_SRC_FILES)
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(HLSXX) $(HLS2RTL_TCL) \
	-l $(TEMP_DIR)/vitis_hls_$(KERNEL_NAME).log \
	-tclargs \
	$(PART) \
	$(CLK_PERIOD_NS) \
	$(KERNEL_NAME) \
	$(GEN_XO) \
	$^

host:$(HOST)

$(HOST): $(SRC_DIR)/host.cpp
	$(CXX) -Wall -g -std=c++11 $^ -o app.exe \
		-I${XILINX_XRT}/include/ \
		-I${XILINX_VIVADO}/include/ \
		-L${XILINX_XRT}/lib/ -lOpenCL -lpthread -lrt -lstdc++
show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv



clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
