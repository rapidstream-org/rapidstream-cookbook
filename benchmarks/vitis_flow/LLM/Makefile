# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

PLATFORM := xilinx_u50_gen3x16_xdma_5_202210_1
HLSXX                := vitis_hls
HLS_SRC_DIR          := design
HLS_KERNEL           := bert_all
HLS_SRC_FILES        := $(foreach n, $(shell seq 1 3 ), $(HLS_SRC_DIR)/bert_region_$(n).cpp)
HLS_SRC_FILES        += $(foreach n, $(shell seq 1 3 ), $(HLS_SRC_DIR)/bert_region_$(n).h)
HLS_SRC_FILES        += $(HLS_SRC_DIR)/bert_all.cpp $(HLS_SRC_DIR)/kernel.h

TEMP_DIR             := build
KERNEL_XO            := $(TEMP_DIR)/$(HLS_KERNEL).xo
KERNEL_XCLBIN        := $(TEMP_DIR)/$(HLS_KERNEL).xclbin
RS_XCLBIN            := $(TEMP_DIR)/dse/candidate_0/design.xclbin
KERNEL_CLK_PERIOD_NS := 3
TARGET               := hw
HLS2RTL_TCL		     := ../../../common/tcl/hls2rtl.tcl
GEN_XO               := 1

ifeq ($(PLATFORM), xilinx_u50_gen3x16_xdma_5_202210_1)
PART := xcu50-fsvh2104-2-e
RUN_FILE := run_u50.py
LINK_FILE := link_config_hbm.ini
else ifeq ($(PLATFORM), xilinx_u55c_gen3x16_xdma_3_202210_1)
PART := xcu55c-fsvh2892-2L-e
RUN_FILE := run_u55c.py
LINK_FILE := linsk_config_hbm.ini
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

$(RS_XCLBIN):$(KERNEL_XO)
	rapidstream $(RUN_FILE)

hw: $(KERNEL_XCLBIN)

$(KERNEL_XCLBIN): $(KERNEL_XO)
	v++ -l -t ${TARGET} \
	--platform $(PLATFORM) \
	--kernel $(HLS_KERNEL) \
	--connectivity.nk $(HLS_KERNEL):1:$(HLS_KERNEL) \
	--config $(HLS_SRC_DIR)/$(LINK_FILE) \
	--temp_dir $(TEMP_DIR) \
	-o $@ \
	$^

xo: $(KERNEL_XO)

$(KERNEL_XO): $(HLS_SRC_FILES)
	mkdir -p $(TEMP_DIR)
	$(HLSXX) $(HLS2RTL_TCL) \
	-l $(TEMP_DIR)/vitis_hls_$(HLS_KERNEL).log \
	-tclargs \
	$(PART) \
	$(KERNEL_CLK_PERIOD_NS) \
	$(HLS_KERNEL) \
	$(GEN_XO) \
	$^

host:$(HOST)

$(HOST): $(SRC_DIR)/host.cpp
	$(CXX) -Wall -g -std=c++11 $^ -o app.exe \
		-I${XILINX_XRT}/include/ \
		-I${XILINX_VIVADO}/include/ \
		-L${XILINX_XRT}/lib/ -lOpenCL -lpthread -lrt -lstdc++


clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
