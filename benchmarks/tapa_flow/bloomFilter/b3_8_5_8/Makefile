# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
KERNEL_NAME      := workload
PLATFORM         := xilinx_u280_gen3x16_xdma_1_202211_1
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
TEMP_DIR         := $(CURDIR)/build
RS_TARGET        := $(TEMP_DIR)/dse/candidate_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).xclbin
TAPA_XO          := $(CURDIR)/design/generated/multistream_MurmurHash3.xo
PART             := xcu280-fsvh2892-2L-e
RUN_FILE         := $(CURDIR)/run.py
BUILD_LOG        := $(TEMP_DIR)/build.json
SUCCESS          := "Build Successful"
TIMING_RPT       := $(TEMP_DIR)/dse/candidate_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).temp/reports/link/imp/impl_1_hw_bb_locked_timing_summary_routed.rpt
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py

all: $(RS_TARGET)
	rapidstream $(SLACK_GETTER) -i $(TIMING_RPT) -o $(BUILD_LOG)
	echo $(SUCCESS)

$(RS_TARGET):$(TAPA_XO)
	rapidstream $(RUN_FILE)

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv



clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
