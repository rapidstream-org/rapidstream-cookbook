# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.


PLATFORM             := vu9p
REPO_ROOT            := $(shell git rev-parse --show-toplevel)
GRP_UTIL             := $(REPO_ROOT)/common/util/get_group.py
HLSXX                := vitis_hls
HLS_SRC_DIR          := $(CURDIR)/design
HLS_KERNEL           := bert_all
HLS_SRC_FILES        := $(foreach n, $(shell seq 1 3 ), $(HLS_SRC_DIR)/bert_region_$(n).cpp)
HLS_SRC_FILES        += $(foreach n, $(shell seq 1 3 ), $(HLS_SRC_DIR)/bert_region_$(n).h)
HLS_SRC_FILES        += $(HLS_SRC_DIR)/bert_all.cpp $(HLS_SRC_DIR)/kernel.h

TEMP_DIR             := $(CURDIR)/build
KERNEL_HLS_SOL       := $(TEMP_DIR)/$(HLS_KERNEL)/solution/syn/report/$(HLS_KERNEL)_csynth.rpt
RS_TARGET            := $(TEMP_DIR)/run/dse/candidate_0/exported/design/$(HLS_KERNEL).v
KERNEL_CLK_PERIOD_NS := 3
HLS2RTL_TCL		     := $(REPO_ROOT)/common/tcl/hls2rtl.tcl
IMPL_RS_TCL          := $(CURDIR)/tcl/impl_rs.tcl
BIT_TARGET           := $(TEMP_DIR)/prj/prj.runs/impl_1/design_1_wrapper.bit
# Do not generate XO file
GEN_XO               := 0
VXX                  := vivado -mode batch -source

ifeq ($(PLATFORM), vhk158)
PART      := xcvh1582-vsva3697-2MP-e-S
BOARD     := xilinx.com:vhk158:part0:1.1
RUN_FILE  := run_vhk158.py
BD_TCL    := $(CURDIR)/tcl/gen_design_vhk158.tcl
else ifeq ($(PLATFORM), vp1552)
PART      := xcvp1552-vsva3340-2MHP-i-S
BOARD     := dummy
RUN_FILE  := $(CURDIR)/run_vp1552.py
BD_TCL    := $(CURDIR)/tcl/gen_design_vp1552.tcl
else ifeq ($(PLATFORM), vu9p)
PART      := xcvu9p-flga2104-2L-e
BOARD     := xilinx.com:vcu118:part0:2.4
RUN_FILE  := $(CURDIR)/run_vu9p.py
BD_TCL    := $(CURDIR)/tcl/gen_design_vu9p.tcl
else ifeq ($(PLATFORM), xilinx_u280_gen3x16_xdma_1_202211_1)
PART      := xcu280-fsvh2892-2L-e
BOARD     := dummy
RUN_FILE  := $(CURDIR)/run_u280.py
BD_TCL    := $(CURDIR)/tcl/gen_design_u280.tcl
else ifeq ($(PLATFORM), xilinx_u55c_gen3x16_xdma_3_202210_1)
PART      := xcu55c-fsvh2892-2L-e
BOARD     := dummy
RUN_FILE  := $(CURDIR)/run_u55c.py
BD_TCL    := $(CURDIR)/tcl/gen_design_u55c.tcl
else ifeq ($(PLATFORM), xilinx_u250_gen3x16_xdma_4_1_202210_1)
PART      := xcu250-figd2104-2L-e
BOARD     := dummy
RUN_FILE  := $(CURDIR)/run_u250.py
BD_TCL    := $(CURDIR)/tcl/gen_design_u250.tcl
else
    $(error PLATFORM not supported)
endif

all:$(BIT_TARGET)
	echo "TESTS PASS!"

$(BIT_TARGET):$(RS_TARGET)
	cd $(TEMP_DIR) && $(VXX) $(IMPL_RS_TCL) -tclargs $(PART) $(BOARD) $(BD_TCL)

$(RS_TARGET):$(KERNEL_HLS_SOL)
	rapidstream $(RUN_FILE)

hls: $(KERNEL_HLS_SOL)

$(KERNEL_HLS_SOL): $(HLS_SRC_FILES)
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(HLSXX) $(HLS2RTL_TCL) \
	-l $(TEMP_DIR)/vitis_hls_$(HLS_KERNEL).log \
	-tclargs \
	$(PART) \
	$(KERNEL_CLK_PERIOD_NS) \
	$(HLS_KERNEL) \
	$(GEN_XO) \
	$^

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/run/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv

clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
