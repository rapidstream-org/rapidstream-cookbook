#
# Copyright 2019-2021 Xilinx, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# makefile-generator v1.0.3
#

############################## Help Section ##############################
ifneq ($(findstring Makefile, $(MAKEFILE_LIST)), Makefile)
help:
	$(ECHO) "Makefile Usage:"
	$(ECHO) "  make all TARGET=<sw_emu/hw_emu/hw> PLATFORM=<FPGA platform>"
	$(ECHO) "      Command to generate the design for specified Target and Shell."
	$(ECHO) ""
	$(ECHO) "  make run TARGET=<sw_emu/hw_emu/hw> PLATFORM=<FPGA platform>"
	$(ECHO) "      Command to run application in emulation."
	$(ECHO) ""
	$(ECHO) "  make build TARGET=<sw_emu/hw_emu/hw> PLATFORM=<FPGA platform>"
	$(ECHO) "      Command to build xclbin application."
	$(ECHO) ""
	$(ECHO) "  make host"
	$(ECHO) "      Command to build host application."
	$(ECHO) ""
	$(ECHO) "  make clean "
	$(ECHO) "      Command to remove the generated non-hardware files."
	$(ECHO) ""
	$(ECHO) "  make cleanall"
	$(ECHO) "      Command to remove all the generated files."
	$(ECHO) ""

endif

############################## Setting up Project Variables ##############################
TARGET := hw

CURR_DIR=$(shell pwd)
CLK_PERIOD = 3
VPP_LDFLAGS := --kernel_frequency 350 --optimize 3
include ./utils.mk

TEMP_DIR := ./_x.$(TARGET).$(XSA)
BUILD_DIR := ./build_dir.$(TARGET).$(XSA)

LINK_OUTPUT := $(BUILD_DIR)/Bert_layer.link.xclbin
PACKAGE_OUT = ./package.$(TARGET)

VPP_PFLAGS :=
CMD_ARGS = $(BUILD_DIR)/Bert_layer.xclbin
CXXFLAGS += -I$(XILINX_XRT)/include -I$(XILINX_VIVADO)/include -Wall -O0 -g -std=c++1y
LDFLAGS += -L$(XILINX_XRT)/lib -pthread -lOpenCL

########################## Checking if PLATFORM in allowlist #######################
PLATFORM_BLOCKLIST += nodma
############################## Setting up Host Variables ##############################
#Include Required Host Source Files
CXXFLAGS += -I.
HOST_SRCS += xcl2.cpp host.cpp
# Host compiler global settings
CXXFLAGS += -fmessage-length=0 -I/opt/xilinx/2022.1/Vitis_HLS/2022.1/include/
LDFLAGS += -lrt -lstdc++

############################## Setting up Kernel Variables ##############################
# Kernel compiler global settings
VPP_FLAGS += --save-temps


EXECUTABLE = ./Bert_layer
EMCONFIG_DIR = $(TEMP_DIR)

############################## Setting Targets ##############################
.PHONY: all clean cleanall docs emconfig
all: check-platform check-device check-vitis $(EXECUTABLE) $(BUILD_DIR)/Bert_layer.xclbin emconfig

.PHONY: host
host: $(EXECUTABLE)

.PHONY: build
build: check-vitis check-device $(BUILD_DIR)/Bert_layer.xclbin

.PHONY: xclbin
xclbin: build

############################## Setting Rules for Binary Containers (Building Kernels) ##############################

kernel_xo:$(TEMP_DIR)/bert_all.xo

$(TEMP_DIR)/bert_all.xo: $(CURR_DIR)/bert_all.cpp $(CURR_DIR)/bert_region_1.cpp $(CURR_DIR)/bert_region_2.cpp $(CURR_DIR)/bert_region_3.cpp
	mkdir -p $(TEMP_DIR)
ifeq ($(TARGET), hw)
	cd $(TEMP_DIR) && vitis_hls $(CURR_DIR)/tcl/hls2xo.tcl -l vitis_hls_bert_all.log -tclargs $(PART) $(CLK_PERIOD) bert_all $^
else
	v++ -c $(VPP_FLAGS) -t $(TARGET) --platform $(PLATFORM) -k bert_all --temp_dir $(TEMP_DIR)  -I'$(<D)' -o'$@' $^
endif

$(BUILD_DIR)/Bert_layer.xclbin: $(TEMP_DIR)/bert_all.xo
	mkdir -p $(BUILD_DIR)
	v++ -l $(VPP_FLAGS) $(VPP_LDFLAGS) --config $(CFG) -t $(TARGET) --platform $(PLATFORM) --temp_dir $(TEMP_DIR) -o'$(LINK_OUTPUT)' $(+)
	v++ -p $(LINK_OUTPUT) $(VPP_FLAGS) -t $(TARGET) --platform $(PLATFORM) --package.out_dir $(PACKAGE_OUT) -o $(BUILD_DIR)/Bert_layer.xclbin


hw: $(TEMP_DIR)/bert_all.xo
	mkdir -p $(BUILD_DIR)
	v++ -l $(VPP_FLAGS) $(VPP_LDFLAGS) --config $(CFG) -t $(TARGET) --platform $(PLATFORM) --temp_dir $(TEMP_DIR) -o'$(LINK_OUTPUT)' $(+)
	v++ -p $(LINK_OUTPUT) $(VPP_FLAGS) -t $(TARGET) --platform $(PLATFORM) --package.out_dir $(PACKAGE_OUT) -o $(BUILD_DIR)/Bert_layer.xclbin

to_scripts: $(TEMP_DIR)/bert_all.xo
	mkdir -p $(BUILD_DIR)
	v++ -l $(VPP_FLAGS) $(VPP_LDFLAGS) --config $(CFG) -t $(TARGET) --export_script --platform $(PLATFORM) --temp_dir $(TEMP_DIR) -o'$(LINK_OUTPUT)' $(+)

to_update_bd: $(TEMP_DIR)/bert_all.xo
	mkdir -p $(BUILD_DIR)
	v++ -l $(VPP_FLAGS) $(VPP_LDFLAGS) --config $(CFG) -t $(TARGET) --to_step vpl.update_bd --platform $(PLATFORM) --temp_dir $(TEMP_DIR) -o'$(LINK_OUTPUT)' $(+)

to_synth: $(TEMP_DIR)/bert_all.xo
	mkdir -p $(BUILD_DIR)
	v++ -l $(VPP_FLAGS) $(VPP_LDFLAGS) --config $(CFG) -t $(TARGET) \
	--vivado.synth.jobs 16 \
	--from_step vpl.generate_target \
	--to_step vpl.synth \
	--platform $(PLATFORM) --temp_dir $(TEMP_DIR) -o'$(LINK_OUTPUT)' $(+)


############################## Setting Rules for Host (Building Host Executable) ##############################
$(EXECUTABLE): $(HOST_SRCS) | check-xrt
		g++ -o $@ $^ $(CXXFLAGS) $(LDFLAGS)

emconfig:$(EMCONFIG_DIR)/emconfig.json
$(EMCONFIG_DIR)/emconfig.json:
	emconfigutil --platform $(PLATFORM) --od $(EMCONFIG_DIR)

############################## Setting Essential Checks and Running Rules ##############################
run: all
ifeq ($(TARGET),$(filter $(TARGET),sw_emu hw_emu))
	cp -rf $(EMCONFIG_DIR)/emconfig.json .
	XCL_EMULATION_MODE=$(TARGET) $(EXECUTABLE) $(CMD_ARGS)
else
	$(EXECUTABLE) $(CMD_ARGS)
endif

.PHONY: test
test: $(EXECUTABLE)
ifeq ($(TARGET),$(filter $(TARGET),sw_emu hw_emu))
	XCL_EMULATION_MODE=$(TARGET) $(EXECUTABLE) $(CMD_ARGS)
else
	$(EXECUTABLE) $(CMD_ARGS)
endif

############################## Cleaning Rules ##############################
# Cleaning stuff
clean:
	-$(RMDIR) $(EXECUTABLE) $(XCLBIN)/{*sw_emu*,*hw_emu*}
	-$(RMDIR) profile_* TempConfig system_estimate.xtxt *.rpt *.csv
	-$(RMDIR) src/*.ll *v++* .Xil emconfig.json dltmp* xmltmp* *.log *.jou *.wcfg *.wdb

cleanall: clean
	-$(RMDIR) build_dir*
	-$(RMDIR) package.*
	-$(RMDIR) _x* *xclbin.run_summary qemu-memory-_* emulation _vimage pl* start_simulation.sh *.xclbin
