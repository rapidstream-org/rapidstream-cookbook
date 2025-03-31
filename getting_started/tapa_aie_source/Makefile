# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
#/opt/xilinx/platforms/xilinx_vck5000_gen4x8_qdma_2_202220_1/xilinx_vck5000_gen4x8_qdma_2_202220_1.xpfm
PART_NUM         := xcu280-fsvh2892-2L-e
PLATFORM         := xilinx_vck5000_gen4x8_qdma_2_202220_1
PLATFORM_REPO_PATHS := /opt/xilinx/platforms
XPFM_FILE        := $(PLATFORM_REPO_PATHS)/$(PLATFORM)/$(PLATFORM).xpfm
GRP_UTIL         := $(ROOT_DIR)/common/util/get_group.py
KERNEL_NAME      := krnl_data_mover
AIE_APP_NAME     := aie_add
SRC_DIR          := $(CURDIR)/design
TARGET           := hw
TEMP_DIR         := $(CURDIR)/build
KERNEL_XO        := $(TEMP_DIR)/$(KERNEL_NAME).xo
KERNEL_XCLBIN    := $(TEMP_DIR)/$(KERNEL_NAME).xclbin
RS_XCLBIN        := $(TEMP_DIR)/dse/solution_0/vitis_run_hw/$(KERNEL_NAME)_$(PLATFORM).xclbin
INCLUDE          := -I $(XILINX_HLS)/include
CFLAGS           := $(INCLUDE) $(OPT_LEVEL)
CXX              := g++
HOST             := app.exe
TIMING_RPT       := impl_1_hw_bb_locked_timing_summary_routed.rpt
SUCCESS          := "Build Successful"
SLACK_GETTER     := $(ROOT_DIR)/common/util/get_slack.py
BUILD_LOG        := $(TEMP_DIR)/build.json
RSXX             := rapidstream
RSPATH           := $(CURDIR)
RSPYTHON         := rapidstream
DEVICE_CONFIG    := $(TEMP_DIR)/device.json
AIE_OBJ          := $(TEMP_DIR)/work.out/aie/$(AIE_APP_NAME)/libadf.a
AXX              := aiecompiler
JOBS             := 16
XSA_OBJ          := $(TEMP_DIR)/overlay_$(TARGET).xsa
VPP              := v++
CXX              := g++
XCLBIN           := $(TEMP_DIR)/overlay_$(TARGET).xclbin
EXECUTABLE       := $(TEMP_DIR)/main.exe
#IS_GDB           := gdb --args

all: $(XCLBIN) $(EXECUTABLE)

xclbin:$(XCLBIN)

$(XCLBIN): $(XSA_OBJ)
	cd $(TEMP_DIR) && $(VPP) -p -t $(TARGET) -f $(PLATFORM) $^ $(AIE_OBJ) -o $@ --package.boot_mode=ospi

xsa: $(XSA_OBJ)

$(XSA_OBJ): $(KERNEL_XO) $(AIE_OBJ)
	@mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VPP) -l \
	--kernel_frequency 200 \
	--to_step vpl.update_bd \
	--platform $(PLATFORM) \
	-t $(TARGET) \
	-g \
	--vivado.synth.jobs $(JOBS) \
	--save-temps \
	--config $(SRC_DIR)/config/xclbin_overlay.cfg \
	-o $(XSA_OBJ) \
	$^
	@cd $(TEMP_DIR) && $(VPP) -l \
	--kernel_frequency 200 \
	--from_step vpl.generate_target \
	--platform $(PLATFORM) \
	-t $(TARGET) \
	-g \
	--vivado.synth.jobs $(JOBS) \
	--save-temps \
	--config $(SRC_DIR)/config/xclbin_overlay.cfg \
	-o $(XSA_OBJ) \
	$^ $(AIE_OBJ)

xo: $(KERNEL_XO)

$(KERNEL_XO):$(SRC_DIR)/VecAdd.cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && tapa compile \
	--top $(KERNEL_NAME) \
	--platform $(PLATFORM) \
	--flow-type hls \
	--clock-period 3.33  \
	--keep-hls-work-dir \
	-f $< \
	-o $@ \
	2>&1 | tee tapa.log

aie: $(AIE_OBJ)

$(AIE_OBJ):$(SRC_DIR)/VecAdd.cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && tapa compile \
	--top aie_add \
	--platform $(PLATFORM) \
	--flow-type aie \
	--clock-period 3.33  \
	--keep-hls-work-dir \
	-f $< \
	2>&1 | tee tapa.log

csim:$(EXECUTABLE)
	$(EXECUTABLE)

host: $(EXECUTABLE)

$(EXECUTABLE): $(SRC_DIR)/main.cpp $(SRC_DIR)/VecAdd.cpp
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && tapa g++ $^ $(INCLUDE) -o $@ -O2

run:
	@cd $(TEMP_DIR) && ./main.exe --bitstream $(XCLBIN)



tapa: $(SRC_DIR)/aie/*
	@mkdir -p $(TEMP_DIR)/Work
	@cd $(TEMP_DIR) && $(AXX) \
	--target=$(TARGET) \
	--platform=$(XPFM_FILE) \
	--include="$(SRC_DIR)/aie" \
	--workdir=$(TEMP_DIR)/Work \
	$(SRC_DIR)/aie/aie_add.cpp

x86_compile:
	@mkdir -p $(TEMP_DIR)/Work
	@cd $(TEMP_DIR) && aiecompiler \
	--target=x86sim \
	--include="$(SRC_DIR)" \
	--include="$(CURDIR)/common" \
	--workdir=$(TEMP_DIR)/Work \
	$(SRC_DIR)/aie/aie_add.cpp

run_x86:
	@cd $(TEMP_DIR) && x86simulator --pkg-dir=./Work #--dump
	@diff $(TEMP_DIR)/../data/s2_exp.txt $(TEMP_DIR)/data/s2_0_act.txt
	@echo "PASS"

show_groups:
	@echo $(RS_KERNEL_XCLBIN)
	$(RSXX) $(GRP_UTIL) -i $(TEMP_DIR)/passes/1-importer.json \
	-o $(TEMP_DIR)/module_types.csv

cp:
	@cp $(CURDIR)/../aie_source_gmio/design/aie/*.h $(TEMP_DIR)/work.out/cpp/
	@mv $(TEMP_DIR)/work.out/cpp/VecAdd.cpp $(TEMP_DIR)/work.out/cpp/VecAdd.h
	@cp $(CURDIR)/../aie_source_gmio/design/aie/VecAdd.cpp $(TEMP_DIR)/work.out/cpp/
	@echo "Copied files"

analize:
	rm -rf ./build/aielog.txt
	cd $(TEMP_DIR) && $(IS_GDB) /home/vagrantxiao24/opt/tapa/usr/bin/tapacc \
	./work.out/flatten/flatten-67e77237-VecAdd.cpp \
	-top aie_add \
	-vitis -- -std=c++14 \
	-nostdinc++ \
	-isystem/home/vagrantxiao24/opt/tapa/usr/include \
	-Wno-attributes -Wno-unknown-pragmas -Wno-unused-label \
	-isystem/opt/tools/xilinx/Vitis_HLS/2022.2/include \
	-isystem/opt/tools/xilinx/Vitis_HLS/2022.2/tps/lnx64/gcc-8.3.0/include/c++/8.3.0 \
	-isystem/opt/tools/xilinx/Vitis_HLS/2022.2/tps/lnx64/gcc-8.3.0/include/c++/8.3.0/x86_64-pc-linux-gnu \
	-isystem/home/vagrantxiao24/opt/tapa/usr/share/tapa/system-include \
	-DTAPA_TARGET_DEVICE_ \
	-DTAPA_TARGET_STUB_

clean:
	rm -rf $(TEMP_DIR) *.log
	rm -rf build
	rm -rf .Xil .run
	rm -rf *.exe
	rm -rf .ipcache
