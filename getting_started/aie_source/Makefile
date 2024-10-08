# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.


ROOT_DIR            := $(shell git rev-parse --show-toplevel)
PLATFORM            := xilinx_vck5000_gen4x8_qdma_2_202220_1
PLATFORM_REPO_PATHS := /opt/xilinx/platforms
XPFM_FILE           := $(PLATFORM_REPO_PATHS)/$(PLATFORM)/$(PLATFORM).xpfm
SRC_DIR             := $(CURDIR)/design
TARGET              := hw
TEMP_DIR            := $(CURDIR)/build
AIE_OBJ             := $(TEMP_DIR)/libadf.a
KERNEL_NAMES        := krnl_input_mover krnl_output_mover
XO_OBJS             := $(foreach kernel,$(KERNEL_NAMES),$(TEMP_DIR)/$(kernel)_$(TARGET).xo)
EXECUTABLE          := $(TEMP_DIR)/host_overlay.exe
XSA_OBJ             := $(TEMP_DIR)/overlay_$(TARGET).xsa
XCLBIN              := $(TEMP_DIR)/overlay_$(TARGET).xclbin
AXX                 := aiecompiler
AX86XX              := x86simulator
CXXFLAGS            := -std=c++17 -Wno-deprecated-declarations
CXXFLAGS            += -I$(XILINX_XRT)/include -I$(XILINX_HLS)/include
LDFLAGS             := -L$(XILINX_XRT)/lib
LDFLAGS             += $(LDFLAGS) -lxrt_coreutil
VPP                 := v++
CXX                 := g++


all:$(EXECUTABLE) $(XCLBIN)

$(EXECUTABLE): $(SRC_DIR)/host/host_overlay.cpp
	@mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(CXX) -o $(EXECUTABLE) $^ $(CXXFLAGS) $(LDFLAGS)

$(XCLBIN): $(XSA_OBJ) $(AIE_OBJ)
	cd $(TEMP_DIR) && $(VPP) -p -t $(TARGET) -f $(PLATFORM) $^ -o $@ --package.boot_mode=ospi

$(XSA_OBJ): $(XO_OBJS) $(AIE_OBJ)
	@mkdir -p $(TEMP_DIR)
	@cd $(TEMP_DIR) && $(VPP) -l \
	--kernel_frequency 200 \
	--platform $(PLATFORM) \
	-t $(TARGET) \
	-g \
	--save-temps \
	--config $(SRC_DIR)/cfg/xclbin_overlay.cfg \
	-o $@ \
	$^

$(XO_OBJS):$(TEMP_DIR)/%_$(TARGET).xo:$(SRC_DIR)/hls/%.cpp
	@mkdir -p $(TEMP_DIR)
	@cd $(TEMP_DIR) && $(VPP) --platform $(PLATFORM) -t $(TARGET) -c -k $* -o $@ $<

ASIM: $(AIE_OBJ)
	@echo "INFO:Running aiesimulator..."
	@cd $(TEMP_DIR) && aiesimulator --pkg-dir=$(TEMP_DIR)/Work --profile

aie_compile:$(AIE_OBJ)

$(AIE_OBJ): $(SRC_DIR)/aie/*
	@mkdir -p $(TEMP_DIR)/Work
	@cd $(TEMP_DIR) && $(AXX) \
	--target=$(TARGET) \
	--platform=$(XPFM_FILE) \
	--include="$(SRC_DIR)/aie" \
	--workdir=$(TEMP_DIR)/Work \
	$(SRC_DIR)/aie/VecAdd.cpp

run:
	@cd $(TEMP_DIR) && ./host_overlay.exe $(XCLBIN)

x86_compile:
	@mkdir -p $(TEMP_DIR)/Work
	@cd $(TEMP_DIR) && aiecompiler \
	--target=x86sim \
	--include="$(SRC_DIR)" \
	--include="$(CURDIR)/common" \
	--workdir=$(TEMP_DIR)/Work \
	$(SRC_DIR)/aie/VecAdd.cpp

run_x86:
	@cd $(TEMP_DIR) && x86simulator --pkg-dir=./Work --dump
	@diff data/s2_exp.txt $(TEMP_DIR)/data/s2_act.txt
	@echo "PASS!"

clean:
	-@rm -rf $(TEMP_DIR)
