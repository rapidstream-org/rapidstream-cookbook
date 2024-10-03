# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
PLATFORM         := xilinx_vck5000_gen4x8_qdma_2_202220_1
PART             := xcvc1902-vsvd1760-2MP-e-S
LINK_FILE        := link_config_hbm.ini
KERNEL_NAME      := bandwidth4
HLSXX            := vitis_hls
SRC_DIR          := $(CURDIR)/design
RS_SCRIPT        := $(CURDIR)/run.py
TEMP_DIR         := $(CURDIR)/build/$(notdir $(RS_SCRIPT))
HOST			 := $(TEMP_DIR)/app.exe
KERNEL_XO        := $(TEMP_DIR)/$(KERNEL_NAME).xo
KERNEL_XSA       := $(TEMP_DIR)/$(KERNEL_NAME).xsa
KERNEL_XCLBIN    := $(TEMP_DIR)/$(KERNEL_NAME).xclbin
RS_XCLBIN        := $(TEMP_DIR)/dse/candidate_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).xclbin
CLK_PERIOD_NS    := 3
TARGET           := hw
HLS2RTL_TCL	     := $(ROOT_DIR)/common/tcl/hls2rtl.tcl
GEN_XO           := 1

BUILD_LOG        := $(TEMP_DIR)/build.json
SUCCESS          := "Build Successful"
TIMING_RPT       := impl_1_hw_bb_locked_timing_summary_routed.rpt
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py
RSXX             := rapidstream




all: $(RS_XCLBIN)
	$(RSXX) $(SLACK_GETTER) -d $(TEMP_DIR) -i $(TIMING_RPT) -o $(BUILD_LOG)   -c clk_kernel_00_unbuffered_net -p 3.333
	echo $(SUCCESS)

$(RS_XCLBIN):$(KERNEL_XO)
	$(RSXX) $(RS_SCRIPT)

hw: $(KERNEL_XCLBIN)

$(KERNEL_XCLBIN): $(KERNEL_XSA)
	@echo "### ***** packaging $(KERNEL_XSA) into $(KERNEL_XCLBIN) ... *****"
	cd $(TEMP_DIR) && v++ --package -t $(TARGET) --platform $(PLATFORM) \
	  $^ \
	  --temp_dir $(TEMP_DIR) \
	  --save-temps \
	  --report_dir $(TEMP_DIR)/reports/ \
	  --package.boot_mode=ospi \
	  -o $@ 2>&1 | tee $(KERNEL_NAME)_xclbin.log
	@echo "### ***** $(KERNEL_XCLBIN) packaging done! *****"

$(KERNEL_XSA): $(KERNEL_XO)
	cd $(TEMP_DIR) && v++ -l -t ${TARGET} \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	--config $(SRC_DIR)/vck5000.cfg \
	--save-temps \
	--temp_dir $(TEMP_DIR) \
	--clock.defaultFreqHz 250000000 \
	--vivado.synth.jobs 16 \
	$< -o $@


xo:$(KERNEL_XO)

$(KERNEL_XO): $(SRC_DIR)/$(KERNEL_NAME).cpp  $(SRC_DIR)/$(KERNEL_NAME).h
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && v++ -c -t ${TARGET} \
	--platform $(PLATFORM) \
	-k $(KERNEL_NAME) \
	--temp_dir $(TEMP_DIR) \
	--save-temps \
	-o $@ \
	$^

sw_emu: $(HOST) $(SRC_DIR)/$(KERNEL_NAME).cpp  $(SRC_DIR)/$(KERNEL_NAME).h
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && v++ -c -t sw_emu \
	--platform xilinx_u50_gen3x16_xdma_5_202210_1 \
	-k $(KERNEL_NAME) \
	--temp_dir $(TEMP_DIR) \
	--save-temps \
	-o $(TEMP_DIR)/$(KERNEL_NAME)_sw_emu.xo \
	$^
	cd $(TEMP_DIR) && v++ -l -t sw_emu \
	$(TEMP_DIR)/$(KERNEL_NAME)_sw_emu.xo \
	--platform xilinx_u50_gen3x16_xdma_5_202210_1 \
	--kernel $(KERNEL_NAME) \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	-o $(TEMP_DIR)/$(KERNEL_NAME)_sw_emu.xclbin
	cd $(TEMP_DIR) && XCL_EMULATION_MODE=sw_emu $< $(TEMP_DIR)/$(KERNEL_NAME)_sw_emu.xclbin

host:$(HOST)

$(HOST): $(SRC_DIR)/host.cpp
	mkdir -p $(TEMP_DIR)
	g++ -Wall -g -std=c++11 $(SRC_DIR)/host.cpp -o $@ \
		-I${XILINX_XRT}/include/ \
		-I${XILINX_HLS}/include/ \
		-L${XILINX_XRT}/lib/ -lOpenCL -pthread -lrt -lstdc++

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv



clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache


cleanall:
	rm -rf build *.log
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
