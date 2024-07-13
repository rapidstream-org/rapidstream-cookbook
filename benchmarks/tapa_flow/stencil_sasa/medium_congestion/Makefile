# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

TEMP_DIR  := $(CURDIR)/build
RS_TARGET := $(CURDIR)/$(TEMP_DIR)/dse/candidate_0/exported/impl/vitis_run_hw
TAPA_XO   := $(CURDIR)/design/generated/unikernel.xo
PLATFORM  := xilinx_u280_gen3x16_xdma_1_202211_1
PART      := xcu280-fsvh2892-2L-e
RUN_FILE  := $(CURDIR)/run.py

all: $(RS_TARGET)

$(RS_TARGET):$(TAPA_XO)
	rapidstream $(RUN_FILE)

clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
