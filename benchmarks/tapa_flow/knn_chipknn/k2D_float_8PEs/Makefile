# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
KERNEL_NAME      := Knn
PLATFORM         := xilinx_u280_gen3x16_xdma_1_202211_1
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
AB_CONFIG        := $(CURDIR)/design/config/ab_config.json
TEMP_DIR         := $(CURDIR)/build/$(notdir $(AB_CONFIG))
RS_TARGET        := $(TEMP_DIR)/dse/candidate_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).xclbin
TAPA_XO          := $(CURDIR)/design/generated/knn.xo
PART             := xcu280-fsvh2892-2L-e
BUILD_LOG        := $(TEMP_DIR)/build.json
SUCCESS          := "Build Successful"
TIMING_RPT       := impl_1_hw_bb_locked_timing_summary_routed.rpt
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py
RSPATH           := $(CURDIR)
RSXX             := rapidstream
RSPYTHON         := rapidstream
DEVICE_CONFIG    := $(TEMP_DIR)/device.json
DEVICE_GEN       := $(CURDIR)/gen_device.py

all: $(RS_TARGET)
	cd $(RSPATH) && $(RSPYTHON)	$(SLACK_GETTER) -d $(TEMP_DIR) -i $(TIMING_RPT) -o $(BUILD_LOG)  -c clk_kernel_00_unbuffered_net -p 3.333
	@echo $(SUCCESS)

$(RS_TARGET):$(TAPA_XO) $(DEVICE_CONFIG)
	mkdir -p $(TEMP_DIR)
	cd $(RSPATH) && $(RSXX)-tapaopt \
    --work-dir $(TEMP_DIR) \
    --tapa-xo-path $< \
    --device-config $(DEVICE_CONFIG) \
    --floorplan-config $(AB_CONFIG) \
	--single-reg \
    --run-impl \
    --implementation-config $(CURDIR)/design/config/impl_config.json \
    --connectivity-ini $(CURDIR)/design/config/link_config.ini

$(DEVICE_CONFIG):$(AB_CONFIG)
	mkdir -p $(TEMP_DIR)
	cd $(RSPATH) && $(RSPYTHON) $(DEVICE_GEN) -i $(AB_CONFIG)

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv



clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
