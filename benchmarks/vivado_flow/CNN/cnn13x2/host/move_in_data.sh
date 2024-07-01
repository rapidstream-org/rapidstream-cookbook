# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.


tool_path=/tools/dma_ip_drivers/XDMA/linux-kernel/tools
data_a_len=$1
data_b_len=$2
data_c_len=$3

sudo ${tool_path}/dma_to_device   -d /dev/xdma0_h2c_0 -f ./data/mem_a.bin  -s ${data_a_len} -a 0x00000000 -c 1
sudo ${tool_path}/dma_to_device   -d /dev/xdma0_h2c_0 -f ./data/mem_b.bin  -s ${data_b_len} -a 0x40000000 -c 1
#sudo ${tool_path}/dma_to_device   -d /dev/xdma0_h2c_0 -f ./data/mem_b.bin  -s ${data_c_len} -a 0x00100000 -c 1
hexdump ./data/mem_a.bin > ./data/mem_a.hex
hexdump ./data/mem_b.bin > ./data/mem_b.hex
hexdump ./data/mem_c.bin > ./data/mem_c.hex


sudo ${tool_path}/dma_from_device -d /dev/xdma0_c2h_0 -f ./data/recv0.bin -s ${data_a_len} -a 0x00000000 -c 1
sudo ${tool_path}/dma_from_device -d /dev/xdma0_c2h_0 -f ./data/recv1.bin -s ${data_b_len} -a 0x40000000 -c 1
sudo ${tool_path}/dma_from_device -d /dev/xdma0_c2h_0 -f ./data/recv2.bin -s ${data_c_len} -a 0x80000000 -c 1
hexdump ./data/recv0.bin > ./data/recv0.hex
hexdump ./data/recv1.bin > ./data/recv1.hex
hexdump ./data/recv2.bin > ./data/recv2.hex
