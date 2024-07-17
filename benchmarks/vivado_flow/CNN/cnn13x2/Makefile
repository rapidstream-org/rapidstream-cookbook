# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.


ROOT_DIR       := $(shell git rev-parse --show-toplevel)
PLATFORM       := xilinx_u50_gen3x16_xdma_5_202210_1
KERNEL_NAME    := kernel3
SRC_DIR        := $(CURDIR)/design
TEMP_DIR       := $(CURDIR)/build
HLS_SOL        := $(TEMP_DIR)/$(KERNEL_NAME)/solution/syn/report/$(KERNEL_NAME)_csynth.rpt
INCLUDE        := -I $(XILINX_HLS)/include
CFLAGS         := $(INCLUDE) $(OPT_LEVEL)
CXX            := g++
COMMON_DIR     := $(ROOT_DIR)/common
HLS2RTL_TCL    := $(COMMON_DIR)/tcl/hls2rtl.tcl
RTL2SHELL_TCL  := $(COMMON_DIR)/tcl/rtl2shell.tcl
RTL2CL_TCL     := $(COMMON_DIR)/tcl/rtl2cl.tcl
CLK_PERIOD_NS  := 3
KERNEL_CLK_MHZ := 300
SHELL_CLK_MHZ  := 300
GEN_XO         := 0
VXX            := vivado -mode batch -source
RS_DCP         := $(TEMP_DIR)/run/dse/candidate_0/route.dcp


ifeq ($(PLATFORM), xilinx_u50_gen3x16_xdma_5_202210_1)
PART      := xcu50-fsvh2104-2-e
RUN_FILE  := run_au50.py
LINK_FILE := link_config_hbm.ini
CARD      := au50
else
    $(error PLATFORM not supported)
endif

SHELL_DCP  := $(TEMP_DIR)/shell_$(CARD)_$(KERNEL_CLK_MHZ)_$(SHELL_CLK_MHZ)M_prj/shell.dcp
CL_IPI_PRJ := $(TEMP_DIR)/$(KERNEL_NAME)_$(CARD)_$(KERNEL_CLK_MHZ)_$(SHELL_CLK_MHZ)M_cl_prj/$(KERNEL_NAME)_$(CARD)_cl_prj.xpr

all:$(RS_DCP)

$(RS_DCP):$(CL_IPI_PRJ) $(SHELL_DCP)
	rapidstream $(RUN_FILE)

cl:$(CL_IPI_PRJ)

$(CL_IPI_PRJ): $(HLS_SOL)
	mkdir -p $(TEMP_DIR)
	cp -rf $(COMMON_DIR)/hdl $(TEMP_DIR)
	cp -rf $(CURDIR)/json $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VXX) $(RTL2CL_TCL) \
	-log cl.log \
	-journal cl.jou \
	-tclargs \
	$(TEMP_DIR) \
	$(KERNEL_NAME) \
	$(CARD) \
	$(KERNEL_CLK_MHZ)_$(SHELL_CLK_MHZ) \
	"run_gen"

shell:$(SHELL_DCP)

$(SHELL_DCP): $(COMMON_DIR)/shell_$(CARD)/json/config_au50.json
	mkdir -p $(TEMP_DIR)
	rm -rf $(TEMP_DIR)/shell_$(CARD) && cp -rf $(COMMON_DIR)/shell_$(CARD) $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VXX) $(RTL2SHELL_TCL) \
	-log shell.log \
	-journal shell.jou \
	-tclargs \
	$(TEMP_DIR)/shell_$(CARD) \
	$(CARD) \
	$(KERNEL_CLK_MHZ)_$(SHELL_CLK_MHZ)

hls:$(HLS_SOL)

$(HLS_SOL): $(SRC_DIR)/$(KERNEL_NAME).cpp $(SRC_DIR)/$(KERNEL_NAME).h
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && vitis_hls $(HLS2RTL_TCL) \
	-l $(TEMP_DIR)/vitis_hls_kernel3.log \
	-tclargs \
	$(PART) \
	$(CLK_PERIOD_NS) \
	$(KERNEL_NAME) \
	$(GEN_XO) \
	$^

csim:$(SRC_DIR)/main.cpp $(SRC_DIR)/$(KERNEL_NAME).cpp
	$(CXX) $(CFLAGS) $^ -o main.exe
	./main.exe

clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
	rm -rf *.jou
