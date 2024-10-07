open_project generated/project
set_top kernel3
add_files "src/kernel_kernel.cpp"
open_solution solution -flow_target vitis

set_part xcu250-figd2104-2L-e
create_clock -period 3

# disable auto-frp infer
set_param hls.enable_hidden_option_error false
config_rtl -enableFreeRunPipeline=false
config_rtl -disableAutoFreeRunPipeline=true

csynth_design
export_design -format xo -rtl verilog -output generated/kernel3.xo
