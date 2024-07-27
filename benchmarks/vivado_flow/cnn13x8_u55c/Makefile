
# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

REPO_ROOT  := $(shell git rev-parse --show-toplevel)
PART_NUM   := xcu55c-fsvh2892-2L-e
BOARD_PART := xilinx.com:au55c:part0:1.0
DESIGN_SRC := $(CURDIR)/design
TEMP_DIR   := $(CURDIR)/build
BIT_TARGET := $(TEMP_DIR)/prj/prj.runs/impl_1/design_1_wrapper.bit
VXX        := vivado -mode batch -source
#VXX        := vivado -source

BUILD_LOG        := $(TEMP_DIR)/build.json
SUCCESS          := "Build Successful"
TIMING_RPT       := $(TEMP_DIR)/prj/prj.runs/impl_1/design_1_wrapper_timing_summary_routed.rpt
SLACK_GETTER     := $(REPO_ROOT)/common/util/get_slack.py


all: $(BIT_TARGET)
	rapidstream $(SLACK_GETTER) -i $(TIMING_RPT) -o $(BUILD_LOG)
	echo $(SUCCESS)

hw:$(BIT_TARGET)

$(BIT_TARGET): $(CURDIR)/tcl/prj_gen.tcl
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VXX) $< -tclargs $(PART_NUM) $(BOARD_PART) $(DESIGN_SRC)


clean:
	rm -rf build

cleanall:
	rm -rf prj vivado* .Xil *.log


ifndef XILINX_VITIS
		$(error Vivado 2022.2 environment variable XILINX_VIVADO is required)
endif
