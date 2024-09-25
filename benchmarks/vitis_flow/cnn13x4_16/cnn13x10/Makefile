# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
KERNEL_NAME      := kernel3
PLATFORM         := xilinx_u250_gen3x16_xdma_4_1_202210_1
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
PART             := xcu250-figd2104-2L-e
LINK_FILE        := link_config.ini
SRC_DIR          := $(CURDIR)/design
TARGET           := hw
RS_SCRIPT        := $(CURDIR)/run.py
TEMP_DIR         := $(CURDIR)/build/$(notdir $(RS_SCRIPT))
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
TIMING_RPT       := impl_1_hw_bb_locked_timing_summary_routed.rpt
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py
RSPATH           := $(CURDIR)
RSXX             := rapidstream
RSPYTHON         := rapidstream

all: $(RS_KERNEL_XCLBIN)
	cd $(RSPATH) && $(RSPYTHON)	$(SLACK_GETTER) -d $(TEMP_DIR) -i $(TIMING_RPT) -o $(BUILD_LOG)  -c clk_kernel_00_unbuffered_net -p 3.333
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
	--save-temps \
	-o $@ \
	$^

rs_opt:$(RS_TARGET)

$(RS_TARGET): $(KERNEL_XO)
	cd $(RSPATH) && $(RSPYTHON) $(RS_SCRIPT)

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
