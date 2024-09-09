# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

ROOT_DIR         := $(shell git rev-parse --show-toplevel)
PLATFORM         := xilinx_u50_gen3x16_xdma_5_202210_1
PART_NUM         := xcu50-fsvh2104-2-e
TEMP_DIR         := $(CURDIR)/build
INCLUDE          := -I $(XILINX_HLS)/include
KERNEL_NAME      := vadd_bw
KERNEL_XO        := $(TEMP_DIR)/$(KERNEL_NAME).xo
SRC_DIR          := $(CURDIR)

all: cosim

cosim:$(KERNEL_XO) $(TEMP_DIR)/main.exe
	$(TEMP_DIR)/main.exe 1024 \
	--bitstream $< \
	-xosim_work_dir $(TEMP_DIR)/xosim_work_dir

xo: $(KERNEL_XO)

$(KERNEL_XO):$(SRC_DIR)/$(KERNEL_NAME).cpp
	tapac -o $@ $< \
	--part-num $(PART_NUM) \
	--clock-period 3.33 \
	--top $(KERNEL_NAME) \
	--work-dir $(TEMP_DIR)

csim:$(TEMP_DIR)/main.exe

$(TEMP_DIR)/main.exe: ./*.cpp
	mkdir -p $(TEMP_DIR)
	$(CXX) $(INCLUDE) -o $(TEMP_DIR)/main.exe -O2 $^ -ltapa -lfrt -lglog -lgflags -lOpenCL
	$(TEMP_DIR)/main.exe

show_groups:
	rapidstream $(GRP_UTIL) -i $(TEMP_DIR)/passes/0-imported.json \
	-o $(TEMP_DIR)/module_types.csv

m=$(shell date)

git:
	git add .
	git commit -m "$(m)"
	git push origin main

clean:
	rm -rf $(TEMP_DIR) *.log
