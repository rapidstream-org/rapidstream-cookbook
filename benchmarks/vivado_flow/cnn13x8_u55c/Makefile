
PART_NUM   := xcu55c-fsvh2892-2L-e
BOARD_PART := xilinx.com:au55c:part0:1.0
DESIGN_SRC := $(CURDIR)/design
TEMP_DIR   := $(CURDIR)/build
BIT_TARGET := $(TEMP_DIR)/prj/prj.runs/impl_1/design_1_wrapper.bit
VXX        := vivado -mode batch -source
#VXX        := vivado -source

all:$(BIT_TARGET)

hw:$(BIT_TARGET)

$(BIT_TARGET): $(CURDIR)/tcl/prj_gen.tcl
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VXX) $< -tclargs $(PART_NUM) $(BOARD_PART) $(DESIGN_SRC)


clean:
	rm -rf build

cleanall:
	rm -rf prj vivado* .Xil *.log


ifndef XILINX_VITIS
		$(error Vivado 2022.2 environment variable XILINX_VIVADO is required)
endif


