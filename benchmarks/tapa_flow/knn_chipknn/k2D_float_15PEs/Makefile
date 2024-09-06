# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
KERNEL_NAME      := Knn
PLATFORM         := xilinx_u280_gen3x16_xdma_1_202211_1
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
RS_SCRIPT        := run.py
TEMP_DIR         := $(CURDIR)/build/$(notdir $(RS_SCRIPT))
RS_TARGET        := $(TEMP_DIR)/dse/candidate_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).xclbin
TAPA_XO          := $(CURDIR)/design/generated/knn.xo
PART             := xcu280-fsvh2892-2L-e
BUILD_LOG        := $(TEMP_DIR)/build.json
SUCCESS          := "Build Successful"
TIMING_RPT       := impl_1_hw_bb_locked_timing_summary_routed.rpt
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py

all: $(RS_TARGET)
	$(RSXX)	$(SLACK_GETTER) -d $(TEMP_DIR) -i $(TIMING_RPT) -o $(BUILD_LOG)  -c clk_kernel_00_unbuffered_net -p 3.333
	@echo $(SUCCESS)

$(RS_TARGET):$(TAPA_XO)
	$(RSXX) $(RS_SCRIPT)

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv



clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
