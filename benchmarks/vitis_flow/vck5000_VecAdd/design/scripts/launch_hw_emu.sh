#!/bin/bash -f
cd /home/ylxiao/workspace/vck5000_tutorial/vck5000_VecAdd1/hw
launch_emulator  -device-family versal \
-noc-memory-config $PWD/sim/behav_waveform/xsim/noc_memory_config.txt \
-qemu-dtb $PWD/sim/behav_waveform/xsim/board-versal-ps-cosim-vitis-virt.dtb \
-pmc-dtb $PWD/sim/behav_waveform/xsim/board-versal-pmc-virt.dtb \
-target hw_emu \
-qemu-args-file $PWD/qemu_args.txt \
-pmc-args-file $PWD/pmc_args.txt \
-pl-sim-dir $PWD/sim/behav_waveform/xsim \
-ospi-image $PWD/qemu_ospi.bin \
-xtlm-log-state WAVEFORM_AND_LOG \
-platform-name xilinx_vck5000_gen4x8_qdma_2_202220_1 \
 "$@"
