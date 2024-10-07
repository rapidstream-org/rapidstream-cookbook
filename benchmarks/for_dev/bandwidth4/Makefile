# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
KERNEL_NAME      := bandwidth4
RS_SCRIPT        := $(CURDIR)/run.py
SRC_DIR		     := $(CURDIR)/design
AB_CONFIG        := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/ab_config.json
IMPL_CONFIG      := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/impl_config.json
LINK_CONFIG      := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/link_config.ini
FIX_NOC_TCL      := $(CURDIR)/design/config/$(notdir $(RS_SCRIPT))/fix_noc.tcl
PLATFORM         := xilinx_vck5000_gen4x8_qdma_2_202220_1
PART_NUM         := xcvc1902-vsvd1760-2MP-e-S
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
TEMP_DIR         := $(CURDIR)/build/$(notdir $(RS_SCRIPT))
SOLUTION_DIR     := $(TEMP_DIR)/dse/solution_0
RS_XO            := $(SOLUTION_DIR)/updated.xo
RS_TARGET        := $(SOLUTION_DIR)/$(KERNEL_NAME)_$(PLATFORM).xsa
BUILD_LOG        := $(TEMP_DIR)/build.json
SUCCESS          := "Build Successful"
TIMING_RPT       := impl_1_$(PLATFORM)_bb_locked_timing_summary_routed.rpt
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
TARGET_FREQUENCY := 300
PLACEMENT_STRATEGY := Explore
STRATEGY           := Explore
VIVADO_PRJ_DIR   := $(SOLUTION_DIR)/$(KERNEL_NAME)_$(PLATFORM).temp/link/vivado/vpl/prj
RS_FIX_NOC_TCL   := $(VIVADO_PRJ_DIR)/fix_noc.tcl
RS_SYN           := $(VIVADO_PRJ_DIR)/prj.runs/my_rm_synth_1/ulp_inst_0.dcp


all:$(RS_TARGET)
	cd $(RSPATH) && $(RSPYTHON)	$(SLACK_GETTER) -d $(TEMP_DIR) -i $(TIMING_RPT) -o $(BUILD_LOG)  -c clk_kernel_00_unbuffered_net -p 3.333
	@echo $(SUCCESS)

$(RS_TARGET):$(RS_SYN)
	cd $(SOLUTION_DIR) && v++ ${DEBUG} \
	--link \
	--kernel $(KERNEL_NAME) \
	--platform $(PLATFORM) \
	--target ${TARGET} \
	--report_level 2 \
	--temp_dir "$(SOLUTION_DIR)/$(KERNEL_NAME)_$(PLATFORM).temp" \
	--optimize 3 \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	--save-temps \
	--from_step vpl.impl \
	$(RS_XO) \
	--vivado.synth.jobs $(shell nproc) \
	--vivado.prop=run.impl_1.STEPS.PHYS_OPT_DESIGN.IS_ENABLED=1 \
	--vivado.prop=run.impl_1.STEPS.OPT_DESIGN.ARGS.DIRECTIVE=$(STRATEGY) \
	--vivado.prop=run.impl_1.STEPS.PLACE_DESIGN.ARGS.DIRECTIVE=$(PLACEMENT_STRATEGY) \
	--vivado.prop=run.impl_1.STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE=$(STRATEGY) \
	--vivado.prop=run.impl_1.STEPS.PLACE_DESIGN.TCL.PRE=$(SOLUTION_DIR)/xdc/floorplan.xdc \
	--config $(LINK_CONFIG) \
	--remote_ip_cache /var/tmp/remote_ip_cache \
	--output $(RS_TARGET) \
	--clock.defaultFreqHz $(TARGET_FREQUENCY)000000

$(RS_SYN): $(RS_FIX_NOC_TCL)
	cd $(VIVADO_PRJ_DIR) && vivado -mode batch -source $(RS_FIX_NOC_TCL) -tclargs $(VIVADO_PRJ_DIR)

$(RS_FIX_NOC_TCL): $(RS_XO)
	cd $(dir $<) && v++ ${DEBUG} \
	--link \
	--kernel $(KERNEL_NAME) \
	--platform $(PLATFORM) \
	--target ${TARGET} \
	--report_level 2 \
	--temp_dir "$(dir $<)/$(KERNEL_NAME)_$(PLATFORM).temp" \
	--optimize 3 \
	--connectivity.nk $(KERNEL_NAME):1:$(KERNEL_NAME) \
	--save-temps \
	--to_step vpl.synth \
	$< \
	--vivado.synth.jobs $(shell nproc) \
	--vivado.prop=run.impl_1.STEPS.PHYS_OPT_DESIGN.IS_ENABLED=1 \
	--vivado.prop=run.impl_1.STEPS.OPT_DESIGN.ARGS.DIRECTIVE=$(STRATEGY) \
	--vivado.prop=run.impl_1.STEPS.PLACE_DESIGN.ARGS.DIRECTIVE=$(PLACEMENT_STRATEGY) \
	--vivado.prop=run.impl_1.STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE=$(STRATEGY) \
	--vivado.prop=run.impl_1.STEPS.PLACE_DESIGN.TCL.PRE=$(dir $<)/xdc/floorplan.xdc \
	--config $(LINK_CONFIG) \
	--remote_ip_cache /var/tmp/remote_ip_cache \
	--output $(RS_TARGET) \
	--clock.defaultFreqHz $(TARGET_FREQUENCY)000000
	cp $(FIX_NOC_TCL) $@


#   --run-impl
$(RS_XO):$(KERNEL_XO) $(DEVICE_CONFIG)
	mkdir -p $(TEMP_DIR)
	cd $(RSPATH) && $(RSXX)-tapaopt \
    --work-dir $(TEMP_DIR) \
    --tapa-xo-path $< \
    --device-config $(DEVICE_CONFIG) \
    --floorplan-config $(AB_CONFIG) \
    --implementation-config $(IMPL_CONFIG) \
    --connectivity-ini $(LINK_CONFIG)

device:$(DEVICE_CONFIG)

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
	--config $(LINK_CONFIG) \
	--save-temps \
	--temp_dir $(TEMP_DIR) \
	--clock.defaultFreqHz $(TARGET_FREQUENCY)000000 \
	--vivado.synth.jobs 16 \
	$< -o $@

xo: $(KERNEL_XO)

$(KERNEL_XO):$(SRC_DIR)/$(KERNEL_NAME).cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && tapa compile \
	--top $(KERNEL_NAME) \
	--part-num $(PART_NUM) \
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
