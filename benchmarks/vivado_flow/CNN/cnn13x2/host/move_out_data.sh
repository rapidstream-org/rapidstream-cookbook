# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.


tool_path=/tools/dma_ip_drivers/XDMA/linux-kernel/tools
data_a_len=$1
data_b_len=$2
data_c_len=$3

sudo ${tool_path}/dma_from_device -d /dev/xdma0_c2h_0 -f ./data/dout0.bin -s ${data_a_len} -a 0x00000000 -c 1
sudo ${tool_path}/dma_from_device -d /dev/xdma0_c2h_0 -f ./data/dout1.bin -s ${data_b_len} -a 0x40000000 -c 1
sudo ${tool_path}/dma_from_device -d /dev/xdma0_c2h_0 -f ./data/dout2.bin -s ${data_c_len} -a 0x80000000 -c 1

hexdump ./data/dout0.bin > ./data/dout0.hex
hexdump ./data/dout1.bin > ./data/dout1.hex
hexdump ./data/dout2.bin > ./data/dout2.hex
