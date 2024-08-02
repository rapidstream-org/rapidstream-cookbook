# Copyright 2024 RapidStream Design Automation, Inc.
# All Rights Reserved.

# This is a simple Makefile to compile the host code and generate the hex files

INCLUDE=-I ${XILINX_HLS}/include
CFLAGS=$(INCLUDE) $(OPT_LEVEL)
CXX=g++
PORTS=a b c
MAIN_EXES=$(foreach port, $(PORTS), main_$(port))
HEX_FILES=$(foreach port, $(PORTS), mem_$(port).hex)
BIN_FILES=$(foreach port, $(PORTS), mem_$(port).bin)

all:$(BIN_FILES)

# Convert the hex file to a binary file
$(BIN_FILES):hex2bin.py $(HEX_FILES)
	python3 $<

# Dump the printout to a hex file
$(HEX_FILES):mem_%.hex:main_%
	./$< > $@

# Compile the source code with different macros
$(MAIN_EXES):main_%:kernel3.cpp main.cpp
	$(CXX) $(CFLAGS) -o $@ $^  -Ddump_hex_$*

clean:
	rm -rf main_* *.bin *.hex
