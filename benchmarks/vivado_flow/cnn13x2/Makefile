# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.


PLATFORM             := xilinx_u50_gen3x16_xdma_5_202210_1
REPO_ROOT            := $(shell git rev-parse --show-toplevel)
HLSXX                := vitis_hls
HLS_SRC_DIR          := design
HLS_KERNEL           := kernel3
HLS_SRC_FILES        := $(foreach n, $(shell seq 1 3 ), $(HLS_SRC_DIR)/bert_region_$(n).cpp)
HLS_SRC_FILES        += $(foreach n, $(shell seq 1 3 ), $(HLS_SRC_DIR)/bert_region_$(n).h)
HLS_SRC_FILES        += $(HLS_SRC_DIR)/bert_all.cpp $(HLS_SRC_DIR)/kernel.h

TEMP_DIR             := $(CURDIR)/build
RS_TARGET            := $(TEMP_DIR)/run/dse/candidate_0/exported/design/$(HLS_KERNEL).v
KERNEL_CLK_PERIOD_NS := 3
SLOT_SRC             := $(CURDIR)/archive/candidate_4/exported/design/$(HLS_KERNEL).v
HLS2RTL_TCL		     := $(CURDIR)/tcl/hls2rtl.tcl
IMPL_TCL             := $(CURDIR)/tcl/impl.tcl
BIT_TARGET           := $(TEMP_DIR)/prj/prj.runs/impl_1/design_1_wrapper.bit
VIVADO_BIT_TARGET    := $(TEMP_DIR)/prj_vivado/prj_vivado.runs/impl_1/design_1_wrapper.bit
SLOTS_BIT_TARGET     := $(TEMP_DIR)/slot/prj_slot/prj_slot.runs/impl_1/design_1_wrapper.bit
BD_BIT_TARGET        := $(TEMP_DIR)/bd/prj_bd/prj_bd.runs/impl_1/design_1_wrapper.bit

# Do not generate XO file
GEN_XO               := 0
VXX                  := vivado -mode batch -source
#VXX                  := vivado -source

PART                 := xcu50-fsvh2104-2-e
BOARD                := xilinx.com:au50dd:part0:1.0
RUN_FILE             := $(CURDIR)/run_au50.py
BD_TCL               := $(CURDIR)/tcl/gen_design_u50.tcl

BIT                  := $(BIT_TARGET)

all:$(BIT_TARGET)

$(BIT_TARGET):$(RS_TARGET)
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VXX) $(IMPL_TCL) -tclargs $(PART) $(BOARD) $(shell dirname $<)

rs_opt:$(RS_TARGET)

$(RS_TARGET):$(RUN_FILE)
	rapidstream $<

vivado_hw:$(VIVADO_BIT_TARGET)

$(VIVADO_BIT_TARGET):
	mkdir -p $(TEMP_DIR)/vivado
	cd $(TEMP_DIR)/vivado && $(VXX) $(CURDIR)/design/impl_prj.tcl -tclargs $(PART) $(BOARD) $(CURDIR)/design

slot_bit:$(SLOTS_BIT_TARGET)

$(SLOTS_BIT_TARGET):$(SLOT_SRC)
	mkdir -p $(TEMP_DIR)/slot
	cd $(TEMP_DIR)/slot && $(VXX) $(IMPL_TCL) -tclargs $(PART) $(BOARD) $(shell dirname $<)

bd_bit:$(BD_BIT_TARGET)

$(BD_BIT_TARGET):$(CURDIR)/design/grouped_modules.json
	mkdir -p $(TEMP_DIR)/bd
	cd $(TEMP_DIR)/bd && $(VXX) $(CURDIR)/tcl/bd20222/impl.tcl -tclargs $(PART) $(BOARD) $(CURDIR)/tcl/bd20222/gen_design_u50.tcl $(shell dirname $<)

run:
	sudo bash /tools/dma_ip_drivers/XDMA/linux-kernel/tests/load_driver.sh
	rm -rf data/recv*.bin
	rm -rf data/dout*.bin
	sudo bash ./run_test.sh

download_bit:tcl/download.tcl
	$(MAKE) -C host_driver $@ BIT=$(BIT)

run:
	$(MAKE) -C host_driver $@

clean:clean_run
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache

clean_run:
	$(MAKE) -C host_driver clean
