# Copyright 2024 RapidStream Design Automation, Inc.
# All Rights Reserved.

# This is a simple Makefile to compile the host code and generate the hex files

INCLUDE=-I ${XILINX_HLS}/include
CFLAGS=$(INCLUDE) $(OPT_LEVEL)
CXX=g++
PORTS=a
MAIN_EXES=$(foreach port, $(PORTS), main_$(port))
HEX_FILES=$(foreach port, $(PORTS), mem_$(port).hex)
BIN_FILES=$(foreach port, $(PORTS), mem_$(port).bin)

# Dump the printout to a hex file
$(HEX_FILES):mem_%.hex:main_%
	./$<

# Compile the source code with different macros
$(MAIN_EXES):main_%:kernel_kernel.cpp kernel_host.cpp
	$(CXX) $(CFLAGS) -o $@ $^  -Ddump_hex_$*

clean:
	rm -rf main* *.bin *.hex
