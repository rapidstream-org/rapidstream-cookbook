# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
PLATFORM         := xilinx_u280_gen3x16_xdma_1_202211_1
PART_NUM         := xcu280-fsvh2892-2L-e
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
RS_SCRIPT        := run.py
KERNEL_NAME      := digit_recognizer
SRC_DIR          := $(CURDIR)/design
TARGET           := hw
TEMP_DIR         := $(CURDIR)/build/$(RS_SCRIPT)
KERNEL_XO        := $(TEMP_DIR)/$(KERNEL_NAME).xo
KERNEL_XCLBIN    := $(TEMP_DIR)/$(KERNEL_NAME).xclbin
RS_KERNEL_XCLBIN := $(TEMP_DIR)/dse/candidate_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).xclbin
INCLUDE          := -I $(XILINX_HLS)/include
CFLAGS           := $(INCLUDE) $(OPT_LEVEL)
CXX              := g++
HOST             := app.exe
RS_TARGET        := $(TEMP_DIR)/dse/candidate_0/exported/$(KERNEL_NAME).xo
TIMING_RPT       := impl_1_hw_bb_locked_timing_summary_routed.rpt
SUCCESS          := "Build Successful"
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py
BUILD_LOG        := $(TEMP_DIR)/build.json

all: $(RS_KERNEL_XCLBIN)
	rapidstream	$(SLACK_GETTER) -d $(TEMP_DIR) -i $(TIMING_RPT) -o $(BUILD_LOG)  -c clk_kernel_00_unbuffered_net -p 3.333
	echo $(SUCCESS)

$(RS_KERNEL_XCLBIN):$(SRC_DIR)/$(KERNEL_NAME).xo
	mkdir -p $(TEMP_DIR)
	rapidstream $(RS_SCRIPT)


sw_emu: $(KERNEL_XCLBIN) $(HOST)
	XCL_EMULATION_MODE=sw_emu ./app.exe $<


xo:$(KERNEL_XO)

$(KERNEL_XO): $(SRC_DIR)/$(KERNEL_NAME).cpp
	tapac -o $@ $< \
	--part-num $(PART_NUM) \
	--clock-period 3.33 \
	--top $(KERNEL_NAME) \
	--work-dir $(TEMP_DIR)

csim:$(SRC_DIR)/*.cpp
	mkdir -p $(TEMP_DIR)
	$(CXX) $(INCLUDE) -o $(TEMP_DIR)/main.exe -O2 $^ -ltapa -lfrt -lglog -lgflags -lOpenCL
	$(TEMP_DIR)/main.exe

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv

m=$(shell date)

git:clean
	git add .
	git commit -m "$(m)"

clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
