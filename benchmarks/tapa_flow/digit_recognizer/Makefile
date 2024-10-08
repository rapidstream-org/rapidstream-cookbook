# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
KERNEL_NAME      := digit_recognizer
RS_SCRIPT        := $(CURDIR)/run_u55c.py
FLP_CONFIG       := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/floorplan_config.json
IMPL_CONFIG      := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/impl_config.json
LINK_CONFIG      := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/link_config.ini
PLATFORM         := xilinx_u55c_gen3x16_xdma_3_202210_1
PART_NUM		 := xcu55c-fsvh2892-2L-e
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
TEMP_DIR         := $(CURDIR)/build/$(notdir $(RS_SCRIPT))
RS_TARGET        := $(TEMP_DIR)/dse/solution_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).xclbin
TAPA_XO          := $(TEMP_DIR)/$(KERNEL_NAME).xo
BUILD_LOG        := $(TEMP_DIR)/build.json
SUCCESS          := "Build Successful"
TIMING_RPT       := impl_1_hw_bb_locked_timing_summary_routed.rpt
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py
RSPATH           := $(CURDIR)
RSXX             := rapidstream
RSPYTHON         := rapidstream
DEVICE_CONFIG    := $(TEMP_DIR)/device.json


all: $(RS_TARGET)
	cd $(RSPATH) && $(RSPYTHON)	$(SLACK_GETTER) -d $(TEMP_DIR) -i $(TIMING_RPT) -o $(BUILD_LOG)  -c clk_kernel_00_unbuffered_net -p 3.333
	@echo $(SUCCESS)

$(RS_TARGET):$(TAPA_XO) $(DEVICE_CONFIG)
	mkdir -p $(TEMP_DIR)
	cd $(RSPATH) && $(RSXX)-tapaopt \
    --work-dir $(TEMP_DIR) \
    --tapa-xo-path $< \
    --device-config $(DEVICE_CONFIG) \
    --floorplan-config $(FLP_CONFIG) \
    --run-impl \
    --implementation-config $(IMPL_CONFIG) \
    --connectivity-ini $(LINK_CONFIG)

device:$(DEVICE_CONFIG)

$(DEVICE_CONFIG):$(RS_SCRIPT)
	mkdir -p $(TEMP_DIR)
	cd $(RSPATH) && $(RSPYTHON) $<

xo: $(TAPA_XO)

$(TAPA_XO): $(CURDIR)/design/$(KERNEL_NAME).cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && tapa compile \
	--top $(KERNEL_NAME) \
	--part-num $(PART_NUM) \
	--clock-period 3.33 \
	-o $(KERNEL_NAME).xo \
	-f $< \
	2>&1 | tee tapa.log

cosim:$(KERNEL_XO) $(TEMP_DIR)/main.exe
	cd $(TEMP_DIR) && $(TEMP_DIR)/main.exe 1024 \
	--bitstream $< \
	-xosim_work_dir $(TEMP_DIR)/xosim_work_dir

csim:$(TEMP_DIR)/main.exe

$(TEMP_DIR)/main.exe: $(CURDIR)/design/*.cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && tapa g++ $^ $(INCLUDE) -o $(TEMP_DIR)/main.exe -O2
	$(TEMP_DIR)/main.exe

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv

clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache

cleanall:
	rm -rf build  *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
