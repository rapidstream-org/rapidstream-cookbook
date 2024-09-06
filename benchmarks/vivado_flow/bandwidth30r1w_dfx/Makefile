# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

#VXX=vivado -mode batch -source
VXX=vivado -source

TEMP_DIR=$(CURDIR)/build
all:
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VXX) $(CURDIR)/tcl/prj_gen.tcl

ooc:
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VXX) $(CURDIR)/tcl/ooc_syn.tcl


clean:
	rm -rf .Xil vivado.* prj vivado_* $(TEMP_DIR)
