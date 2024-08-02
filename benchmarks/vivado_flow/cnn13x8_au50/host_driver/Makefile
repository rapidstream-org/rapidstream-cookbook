# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

bit=design_1_wrapper.bit
VXX=vivado -mode batch -source

download_bit:download.tcl
	#cat $(bit).?? > $(bit)
	$(VXX) $< -nolog -nojournal -tclarg $(bit)
	#rm -rf $(bit)


run:
	sudo bash /tools/dma_ip_drivers/XDMA/linux-kernel/tests/load_driver.sh
	rm -rf data/recv*.bin
	rm -rf data/dout*.bin
	sudo bash ./run_test.sh

clean:
	rm -rf data/recv*.bin
	rm -rf data/dout*.bin
	rm -rf data/*.hex
	rm -rf *.bit
