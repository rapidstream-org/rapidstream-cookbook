# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

#---------------------------------------------------------------------
# Script variables
#---------------------------------------------------------------------
tool_path=/tools/dma_ip_drivers/XDMA/linux-kernel/tools/
data_a_len=212992
data_b_len=131072
data_c_len=106496

# Load XDMA driver on the host
${tool_path}/../tests/load_driver.sh

# Size of PCIe DMA transfers that will be used for this test.
# Make sure valid addresses exist in the FPGA when modifying this
# variable. Addresses in the range of 0 - (4 * transferSize) will
# be used for this test when the PCIe DMA core is setup for memory
# mapped transaction.
# Set the number of times each data transfer will be repeated.
# Increasing this number will allow transfers to accross multiple
# channels to over lap for a longer period of time.
transferCount=1

# Determine which Channels are enabled
# Determine if the core is Memory Mapped or Streaming
isStreaming=0
h2cChannels=0
for ((i=0; i<=3; i++)); do
	v=`$tool_path/reg_rw /dev/xdma0_control 0x0${i}00 w`
	returnVal=$?
	if [ $returnVal -ne 0 ]; then
		break;
	fi

	#v=`echo $v | grep -o  '): 0x[0-9a-f]*'`
	statusRegVal=`$tool_path/reg_rw /dev/xdma0_control 0x0${i}00 w | grep "Read.*:" | sed 's/Read.*: 0x\([a-z0-9]*\)/\1/'`
	channelId=${statusRegVal:0:3}
	streamEnable=${statusRegVal:4:1}

	if [ $channelId == "1fc" ]; then
		h2cChannels=$((h2cChannels + 1))
		if [ $streamEnable == "8" ]; then
			isStreaming=1
		fi
	fi
done
echo "Info: Number of enabled h2c channels = $h2cChannels"

# Find enabled c2hChannels
c2hChannels=0
for ((i=0; i<=3; i++)); do
	v=`$tool_path/reg_rw /dev/xdma0_control 0x1${i}00 w`
	returnVal=$?
	if [ $returnVal -ne 0 ]; then
		break;
	fi

	$tool_path/reg_rw /dev/xdma0_control 0x1${i}00 w | grep "Read.*: 0x1fc" > /dev/null
	statusRegVal=`$tool_path/reg_rw /dev/xdma0_control 0x1${i}00 w | grep "Read.*:" | sed 's/Read.*: 0x\([a-z0-9]*\)/\1/'`
	channelId=${statusRegVal:0:3}

	# there will NOT be a mix of MM & ST channels, so no need to check
	# for streaming enabled
	if [ $channelId == "1fc" ]; then
		c2hChannels=$((c2hChannels + 1))
	fi
done
echo "Info: Number of enabled c2h channels = $c2hChannels"

# Report if the PCIe DMA core is memory mapped or streaming
if [ $isStreaming -eq 0 ]; then
	echo "Info: The PCIe DMA core is memory mapped."
else
	echo "Info: The PCIe DMA core is streaming."
fi

# Check to make sure atleast one channel was identified
if [ $h2cChannels -eq 0 -a $c2hChannels -eq 0 ]; then
	echo "Error: No PCIe DMA channels were identified."
	exit 1
fi

# Perform testing on the PCIe DMA core.
testError=0
sudo bash ./move_in_data.sh ${data_a_len} ${data_b_len} ${data_c_len}
sudo bash ./config.sh
sudo bash ./move_out_data.sh ${data_a_len} ${data_b_len} ${data_c_len}

# Check BRAM0
diff data/mem_a.bin data/dout0.bin
testError=$?
# Exit with an error code if an error was found during testing
if [ $testError -eq 1 ]; then
	echo "Error: Test completed with Errors for mem_a."
	exit 1
fi

# Check BRAM1
diff data/mem_b.bin data/dout1.bin
testError=$?
# Exit with an error code if an error was found during testing
if [ $testError -eq 1 ]; then
	echo "Error: Test completed with Errors for mem_b."
	exit 1
fi

# Check BRAM2
diff data/mem_c.bin data/dout2.bin
testError=$?
# Exit with an error code if an error was found during testing
if [ $testError -eq 1 ]; then
	echo "Error: Test completed with Errors for mem_c."
	exit 1
fi
# Report all tests passed and exit
echo "Info: All tests in run_tests.sh passed."
exit 0
