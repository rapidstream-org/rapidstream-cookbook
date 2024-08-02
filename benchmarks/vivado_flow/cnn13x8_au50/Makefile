# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR             := $(shell git rev-parse --show-toplevel)
GRP_UTIL             := $(ROOT_DIR)/common/util/get_group.py
PLATFORM             := xilinx_u50_gen3x16_xdma_5_202210_1
REPO_ROOT            := $(shell git rev-parse --show-toplevel)
HLSXX                := vitis_hls
HLS_KERNEL           := kernel3

TEMP_DIR             := $(CURDIR)/build
BD_BIT_TARGET        := $(TEMP_DIR)/bd/prj_bd/prj_bd.runs/impl_1/design_1_wrapper.bit

VXX                  := vivado -mode batch -source
#VXX                  := vivado -source

PART                 := xcu50-fsvh2104-2-e
BOARD                := xilinx.com:au50dd:part0:1.0
RUN_FILE             := $(CURDIR)/run_au50.py
BD_TCL               := $(CURDIR)/tcl/gen_design_u50.tcl

BIT                  := $(BIT_TARGET)

all: $(BD_BIT_TARGET)

bd_bit:$(BD_BIT_TARGET)

$(BD_BIT_TARGET):$(CURDIR)/design/grouped_modules.json
	mkdir -p $(TEMP_DIR)/bd
	cd $(TEMP_DIR)/bd && $(VXX) $(CURDIR)/tcl/bd20222/impl.tcl -tclargs $(PART) $(BOARD) $(CURDIR)/tcl/bd20222/gen_design_u50.tcl $(shell dirname $<)

download_bit:tcl/download.tcl
	$(MAKE) -C host_driver $@ BIT=$(BIT)

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/run/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv

run:
	$(MAKE) -C host_driver $@

clean:clean_run
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache

clean_run:
	$(MAKE) -C host_driver clean
