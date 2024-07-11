
proc getEnvInt { varName defaultIntValue } {
    set value [expr {[info exists ::env($varName)] ? $::env($varName) : $defaultIntValue}]
    return [expr {int($value)}]
}

create_project -force /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/impl/build/vivado_proj -part xcu50-fsvh2104-2-e
set_property board_part xilinx.com:au50dd:part0:1.0 [current_project]
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_m00e_0/bd_fed5_m00e_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_sawn_0/bd_0004_sawn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_psr_aclk1_0/bd_fed5_psr_aclk1_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_psr0_0/bd_3e84_psr0_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_one_0/bd_c055_one_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_one_0/bd_fed5_one_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_psr_aclk_0/bd_3e84_psr_aclk_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_psr0_0/bd_0004_psr0_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_s00sic_0/bd_fed5_s00sic_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_axi_register_slice_30_0/design_1_axi_register_slice_30_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_sawn_0/bd_3e84_sawn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_psr0_0/bd_c055_psr0_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_s00a2s_0/bd_fed5_s00a2s_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_m00s2a_0/bd_c055_m00s2a_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_s00mmu_0/bd_fed5_s00mmu_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_m00e_0/bd_0004_m00e_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_psr_aclk_0/bd_fed5_psr_aclk_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_m00s2a_0/bd_3e84_m00s2a_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_auto_ds_0/design_1_auto_ds_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_s00a2s_0/bd_3e84_s00a2s_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_axi_register_slice_29_0/design_1_axi_register_slice_29_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_swn_0/bd_3e84_swn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_util_ds_buf_0_0/design_1_util_ds_buf_0_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_psr_aclk1_0/bd_c055_psr_aclk1_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_srn_0/bd_0004_srn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_m00e_0/bd_c055_m00e_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_s00tr_0/bd_3e84_s00tr_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_s00a2s_0/bd_c055_s00a2s_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_psr_aclk1_0/bd_3e84_psr_aclk1_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_sarn_0/bd_fed5_sarn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_srn_0/bd_3e84_srn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_swn_0/bd_0004_swn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_psr_aclk_0/bd_0004_psr_aclk_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_sbn_0/bd_0004_sbn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_m00s2a_0/bd_0004_m00s2a_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_m00s2a_0/bd_fed5_m00s2a_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_apb_sys_reset_0/design_1_apb_sys_reset_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_sbn_0/bd_c055_sbn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_auto_pc_0/design_1_auto_pc_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_psr_aclk1_0/bd_0004_psr_aclk1_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_one_0/bd_3e84_one_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_s00tr_0/bd_c055_s00tr_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_util_ds_buf_0/design_1_util_ds_buf_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_sarn_0/bd_c055_sarn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/kernel3_fmul_32ns_32ns_32_5_max_dsp_1_ip/kernel3_fmul_32ns_32ns_32_5_max_dsp_1_ip.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_s00mmu_0/bd_c055_s00mmu_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_srn_0/bd_c055_srn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_sbn_0/bd_3e84_sbn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_hbm_sys_reset_0/design_1_hbm_sys_reset_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_auto_cc_0/design_1_auto_cc_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_sawn_0/bd_c055_sawn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_kernel_clk_0/design_1_kernel_clk_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_sarn_0/bd_0004_sarn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_axi_register_slice_31_0/design_1_axi_register_slice_31_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/kernel3_fadd_32ns_32ns_32_10_full_dsp_1_ip/kernel3_fadd_32ns_32ns_32_10_full_dsp_1_ip.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_s00mmu_0/bd_0004_s00mmu_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_swn_0/bd_c055_swn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_axi_register_slice_28_0/design_1_axi_register_slice_28_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_hbm_0_0/design_1_hbm_0_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_srn_0/bd_fed5_srn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_kernel_sys_reset_0/design_1_kernel_sys_reset_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_psr_aclk_0/bd_c055_psr_aclk_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_sarn_0/bd_3e84_sarn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_s00tr_0/bd_fed5_s00tr_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_s00sic_0/bd_0004_s00sic_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_s00sic_0/bd_3e84_s00sic_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_c055_s00sic_0/bd_c055_s00sic_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_s00mmu_0/bd_3e84_s00mmu_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/design_1_xdma_0_0/design_1_xdma_0_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_sbn_0/bd_fed5_sbn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_s00a2s_0/bd_0004_s00a2s_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_one_0/bd_0004_one_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_sawn_0/bd_fed5_sawn_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_psr0_0/bd_fed5_psr0_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_0004_s00tr_0/bd_0004_s00tr_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_3e84_m00e_0/bd_3e84_m00e_0.xci
import_ip /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design/bd_fed5_swn_0/bd_fed5_swn_0.xci
import_files /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/design
import_files -fileset constrs_1 /home/vagrantxiao24/ws_222/rapidstream-cookbook_20232/benchmarks/vivado_flow/cnn132/build/02d3d7c5/run/dse/candidate_4/exported/xdc
upgrade_ip -quiet [get_ips *]
generate_target synthesis [ get_files *.xci ]
set_property top design_1_wrapper [current_fileset]
 exit

set_property     -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS}     -value {-mode out_of_context}     -objects [get_runs synth_1]

launch_runs synth_1 -jobs [getEnvInt VIVADO_SYNTH_JOBS 8]
wait_on_run synth_1
open_run synth_1
write_checkpoint synth.dcp
opt_design
place_design
phys_opt_design
write_checkpoint place.dcp
route_design
phys_opt_design
write_checkpoint route.dcp
report_timing_summary -file timing_summary.rpt
close_project
