set top_name vadd_bw

set dir "../v/vadd_bandwidth28r28w"
set contents [glob -nocomplain -directory $dir *]
foreach item $contents {
  if { [regexp {.*\.tcl} $item] } {
    source $item
  } else {
    add_files -norecurse $item
  }
}

set_param general.maxThreads  8
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
set logFileId [open ./runOOC.log "w"]
set start_time [clock seconds]
set_param general.maxThreads  8
synth_design -top $top_name -part xcvc1902-vsvd1760-2MP-e-S -mode out_of_context
write_checkpoint -force $top_name.dcp
set end_time [clock seconds]
set total_seconds [expr $end_time - $start_time]
puts $logFileId "syn: $total_seconds seconds"
report_utilization -hierarchical > utilization.rpt
