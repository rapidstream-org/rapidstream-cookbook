# Makefile

in1 := "input_port"
out1 := "output_port0_32b_8b"
out2 := "output_port1_16b_8b"
out3 := "output_port2_16b_8b"
out4 := "output_port3_8b"
out5 := "output_port4_Track"
# out6 := "OUT2_8b"
# out7 := "OUT3_8b"
# out8 := "OUT0_8b"

MK_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CUR_DIR := $(patsubst %/,%,$(dir $(MK_PATH)))
CUR_DIR ?= $(CUR_DIR)

#default
PLATFORM ?= xilinx_u280_gen3x16_xdma_1_202211_1
# xilinx_u200_xdma_201830_2
# xilinx_u280_xdma_201920_3

# Compiler
CXX := g++

# Compiler flags
CXXFLAGS := -O2
server := $(shell hostname)

# VITIS_HLS := /localssd/Xilinx/Vitis_HLS/2020.2

VITIS_HLS := /tools/Xilinx/Vitis_HLS/2022.2


ifeq ($(PLATFORM), xilinx_u200_xdma_201830_2)
	EXTRA_FLAGS :=
	INI := link.ini
else
	EXTRA_FLAGS := --enable-floorplan --floorplan-output constraint.tcl
	EXTRA_FLAGS += --read-only-args $(in1)
	EXTRA_FLAGS += --write-only-args $(out1) --write-only-args $(out2) --write-only-args $(out3) --write-only-args $(out4)
	EXTRA_FLAGS += --write-only-args $(out5)
# EXTRA_FLAGS += --write-only-args $(out5) --write-only-args $(out6) --write-only-args $(out7)
	INI := link_hbm.ini
endif

VITIS_HLS_INCLUDE := $(VITIS_HLS)/include/
VITIS_HLS_LIB := $(VITIS_HLS)/lib/
XILINX_XRT = /opt/xilinx/xrt
XILINX_XRT_LIB := $(XILINX_XRT)/lib/
XILINX_XRT_INCLUDE := $(XILINX_XRT)/include/

LIBRARIES := -lstdc++ -ltinyxml -lpthread -lrt -lgmp -lmpfr -ltapa -lfrt -lglog -lgflags -lOpenCL



# Initializers
OUTPUT := decoder
TARGET ?= hw
ifeq ($(filter $(TARGET),sw_emu hw_emu hw),)
$(error TARGET is not sw_emu, hw_emu or hw)
endif

TOP := data_decoding

SRC_NAME := data_decoder
SOURCES := $(SRC_NAME).cpp $(SRC_NAME)_host.cpp


all: $(OUTPUT) rtl_gen

# -L$(XILINX_XRT_LIB)
# -I$(XILINX_XRT_INCLUDE)
$(OUTPUT): $(SOURCES)
	$(CXX) $(CXXFLAGS) -o $@ $^ -I$(VITIS_HLS_INCLUDE) -I$(XILINX_XRT_INCLUDE) -L$(XILINX_XRT_LIB) $(LIBRARIES) -DHAVE_CL2 -DCL_HPP_TARGET_OPENCL_VERSION=120 -DCL_HPP_MINIMUM_OPENCL_VERSION=120

gpp: clean_gpp $(OUTPUT)


# "min_area_limit": 0.65,
# "max_area_limit": 0.85,
# "min_slr_width_limit": 10000,
# "max_slr_width_limit": 15000,
# "max_search_time": 600,
# "floorplan_strategy": "HALF_SLR_LEVEL_FLOORPLANNING",
# "floorplan_opt_priority": "AREA_PRIORITIZED",
# "enable_hbm_binding_adjustment": false

# --min-area-limit 0.40 \
# --max-area-limit 0.60 \
# --min-slr-width-limit 8000 \
# --max-slr-width-limit 10000 \
# --floorplan-strategy "SLR_LEVEL_FLOORPLANNING" \

# --enable-synth-util \
# --run-floorplan-dse \
# --enable-hbm-binding-adjustment \
# --clock-period 2.22 \
# get the platform from user input
rtl_gen:
	platform=$(PLATFORM)
	tapac -o $(OUTPUT).$(PLATFORM).hw.xo $(SRC_NAME).cpp \
		--platform $(PLATFORM) \
		--clock-period 3.33 \
		--top $(TOP) \
		--work-dir $(OUTPUT).$(PLATFORM).hw.xo.tapa \
		--connectivity $(INI) \
		$(EXTRA_FLAGS) \
		--enable-synth-util \
		--enable-hbm-binding-adjustment \
		--max-parallel-synth-jobs 24 \
		--run-tapacc \
		--run-hls \
		--generate-task-rtl \
		--run-floorplanning \
		--run-floorplan-dse \
		--generate-top-rtl \
		--pack-xo

echo:
	echo $(TOP)
	echo $(SRC_NAME).cpp


Mrtl_gen:
	platform=$(PLATFORM)
	tapac -o $(OUTPUT).$(PLATFORM).hw.xo $(SRC_NAME).cpp \
		--platform $(PLATFORM) \
		--clock-period 3.33 \
		--top $(TOP) \
		--work-dir $(OUTPUT).$(PLATFORM).hw.xo.tapa \
		--connectivity $(INI) \
		$(EXTRA_FLAGS) \
		--enable-synth-util \
		--enable-hbm-binding-adjustment \
		--max-parallel-synth-jobs 24 \
		--run-tapacc \
		--run-hls \
		--generate-task-rtl \
		--floorplan-pre-assignments floorplan-region-to-instances1.json \
		--run-floorplanning \
		--run-floorplan-dse \
		--generate-top-rtl \
		--pack-xo

clean_rtl:
	rm -rf $(OUTPUT).*.hw.* $(OUTPUT).*.hw.*.tapa
	rm -rf $(OUTPUT).$(PLATFORM).*
	rm -rf _x
	rm *.log

clean_gpp:
	rm -rf $(OUTPUT)

clean: clean_gpp clean_rtl
