# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
KERNEL_NAME      := bandwidth23
RS_SCRIPT        := $(CURDIR)/run.py
SRC_DIR		     := $(CURDIR)/design
AB_CONFIG        := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/ab_config.json
IMPL_CONFIG      := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/impl_config.json
LINK_CONFIG      := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/link_config.ini
PLATFORM         := xilinx_vck5000_gen4x8_qdma_2_202220_1
PART_NUM         := xcvc1902-vsvd1760-2MP-e-S
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
TEMP_DIR         := $(CURDIR)/build/$(notdir $(RS_SCRIPT))
RS_TARGET        := $(TEMP_DIR)/dse/solution_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).xclbin
BUILD_LOG        := $(TEMP_DIR)/build.json
SUCCESS          := "Build Successful"
TIMING_RPT       := impl_1_hw_bb_locked_timing_summary_routed.rpt
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py
RSPATH           := $(CURDIR)
RSXX             := rapidstream
RSPYTHON         := rapidstream
DEVICE_CONFIG    := $(TEMP_DIR)/device.json
DEVICE_GEN       := $(CURDIR)/gen_device.py
INCLUDE          := -I $(XILINX_HLS)/include
KERNEL_XO        := $(TEMP_DIR)/$(KERNEL_NAME).xo
KERNEL_XCLBIN    := $(TEMP_DIR)/$(KERNEL_NAME).xclbin
KERNEL_XSA       := $(TEMP_DIR)/$(KERNEL_NAME).xsa
TARGET		     := hw

all: $(RS_TARGET)
	cd $(RSPATH) && $(RSPYTHON)	$(SLACK_GETTER) -d $(TEMP_DIR) -i $(TIMING_RPT) -o $(BUILD_LOG)  -c clk_kernel_00_unbuffered_net -p 3.333
	@echo $(SUCCESS)

$(RS_TARGET):$(KERNEL_XO) $(DEVICE_CONFIG)
	mkdir -p $(TEMP_DIR)
	cd $(RSPATH) && $(RSXX)-tapaopt \
    --work-dir $(TEMP_DIR) \
    --tapa-xo-path $< \
    --device-config $(DEVICE_CONFIG) \
    --floorplan-config $(AB_CONFIG) \
	--single-reg \
    --run-impl \
    --implementation-config $(IMPL_CONFIG) \
    --connectivity-ini $(LINK_CONFIG)

$(DEVICE_CONFIG):$(AB_CONFIG)
	mkdir -p $(TEMP_DIR)
	cd $(RSPATH) && $(RSPYTHON) $(RS_SCRIPT)

cosim:$(KERNEL_XO) $(TEMP_DIR)/main.exe
	cd $(TEMP_DIR) && $(TEMP_DIR)/main.exe 1024 \
	--bitstream $< \
	-xosim_work_dir $(TEMP_DIR)/xosim_work_dir

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

xo: $(KERNEL_XO)

$(KERNEL_XO):$(SRC_DIR)/$(KERNEL_NAME).cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && tapa compile \
	--top $(KERNEL_NAME) \
	--part-num xcu55c-fsvh2892-2L-e \
	--clock-period 3.33 \
	-o $(KERNEL_NAME).xo \
	-f $< \
	2>&1 | tee tapa.log

csim:$(TEMP_DIR)/main.exe

$(TEMP_DIR)/main.exe: $(SRC_DIR)/*.cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && tapa g++ $^ $(INCLUDE) -o $(TEMP_DIR)/main.exe -O2
	$(TEMP_DIR)/main.exe

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
