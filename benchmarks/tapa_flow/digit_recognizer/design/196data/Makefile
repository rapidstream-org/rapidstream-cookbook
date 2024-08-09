# Makefile for Digit_reg of Rosetta benchmarks
#
# Author: Yuanlong Xiao (ylxiao@seas.upenn.edu)
#
# Targets:
#   all   - Builds hardware and software in SDSoC.

HOST_OBJ=main.o


INCLUDE=-I /scratch/unsafe/Xilinx/Vitis_HLS/2022.1/include
OPT_LEVEL=-O3
CFLAGS=$(INCLUDE) $(OPT_LEVEL)
CXX=g++
VPATH=src

all: main
	./main

main:$(HOST_OBJ)
	$(CXX) $(CFLAGS) -o main $^

$(HOST_OBJ):%.o:./%.cpp
	$(CXX) $(CFLAGS) -o $@ -c $^

run: main
	./main > out.log

install:
	echo hello

print:
	ls ./src

tar:
	tar -czvf ./src.tar.gz ./src/


try:
	echo $(notdir $(wildcard ./src))



clean:
	rm -rf ./*.o main *.log
