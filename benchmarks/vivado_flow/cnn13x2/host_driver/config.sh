# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

tool_path=/tools/dma_ip_drivers/XDMA/linux-kernel/tools

 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000010 w 0x00000000
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000014 w 0x00000001
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x0000001c w 0x40000000
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000020 w 0x00000001
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000028 w 0x80000000
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x0000002c w 0x00000001
 sudo ${tool_path}/reg_rw /dev/xdma0_bypass 0x00000000 w 0x00000001

AP_DONE="0x00000002"
last_word="0x00000000"

# Poll until ap_done bit is set
while (( !(last_word & AP_DONE) )); do
    echo -e "\nKernel is still running..."
    # Read the register
    out=$(sudo "${tool_path}/reg_rw" /dev/xdma0_bypass 0x00000000)
    words=($out)
    last_word=${words[-1]}
	echo $last_word
	sleep 1
done

echo -e "\nKernel is completed!\n"
