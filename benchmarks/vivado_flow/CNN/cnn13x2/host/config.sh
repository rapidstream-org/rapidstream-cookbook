# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.


tool_path=/tools/dma_ip_drivers/XDMA/linux-kernel/tools

 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000010 w 0x00000000
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000014 w 0x00000000
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x0000001c w 0x40000000
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000020 w 0x00000000
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000028 w 0x80000000
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x0000002c w 0x00000000
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000000 w 0x00000001
 for ((i=0; i<=3; i++)); do
        sleep 1
	echo "${i} second..."
done

 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000000 w 0x00000010
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000000 w
