# Copyright 2024 RapidStream Design Automation, Inc.
# All Rights Reserved.

PLATFORM := xilinx_u250_gen3x16_xdma_4_1_202210_1

ifeq ($(PLATFORM), xilinx_u50_gen3x16_xdma_5_202210_1)
PART := xcu50-fsvh2104-2-e
else ifeq ($(PLATFORM), xilinx_u250_gen3x16_xdma_4_1_202210_1)
PART := xcu250-figd2104-2L-e
else ifeq ($(PLATFORM), xilinx_u55c_gen3x16_xdma_3_202210_1)
PART := xcu55c-fsvh2892-2L-e
else
    $(error PLATFORM not supported)
endif


CURR_DIR=$(shell pwd)
KERNEL_NAME=kernel3
SRC_DIR=src
EXPORT_SCRIPT=
CLK_PERIOD=3
VPP_FLAG = --vivado.synth.jobs 8 --vivado.impl.jobs 8 --kernel_frequency $(shell expr 1000 / $(CLK_PERIOD)) --platform  $(PLATFORM)
# Unless specified, use the current directory name as the v++ build target
#TARGET ?= $(notdir $(CURDIR))
TARGET = hw
KERNEL_XO=_x/$(KERNEL_NAME).xo
XCLBIN=$(KERNEL_NAME).xclbin


hw: $(XCLBIN)

kernel_xo:$(KERNEL_XO)

$(KERNEL_XO): $(CURR_DIR)/$(SRC_DIR)/kernel_kernel.cpp $(CURR_DIR)/$(SRC_DIR)/kernel_kernel.h
ifeq ($(TARGET), hw)
	rm -rf _x && mkdir _x && cd _x && vitis_hls $(CURR_DIR)/tcl/hls2xo.tcl -l vitis_hls_kernel3.log -tclargs $(PART) $(CLK_PERIOD) kernel3  $^
else
	v++ -c -t ${TARGET} --config ./au250.cfg -k $(KERNEL_NAME) \
	-I$(SRC_DIR)/src/ \
	-o $(KERNEL_XO) \
	$^
endif



$(XCLBIN): $(KERNEL_XO)
	v++  $(VPP_FLAG) -l -t ${TARGET} --config ./au250.cfg $(KERNEL_XO) -o $(KERNEL_NAME).xclbin

syn: $(KERNEL_XO)
	v++  -l -t ${TARGET}  $(VPP_FLAG) --to_step vpl.synth --custom_script ./run_script_map.dat --config ./au250.cfg $(KERNEL_XO) -o $(KERNEL_NAME).xclbin

scripts: $(KERNEL_XO)
	v++  $(VPP_FLAG) --export_script -l -t ${TARGET} --config ./au250.cfg $(KERNEL_XO) -o $(KERNEL_NAME).xclbin


emconfig.json:
	emconfigutil --platform $(PLATFORM) --nd 1

cleanall:
	rm -rf $(KERNEL_NAME)* app.exe *json *csv *log *summary _x xilinx* .run .Xil .ipcache *.jou halout

echo:
	echo $(TARGET)
