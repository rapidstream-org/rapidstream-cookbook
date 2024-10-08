# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
#/opt/xilinx/platforms/xilinx_vck5000_gen4x8_qdma_2_202220_1/xilinx_vck5000_gen4x8_qdma_2_202220_1.xpfm
PART_NUM         := xcu280-fsvh2892-2L-e
PLATFORM         := xilinx_vck5000_gen4x8_qdma_2_202220_1
PLATFORM_REPO_PATHS := /opt/xilinx/platforms
XPFM_FILE        := $(PLATFORM_REPO_PATHS)/$(PLATFORM)/$(PLATFORM).xpfm
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
KERNEL_NAME      := VecAdd
RS_SCRIPT        := $(CURDIR)/run_u55c.py
SRC_DIR		     := $(CURDIR)/design
AB_CONFIG        := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/floorplan_config.json
IMPL_CONFIG      := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/impl_config.json
LINK_CONFIG      := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/link_config.ini
FIX_NOC_TCL      := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/fix_noc.tcl
TARGET           := hw
TEMP_DIR         := $(CURDIR)/build/$(notdir $(RS_SCRIPT))
KERNEL_XO        := $(TEMP_DIR)/$(KERNEL_NAME).xo
KERNEL_XCLBIN    := $(TEMP_DIR)/$(KERNEL_NAME).xclbin
RS_XCLBIN        := $(TEMP_DIR)/dse/solution_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).xclbin
INCLUDE          := -I $(XILINX_HLS)/include
CFLAGS           := $(INCLUDE) $(OPT_LEVEL)
CXX              := g++
HOST             := app.exe
RS_TARGET        := $(TEMP_DIR)/dse/solution_0/updated.xo
TIMING_RPT       := impl_1_hw_bb_locked_timing_summary_routed.rpt
SUCCESS          := "Build Successful"
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py
BUILD_LOG        := $(TEMP_DIR)/build.json
RSXX             := rapidstream
RSPATH           := $(CURDIR)
RSPYTHON         := rapidstream
DEVICE_CONFIG    := $(TEMP_DIR)/device.json
AIE_OBJ          := $(TEMP_DIR)/libadf.a
AXX              := aiecompiler

all:clean $(KERNEL_XO)

all1: $(RS_XCLBIN)
	$(RSXX) $(SLACK_GETTER) -d $(TEMP_DIR) -i $(TIMING_RPT) -o $(BUILD_LOG)  -c clk_kernel_00_unbuffered_net -p 3.333
	echo $(SUCCESS)

$(RS_XCLBIN): $(RS_TARGET)
	v++ -l -t ${TARGET} \
	--platform $(PLATFORM) \
	--kernel $(KERNEL_NAME) \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	--config $(LINK_CONFIG) \
	--temp_dir $(TEMP_DIR) \
	-o $@ \
	$^

$(RS_TARGET):$(KERNEL_XO) $(DEVICE_CONFIG) $(AB_CONFIG)
	mkdir -p $(TEMP_DIR)
	cd $(RSPATH) && $(RSXX)-tapaopt \
    --work-dir $(TEMP_DIR) \
    --tapa-xo-path $< \
    --device-config $(DEVICE_CONFIG) \
    --floorplan-config $(AB_CONFIG) \
    --implementation-config $(IMPL_CONFIG) \
    --connectivity-ini $(LINK_CONFIG)

device: $(DEVICE_CONFIG)

$(DEVICE_CONFIG):$(RS_SCRIPT)
	mkdir -p $(TEMP_DIR)
	cd $(RSPATH) && $(RSPYTHON) $(RS_SCRIPT)

hw: $(KERNEL_XCLBIN)

$(KERNEL_XCLBIN): $(KERNEL_XO)
	v++ -l -t ${TARGET} \
	--platform $(PLATFORM) \
	--kernel $(KERNEL_NAME) \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	--config $(LINK_CONFIG) \
	--temp_dir $(TEMP_DIR) \
	-o $@ \
	$^

xo:$(KERNEL_XO)

#-o $(KERNEL_NAME).xo
#

#--flow-type pl \
#	--flow-type aie \

$(KERNEL_XO):$(SRC_DIR)/$(KERNEL_NAME).cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && tapa compile \
	--top $(KERNEL_NAME) \
	--platform $(PLATFORM) \
	--flow-type aie \
	--clock-period 3.33  \
	--keep-hls-work-dir \
	-f $< \
	2>&1 | tee tapa.log

csim:$(TEMP_DIR)/main.exe
	$(TEMP_DIR)/main.exe

$(TEMP_DIR)/main.exe: $(SRC_DIR)/main.cpp $(SRC_DIR)/VecAdd.cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && tapa g++ $^ $(INCLUDE) -o $@ -O2


show_groups:
	@echo $(RS_KERNEL_XCLBIN)
	$(RSXX) $(GRP_UTIL) -i $(TEMP_DIR)/passes/1-importer.json \
	-o $(TEMP_DIR)/module_types.csv

cp:
	@cp $(CURDIR)/../aie_source_gmio/design/aie/*.h $(TEMP_DIR)/work.out/cpp/
	@mv $(TEMP_DIR)/work.out/cpp/VecAdd.cpp $(TEMP_DIR)/work.out/cpp/VecAdd.h
	@cp $(CURDIR)/../aie_source_gmio/design/aie/VecAdd.cpp $(TEMP_DIR)/work.out/cpp/
	@echo "Copied files"

aie_compile:$(AIE_OBJ)

$(AIE_OBJ): $(TEMP_DIR)/work.out/cpp/*
	@mkdir -p $(TEMP_DIR)/Work
	@cd $(TEMP_DIR) && $(AXX) \
	--target=$(TARGET) \
	--platform=$(XPFM_FILE) \
	--include="$(TEMP_DIR)/work.out/cpp" \
	--workdir=$(TEMP_DIR)/Work \
	$(TEMP_DIR)/work.out/cpp/VecAdd.cpp


clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf build
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
