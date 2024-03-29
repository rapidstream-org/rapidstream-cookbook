

module Sextans_fsm
(
  ap_clk,
  ap_rst_n,
  ap_start,
  ap_ready,
  ap_done,
  ap_idle,
  FloatvAddFloatv_0__ap_start,
  FloatvAddFloatv_1__ap_start,
  FloatvAddFloatv_2__ap_start,
  FloatvAddFloatv_3__ap_start,
  FloatvAddFloatv_4__ap_start,
  FloatvAddFloatv_5__ap_start,
  FloatvAddFloatv_6__ap_start,
  FloatvAddFloatv_7__ap_start,
  FloatvMultConst_0__ap_start,
  FloatvMultConst_0__ap_ready,
  FloatvMultConst_0__ap_done,
  FloatvMultConst_0__ap_idle,
  FloatvMultConst_1__ap_start,
  FloatvMultConst_1__ap_ready,
  FloatvMultConst_1__ap_done,
  FloatvMultConst_1__ap_idle,
  FloatvMultConst_2__ap_start,
  FloatvMultConst_2__ap_ready,
  FloatvMultConst_2__ap_done,
  FloatvMultConst_2__ap_idle,
  FloatvMultConst_3__ap_start,
  FloatvMultConst_3__ap_ready,
  FloatvMultConst_3__ap_done,
  FloatvMultConst_3__ap_idle,
  FloatvMultConst_4__ap_start,
  FloatvMultConst_4__ap_ready,
  FloatvMultConst_4__ap_done,
  FloatvMultConst_4__ap_idle,
  FloatvMultConst_5__ap_start,
  FloatvMultConst_5__ap_ready,
  FloatvMultConst_5__ap_done,
  FloatvMultConst_5__ap_idle,
  FloatvMultConst_6__ap_start,
  FloatvMultConst_6__ap_ready,
  FloatvMultConst_6__ap_done,
  FloatvMultConst_6__ap_idle,
  FloatvMultConst_7__ap_start,
  FloatvMultConst_7__ap_ready,
  FloatvMultConst_7__ap_done,
  FloatvMultConst_7__ap_idle,
  FloatvMultConst_8__ap_start,
  FloatvMultConst_8__ap_ready,
  FloatvMultConst_8__ap_done,
  FloatvMultConst_8__ap_idle,
  FloatvMultConst_9__ap_start,
  FloatvMultConst_9__ap_ready,
  FloatvMultConst_9__ap_done,
  FloatvMultConst_9__ap_idle,
  FloatvMultConst_10__ap_start,
  FloatvMultConst_10__ap_ready,
  FloatvMultConst_10__ap_done,
  FloatvMultConst_10__ap_idle,
  FloatvMultConst_11__ap_start,
  FloatvMultConst_11__ap_ready,
  FloatvMultConst_11__ap_done,
  FloatvMultConst_11__ap_idle,
  FloatvMultConst_12__ap_start,
  FloatvMultConst_12__ap_ready,
  FloatvMultConst_12__ap_done,
  FloatvMultConst_12__ap_idle,
  FloatvMultConst_13__ap_start,
  FloatvMultConst_13__ap_ready,
  FloatvMultConst_13__ap_done,
  FloatvMultConst_13__ap_idle,
  FloatvMultConst_14__ap_start,
  FloatvMultConst_14__ap_ready,
  FloatvMultConst_14__ap_done,
  FloatvMultConst_14__ap_idle,
  FloatvMultConst_15__ap_start,
  FloatvMultConst_15__ap_ready,
  FloatvMultConst_15__ap_done,
  FloatvMultConst_15__ap_idle,
  Merger_0__ap_start,
  Merger_1__ap_start,
  Merger_2__ap_start,
  Merger_3__ap_start,
  Merger_4__ap_start,
  Merger_5__ap_start,
  Merger_6__ap_start,
  Merger_7__ap_start,
  PEG_Bmtx_0__ap_start,
  PEG_Bmtx_0__ap_ready,
  PEG_Bmtx_0__ap_done,
  PEG_Bmtx_0__ap_idle,
  PEG_Bmtx_1__ap_start,
  PEG_Bmtx_1__ap_ready,
  PEG_Bmtx_1__ap_done,
  PEG_Bmtx_1__ap_idle,
  PEG_Bmtx_2__ap_start,
  PEG_Bmtx_2__ap_ready,
  PEG_Bmtx_2__ap_done,
  PEG_Bmtx_2__ap_idle,
  PEG_Bmtx_3__ap_start,
  PEG_Bmtx_3__ap_ready,
  PEG_Bmtx_3__ap_done,
  PEG_Bmtx_3__ap_idle,
  PEG_Bmtx_4__ap_start,
  PEG_Bmtx_4__ap_ready,
  PEG_Bmtx_4__ap_done,
  PEG_Bmtx_4__ap_idle,
  PEG_Bmtx_5__ap_start,
  PEG_Bmtx_5__ap_ready,
  PEG_Bmtx_5__ap_done,
  PEG_Bmtx_5__ap_idle,
  PEG_Bmtx_6__ap_start,
  PEG_Bmtx_6__ap_ready,
  PEG_Bmtx_6__ap_done,
  PEG_Bmtx_6__ap_idle,
  PEG_Bmtx_7__ap_start,
  PEG_Bmtx_7__ap_ready,
  PEG_Bmtx_7__ap_done,
  PEG_Bmtx_7__ap_idle,
  PEG_Bmtx_8__ap_start,
  PEG_Bmtx_8__ap_ready,
  PEG_Bmtx_8__ap_done,
  PEG_Bmtx_8__ap_idle,
  PEG_Bmtx_9__ap_start,
  PEG_Bmtx_9__ap_ready,
  PEG_Bmtx_9__ap_done,
  PEG_Bmtx_9__ap_idle,
  PEG_Bmtx_10__ap_start,
  PEG_Bmtx_10__ap_ready,
  PEG_Bmtx_10__ap_done,
  PEG_Bmtx_10__ap_idle,
  PEG_Bmtx_11__ap_start,
  PEG_Bmtx_11__ap_ready,
  PEG_Bmtx_11__ap_done,
  PEG_Bmtx_11__ap_idle,
  PEG_Bmtx_12__ap_start,
  PEG_Bmtx_12__ap_ready,
  PEG_Bmtx_12__ap_done,
  PEG_Bmtx_12__ap_idle,
  PEG_Bmtx_13__ap_start,
  PEG_Bmtx_13__ap_ready,
  PEG_Bmtx_13__ap_done,
  PEG_Bmtx_13__ap_idle,
  PEG_Bmtx_14__ap_start,
  PEG_Bmtx_14__ap_ready,
  PEG_Bmtx_14__ap_done,
  PEG_Bmtx_14__ap_idle,
  PEG_Bmtx_15__ap_start,
  PEG_Bmtx_15__ap_ready,
  PEG_Bmtx_15__ap_done,
  PEG_Bmtx_15__ap_idle,
  PEG_Cmtx_0__ap_start,
  PEG_Cmtx_0__ap_ready,
  PEG_Cmtx_0__ap_done,
  PEG_Cmtx_0__ap_idle,
  PEG_Cmtx_1__ap_start,
  PEG_Cmtx_1__ap_ready,
  PEG_Cmtx_1__ap_done,
  PEG_Cmtx_1__ap_idle,
  PEG_Cmtx_2__ap_start,
  PEG_Cmtx_2__ap_ready,
  PEG_Cmtx_2__ap_done,
  PEG_Cmtx_2__ap_idle,
  PEG_Cmtx_3__ap_start,
  PEG_Cmtx_3__ap_ready,
  PEG_Cmtx_3__ap_done,
  PEG_Cmtx_3__ap_idle,
  PEG_Cmtx_4__ap_start,
  PEG_Cmtx_4__ap_ready,
  PEG_Cmtx_4__ap_done,
  PEG_Cmtx_4__ap_idle,
  PEG_Cmtx_5__ap_start,
  PEG_Cmtx_5__ap_ready,
  PEG_Cmtx_5__ap_done,
  PEG_Cmtx_5__ap_idle,
  PEG_Cmtx_6__ap_start,
  PEG_Cmtx_6__ap_ready,
  PEG_Cmtx_6__ap_done,
  PEG_Cmtx_6__ap_idle,
  PEG_Cmtx_7__ap_start,
  PEG_Cmtx_7__ap_ready,
  PEG_Cmtx_7__ap_done,
  PEG_Cmtx_7__ap_idle,
  PEG_Cmtx_8__ap_start,
  PEG_Cmtx_8__ap_ready,
  PEG_Cmtx_8__ap_done,
  PEG_Cmtx_8__ap_idle,
  PEG_Cmtx_9__ap_start,
  PEG_Cmtx_9__ap_ready,
  PEG_Cmtx_9__ap_done,
  PEG_Cmtx_9__ap_idle,
  PEG_Cmtx_10__ap_start,
  PEG_Cmtx_10__ap_ready,
  PEG_Cmtx_10__ap_done,
  PEG_Cmtx_10__ap_idle,
  PEG_Cmtx_11__ap_start,
  PEG_Cmtx_11__ap_ready,
  PEG_Cmtx_11__ap_done,
  PEG_Cmtx_11__ap_idle,
  PEG_Cmtx_12__ap_start,
  PEG_Cmtx_12__ap_ready,
  PEG_Cmtx_12__ap_done,
  PEG_Cmtx_12__ap_idle,
  PEG_Cmtx_13__ap_start,
  PEG_Cmtx_13__ap_ready,
  PEG_Cmtx_13__ap_done,
  PEG_Cmtx_13__ap_idle,
  PEG_Cmtx_14__ap_start,
  PEG_Cmtx_14__ap_ready,
  PEG_Cmtx_14__ap_done,
  PEG_Cmtx_14__ap_idle,
  PEG_Cmtx_15__ap_start,
  PEG_Cmtx_15__ap_ready,
  PEG_Cmtx_15__ap_done,
  PEG_Cmtx_15__ap_idle,
  Scatter_1_2_0__ap_start,
  Scatter_1_2_1__ap_start,
  Scatter_1_2_2__ap_start,
  Scatter_1_2_3__ap_start,
  Scatter_1_2_4__ap_start,
  Scatter_1_2_5__ap_start,
  Scatter_1_2_6__ap_start,
  Scatter_1_2_7__ap_start,
  black_hole_float_v16_0__ap_start,
  black_hole_float_v16_1__ap_start,
  black_hole_float_v16_2__ap_start,
  black_hole_float_v16_3__ap_start,
  black_hole_int_0__ap_start,
  black_hole_int_1__ap_start,
  read_A_0__ap_start,
  read_A_0__ap_ready,
  read_A_0__ap_done,
  read_A_0__ap_idle,
  read_A_1__ap_start,
  read_A_1__ap_ready,
  read_A_1__ap_done,
  read_A_1__ap_idle,
  read_A_2__ap_start,
  read_A_2__ap_ready,
  read_A_2__ap_done,
  read_A_2__ap_idle,
  read_A_3__ap_start,
  read_A_3__ap_ready,
  read_A_3__ap_done,
  read_A_3__ap_idle,
  read_A_4__ap_start,
  read_A_4__ap_ready,
  read_A_4__ap_done,
  read_A_4__ap_idle,
  read_A_5__ap_start,
  read_A_5__ap_ready,
  read_A_5__ap_done,
  read_A_5__ap_idle,
  read_A_6__ap_start,
  read_A_6__ap_ready,
  read_A_6__ap_done,
  read_A_6__ap_idle,
  read_A_7__ap_start,
  read_A_7__ap_ready,
  read_A_7__ap_done,
  read_A_7__ap_idle,
  read_B_0__ap_start,
  read_B_0__ap_ready,
  read_B_0__ap_done,
  read_B_0__ap_idle,
  read_B_1__ap_start,
  read_B_1__ap_ready,
  read_B_1__ap_done,
  read_B_1__ap_idle,
  read_B_2__ap_start,
  read_B_2__ap_ready,
  read_B_2__ap_done,
  read_B_2__ap_idle,
  read_B_3__ap_start,
  read_B_3__ap_ready,
  read_B_3__ap_done,
  read_B_3__ap_idle,
  read_C_0__ap_start,
  read_C_0__ap_ready,
  read_C_0__ap_done,
  read_C_0__ap_idle,
  read_C_1__ap_start,
  read_C_1__ap_ready,
  read_C_1__ap_done,
  read_C_1__ap_idle,
  read_C_2__ap_start,
  read_C_2__ap_ready,
  read_C_2__ap_done,
  read_C_2__ap_idle,
  read_C_3__ap_start,
  read_C_3__ap_ready,
  read_C_3__ap_done,
  read_C_3__ap_idle,
  read_C_4__ap_start,
  read_C_4__ap_ready,
  read_C_4__ap_done,
  read_C_4__ap_idle,
  read_C_5__ap_start,
  read_C_5__ap_ready,
  read_C_5__ap_done,
  read_C_5__ap_idle,
  read_C_6__ap_start,
  read_C_6__ap_ready,
  read_C_6__ap_done,
  read_C_6__ap_idle,
  read_C_7__ap_start,
  read_C_7__ap_ready,
  read_C_7__ap_done,
  read_C_7__ap_idle,
  read_edge_list_ptr_0__ap_start,
  read_edge_list_ptr_0__ap_ready,
  read_edge_list_ptr_0__ap_done,
  read_edge_list_ptr_0__ap_idle,
  write_C_0__ap_start,
  write_C_0__ap_ready,
  write_C_0__ap_done,
  write_C_0__ap_idle,
  write_C_1__ap_start,
  write_C_1__ap_ready,
  write_C_1__ap_done,
  write_C_1__ap_idle,
  write_C_2__ap_start,
  write_C_2__ap_ready,
  write_C_2__ap_done,
  write_C_2__ap_idle,
  write_C_3__ap_start,
  write_C_3__ap_ready,
  write_C_3__ap_done,
  write_C_3__ap_idle,
  write_C_4__ap_start,
  write_C_4__ap_ready,
  write_C_4__ap_done,
  write_C_4__ap_idle,
  write_C_5__ap_start,
  write_C_5__ap_ready,
  write_C_5__ap_done,
  write_C_5__ap_idle,
  write_C_6__ap_start,
  write_C_6__ap_ready,
  write_C_6__ap_done,
  write_C_6__ap_idle,
  write_C_7__ap_start,
  write_C_7__ap_ready,
  write_C_7__ap_done,
  write_C_7__ap_idle
);

  (* RS_CLK *)input ap_clk;
  (* RS_RST = "ff" *)input ap_rst_n;
  (* RS_AP_CTRL = "Sextans.ap_start" *)input ap_start;
  (* RS_AP_CTRL = "Sextans.ap_ready" *)output ap_ready;
  (* RS_FF = "Sextans__ap_done" *)output ap_done;
  (* RS_FF = "Sextans__ap_idle" *)output ap_idle;
  (* RS_FF = "FloatvAddFloatv_0__ap_start" *)output FloatvAddFloatv_0__ap_start;
  (* RS_FF = "FloatvAddFloatv_1__ap_start" *)output FloatvAddFloatv_1__ap_start;
  (* RS_FF = "FloatvAddFloatv_2__ap_start" *)output FloatvAddFloatv_2__ap_start;
  (* RS_FF = "FloatvAddFloatv_3__ap_start" *)output FloatvAddFloatv_3__ap_start;
  (* RS_FF = "FloatvAddFloatv_4__ap_start" *)output FloatvAddFloatv_4__ap_start;
  (* RS_FF = "FloatvAddFloatv_5__ap_start" *)output FloatvAddFloatv_5__ap_start;
  (* RS_FF = "FloatvAddFloatv_6__ap_start" *)output FloatvAddFloatv_6__ap_start;
  (* RS_FF = "FloatvAddFloatv_7__ap_start" *)output FloatvAddFloatv_7__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_0.ap_start" *)output FloatvMultConst_0__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_0.ap_ready" *)input FloatvMultConst_0__ap_ready;
  (* RS_FF = "FloatvMultConst_0__ap_done" *)input FloatvMultConst_0__ap_done;
  (* RS_FF = "FloatvMultConst_0__ap_idle" *)input FloatvMultConst_0__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_1.ap_start" *)output FloatvMultConst_1__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_1.ap_ready" *)input FloatvMultConst_1__ap_ready;
  (* RS_FF = "FloatvMultConst_1__ap_done" *)input FloatvMultConst_1__ap_done;
  (* RS_FF = "FloatvMultConst_1__ap_idle" *)input FloatvMultConst_1__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_2.ap_start" *)output FloatvMultConst_2__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_2.ap_ready" *)input FloatvMultConst_2__ap_ready;
  (* RS_FF = "FloatvMultConst_2__ap_done" *)input FloatvMultConst_2__ap_done;
  (* RS_FF = "FloatvMultConst_2__ap_idle" *)input FloatvMultConst_2__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_3.ap_start" *)output FloatvMultConst_3__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_3.ap_ready" *)input FloatvMultConst_3__ap_ready;
  (* RS_FF = "FloatvMultConst_3__ap_done" *)input FloatvMultConst_3__ap_done;
  (* RS_FF = "FloatvMultConst_3__ap_idle" *)input FloatvMultConst_3__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_4.ap_start" *)output FloatvMultConst_4__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_4.ap_ready" *)input FloatvMultConst_4__ap_ready;
  (* RS_FF = "FloatvMultConst_4__ap_done" *)input FloatvMultConst_4__ap_done;
  (* RS_FF = "FloatvMultConst_4__ap_idle" *)input FloatvMultConst_4__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_5.ap_start" *)output FloatvMultConst_5__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_5.ap_ready" *)input FloatvMultConst_5__ap_ready;
  (* RS_FF = "FloatvMultConst_5__ap_done" *)input FloatvMultConst_5__ap_done;
  (* RS_FF = "FloatvMultConst_5__ap_idle" *)input FloatvMultConst_5__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_6.ap_start" *)output FloatvMultConst_6__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_6.ap_ready" *)input FloatvMultConst_6__ap_ready;
  (* RS_FF = "FloatvMultConst_6__ap_done" *)input FloatvMultConst_6__ap_done;
  (* RS_FF = "FloatvMultConst_6__ap_idle" *)input FloatvMultConst_6__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_7.ap_start" *)output FloatvMultConst_7__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_7.ap_ready" *)input FloatvMultConst_7__ap_ready;
  (* RS_FF = "FloatvMultConst_7__ap_done" *)input FloatvMultConst_7__ap_done;
  (* RS_FF = "FloatvMultConst_7__ap_idle" *)input FloatvMultConst_7__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_8.ap_start" *)output FloatvMultConst_8__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_8.ap_ready" *)input FloatvMultConst_8__ap_ready;
  (* RS_FF = "FloatvMultConst_8__ap_done" *)input FloatvMultConst_8__ap_done;
  (* RS_FF = "FloatvMultConst_8__ap_idle" *)input FloatvMultConst_8__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_9.ap_start" *)output FloatvMultConst_9__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_9.ap_ready" *)input FloatvMultConst_9__ap_ready;
  (* RS_FF = "FloatvMultConst_9__ap_done" *)input FloatvMultConst_9__ap_done;
  (* RS_FF = "FloatvMultConst_9__ap_idle" *)input FloatvMultConst_9__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_10.ap_start" *)output FloatvMultConst_10__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_10.ap_ready" *)input FloatvMultConst_10__ap_ready;
  (* RS_FF = "FloatvMultConst_10__ap_done" *)input FloatvMultConst_10__ap_done;
  (* RS_FF = "FloatvMultConst_10__ap_idle" *)input FloatvMultConst_10__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_11.ap_start" *)output FloatvMultConst_11__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_11.ap_ready" *)input FloatvMultConst_11__ap_ready;
  (* RS_FF = "FloatvMultConst_11__ap_done" *)input FloatvMultConst_11__ap_done;
  (* RS_FF = "FloatvMultConst_11__ap_idle" *)input FloatvMultConst_11__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_12.ap_start" *)output FloatvMultConst_12__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_12.ap_ready" *)input FloatvMultConst_12__ap_ready;
  (* RS_FF = "FloatvMultConst_12__ap_done" *)input FloatvMultConst_12__ap_done;
  (* RS_FF = "FloatvMultConst_12__ap_idle" *)input FloatvMultConst_12__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_13.ap_start" *)output FloatvMultConst_13__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_13.ap_ready" *)input FloatvMultConst_13__ap_ready;
  (* RS_FF = "FloatvMultConst_13__ap_done" *)input FloatvMultConst_13__ap_done;
  (* RS_FF = "FloatvMultConst_13__ap_idle" *)input FloatvMultConst_13__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_14.ap_start" *)output FloatvMultConst_14__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_14.ap_ready" *)input FloatvMultConst_14__ap_ready;
  (* RS_FF = "FloatvMultConst_14__ap_done" *)input FloatvMultConst_14__ap_done;
  (* RS_FF = "FloatvMultConst_14__ap_idle" *)input FloatvMultConst_14__ap_idle;
  (* RS_AP_CTRL = "FloatvMultConst_15.ap_start" *)output FloatvMultConst_15__ap_start;
  (* RS_AP_CTRL = "FloatvMultConst_15.ap_ready" *)input FloatvMultConst_15__ap_ready;
  (* RS_FF = "FloatvMultConst_15__ap_done" *)input FloatvMultConst_15__ap_done;
  (* RS_FF = "FloatvMultConst_15__ap_idle" *)input FloatvMultConst_15__ap_idle;
  (* RS_FF = "Merger_0__ap_start" *)output Merger_0__ap_start;
  (* RS_FF = "Merger_1__ap_start" *)output Merger_1__ap_start;
  (* RS_FF = "Merger_2__ap_start" *)output Merger_2__ap_start;
  (* RS_FF = "Merger_3__ap_start" *)output Merger_3__ap_start;
  (* RS_FF = "Merger_4__ap_start" *)output Merger_4__ap_start;
  (* RS_FF = "Merger_5__ap_start" *)output Merger_5__ap_start;
  (* RS_FF = "Merger_6__ap_start" *)output Merger_6__ap_start;
  (* RS_FF = "Merger_7__ap_start" *)output Merger_7__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_0.ap_start" *)output PEG_Bmtx_0__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_0.ap_ready" *)input PEG_Bmtx_0__ap_ready;
  (* RS_FF = "PEG_Bmtx_0__ap_done" *)input PEG_Bmtx_0__ap_done;
  (* RS_FF = "PEG_Bmtx_0__ap_idle" *)input PEG_Bmtx_0__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_1.ap_start" *)output PEG_Bmtx_1__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_1.ap_ready" *)input PEG_Bmtx_1__ap_ready;
  (* RS_FF = "PEG_Bmtx_1__ap_done" *)input PEG_Bmtx_1__ap_done;
  (* RS_FF = "PEG_Bmtx_1__ap_idle" *)input PEG_Bmtx_1__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_2.ap_start" *)output PEG_Bmtx_2__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_2.ap_ready" *)input PEG_Bmtx_2__ap_ready;
  (* RS_FF = "PEG_Bmtx_2__ap_done" *)input PEG_Bmtx_2__ap_done;
  (* RS_FF = "PEG_Bmtx_2__ap_idle" *)input PEG_Bmtx_2__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_3.ap_start" *)output PEG_Bmtx_3__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_3.ap_ready" *)input PEG_Bmtx_3__ap_ready;
  (* RS_FF = "PEG_Bmtx_3__ap_done" *)input PEG_Bmtx_3__ap_done;
  (* RS_FF = "PEG_Bmtx_3__ap_idle" *)input PEG_Bmtx_3__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_4.ap_start" *)output PEG_Bmtx_4__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_4.ap_ready" *)input PEG_Bmtx_4__ap_ready;
  (* RS_FF = "PEG_Bmtx_4__ap_done" *)input PEG_Bmtx_4__ap_done;
  (* RS_FF = "PEG_Bmtx_4__ap_idle" *)input PEG_Bmtx_4__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_5.ap_start" *)output PEG_Bmtx_5__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_5.ap_ready" *)input PEG_Bmtx_5__ap_ready;
  (* RS_FF = "PEG_Bmtx_5__ap_done" *)input PEG_Bmtx_5__ap_done;
  (* RS_FF = "PEG_Bmtx_5__ap_idle" *)input PEG_Bmtx_5__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_6.ap_start" *)output PEG_Bmtx_6__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_6.ap_ready" *)input PEG_Bmtx_6__ap_ready;
  (* RS_FF = "PEG_Bmtx_6__ap_done" *)input PEG_Bmtx_6__ap_done;
  (* RS_FF = "PEG_Bmtx_6__ap_idle" *)input PEG_Bmtx_6__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_7.ap_start" *)output PEG_Bmtx_7__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_7.ap_ready" *)input PEG_Bmtx_7__ap_ready;
  (* RS_FF = "PEG_Bmtx_7__ap_done" *)input PEG_Bmtx_7__ap_done;
  (* RS_FF = "PEG_Bmtx_7__ap_idle" *)input PEG_Bmtx_7__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_8.ap_start" *)output PEG_Bmtx_8__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_8.ap_ready" *)input PEG_Bmtx_8__ap_ready;
  (* RS_FF = "PEG_Bmtx_8__ap_done" *)input PEG_Bmtx_8__ap_done;
  (* RS_FF = "PEG_Bmtx_8__ap_idle" *)input PEG_Bmtx_8__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_9.ap_start" *)output PEG_Bmtx_9__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_9.ap_ready" *)input PEG_Bmtx_9__ap_ready;
  (* RS_FF = "PEG_Bmtx_9__ap_done" *)input PEG_Bmtx_9__ap_done;
  (* RS_FF = "PEG_Bmtx_9__ap_idle" *)input PEG_Bmtx_9__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_10.ap_start" *)output PEG_Bmtx_10__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_10.ap_ready" *)input PEG_Bmtx_10__ap_ready;
  (* RS_FF = "PEG_Bmtx_10__ap_done" *)input PEG_Bmtx_10__ap_done;
  (* RS_FF = "PEG_Bmtx_10__ap_idle" *)input PEG_Bmtx_10__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_11.ap_start" *)output PEG_Bmtx_11__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_11.ap_ready" *)input PEG_Bmtx_11__ap_ready;
  (* RS_FF = "PEG_Bmtx_11__ap_done" *)input PEG_Bmtx_11__ap_done;
  (* RS_FF = "PEG_Bmtx_11__ap_idle" *)input PEG_Bmtx_11__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_12.ap_start" *)output PEG_Bmtx_12__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_12.ap_ready" *)input PEG_Bmtx_12__ap_ready;
  (* RS_FF = "PEG_Bmtx_12__ap_done" *)input PEG_Bmtx_12__ap_done;
  (* RS_FF = "PEG_Bmtx_12__ap_idle" *)input PEG_Bmtx_12__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_13.ap_start" *)output PEG_Bmtx_13__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_13.ap_ready" *)input PEG_Bmtx_13__ap_ready;
  (* RS_FF = "PEG_Bmtx_13__ap_done" *)input PEG_Bmtx_13__ap_done;
  (* RS_FF = "PEG_Bmtx_13__ap_idle" *)input PEG_Bmtx_13__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_14.ap_start" *)output PEG_Bmtx_14__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_14.ap_ready" *)input PEG_Bmtx_14__ap_ready;
  (* RS_FF = "PEG_Bmtx_14__ap_done" *)input PEG_Bmtx_14__ap_done;
  (* RS_FF = "PEG_Bmtx_14__ap_idle" *)input PEG_Bmtx_14__ap_idle;
  (* RS_AP_CTRL = "PEG_Bmtx_15.ap_start" *)output PEG_Bmtx_15__ap_start;
  (* RS_AP_CTRL = "PEG_Bmtx_15.ap_ready" *)input PEG_Bmtx_15__ap_ready;
  (* RS_FF = "PEG_Bmtx_15__ap_done" *)input PEG_Bmtx_15__ap_done;
  (* RS_FF = "PEG_Bmtx_15__ap_idle" *)input PEG_Bmtx_15__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_0.ap_start" *)output PEG_Cmtx_0__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_0.ap_ready" *)input PEG_Cmtx_0__ap_ready;
  (* RS_FF = "PEG_Cmtx_0__ap_done" *)input PEG_Cmtx_0__ap_done;
  (* RS_FF = "PEG_Cmtx_0__ap_idle" *)input PEG_Cmtx_0__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_1.ap_start" *)output PEG_Cmtx_1__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_1.ap_ready" *)input PEG_Cmtx_1__ap_ready;
  (* RS_FF = "PEG_Cmtx_1__ap_done" *)input PEG_Cmtx_1__ap_done;
  (* RS_FF = "PEG_Cmtx_1__ap_idle" *)input PEG_Cmtx_1__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_2.ap_start" *)output PEG_Cmtx_2__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_2.ap_ready" *)input PEG_Cmtx_2__ap_ready;
  (* RS_FF = "PEG_Cmtx_2__ap_done" *)input PEG_Cmtx_2__ap_done;
  (* RS_FF = "PEG_Cmtx_2__ap_idle" *)input PEG_Cmtx_2__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_3.ap_start" *)output PEG_Cmtx_3__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_3.ap_ready" *)input PEG_Cmtx_3__ap_ready;
  (* RS_FF = "PEG_Cmtx_3__ap_done" *)input PEG_Cmtx_3__ap_done;
  (* RS_FF = "PEG_Cmtx_3__ap_idle" *)input PEG_Cmtx_3__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_4.ap_start" *)output PEG_Cmtx_4__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_4.ap_ready" *)input PEG_Cmtx_4__ap_ready;
  (* RS_FF = "PEG_Cmtx_4__ap_done" *)input PEG_Cmtx_4__ap_done;
  (* RS_FF = "PEG_Cmtx_4__ap_idle" *)input PEG_Cmtx_4__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_5.ap_start" *)output PEG_Cmtx_5__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_5.ap_ready" *)input PEG_Cmtx_5__ap_ready;
  (* RS_FF = "PEG_Cmtx_5__ap_done" *)input PEG_Cmtx_5__ap_done;
  (* RS_FF = "PEG_Cmtx_5__ap_idle" *)input PEG_Cmtx_5__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_6.ap_start" *)output PEG_Cmtx_6__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_6.ap_ready" *)input PEG_Cmtx_6__ap_ready;
  (* RS_FF = "PEG_Cmtx_6__ap_done" *)input PEG_Cmtx_6__ap_done;
  (* RS_FF = "PEG_Cmtx_6__ap_idle" *)input PEG_Cmtx_6__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_7.ap_start" *)output PEG_Cmtx_7__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_7.ap_ready" *)input PEG_Cmtx_7__ap_ready;
  (* RS_FF = "PEG_Cmtx_7__ap_done" *)input PEG_Cmtx_7__ap_done;
  (* RS_FF = "PEG_Cmtx_7__ap_idle" *)input PEG_Cmtx_7__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_8.ap_start" *)output PEG_Cmtx_8__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_8.ap_ready" *)input PEG_Cmtx_8__ap_ready;
  (* RS_FF = "PEG_Cmtx_8__ap_done" *)input PEG_Cmtx_8__ap_done;
  (* RS_FF = "PEG_Cmtx_8__ap_idle" *)input PEG_Cmtx_8__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_9.ap_start" *)output PEG_Cmtx_9__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_9.ap_ready" *)input PEG_Cmtx_9__ap_ready;
  (* RS_FF = "PEG_Cmtx_9__ap_done" *)input PEG_Cmtx_9__ap_done;
  (* RS_FF = "PEG_Cmtx_9__ap_idle" *)input PEG_Cmtx_9__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_10.ap_start" *)output PEG_Cmtx_10__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_10.ap_ready" *)input PEG_Cmtx_10__ap_ready;
  (* RS_FF = "PEG_Cmtx_10__ap_done" *)input PEG_Cmtx_10__ap_done;
  (* RS_FF = "PEG_Cmtx_10__ap_idle" *)input PEG_Cmtx_10__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_11.ap_start" *)output PEG_Cmtx_11__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_11.ap_ready" *)input PEG_Cmtx_11__ap_ready;
  (* RS_FF = "PEG_Cmtx_11__ap_done" *)input PEG_Cmtx_11__ap_done;
  (* RS_FF = "PEG_Cmtx_11__ap_idle" *)input PEG_Cmtx_11__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_12.ap_start" *)output PEG_Cmtx_12__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_12.ap_ready" *)input PEG_Cmtx_12__ap_ready;
  (* RS_FF = "PEG_Cmtx_12__ap_done" *)input PEG_Cmtx_12__ap_done;
  (* RS_FF = "PEG_Cmtx_12__ap_idle" *)input PEG_Cmtx_12__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_13.ap_start" *)output PEG_Cmtx_13__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_13.ap_ready" *)input PEG_Cmtx_13__ap_ready;
  (* RS_FF = "PEG_Cmtx_13__ap_done" *)input PEG_Cmtx_13__ap_done;
  (* RS_FF = "PEG_Cmtx_13__ap_idle" *)input PEG_Cmtx_13__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_14.ap_start" *)output PEG_Cmtx_14__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_14.ap_ready" *)input PEG_Cmtx_14__ap_ready;
  (* RS_FF = "PEG_Cmtx_14__ap_done" *)input PEG_Cmtx_14__ap_done;
  (* RS_FF = "PEG_Cmtx_14__ap_idle" *)input PEG_Cmtx_14__ap_idle;
  (* RS_AP_CTRL = "PEG_Cmtx_15.ap_start" *)output PEG_Cmtx_15__ap_start;
  (* RS_AP_CTRL = "PEG_Cmtx_15.ap_ready" *)input PEG_Cmtx_15__ap_ready;
  (* RS_FF = "PEG_Cmtx_15__ap_done" *)input PEG_Cmtx_15__ap_done;
  (* RS_FF = "PEG_Cmtx_15__ap_idle" *)input PEG_Cmtx_15__ap_idle;
  (* RS_FF = "Scatter_1_2_0__ap_start" *)output Scatter_1_2_0__ap_start;
  (* RS_FF = "Scatter_1_2_1__ap_start" *)output Scatter_1_2_1__ap_start;
  (* RS_FF = "Scatter_1_2_2__ap_start" *)output Scatter_1_2_2__ap_start;
  (* RS_FF = "Scatter_1_2_3__ap_start" *)output Scatter_1_2_3__ap_start;
  (* RS_FF = "Scatter_1_2_4__ap_start" *)output Scatter_1_2_4__ap_start;
  (* RS_FF = "Scatter_1_2_5__ap_start" *)output Scatter_1_2_5__ap_start;
  (* RS_FF = "Scatter_1_2_6__ap_start" *)output Scatter_1_2_6__ap_start;
  (* RS_FF = "Scatter_1_2_7__ap_start" *)output Scatter_1_2_7__ap_start;
  (* RS_FF = "black_hole_float_v16_0__ap_start" *)output black_hole_float_v16_0__ap_start;
  (* RS_FF = "black_hole_float_v16_1__ap_start" *)output black_hole_float_v16_1__ap_start;
  (* RS_FF = "black_hole_float_v16_2__ap_start" *)output black_hole_float_v16_2__ap_start;
  (* RS_FF = "black_hole_float_v16_3__ap_start" *)output black_hole_float_v16_3__ap_start;
  (* RS_FF = "black_hole_int_0__ap_start" *)output black_hole_int_0__ap_start;
  (* RS_FF = "black_hole_int_1__ap_start" *)output black_hole_int_1__ap_start;
  (* RS_AP_CTRL = "read_A_0.ap_start" *)output read_A_0__ap_start;
  (* RS_AP_CTRL = "read_A_0.ap_ready" *)input read_A_0__ap_ready;
  (* RS_FF = "read_A_0__ap_done" *)input read_A_0__ap_done;
  (* RS_FF = "read_A_0__ap_idle" *)input read_A_0__ap_idle;
  (* RS_AP_CTRL = "read_A_1.ap_start" *)output read_A_1__ap_start;
  (* RS_AP_CTRL = "read_A_1.ap_ready" *)input read_A_1__ap_ready;
  (* RS_FF = "read_A_1__ap_done" *)input read_A_1__ap_done;
  (* RS_FF = "read_A_1__ap_idle" *)input read_A_1__ap_idle;
  (* RS_AP_CTRL = "read_A_2.ap_start" *)output read_A_2__ap_start;
  (* RS_AP_CTRL = "read_A_2.ap_ready" *)input read_A_2__ap_ready;
  (* RS_FF = "read_A_2__ap_done" *)input read_A_2__ap_done;
  (* RS_FF = "read_A_2__ap_idle" *)input read_A_2__ap_idle;
  (* RS_AP_CTRL = "read_A_3.ap_start" *)output read_A_3__ap_start;
  (* RS_AP_CTRL = "read_A_3.ap_ready" *)input read_A_3__ap_ready;
  (* RS_FF = "read_A_3__ap_done" *)input read_A_3__ap_done;
  (* RS_FF = "read_A_3__ap_idle" *)input read_A_3__ap_idle;
  (* RS_AP_CTRL = "read_A_4.ap_start" *)output read_A_4__ap_start;
  (* RS_AP_CTRL = "read_A_4.ap_ready" *)input read_A_4__ap_ready;
  (* RS_FF = "read_A_4__ap_done" *)input read_A_4__ap_done;
  (* RS_FF = "read_A_4__ap_idle" *)input read_A_4__ap_idle;
  (* RS_AP_CTRL = "read_A_5.ap_start" *)output read_A_5__ap_start;
  (* RS_AP_CTRL = "read_A_5.ap_ready" *)input read_A_5__ap_ready;
  (* RS_FF = "read_A_5__ap_done" *)input read_A_5__ap_done;
  (* RS_FF = "read_A_5__ap_idle" *)input read_A_5__ap_idle;
  (* RS_AP_CTRL = "read_A_6.ap_start" *)output read_A_6__ap_start;
  (* RS_AP_CTRL = "read_A_6.ap_ready" *)input read_A_6__ap_ready;
  (* RS_FF = "read_A_6__ap_done" *)input read_A_6__ap_done;
  (* RS_FF = "read_A_6__ap_idle" *)input read_A_6__ap_idle;
  (* RS_AP_CTRL = "read_A_7.ap_start" *)output read_A_7__ap_start;
  (* RS_AP_CTRL = "read_A_7.ap_ready" *)input read_A_7__ap_ready;
  (* RS_FF = "read_A_7__ap_done" *)input read_A_7__ap_done;
  (* RS_FF = "read_A_7__ap_idle" *)input read_A_7__ap_idle;
  (* RS_AP_CTRL = "read_B_0.ap_start" *)output read_B_0__ap_start;
  (* RS_AP_CTRL = "read_B_0.ap_ready" *)input read_B_0__ap_ready;
  (* RS_FF = "read_B_0__ap_done" *)input read_B_0__ap_done;
  (* RS_FF = "read_B_0__ap_idle" *)input read_B_0__ap_idle;
  (* RS_AP_CTRL = "read_B_1.ap_start" *)output read_B_1__ap_start;
  (* RS_AP_CTRL = "read_B_1.ap_ready" *)input read_B_1__ap_ready;
  (* RS_FF = "read_B_1__ap_done" *)input read_B_1__ap_done;
  (* RS_FF = "read_B_1__ap_idle" *)input read_B_1__ap_idle;
  (* RS_AP_CTRL = "read_B_2.ap_start" *)output read_B_2__ap_start;
  (* RS_AP_CTRL = "read_B_2.ap_ready" *)input read_B_2__ap_ready;
  (* RS_FF = "read_B_2__ap_done" *)input read_B_2__ap_done;
  (* RS_FF = "read_B_2__ap_idle" *)input read_B_2__ap_idle;
  (* RS_AP_CTRL = "read_B_3.ap_start" *)output read_B_3__ap_start;
  (* RS_AP_CTRL = "read_B_3.ap_ready" *)input read_B_3__ap_ready;
  (* RS_FF = "read_B_3__ap_done" *)input read_B_3__ap_done;
  (* RS_FF = "read_B_3__ap_idle" *)input read_B_3__ap_idle;
  (* RS_AP_CTRL = "read_C_0.ap_start" *)output read_C_0__ap_start;
  (* RS_AP_CTRL = "read_C_0.ap_ready" *)input read_C_0__ap_ready;
  (* RS_FF = "read_C_0__ap_done" *)input read_C_0__ap_done;
  (* RS_FF = "read_C_0__ap_idle" *)input read_C_0__ap_idle;
  (* RS_AP_CTRL = "read_C_1.ap_start" *)output read_C_1__ap_start;
  (* RS_AP_CTRL = "read_C_1.ap_ready" *)input read_C_1__ap_ready;
  (* RS_FF = "read_C_1__ap_done" *)input read_C_1__ap_done;
  (* RS_FF = "read_C_1__ap_idle" *)input read_C_1__ap_idle;
  (* RS_AP_CTRL = "read_C_2.ap_start" *)output read_C_2__ap_start;
  (* RS_AP_CTRL = "read_C_2.ap_ready" *)input read_C_2__ap_ready;
  (* RS_FF = "read_C_2__ap_done" *)input read_C_2__ap_done;
  (* RS_FF = "read_C_2__ap_idle" *)input read_C_2__ap_idle;
  (* RS_AP_CTRL = "read_C_3.ap_start" *)output read_C_3__ap_start;
  (* RS_AP_CTRL = "read_C_3.ap_ready" *)input read_C_3__ap_ready;
  (* RS_FF = "read_C_3__ap_done" *)input read_C_3__ap_done;
  (* RS_FF = "read_C_3__ap_idle" *)input read_C_3__ap_idle;
  (* RS_AP_CTRL = "read_C_4.ap_start" *)output read_C_4__ap_start;
  (* RS_AP_CTRL = "read_C_4.ap_ready" *)input read_C_4__ap_ready;
  (* RS_FF = "read_C_4__ap_done" *)input read_C_4__ap_done;
  (* RS_FF = "read_C_4__ap_idle" *)input read_C_4__ap_idle;
  (* RS_AP_CTRL = "read_C_5.ap_start" *)output read_C_5__ap_start;
  (* RS_AP_CTRL = "read_C_5.ap_ready" *)input read_C_5__ap_ready;
  (* RS_FF = "read_C_5__ap_done" *)input read_C_5__ap_done;
  (* RS_FF = "read_C_5__ap_idle" *)input read_C_5__ap_idle;
  (* RS_AP_CTRL = "read_C_6.ap_start" *)output read_C_6__ap_start;
  (* RS_AP_CTRL = "read_C_6.ap_ready" *)input read_C_6__ap_ready;
  (* RS_FF = "read_C_6__ap_done" *)input read_C_6__ap_done;
  (* RS_FF = "read_C_6__ap_idle" *)input read_C_6__ap_idle;
  (* RS_AP_CTRL = "read_C_7.ap_start" *)output read_C_7__ap_start;
  (* RS_AP_CTRL = "read_C_7.ap_ready" *)input read_C_7__ap_ready;
  (* RS_FF = "read_C_7__ap_done" *)input read_C_7__ap_done;
  (* RS_FF = "read_C_7__ap_idle" *)input read_C_7__ap_idle;
  (* RS_AP_CTRL = "read_edge_list_ptr_0.ap_start" *)output read_edge_list_ptr_0__ap_start;
  (* RS_AP_CTRL = "read_edge_list_ptr_0.ap_ready" *)input read_edge_list_ptr_0__ap_ready;
  (* RS_FF = "read_edge_list_ptr_0__ap_done" *)input read_edge_list_ptr_0__ap_done;
  (* RS_FF = "read_edge_list_ptr_0__ap_idle" *)input read_edge_list_ptr_0__ap_idle;
  (* RS_AP_CTRL = "write_C_0.ap_start" *)output write_C_0__ap_start;
  (* RS_AP_CTRL = "write_C_0.ap_ready" *)input write_C_0__ap_ready;
  (* RS_FF = "write_C_0__ap_done" *)input write_C_0__ap_done;
  (* RS_FF = "write_C_0__ap_idle" *)input write_C_0__ap_idle;
  (* RS_AP_CTRL = "write_C_1.ap_start" *)output write_C_1__ap_start;
  (* RS_AP_CTRL = "write_C_1.ap_ready" *)input write_C_1__ap_ready;
  (* RS_FF = "write_C_1__ap_done" *)input write_C_1__ap_done;
  (* RS_FF = "write_C_1__ap_idle" *)input write_C_1__ap_idle;
  (* RS_AP_CTRL = "write_C_2.ap_start" *)output write_C_2__ap_start;
  (* RS_AP_CTRL = "write_C_2.ap_ready" *)input write_C_2__ap_ready;
  (* RS_FF = "write_C_2__ap_done" *)input write_C_2__ap_done;
  (* RS_FF = "write_C_2__ap_idle" *)input write_C_2__ap_idle;
  (* RS_AP_CTRL = "write_C_3.ap_start" *)output write_C_3__ap_start;
  (* RS_AP_CTRL = "write_C_3.ap_ready" *)input write_C_3__ap_ready;
  (* RS_FF = "write_C_3__ap_done" *)input write_C_3__ap_done;
  (* RS_FF = "write_C_3__ap_idle" *)input write_C_3__ap_idle;
  (* RS_AP_CTRL = "write_C_4.ap_start" *)output write_C_4__ap_start;
  (* RS_AP_CTRL = "write_C_4.ap_ready" *)input write_C_4__ap_ready;
  (* RS_FF = "write_C_4__ap_done" *)input write_C_4__ap_done;
  (* RS_FF = "write_C_4__ap_idle" *)input write_C_4__ap_idle;
  (* RS_AP_CTRL = "write_C_5.ap_start" *)output write_C_5__ap_start;
  (* RS_AP_CTRL = "write_C_5.ap_ready" *)input write_C_5__ap_ready;
  (* RS_FF = "write_C_5__ap_done" *)input write_C_5__ap_done;
  (* RS_FF = "write_C_5__ap_idle" *)input write_C_5__ap_idle;
  (* RS_AP_CTRL = "write_C_6.ap_start" *)output write_C_6__ap_start;
  (* RS_AP_CTRL = "write_C_6.ap_ready" *)input write_C_6__ap_ready;
  (* RS_FF = "write_C_6__ap_done" *)input write_C_6__ap_done;
  (* RS_FF = "write_C_6__ap_idle" *)input write_C_6__ap_idle;
  (* RS_AP_CTRL = "write_C_7.ap_start" *)output write_C_7__ap_start;
  (* RS_AP_CTRL = "write_C_7.ap_ready" *)input write_C_7__ap_ready;
  (* RS_FF = "write_C_7__ap_done" *)input write_C_7__ap_done;
  (* RS_FF = "write_C_7__ap_idle" *)input write_C_7__ap_idle;
  wire FloatvAddFloatv_0__ap_start_global__q0;
  reg FloatvAddFloatv_0__ap_start;
  wire FloatvAddFloatv_1__ap_start_global__q0;
  reg FloatvAddFloatv_1__ap_start;
  wire FloatvAddFloatv_2__ap_start_global__q0;
  reg FloatvAddFloatv_2__ap_start;
  wire FloatvAddFloatv_3__ap_start_global__q0;
  reg FloatvAddFloatv_3__ap_start;
  wire FloatvAddFloatv_4__ap_start_global__q0;
  reg FloatvAddFloatv_4__ap_start;
  wire FloatvAddFloatv_5__ap_start_global__q0;
  reg FloatvAddFloatv_5__ap_start;
  wire FloatvAddFloatv_6__ap_start_global__q0;
  reg FloatvAddFloatv_6__ap_start;
  wire FloatvAddFloatv_7__ap_start_global__q0;
  reg FloatvAddFloatv_7__ap_start;
  wire FloatvMultConst_0__ap_start_global__q0;
  wire FloatvMultConst_0__is_done__q0;
  wire FloatvMultConst_0__ap_done_global__q0;
  wire FloatvMultConst_0__ap_start;
  wire FloatvMultConst_0__ap_ready;
  wire FloatvMultConst_0__ap_done;
  wire FloatvMultConst_0__ap_idle;
  reg [1:0] FloatvMultConst_0__state;
  wire FloatvMultConst_1__ap_start_global__q0;
  wire FloatvMultConst_1__is_done__q0;
  wire FloatvMultConst_1__ap_done_global__q0;
  wire FloatvMultConst_1__ap_start;
  wire FloatvMultConst_1__ap_ready;
  wire FloatvMultConst_1__ap_done;
  wire FloatvMultConst_1__ap_idle;
  reg [1:0] FloatvMultConst_1__state;
  wire FloatvMultConst_2__ap_start_global__q0;
  wire FloatvMultConst_2__is_done__q0;
  wire FloatvMultConst_2__ap_done_global__q0;
  wire FloatvMultConst_2__ap_start;
  wire FloatvMultConst_2__ap_ready;
  wire FloatvMultConst_2__ap_done;
  wire FloatvMultConst_2__ap_idle;
  reg [1:0] FloatvMultConst_2__state;
  wire FloatvMultConst_3__ap_start_global__q0;
  wire FloatvMultConst_3__is_done__q0;
  wire FloatvMultConst_3__ap_done_global__q0;
  wire FloatvMultConst_3__ap_start;
  wire FloatvMultConst_3__ap_ready;
  wire FloatvMultConst_3__ap_done;
  wire FloatvMultConst_3__ap_idle;
  reg [1:0] FloatvMultConst_3__state;
  wire FloatvMultConst_4__ap_start_global__q0;
  wire FloatvMultConst_4__is_done__q0;
  wire FloatvMultConst_4__ap_done_global__q0;
  wire FloatvMultConst_4__ap_start;
  wire FloatvMultConst_4__ap_ready;
  wire FloatvMultConst_4__ap_done;
  wire FloatvMultConst_4__ap_idle;
  reg [1:0] FloatvMultConst_4__state;
  wire FloatvMultConst_5__ap_start_global__q0;
  wire FloatvMultConst_5__is_done__q0;
  wire FloatvMultConst_5__ap_done_global__q0;
  wire FloatvMultConst_5__ap_start;
  wire FloatvMultConst_5__ap_ready;
  wire FloatvMultConst_5__ap_done;
  wire FloatvMultConst_5__ap_idle;
  reg [1:0] FloatvMultConst_5__state;
  wire FloatvMultConst_6__ap_start_global__q0;
  wire FloatvMultConst_6__is_done__q0;
  wire FloatvMultConst_6__ap_done_global__q0;
  wire FloatvMultConst_6__ap_start;
  wire FloatvMultConst_6__ap_ready;
  wire FloatvMultConst_6__ap_done;
  wire FloatvMultConst_6__ap_idle;
  reg [1:0] FloatvMultConst_6__state;
  wire FloatvMultConst_7__ap_start_global__q0;
  wire FloatvMultConst_7__is_done__q0;
  wire FloatvMultConst_7__ap_done_global__q0;
  wire FloatvMultConst_7__ap_start;
  wire FloatvMultConst_7__ap_ready;
  wire FloatvMultConst_7__ap_done;
  wire FloatvMultConst_7__ap_idle;
  reg [1:0] FloatvMultConst_7__state;
  wire FloatvMultConst_8__ap_start_global__q0;
  wire FloatvMultConst_8__is_done__q0;
  wire FloatvMultConst_8__ap_done_global__q0;
  wire FloatvMultConst_8__ap_start;
  wire FloatvMultConst_8__ap_ready;
  wire FloatvMultConst_8__ap_done;
  wire FloatvMultConst_8__ap_idle;
  reg [1:0] FloatvMultConst_8__state;
  wire FloatvMultConst_9__ap_start_global__q0;
  wire FloatvMultConst_9__is_done__q0;
  wire FloatvMultConst_9__ap_done_global__q0;
  wire FloatvMultConst_9__ap_start;
  wire FloatvMultConst_9__ap_ready;
  wire FloatvMultConst_9__ap_done;
  wire FloatvMultConst_9__ap_idle;
  reg [1:0] FloatvMultConst_9__state;
  wire FloatvMultConst_10__ap_start_global__q0;
  wire FloatvMultConst_10__is_done__q0;
  wire FloatvMultConst_10__ap_done_global__q0;
  wire FloatvMultConst_10__ap_start;
  wire FloatvMultConst_10__ap_ready;
  wire FloatvMultConst_10__ap_done;
  wire FloatvMultConst_10__ap_idle;
  reg [1:0] FloatvMultConst_10__state;
  wire FloatvMultConst_11__ap_start_global__q0;
  wire FloatvMultConst_11__is_done__q0;
  wire FloatvMultConst_11__ap_done_global__q0;
  wire FloatvMultConst_11__ap_start;
  wire FloatvMultConst_11__ap_ready;
  wire FloatvMultConst_11__ap_done;
  wire FloatvMultConst_11__ap_idle;
  reg [1:0] FloatvMultConst_11__state;
  wire FloatvMultConst_12__ap_start_global__q0;
  wire FloatvMultConst_12__is_done__q0;
  wire FloatvMultConst_12__ap_done_global__q0;
  wire FloatvMultConst_12__ap_start;
  wire FloatvMultConst_12__ap_ready;
  wire FloatvMultConst_12__ap_done;
  wire FloatvMultConst_12__ap_idle;
  reg [1:0] FloatvMultConst_12__state;
  wire FloatvMultConst_13__ap_start_global__q0;
  wire FloatvMultConst_13__is_done__q0;
  wire FloatvMultConst_13__ap_done_global__q0;
  wire FloatvMultConst_13__ap_start;
  wire FloatvMultConst_13__ap_ready;
  wire FloatvMultConst_13__ap_done;
  wire FloatvMultConst_13__ap_idle;
  reg [1:0] FloatvMultConst_13__state;
  wire FloatvMultConst_14__ap_start_global__q0;
  wire FloatvMultConst_14__is_done__q0;
  wire FloatvMultConst_14__ap_done_global__q0;
  wire FloatvMultConst_14__ap_start;
  wire FloatvMultConst_14__ap_ready;
  wire FloatvMultConst_14__ap_done;
  wire FloatvMultConst_14__ap_idle;
  reg [1:0] FloatvMultConst_14__state;
  wire FloatvMultConst_15__ap_start_global__q0;
  wire FloatvMultConst_15__is_done__q0;
  wire FloatvMultConst_15__ap_done_global__q0;
  wire FloatvMultConst_15__ap_start;
  wire FloatvMultConst_15__ap_ready;
  wire FloatvMultConst_15__ap_done;
  wire FloatvMultConst_15__ap_idle;
  reg [1:0] FloatvMultConst_15__state;
  wire Merger_0__ap_start_global__q0;
  reg Merger_0__ap_start;
  wire Merger_1__ap_start_global__q0;
  reg Merger_1__ap_start;
  wire Merger_2__ap_start_global__q0;
  reg Merger_2__ap_start;
  wire Merger_3__ap_start_global__q0;
  reg Merger_3__ap_start;
  wire Merger_4__ap_start_global__q0;
  reg Merger_4__ap_start;
  wire Merger_5__ap_start_global__q0;
  reg Merger_5__ap_start;
  wire Merger_6__ap_start_global__q0;
  reg Merger_6__ap_start;
  wire Merger_7__ap_start_global__q0;
  reg Merger_7__ap_start;
  wire PEG_Bmtx_0__ap_start_global__q0;
  wire PEG_Bmtx_0__is_done__q0;
  wire PEG_Bmtx_0__ap_done_global__q0;
  wire PEG_Bmtx_0__ap_start;
  wire PEG_Bmtx_0__ap_ready;
  wire PEG_Bmtx_0__ap_done;
  wire PEG_Bmtx_0__ap_idle;
  reg [1:0] PEG_Bmtx_0__state;
  wire PEG_Bmtx_1__ap_start_global__q0;
  wire PEG_Bmtx_1__is_done__q0;
  wire PEG_Bmtx_1__ap_done_global__q0;
  wire PEG_Bmtx_1__ap_start;
  wire PEG_Bmtx_1__ap_ready;
  wire PEG_Bmtx_1__ap_done;
  wire PEG_Bmtx_1__ap_idle;
  reg [1:0] PEG_Bmtx_1__state;
  wire PEG_Bmtx_2__ap_start_global__q0;
  wire PEG_Bmtx_2__is_done__q0;
  wire PEG_Bmtx_2__ap_done_global__q0;
  wire PEG_Bmtx_2__ap_start;
  wire PEG_Bmtx_2__ap_ready;
  wire PEG_Bmtx_2__ap_done;
  wire PEG_Bmtx_2__ap_idle;
  reg [1:0] PEG_Bmtx_2__state;
  wire PEG_Bmtx_3__ap_start_global__q0;
  wire PEG_Bmtx_3__is_done__q0;
  wire PEG_Bmtx_3__ap_done_global__q0;
  wire PEG_Bmtx_3__ap_start;
  wire PEG_Bmtx_3__ap_ready;
  wire PEG_Bmtx_3__ap_done;
  wire PEG_Bmtx_3__ap_idle;
  reg [1:0] PEG_Bmtx_3__state;
  wire PEG_Bmtx_4__ap_start_global__q0;
  wire PEG_Bmtx_4__is_done__q0;
  wire PEG_Bmtx_4__ap_done_global__q0;
  wire PEG_Bmtx_4__ap_start;
  wire PEG_Bmtx_4__ap_ready;
  wire PEG_Bmtx_4__ap_done;
  wire PEG_Bmtx_4__ap_idle;
  reg [1:0] PEG_Bmtx_4__state;
  wire PEG_Bmtx_5__ap_start_global__q0;
  wire PEG_Bmtx_5__is_done__q0;
  wire PEG_Bmtx_5__ap_done_global__q0;
  wire PEG_Bmtx_5__ap_start;
  wire PEG_Bmtx_5__ap_ready;
  wire PEG_Bmtx_5__ap_done;
  wire PEG_Bmtx_5__ap_idle;
  reg [1:0] PEG_Bmtx_5__state;
  wire PEG_Bmtx_6__ap_start_global__q0;
  wire PEG_Bmtx_6__is_done__q0;
  wire PEG_Bmtx_6__ap_done_global__q0;
  wire PEG_Bmtx_6__ap_start;
  wire PEG_Bmtx_6__ap_ready;
  wire PEG_Bmtx_6__ap_done;
  wire PEG_Bmtx_6__ap_idle;
  reg [1:0] PEG_Bmtx_6__state;
  wire PEG_Bmtx_7__ap_start_global__q0;
  wire PEG_Bmtx_7__is_done__q0;
  wire PEG_Bmtx_7__ap_done_global__q0;
  wire PEG_Bmtx_7__ap_start;
  wire PEG_Bmtx_7__ap_ready;
  wire PEG_Bmtx_7__ap_done;
  wire PEG_Bmtx_7__ap_idle;
  reg [1:0] PEG_Bmtx_7__state;
  wire PEG_Bmtx_8__ap_start_global__q0;
  wire PEG_Bmtx_8__is_done__q0;
  wire PEG_Bmtx_8__ap_done_global__q0;
  wire PEG_Bmtx_8__ap_start;
  wire PEG_Bmtx_8__ap_ready;
  wire PEG_Bmtx_8__ap_done;
  wire PEG_Bmtx_8__ap_idle;
  reg [1:0] PEG_Bmtx_8__state;
  wire PEG_Bmtx_9__ap_start_global__q0;
  wire PEG_Bmtx_9__is_done__q0;
  wire PEG_Bmtx_9__ap_done_global__q0;
  wire PEG_Bmtx_9__ap_start;
  wire PEG_Bmtx_9__ap_ready;
  wire PEG_Bmtx_9__ap_done;
  wire PEG_Bmtx_9__ap_idle;
  reg [1:0] PEG_Bmtx_9__state;
  wire PEG_Bmtx_10__ap_start_global__q0;
  wire PEG_Bmtx_10__is_done__q0;
  wire PEG_Bmtx_10__ap_done_global__q0;
  wire PEG_Bmtx_10__ap_start;
  wire PEG_Bmtx_10__ap_ready;
  wire PEG_Bmtx_10__ap_done;
  wire PEG_Bmtx_10__ap_idle;
  reg [1:0] PEG_Bmtx_10__state;
  wire PEG_Bmtx_11__ap_start_global__q0;
  wire PEG_Bmtx_11__is_done__q0;
  wire PEG_Bmtx_11__ap_done_global__q0;
  wire PEG_Bmtx_11__ap_start;
  wire PEG_Bmtx_11__ap_ready;
  wire PEG_Bmtx_11__ap_done;
  wire PEG_Bmtx_11__ap_idle;
  reg [1:0] PEG_Bmtx_11__state;
  wire PEG_Bmtx_12__ap_start_global__q0;
  wire PEG_Bmtx_12__is_done__q0;
  wire PEG_Bmtx_12__ap_done_global__q0;
  wire PEG_Bmtx_12__ap_start;
  wire PEG_Bmtx_12__ap_ready;
  wire PEG_Bmtx_12__ap_done;
  wire PEG_Bmtx_12__ap_idle;
  reg [1:0] PEG_Bmtx_12__state;
  wire PEG_Bmtx_13__ap_start_global__q0;
  wire PEG_Bmtx_13__is_done__q0;
  wire PEG_Bmtx_13__ap_done_global__q0;
  wire PEG_Bmtx_13__ap_start;
  wire PEG_Bmtx_13__ap_ready;
  wire PEG_Bmtx_13__ap_done;
  wire PEG_Bmtx_13__ap_idle;
  reg [1:0] PEG_Bmtx_13__state;
  wire PEG_Bmtx_14__ap_start_global__q0;
  wire PEG_Bmtx_14__is_done__q0;
  wire PEG_Bmtx_14__ap_done_global__q0;
  wire PEG_Bmtx_14__ap_start;
  wire PEG_Bmtx_14__ap_ready;
  wire PEG_Bmtx_14__ap_done;
  wire PEG_Bmtx_14__ap_idle;
  reg [1:0] PEG_Bmtx_14__state;
  wire PEG_Bmtx_15__ap_start_global__q0;
  wire PEG_Bmtx_15__is_done__q0;
  wire PEG_Bmtx_15__ap_done_global__q0;
  wire PEG_Bmtx_15__ap_start;
  wire PEG_Bmtx_15__ap_ready;
  wire PEG_Bmtx_15__ap_done;
  wire PEG_Bmtx_15__ap_idle;
  reg [1:0] PEG_Bmtx_15__state;
  wire PEG_Cmtx_0__ap_start_global__q0;
  wire PEG_Cmtx_0__is_done__q0;
  wire PEG_Cmtx_0__ap_done_global__q0;
  wire PEG_Cmtx_0__ap_start;
  wire PEG_Cmtx_0__ap_ready;
  wire PEG_Cmtx_0__ap_done;
  wire PEG_Cmtx_0__ap_idle;
  reg [1:0] PEG_Cmtx_0__state;
  wire PEG_Cmtx_1__ap_start_global__q0;
  wire PEG_Cmtx_1__is_done__q0;
  wire PEG_Cmtx_1__ap_done_global__q0;
  wire PEG_Cmtx_1__ap_start;
  wire PEG_Cmtx_1__ap_ready;
  wire PEG_Cmtx_1__ap_done;
  wire PEG_Cmtx_1__ap_idle;
  reg [1:0] PEG_Cmtx_1__state;
  wire PEG_Cmtx_2__ap_start_global__q0;
  wire PEG_Cmtx_2__is_done__q0;
  wire PEG_Cmtx_2__ap_done_global__q0;
  wire PEG_Cmtx_2__ap_start;
  wire PEG_Cmtx_2__ap_ready;
  wire PEG_Cmtx_2__ap_done;
  wire PEG_Cmtx_2__ap_idle;
  reg [1:0] PEG_Cmtx_2__state;
  wire PEG_Cmtx_3__ap_start_global__q0;
  wire PEG_Cmtx_3__is_done__q0;
  wire PEG_Cmtx_3__ap_done_global__q0;
  wire PEG_Cmtx_3__ap_start;
  wire PEG_Cmtx_3__ap_ready;
  wire PEG_Cmtx_3__ap_done;
  wire PEG_Cmtx_3__ap_idle;
  reg [1:0] PEG_Cmtx_3__state;
  wire PEG_Cmtx_4__ap_start_global__q0;
  wire PEG_Cmtx_4__is_done__q0;
  wire PEG_Cmtx_4__ap_done_global__q0;
  wire PEG_Cmtx_4__ap_start;
  wire PEG_Cmtx_4__ap_ready;
  wire PEG_Cmtx_4__ap_done;
  wire PEG_Cmtx_4__ap_idle;
  reg [1:0] PEG_Cmtx_4__state;
  wire PEG_Cmtx_5__ap_start_global__q0;
  wire PEG_Cmtx_5__is_done__q0;
  wire PEG_Cmtx_5__ap_done_global__q0;
  wire PEG_Cmtx_5__ap_start;
  wire PEG_Cmtx_5__ap_ready;
  wire PEG_Cmtx_5__ap_done;
  wire PEG_Cmtx_5__ap_idle;
  reg [1:0] PEG_Cmtx_5__state;
  wire PEG_Cmtx_6__ap_start_global__q0;
  wire PEG_Cmtx_6__is_done__q0;
  wire PEG_Cmtx_6__ap_done_global__q0;
  wire PEG_Cmtx_6__ap_start;
  wire PEG_Cmtx_6__ap_ready;
  wire PEG_Cmtx_6__ap_done;
  wire PEG_Cmtx_6__ap_idle;
  reg [1:0] PEG_Cmtx_6__state;
  wire PEG_Cmtx_7__ap_start_global__q0;
  wire PEG_Cmtx_7__is_done__q0;
  wire PEG_Cmtx_7__ap_done_global__q0;
  wire PEG_Cmtx_7__ap_start;
  wire PEG_Cmtx_7__ap_ready;
  wire PEG_Cmtx_7__ap_done;
  wire PEG_Cmtx_7__ap_idle;
  reg [1:0] PEG_Cmtx_7__state;
  wire PEG_Cmtx_8__ap_start_global__q0;
  wire PEG_Cmtx_8__is_done__q0;
  wire PEG_Cmtx_8__ap_done_global__q0;
  wire PEG_Cmtx_8__ap_start;
  wire PEG_Cmtx_8__ap_ready;
  wire PEG_Cmtx_8__ap_done;
  wire PEG_Cmtx_8__ap_idle;
  reg [1:0] PEG_Cmtx_8__state;
  wire PEG_Cmtx_9__ap_start_global__q0;
  wire PEG_Cmtx_9__is_done__q0;
  wire PEG_Cmtx_9__ap_done_global__q0;
  wire PEG_Cmtx_9__ap_start;
  wire PEG_Cmtx_9__ap_ready;
  wire PEG_Cmtx_9__ap_done;
  wire PEG_Cmtx_9__ap_idle;
  reg [1:0] PEG_Cmtx_9__state;
  wire PEG_Cmtx_10__ap_start_global__q0;
  wire PEG_Cmtx_10__is_done__q0;
  wire PEG_Cmtx_10__ap_done_global__q0;
  wire PEG_Cmtx_10__ap_start;
  wire PEG_Cmtx_10__ap_ready;
  wire PEG_Cmtx_10__ap_done;
  wire PEG_Cmtx_10__ap_idle;
  reg [1:0] PEG_Cmtx_10__state;
  wire PEG_Cmtx_11__ap_start_global__q0;
  wire PEG_Cmtx_11__is_done__q0;
  wire PEG_Cmtx_11__ap_done_global__q0;
  wire PEG_Cmtx_11__ap_start;
  wire PEG_Cmtx_11__ap_ready;
  wire PEG_Cmtx_11__ap_done;
  wire PEG_Cmtx_11__ap_idle;
  reg [1:0] PEG_Cmtx_11__state;
  wire PEG_Cmtx_12__ap_start_global__q0;
  wire PEG_Cmtx_12__is_done__q0;
  wire PEG_Cmtx_12__ap_done_global__q0;
  wire PEG_Cmtx_12__ap_start;
  wire PEG_Cmtx_12__ap_ready;
  wire PEG_Cmtx_12__ap_done;
  wire PEG_Cmtx_12__ap_idle;
  reg [1:0] PEG_Cmtx_12__state;
  wire PEG_Cmtx_13__ap_start_global__q0;
  wire PEG_Cmtx_13__is_done__q0;
  wire PEG_Cmtx_13__ap_done_global__q0;
  wire PEG_Cmtx_13__ap_start;
  wire PEG_Cmtx_13__ap_ready;
  wire PEG_Cmtx_13__ap_done;
  wire PEG_Cmtx_13__ap_idle;
  reg [1:0] PEG_Cmtx_13__state;
  wire PEG_Cmtx_14__ap_start_global__q0;
  wire PEG_Cmtx_14__is_done__q0;
  wire PEG_Cmtx_14__ap_done_global__q0;
  wire PEG_Cmtx_14__ap_start;
  wire PEG_Cmtx_14__ap_ready;
  wire PEG_Cmtx_14__ap_done;
  wire PEG_Cmtx_14__ap_idle;
  reg [1:0] PEG_Cmtx_14__state;
  wire PEG_Cmtx_15__ap_start_global__q0;
  wire PEG_Cmtx_15__is_done__q0;
  wire PEG_Cmtx_15__ap_done_global__q0;
  wire PEG_Cmtx_15__ap_start;
  wire PEG_Cmtx_15__ap_ready;
  wire PEG_Cmtx_15__ap_done;
  wire PEG_Cmtx_15__ap_idle;
  reg [1:0] PEG_Cmtx_15__state;
  wire Scatter_1_2_0__ap_start_global__q0;
  reg Scatter_1_2_0__ap_start;
  wire Scatter_1_2_1__ap_start_global__q0;
  reg Scatter_1_2_1__ap_start;
  wire Scatter_1_2_2__ap_start_global__q0;
  reg Scatter_1_2_2__ap_start;
  wire Scatter_1_2_3__ap_start_global__q0;
  reg Scatter_1_2_3__ap_start;
  wire Scatter_1_2_4__ap_start_global__q0;
  reg Scatter_1_2_4__ap_start;
  wire Scatter_1_2_5__ap_start_global__q0;
  reg Scatter_1_2_5__ap_start;
  wire Scatter_1_2_6__ap_start_global__q0;
  reg Scatter_1_2_6__ap_start;
  wire Scatter_1_2_7__ap_start_global__q0;
  reg Scatter_1_2_7__ap_start;
  wire black_hole_float_v16_0__ap_start_global__q0;
  reg black_hole_float_v16_0__ap_start;
  wire black_hole_float_v16_1__ap_start_global__q0;
  reg black_hole_float_v16_1__ap_start;
  wire black_hole_float_v16_2__ap_start_global__q0;
  reg black_hole_float_v16_2__ap_start;
  wire black_hole_float_v16_3__ap_start_global__q0;
  reg black_hole_float_v16_3__ap_start;
  wire black_hole_int_0__ap_start_global__q0;
  reg black_hole_int_0__ap_start;
  wire black_hole_int_1__ap_start_global__q0;
  reg black_hole_int_1__ap_start;
  wire read_A_0__ap_start_global__q0;
  wire read_A_0__is_done__q0;
  wire read_A_0__ap_done_global__q0;
  wire read_A_0__ap_start;
  wire read_A_0__ap_ready;
  wire read_A_0__ap_done;
  wire read_A_0__ap_idle;
  reg [1:0] read_A_0__state;
  wire read_A_1__ap_start_global__q0;
  wire read_A_1__is_done__q0;
  wire read_A_1__ap_done_global__q0;
  wire read_A_1__ap_start;
  wire read_A_1__ap_ready;
  wire read_A_1__ap_done;
  wire read_A_1__ap_idle;
  reg [1:0] read_A_1__state;
  wire read_A_2__ap_start_global__q0;
  wire read_A_2__is_done__q0;
  wire read_A_2__ap_done_global__q0;
  wire read_A_2__ap_start;
  wire read_A_2__ap_ready;
  wire read_A_2__ap_done;
  wire read_A_2__ap_idle;
  reg [1:0] read_A_2__state;
  wire read_A_3__ap_start_global__q0;
  wire read_A_3__is_done__q0;
  wire read_A_3__ap_done_global__q0;
  wire read_A_3__ap_start;
  wire read_A_3__ap_ready;
  wire read_A_3__ap_done;
  wire read_A_3__ap_idle;
  reg [1:0] read_A_3__state;
  wire read_A_4__ap_start_global__q0;
  wire read_A_4__is_done__q0;
  wire read_A_4__ap_done_global__q0;
  wire read_A_4__ap_start;
  wire read_A_4__ap_ready;
  wire read_A_4__ap_done;
  wire read_A_4__ap_idle;
  reg [1:0] read_A_4__state;
  wire read_A_5__ap_start_global__q0;
  wire read_A_5__is_done__q0;
  wire read_A_5__ap_done_global__q0;
  wire read_A_5__ap_start;
  wire read_A_5__ap_ready;
  wire read_A_5__ap_done;
  wire read_A_5__ap_idle;
  reg [1:0] read_A_5__state;
  wire read_A_6__ap_start_global__q0;
  wire read_A_6__is_done__q0;
  wire read_A_6__ap_done_global__q0;
  wire read_A_6__ap_start;
  wire read_A_6__ap_ready;
  wire read_A_6__ap_done;
  wire read_A_6__ap_idle;
  reg [1:0] read_A_6__state;
  wire read_A_7__ap_start_global__q0;
  wire read_A_7__is_done__q0;
  wire read_A_7__ap_done_global__q0;
  wire read_A_7__ap_start;
  wire read_A_7__ap_ready;
  wire read_A_7__ap_done;
  wire read_A_7__ap_idle;
  reg [1:0] read_A_7__state;
  wire read_B_0__ap_start_global__q0;
  wire read_B_0__is_done__q0;
  wire read_B_0__ap_done_global__q0;
  wire read_B_0__ap_start;
  wire read_B_0__ap_ready;
  wire read_B_0__ap_done;
  wire read_B_0__ap_idle;
  reg [1:0] read_B_0__state;
  wire read_B_1__ap_start_global__q0;
  wire read_B_1__is_done__q0;
  wire read_B_1__ap_done_global__q0;
  wire read_B_1__ap_start;
  wire read_B_1__ap_ready;
  wire read_B_1__ap_done;
  wire read_B_1__ap_idle;
  reg [1:0] read_B_1__state;
  wire read_B_2__ap_start_global__q0;
  wire read_B_2__is_done__q0;
  wire read_B_2__ap_done_global__q0;
  wire read_B_2__ap_start;
  wire read_B_2__ap_ready;
  wire read_B_2__ap_done;
  wire read_B_2__ap_idle;
  reg [1:0] read_B_2__state;
  wire read_B_3__ap_start_global__q0;
  wire read_B_3__is_done__q0;
  wire read_B_3__ap_done_global__q0;
  wire read_B_3__ap_start;
  wire read_B_3__ap_ready;
  wire read_B_3__ap_done;
  wire read_B_3__ap_idle;
  reg [1:0] read_B_3__state;
  wire read_C_0__ap_start_global__q0;
  wire read_C_0__is_done__q0;
  wire read_C_0__ap_done_global__q0;
  wire read_C_0__ap_start;
  wire read_C_0__ap_ready;
  wire read_C_0__ap_done;
  wire read_C_0__ap_idle;
  reg [1:0] read_C_0__state;
  wire read_C_1__ap_start_global__q0;
  wire read_C_1__is_done__q0;
  wire read_C_1__ap_done_global__q0;
  wire read_C_1__ap_start;
  wire read_C_1__ap_ready;
  wire read_C_1__ap_done;
  wire read_C_1__ap_idle;
  reg [1:0] read_C_1__state;
  wire read_C_2__ap_start_global__q0;
  wire read_C_2__is_done__q0;
  wire read_C_2__ap_done_global__q0;
  wire read_C_2__ap_start;
  wire read_C_2__ap_ready;
  wire read_C_2__ap_done;
  wire read_C_2__ap_idle;
  reg [1:0] read_C_2__state;
  wire read_C_3__ap_start_global__q0;
  wire read_C_3__is_done__q0;
  wire read_C_3__ap_done_global__q0;
  wire read_C_3__ap_start;
  wire read_C_3__ap_ready;
  wire read_C_3__ap_done;
  wire read_C_3__ap_idle;
  reg [1:0] read_C_3__state;
  wire read_C_4__ap_start_global__q0;
  wire read_C_4__is_done__q0;
  wire read_C_4__ap_done_global__q0;
  wire read_C_4__ap_start;
  wire read_C_4__ap_ready;
  wire read_C_4__ap_done;
  wire read_C_4__ap_idle;
  reg [1:0] read_C_4__state;
  wire read_C_5__ap_start_global__q0;
  wire read_C_5__is_done__q0;
  wire read_C_5__ap_done_global__q0;
  wire read_C_5__ap_start;
  wire read_C_5__ap_ready;
  wire read_C_5__ap_done;
  wire read_C_5__ap_idle;
  reg [1:0] read_C_5__state;
  wire read_C_6__ap_start_global__q0;
  wire read_C_6__is_done__q0;
  wire read_C_6__ap_done_global__q0;
  wire read_C_6__ap_start;
  wire read_C_6__ap_ready;
  wire read_C_6__ap_done;
  wire read_C_6__ap_idle;
  reg [1:0] read_C_6__state;
  wire read_C_7__ap_start_global__q0;
  wire read_C_7__is_done__q0;
  wire read_C_7__ap_done_global__q0;
  wire read_C_7__ap_start;
  wire read_C_7__ap_ready;
  wire read_C_7__ap_done;
  wire read_C_7__ap_idle;
  reg [1:0] read_C_7__state;
  wire read_edge_list_ptr_0__ap_start_global__q0;
  wire read_edge_list_ptr_0__is_done__q0;
  wire read_edge_list_ptr_0__ap_done_global__q0;
  wire read_edge_list_ptr_0__ap_start;
  wire read_edge_list_ptr_0__ap_ready;
  wire read_edge_list_ptr_0__ap_done;
  wire read_edge_list_ptr_0__ap_idle;
  reg [1:0] read_edge_list_ptr_0__state;
  wire write_C_0__ap_start_global__q0;
  wire write_C_0__is_done__q0;
  wire write_C_0__ap_done_global__q0;
  wire write_C_0__ap_start;
  wire write_C_0__ap_ready;
  wire write_C_0__ap_done;
  wire write_C_0__ap_idle;
  reg [1:0] write_C_0__state;
  wire write_C_1__ap_start_global__q0;
  wire write_C_1__is_done__q0;
  wire write_C_1__ap_done_global__q0;
  wire write_C_1__ap_start;
  wire write_C_1__ap_ready;
  wire write_C_1__ap_done;
  wire write_C_1__ap_idle;
  reg [1:0] write_C_1__state;
  wire write_C_2__ap_start_global__q0;
  wire write_C_2__is_done__q0;
  wire write_C_2__ap_done_global__q0;
  wire write_C_2__ap_start;
  wire write_C_2__ap_ready;
  wire write_C_2__ap_done;
  wire write_C_2__ap_idle;
  reg [1:0] write_C_2__state;
  wire write_C_3__ap_start_global__q0;
  wire write_C_3__is_done__q0;
  wire write_C_3__ap_done_global__q0;
  wire write_C_3__ap_start;
  wire write_C_3__ap_ready;
  wire write_C_3__ap_done;
  wire write_C_3__ap_idle;
  reg [1:0] write_C_3__state;
  wire write_C_4__ap_start_global__q0;
  wire write_C_4__is_done__q0;
  wire write_C_4__ap_done_global__q0;
  wire write_C_4__ap_start;
  wire write_C_4__ap_ready;
  wire write_C_4__ap_done;
  wire write_C_4__ap_idle;
  reg [1:0] write_C_4__state;
  wire write_C_5__ap_start_global__q0;
  wire write_C_5__is_done__q0;
  wire write_C_5__ap_done_global__q0;
  wire write_C_5__ap_start;
  wire write_C_5__ap_ready;
  wire write_C_5__ap_done;
  wire write_C_5__ap_idle;
  reg [1:0] write_C_5__state;
  wire write_C_6__ap_start_global__q0;
  wire write_C_6__is_done__q0;
  wire write_C_6__ap_done_global__q0;
  wire write_C_6__ap_start;
  wire write_C_6__ap_ready;
  wire write_C_6__ap_done;
  wire write_C_6__ap_idle;
  reg [1:0] write_C_6__state;
  wire write_C_7__ap_start_global__q0;
  wire write_C_7__is_done__q0;
  wire write_C_7__ap_done_global__q0;
  wire write_C_7__ap_start;
  wire write_C_7__ap_ready;
  wire write_C_7__ap_done;
  wire write_C_7__ap_idle;
  reg [1:0] write_C_7__state;
  reg [1:0] tapa_state;
  reg [0:0] countdown;
  wire ap_start__q0;
  wire ap_done__q0;
  assign FloatvAddFloatv_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvAddFloatv_0__ap_start <= 1'b0;
    end else if(FloatvAddFloatv_0__ap_start_global__q0) begin
      FloatvAddFloatv_0__ap_start <= 1'b1;
    end
  end

  assign FloatvAddFloatv_1__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvAddFloatv_1__ap_start <= 1'b0;
    end else if(FloatvAddFloatv_1__ap_start_global__q0) begin
      FloatvAddFloatv_1__ap_start <= 1'b1;
    end
  end

  assign FloatvAddFloatv_2__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvAddFloatv_2__ap_start <= 1'b0;
    end else if(FloatvAddFloatv_2__ap_start_global__q0) begin
      FloatvAddFloatv_2__ap_start <= 1'b1;
    end
  end

  assign FloatvAddFloatv_3__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvAddFloatv_3__ap_start <= 1'b0;
    end else if(FloatvAddFloatv_3__ap_start_global__q0) begin
      FloatvAddFloatv_3__ap_start <= 1'b1;
    end
  end

  assign FloatvAddFloatv_4__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvAddFloatv_4__ap_start <= 1'b0;
    end else if(FloatvAddFloatv_4__ap_start_global__q0) begin
      FloatvAddFloatv_4__ap_start <= 1'b1;
    end
  end

  assign FloatvAddFloatv_5__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvAddFloatv_5__ap_start <= 1'b0;
    end else if(FloatvAddFloatv_5__ap_start_global__q0) begin
      FloatvAddFloatv_5__ap_start <= 1'b1;
    end
  end

  assign FloatvAddFloatv_6__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvAddFloatv_6__ap_start <= 1'b0;
    end else if(FloatvAddFloatv_6__ap_start_global__q0) begin
      FloatvAddFloatv_6__ap_start <= 1'b1;
    end
  end

  assign FloatvAddFloatv_7__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvAddFloatv_7__ap_start <= 1'b0;
    end else if(FloatvAddFloatv_7__ap_start_global__q0) begin
      FloatvAddFloatv_7__ap_start <= 1'b1;
    end
  end

  assign FloatvMultConst_0__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_0__is_done__q0 = (FloatvMultConst_0__state == 2'b10);
  assign FloatvMultConst_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_0__state <= 2'b00;
    end else begin
      if(FloatvMultConst_0__state == 2'b00) begin
        if(FloatvMultConst_0__ap_start_global__q0) begin
          FloatvMultConst_0__state <= 2'b01;
        end
      end
      if(FloatvMultConst_0__state == 2'b01) begin
        if(FloatvMultConst_0__ap_ready) begin
          if(FloatvMultConst_0__ap_done) begin
            FloatvMultConst_0__state <= 2'b10;
          end else begin
            FloatvMultConst_0__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_0__state == 2'b11) begin
        if(FloatvMultConst_0__ap_done) begin
          FloatvMultConst_0__state <= 2'b10;
        end
      end
      if(FloatvMultConst_0__state == 2'b10) begin
        if(FloatvMultConst_0__ap_done_global__q0) begin
          FloatvMultConst_0__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_0__ap_start = (FloatvMultConst_0__state == 2'b01);
  assign FloatvMultConst_1__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_1__is_done__q0 = (FloatvMultConst_1__state == 2'b10);
  assign FloatvMultConst_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_1__state <= 2'b00;
    end else begin
      if(FloatvMultConst_1__state == 2'b00) begin
        if(FloatvMultConst_1__ap_start_global__q0) begin
          FloatvMultConst_1__state <= 2'b01;
        end
      end
      if(FloatvMultConst_1__state == 2'b01) begin
        if(FloatvMultConst_1__ap_ready) begin
          if(FloatvMultConst_1__ap_done) begin
            FloatvMultConst_1__state <= 2'b10;
          end else begin
            FloatvMultConst_1__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_1__state == 2'b11) begin
        if(FloatvMultConst_1__ap_done) begin
          FloatvMultConst_1__state <= 2'b10;
        end
      end
      if(FloatvMultConst_1__state == 2'b10) begin
        if(FloatvMultConst_1__ap_done_global__q0) begin
          FloatvMultConst_1__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_1__ap_start = (FloatvMultConst_1__state == 2'b01);
  assign FloatvMultConst_2__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_2__is_done__q0 = (FloatvMultConst_2__state == 2'b10);
  assign FloatvMultConst_2__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_2__state <= 2'b00;
    end else begin
      if(FloatvMultConst_2__state == 2'b00) begin
        if(FloatvMultConst_2__ap_start_global__q0) begin
          FloatvMultConst_2__state <= 2'b01;
        end
      end
      if(FloatvMultConst_2__state == 2'b01) begin
        if(FloatvMultConst_2__ap_ready) begin
          if(FloatvMultConst_2__ap_done) begin
            FloatvMultConst_2__state <= 2'b10;
          end else begin
            FloatvMultConst_2__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_2__state == 2'b11) begin
        if(FloatvMultConst_2__ap_done) begin
          FloatvMultConst_2__state <= 2'b10;
        end
      end
      if(FloatvMultConst_2__state == 2'b10) begin
        if(FloatvMultConst_2__ap_done_global__q0) begin
          FloatvMultConst_2__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_2__ap_start = (FloatvMultConst_2__state == 2'b01);
  assign FloatvMultConst_3__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_3__is_done__q0 = (FloatvMultConst_3__state == 2'b10);
  assign FloatvMultConst_3__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_3__state <= 2'b00;
    end else begin
      if(FloatvMultConst_3__state == 2'b00) begin
        if(FloatvMultConst_3__ap_start_global__q0) begin
          FloatvMultConst_3__state <= 2'b01;
        end
      end
      if(FloatvMultConst_3__state == 2'b01) begin
        if(FloatvMultConst_3__ap_ready) begin
          if(FloatvMultConst_3__ap_done) begin
            FloatvMultConst_3__state <= 2'b10;
          end else begin
            FloatvMultConst_3__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_3__state == 2'b11) begin
        if(FloatvMultConst_3__ap_done) begin
          FloatvMultConst_3__state <= 2'b10;
        end
      end
      if(FloatvMultConst_3__state == 2'b10) begin
        if(FloatvMultConst_3__ap_done_global__q0) begin
          FloatvMultConst_3__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_3__ap_start = (FloatvMultConst_3__state == 2'b01);
  assign FloatvMultConst_4__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_4__is_done__q0 = (FloatvMultConst_4__state == 2'b10);
  assign FloatvMultConst_4__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_4__state <= 2'b00;
    end else begin
      if(FloatvMultConst_4__state == 2'b00) begin
        if(FloatvMultConst_4__ap_start_global__q0) begin
          FloatvMultConst_4__state <= 2'b01;
        end
      end
      if(FloatvMultConst_4__state == 2'b01) begin
        if(FloatvMultConst_4__ap_ready) begin
          if(FloatvMultConst_4__ap_done) begin
            FloatvMultConst_4__state <= 2'b10;
          end else begin
            FloatvMultConst_4__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_4__state == 2'b11) begin
        if(FloatvMultConst_4__ap_done) begin
          FloatvMultConst_4__state <= 2'b10;
        end
      end
      if(FloatvMultConst_4__state == 2'b10) begin
        if(FloatvMultConst_4__ap_done_global__q0) begin
          FloatvMultConst_4__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_4__ap_start = (FloatvMultConst_4__state == 2'b01);
  assign FloatvMultConst_5__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_5__is_done__q0 = (FloatvMultConst_5__state == 2'b10);
  assign FloatvMultConst_5__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_5__state <= 2'b00;
    end else begin
      if(FloatvMultConst_5__state == 2'b00) begin
        if(FloatvMultConst_5__ap_start_global__q0) begin
          FloatvMultConst_5__state <= 2'b01;
        end
      end
      if(FloatvMultConst_5__state == 2'b01) begin
        if(FloatvMultConst_5__ap_ready) begin
          if(FloatvMultConst_5__ap_done) begin
            FloatvMultConst_5__state <= 2'b10;
          end else begin
            FloatvMultConst_5__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_5__state == 2'b11) begin
        if(FloatvMultConst_5__ap_done) begin
          FloatvMultConst_5__state <= 2'b10;
        end
      end
      if(FloatvMultConst_5__state == 2'b10) begin
        if(FloatvMultConst_5__ap_done_global__q0) begin
          FloatvMultConst_5__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_5__ap_start = (FloatvMultConst_5__state == 2'b01);
  assign FloatvMultConst_6__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_6__is_done__q0 = (FloatvMultConst_6__state == 2'b10);
  assign FloatvMultConst_6__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_6__state <= 2'b00;
    end else begin
      if(FloatvMultConst_6__state == 2'b00) begin
        if(FloatvMultConst_6__ap_start_global__q0) begin
          FloatvMultConst_6__state <= 2'b01;
        end
      end
      if(FloatvMultConst_6__state == 2'b01) begin
        if(FloatvMultConst_6__ap_ready) begin
          if(FloatvMultConst_6__ap_done) begin
            FloatvMultConst_6__state <= 2'b10;
          end else begin
            FloatvMultConst_6__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_6__state == 2'b11) begin
        if(FloatvMultConst_6__ap_done) begin
          FloatvMultConst_6__state <= 2'b10;
        end
      end
      if(FloatvMultConst_6__state == 2'b10) begin
        if(FloatvMultConst_6__ap_done_global__q0) begin
          FloatvMultConst_6__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_6__ap_start = (FloatvMultConst_6__state == 2'b01);
  assign FloatvMultConst_7__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_7__is_done__q0 = (FloatvMultConst_7__state == 2'b10);
  assign FloatvMultConst_7__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_7__state <= 2'b00;
    end else begin
      if(FloatvMultConst_7__state == 2'b00) begin
        if(FloatvMultConst_7__ap_start_global__q0) begin
          FloatvMultConst_7__state <= 2'b01;
        end
      end
      if(FloatvMultConst_7__state == 2'b01) begin
        if(FloatvMultConst_7__ap_ready) begin
          if(FloatvMultConst_7__ap_done) begin
            FloatvMultConst_7__state <= 2'b10;
          end else begin
            FloatvMultConst_7__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_7__state == 2'b11) begin
        if(FloatvMultConst_7__ap_done) begin
          FloatvMultConst_7__state <= 2'b10;
        end
      end
      if(FloatvMultConst_7__state == 2'b10) begin
        if(FloatvMultConst_7__ap_done_global__q0) begin
          FloatvMultConst_7__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_7__ap_start = (FloatvMultConst_7__state == 2'b01);
  assign FloatvMultConst_8__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_8__is_done__q0 = (FloatvMultConst_8__state == 2'b10);
  assign FloatvMultConst_8__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_8__state <= 2'b00;
    end else begin
      if(FloatvMultConst_8__state == 2'b00) begin
        if(FloatvMultConst_8__ap_start_global__q0) begin
          FloatvMultConst_8__state <= 2'b01;
        end
      end
      if(FloatvMultConst_8__state == 2'b01) begin
        if(FloatvMultConst_8__ap_ready) begin
          if(FloatvMultConst_8__ap_done) begin
            FloatvMultConst_8__state <= 2'b10;
          end else begin
            FloatvMultConst_8__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_8__state == 2'b11) begin
        if(FloatvMultConst_8__ap_done) begin
          FloatvMultConst_8__state <= 2'b10;
        end
      end
      if(FloatvMultConst_8__state == 2'b10) begin
        if(FloatvMultConst_8__ap_done_global__q0) begin
          FloatvMultConst_8__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_8__ap_start = (FloatvMultConst_8__state == 2'b01);
  assign FloatvMultConst_9__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_9__is_done__q0 = (FloatvMultConst_9__state == 2'b10);
  assign FloatvMultConst_9__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_9__state <= 2'b00;
    end else begin
      if(FloatvMultConst_9__state == 2'b00) begin
        if(FloatvMultConst_9__ap_start_global__q0) begin
          FloatvMultConst_9__state <= 2'b01;
        end
      end
      if(FloatvMultConst_9__state == 2'b01) begin
        if(FloatvMultConst_9__ap_ready) begin
          if(FloatvMultConst_9__ap_done) begin
            FloatvMultConst_9__state <= 2'b10;
          end else begin
            FloatvMultConst_9__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_9__state == 2'b11) begin
        if(FloatvMultConst_9__ap_done) begin
          FloatvMultConst_9__state <= 2'b10;
        end
      end
      if(FloatvMultConst_9__state == 2'b10) begin
        if(FloatvMultConst_9__ap_done_global__q0) begin
          FloatvMultConst_9__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_9__ap_start = (FloatvMultConst_9__state == 2'b01);
  assign FloatvMultConst_10__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_10__is_done__q0 = (FloatvMultConst_10__state == 2'b10);
  assign FloatvMultConst_10__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_10__state <= 2'b00;
    end else begin
      if(FloatvMultConst_10__state == 2'b00) begin
        if(FloatvMultConst_10__ap_start_global__q0) begin
          FloatvMultConst_10__state <= 2'b01;
        end
      end
      if(FloatvMultConst_10__state == 2'b01) begin
        if(FloatvMultConst_10__ap_ready) begin
          if(FloatvMultConst_10__ap_done) begin
            FloatvMultConst_10__state <= 2'b10;
          end else begin
            FloatvMultConst_10__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_10__state == 2'b11) begin
        if(FloatvMultConst_10__ap_done) begin
          FloatvMultConst_10__state <= 2'b10;
        end
      end
      if(FloatvMultConst_10__state == 2'b10) begin
        if(FloatvMultConst_10__ap_done_global__q0) begin
          FloatvMultConst_10__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_10__ap_start = (FloatvMultConst_10__state == 2'b01);
  assign FloatvMultConst_11__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_11__is_done__q0 = (FloatvMultConst_11__state == 2'b10);
  assign FloatvMultConst_11__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_11__state <= 2'b00;
    end else begin
      if(FloatvMultConst_11__state == 2'b00) begin
        if(FloatvMultConst_11__ap_start_global__q0) begin
          FloatvMultConst_11__state <= 2'b01;
        end
      end
      if(FloatvMultConst_11__state == 2'b01) begin
        if(FloatvMultConst_11__ap_ready) begin
          if(FloatvMultConst_11__ap_done) begin
            FloatvMultConst_11__state <= 2'b10;
          end else begin
            FloatvMultConst_11__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_11__state == 2'b11) begin
        if(FloatvMultConst_11__ap_done) begin
          FloatvMultConst_11__state <= 2'b10;
        end
      end
      if(FloatvMultConst_11__state == 2'b10) begin
        if(FloatvMultConst_11__ap_done_global__q0) begin
          FloatvMultConst_11__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_11__ap_start = (FloatvMultConst_11__state == 2'b01);
  assign FloatvMultConst_12__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_12__is_done__q0 = (FloatvMultConst_12__state == 2'b10);
  assign FloatvMultConst_12__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_12__state <= 2'b00;
    end else begin
      if(FloatvMultConst_12__state == 2'b00) begin
        if(FloatvMultConst_12__ap_start_global__q0) begin
          FloatvMultConst_12__state <= 2'b01;
        end
      end
      if(FloatvMultConst_12__state == 2'b01) begin
        if(FloatvMultConst_12__ap_ready) begin
          if(FloatvMultConst_12__ap_done) begin
            FloatvMultConst_12__state <= 2'b10;
          end else begin
            FloatvMultConst_12__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_12__state == 2'b11) begin
        if(FloatvMultConst_12__ap_done) begin
          FloatvMultConst_12__state <= 2'b10;
        end
      end
      if(FloatvMultConst_12__state == 2'b10) begin
        if(FloatvMultConst_12__ap_done_global__q0) begin
          FloatvMultConst_12__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_12__ap_start = (FloatvMultConst_12__state == 2'b01);
  assign FloatvMultConst_13__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_13__is_done__q0 = (FloatvMultConst_13__state == 2'b10);
  assign FloatvMultConst_13__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_13__state <= 2'b00;
    end else begin
      if(FloatvMultConst_13__state == 2'b00) begin
        if(FloatvMultConst_13__ap_start_global__q0) begin
          FloatvMultConst_13__state <= 2'b01;
        end
      end
      if(FloatvMultConst_13__state == 2'b01) begin
        if(FloatvMultConst_13__ap_ready) begin
          if(FloatvMultConst_13__ap_done) begin
            FloatvMultConst_13__state <= 2'b10;
          end else begin
            FloatvMultConst_13__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_13__state == 2'b11) begin
        if(FloatvMultConst_13__ap_done) begin
          FloatvMultConst_13__state <= 2'b10;
        end
      end
      if(FloatvMultConst_13__state == 2'b10) begin
        if(FloatvMultConst_13__ap_done_global__q0) begin
          FloatvMultConst_13__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_13__ap_start = (FloatvMultConst_13__state == 2'b01);
  assign FloatvMultConst_14__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_14__is_done__q0 = (FloatvMultConst_14__state == 2'b10);
  assign FloatvMultConst_14__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_14__state <= 2'b00;
    end else begin
      if(FloatvMultConst_14__state == 2'b00) begin
        if(FloatvMultConst_14__ap_start_global__q0) begin
          FloatvMultConst_14__state <= 2'b01;
        end
      end
      if(FloatvMultConst_14__state == 2'b01) begin
        if(FloatvMultConst_14__ap_ready) begin
          if(FloatvMultConst_14__ap_done) begin
            FloatvMultConst_14__state <= 2'b10;
          end else begin
            FloatvMultConst_14__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_14__state == 2'b11) begin
        if(FloatvMultConst_14__ap_done) begin
          FloatvMultConst_14__state <= 2'b10;
        end
      end
      if(FloatvMultConst_14__state == 2'b10) begin
        if(FloatvMultConst_14__ap_done_global__q0) begin
          FloatvMultConst_14__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_14__ap_start = (FloatvMultConst_14__state == 2'b01);
  assign FloatvMultConst_15__ap_start_global__q0 = ap_start__q0;
  assign FloatvMultConst_15__is_done__q0 = (FloatvMultConst_15__state == 2'b10);
  assign FloatvMultConst_15__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      FloatvMultConst_15__state <= 2'b00;
    end else begin
      if(FloatvMultConst_15__state == 2'b00) begin
        if(FloatvMultConst_15__ap_start_global__q0) begin
          FloatvMultConst_15__state <= 2'b01;
        end
      end
      if(FloatvMultConst_15__state == 2'b01) begin
        if(FloatvMultConst_15__ap_ready) begin
          if(FloatvMultConst_15__ap_done) begin
            FloatvMultConst_15__state <= 2'b10;
          end else begin
            FloatvMultConst_15__state <= 2'b11;
          end
        end
      end
      if(FloatvMultConst_15__state == 2'b11) begin
        if(FloatvMultConst_15__ap_done) begin
          FloatvMultConst_15__state <= 2'b10;
        end
      end
      if(FloatvMultConst_15__state == 2'b10) begin
        if(FloatvMultConst_15__ap_done_global__q0) begin
          FloatvMultConst_15__state <= 2'b00;
        end
      end
    end
  end

  assign FloatvMultConst_15__ap_start = (FloatvMultConst_15__state == 2'b01);
  assign Merger_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Merger_0__ap_start <= 1'b0;
    end else if(Merger_0__ap_start_global__q0) begin
      Merger_0__ap_start <= 1'b1;
    end
  end

  assign Merger_1__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Merger_1__ap_start <= 1'b0;
    end else if(Merger_1__ap_start_global__q0) begin
      Merger_1__ap_start <= 1'b1;
    end
  end

  assign Merger_2__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Merger_2__ap_start <= 1'b0;
    end else if(Merger_2__ap_start_global__q0) begin
      Merger_2__ap_start <= 1'b1;
    end
  end

  assign Merger_3__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Merger_3__ap_start <= 1'b0;
    end else if(Merger_3__ap_start_global__q0) begin
      Merger_3__ap_start <= 1'b1;
    end
  end

  assign Merger_4__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Merger_4__ap_start <= 1'b0;
    end else if(Merger_4__ap_start_global__q0) begin
      Merger_4__ap_start <= 1'b1;
    end
  end

  assign Merger_5__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Merger_5__ap_start <= 1'b0;
    end else if(Merger_5__ap_start_global__q0) begin
      Merger_5__ap_start <= 1'b1;
    end
  end

  assign Merger_6__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Merger_6__ap_start <= 1'b0;
    end else if(Merger_6__ap_start_global__q0) begin
      Merger_6__ap_start <= 1'b1;
    end
  end

  assign Merger_7__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Merger_7__ap_start <= 1'b0;
    end else if(Merger_7__ap_start_global__q0) begin
      Merger_7__ap_start <= 1'b1;
    end
  end

  assign PEG_Bmtx_0__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_0__is_done__q0 = (PEG_Bmtx_0__state == 2'b10);
  assign PEG_Bmtx_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_0__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_0__state == 2'b00) begin
        if(PEG_Bmtx_0__ap_start_global__q0) begin
          PEG_Bmtx_0__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_0__state == 2'b01) begin
        if(PEG_Bmtx_0__ap_ready) begin
          if(PEG_Bmtx_0__ap_done) begin
            PEG_Bmtx_0__state <= 2'b10;
          end else begin
            PEG_Bmtx_0__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_0__state == 2'b11) begin
        if(PEG_Bmtx_0__ap_done) begin
          PEG_Bmtx_0__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_0__state == 2'b10) begin
        if(PEG_Bmtx_0__ap_done_global__q0) begin
          PEG_Bmtx_0__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_0__ap_start = (PEG_Bmtx_0__state == 2'b01);
  assign PEG_Bmtx_1__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_1__is_done__q0 = (PEG_Bmtx_1__state == 2'b10);
  assign PEG_Bmtx_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_1__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_1__state == 2'b00) begin
        if(PEG_Bmtx_1__ap_start_global__q0) begin
          PEG_Bmtx_1__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_1__state == 2'b01) begin
        if(PEG_Bmtx_1__ap_ready) begin
          if(PEG_Bmtx_1__ap_done) begin
            PEG_Bmtx_1__state <= 2'b10;
          end else begin
            PEG_Bmtx_1__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_1__state == 2'b11) begin
        if(PEG_Bmtx_1__ap_done) begin
          PEG_Bmtx_1__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_1__state == 2'b10) begin
        if(PEG_Bmtx_1__ap_done_global__q0) begin
          PEG_Bmtx_1__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_1__ap_start = (PEG_Bmtx_1__state == 2'b01);
  assign PEG_Bmtx_2__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_2__is_done__q0 = (PEG_Bmtx_2__state == 2'b10);
  assign PEG_Bmtx_2__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_2__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_2__state == 2'b00) begin
        if(PEG_Bmtx_2__ap_start_global__q0) begin
          PEG_Bmtx_2__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_2__state == 2'b01) begin
        if(PEG_Bmtx_2__ap_ready) begin
          if(PEG_Bmtx_2__ap_done) begin
            PEG_Bmtx_2__state <= 2'b10;
          end else begin
            PEG_Bmtx_2__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_2__state == 2'b11) begin
        if(PEG_Bmtx_2__ap_done) begin
          PEG_Bmtx_2__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_2__state == 2'b10) begin
        if(PEG_Bmtx_2__ap_done_global__q0) begin
          PEG_Bmtx_2__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_2__ap_start = (PEG_Bmtx_2__state == 2'b01);
  assign PEG_Bmtx_3__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_3__is_done__q0 = (PEG_Bmtx_3__state == 2'b10);
  assign PEG_Bmtx_3__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_3__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_3__state == 2'b00) begin
        if(PEG_Bmtx_3__ap_start_global__q0) begin
          PEG_Bmtx_3__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_3__state == 2'b01) begin
        if(PEG_Bmtx_3__ap_ready) begin
          if(PEG_Bmtx_3__ap_done) begin
            PEG_Bmtx_3__state <= 2'b10;
          end else begin
            PEG_Bmtx_3__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_3__state == 2'b11) begin
        if(PEG_Bmtx_3__ap_done) begin
          PEG_Bmtx_3__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_3__state == 2'b10) begin
        if(PEG_Bmtx_3__ap_done_global__q0) begin
          PEG_Bmtx_3__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_3__ap_start = (PEG_Bmtx_3__state == 2'b01);
  assign PEG_Bmtx_4__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_4__is_done__q0 = (PEG_Bmtx_4__state == 2'b10);
  assign PEG_Bmtx_4__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_4__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_4__state == 2'b00) begin
        if(PEG_Bmtx_4__ap_start_global__q0) begin
          PEG_Bmtx_4__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_4__state == 2'b01) begin
        if(PEG_Bmtx_4__ap_ready) begin
          if(PEG_Bmtx_4__ap_done) begin
            PEG_Bmtx_4__state <= 2'b10;
          end else begin
            PEG_Bmtx_4__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_4__state == 2'b11) begin
        if(PEG_Bmtx_4__ap_done) begin
          PEG_Bmtx_4__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_4__state == 2'b10) begin
        if(PEG_Bmtx_4__ap_done_global__q0) begin
          PEG_Bmtx_4__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_4__ap_start = (PEG_Bmtx_4__state == 2'b01);
  assign PEG_Bmtx_5__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_5__is_done__q0 = (PEG_Bmtx_5__state == 2'b10);
  assign PEG_Bmtx_5__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_5__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_5__state == 2'b00) begin
        if(PEG_Bmtx_5__ap_start_global__q0) begin
          PEG_Bmtx_5__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_5__state == 2'b01) begin
        if(PEG_Bmtx_5__ap_ready) begin
          if(PEG_Bmtx_5__ap_done) begin
            PEG_Bmtx_5__state <= 2'b10;
          end else begin
            PEG_Bmtx_5__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_5__state == 2'b11) begin
        if(PEG_Bmtx_5__ap_done) begin
          PEG_Bmtx_5__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_5__state == 2'b10) begin
        if(PEG_Bmtx_5__ap_done_global__q0) begin
          PEG_Bmtx_5__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_5__ap_start = (PEG_Bmtx_5__state == 2'b01);
  assign PEG_Bmtx_6__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_6__is_done__q0 = (PEG_Bmtx_6__state == 2'b10);
  assign PEG_Bmtx_6__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_6__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_6__state == 2'b00) begin
        if(PEG_Bmtx_6__ap_start_global__q0) begin
          PEG_Bmtx_6__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_6__state == 2'b01) begin
        if(PEG_Bmtx_6__ap_ready) begin
          if(PEG_Bmtx_6__ap_done) begin
            PEG_Bmtx_6__state <= 2'b10;
          end else begin
            PEG_Bmtx_6__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_6__state == 2'b11) begin
        if(PEG_Bmtx_6__ap_done) begin
          PEG_Bmtx_6__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_6__state == 2'b10) begin
        if(PEG_Bmtx_6__ap_done_global__q0) begin
          PEG_Bmtx_6__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_6__ap_start = (PEG_Bmtx_6__state == 2'b01);
  assign PEG_Bmtx_7__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_7__is_done__q0 = (PEG_Bmtx_7__state == 2'b10);
  assign PEG_Bmtx_7__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_7__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_7__state == 2'b00) begin
        if(PEG_Bmtx_7__ap_start_global__q0) begin
          PEG_Bmtx_7__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_7__state == 2'b01) begin
        if(PEG_Bmtx_7__ap_ready) begin
          if(PEG_Bmtx_7__ap_done) begin
            PEG_Bmtx_7__state <= 2'b10;
          end else begin
            PEG_Bmtx_7__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_7__state == 2'b11) begin
        if(PEG_Bmtx_7__ap_done) begin
          PEG_Bmtx_7__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_7__state == 2'b10) begin
        if(PEG_Bmtx_7__ap_done_global__q0) begin
          PEG_Bmtx_7__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_7__ap_start = (PEG_Bmtx_7__state == 2'b01);
  assign PEG_Bmtx_8__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_8__is_done__q0 = (PEG_Bmtx_8__state == 2'b10);
  assign PEG_Bmtx_8__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_8__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_8__state == 2'b00) begin
        if(PEG_Bmtx_8__ap_start_global__q0) begin
          PEG_Bmtx_8__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_8__state == 2'b01) begin
        if(PEG_Bmtx_8__ap_ready) begin
          if(PEG_Bmtx_8__ap_done) begin
            PEG_Bmtx_8__state <= 2'b10;
          end else begin
            PEG_Bmtx_8__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_8__state == 2'b11) begin
        if(PEG_Bmtx_8__ap_done) begin
          PEG_Bmtx_8__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_8__state == 2'b10) begin
        if(PEG_Bmtx_8__ap_done_global__q0) begin
          PEG_Bmtx_8__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_8__ap_start = (PEG_Bmtx_8__state == 2'b01);
  assign PEG_Bmtx_9__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_9__is_done__q0 = (PEG_Bmtx_9__state == 2'b10);
  assign PEG_Bmtx_9__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_9__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_9__state == 2'b00) begin
        if(PEG_Bmtx_9__ap_start_global__q0) begin
          PEG_Bmtx_9__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_9__state == 2'b01) begin
        if(PEG_Bmtx_9__ap_ready) begin
          if(PEG_Bmtx_9__ap_done) begin
            PEG_Bmtx_9__state <= 2'b10;
          end else begin
            PEG_Bmtx_9__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_9__state == 2'b11) begin
        if(PEG_Bmtx_9__ap_done) begin
          PEG_Bmtx_9__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_9__state == 2'b10) begin
        if(PEG_Bmtx_9__ap_done_global__q0) begin
          PEG_Bmtx_9__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_9__ap_start = (PEG_Bmtx_9__state == 2'b01);
  assign PEG_Bmtx_10__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_10__is_done__q0 = (PEG_Bmtx_10__state == 2'b10);
  assign PEG_Bmtx_10__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_10__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_10__state == 2'b00) begin
        if(PEG_Bmtx_10__ap_start_global__q0) begin
          PEG_Bmtx_10__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_10__state == 2'b01) begin
        if(PEG_Bmtx_10__ap_ready) begin
          if(PEG_Bmtx_10__ap_done) begin
            PEG_Bmtx_10__state <= 2'b10;
          end else begin
            PEG_Bmtx_10__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_10__state == 2'b11) begin
        if(PEG_Bmtx_10__ap_done) begin
          PEG_Bmtx_10__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_10__state == 2'b10) begin
        if(PEG_Bmtx_10__ap_done_global__q0) begin
          PEG_Bmtx_10__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_10__ap_start = (PEG_Bmtx_10__state == 2'b01);
  assign PEG_Bmtx_11__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_11__is_done__q0 = (PEG_Bmtx_11__state == 2'b10);
  assign PEG_Bmtx_11__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_11__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_11__state == 2'b00) begin
        if(PEG_Bmtx_11__ap_start_global__q0) begin
          PEG_Bmtx_11__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_11__state == 2'b01) begin
        if(PEG_Bmtx_11__ap_ready) begin
          if(PEG_Bmtx_11__ap_done) begin
            PEG_Bmtx_11__state <= 2'b10;
          end else begin
            PEG_Bmtx_11__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_11__state == 2'b11) begin
        if(PEG_Bmtx_11__ap_done) begin
          PEG_Bmtx_11__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_11__state == 2'b10) begin
        if(PEG_Bmtx_11__ap_done_global__q0) begin
          PEG_Bmtx_11__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_11__ap_start = (PEG_Bmtx_11__state == 2'b01);
  assign PEG_Bmtx_12__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_12__is_done__q0 = (PEG_Bmtx_12__state == 2'b10);
  assign PEG_Bmtx_12__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_12__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_12__state == 2'b00) begin
        if(PEG_Bmtx_12__ap_start_global__q0) begin
          PEG_Bmtx_12__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_12__state == 2'b01) begin
        if(PEG_Bmtx_12__ap_ready) begin
          if(PEG_Bmtx_12__ap_done) begin
            PEG_Bmtx_12__state <= 2'b10;
          end else begin
            PEG_Bmtx_12__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_12__state == 2'b11) begin
        if(PEG_Bmtx_12__ap_done) begin
          PEG_Bmtx_12__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_12__state == 2'b10) begin
        if(PEG_Bmtx_12__ap_done_global__q0) begin
          PEG_Bmtx_12__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_12__ap_start = (PEG_Bmtx_12__state == 2'b01);
  assign PEG_Bmtx_13__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_13__is_done__q0 = (PEG_Bmtx_13__state == 2'b10);
  assign PEG_Bmtx_13__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_13__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_13__state == 2'b00) begin
        if(PEG_Bmtx_13__ap_start_global__q0) begin
          PEG_Bmtx_13__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_13__state == 2'b01) begin
        if(PEG_Bmtx_13__ap_ready) begin
          if(PEG_Bmtx_13__ap_done) begin
            PEG_Bmtx_13__state <= 2'b10;
          end else begin
            PEG_Bmtx_13__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_13__state == 2'b11) begin
        if(PEG_Bmtx_13__ap_done) begin
          PEG_Bmtx_13__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_13__state == 2'b10) begin
        if(PEG_Bmtx_13__ap_done_global__q0) begin
          PEG_Bmtx_13__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_13__ap_start = (PEG_Bmtx_13__state == 2'b01);
  assign PEG_Bmtx_14__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_14__is_done__q0 = (PEG_Bmtx_14__state == 2'b10);
  assign PEG_Bmtx_14__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_14__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_14__state == 2'b00) begin
        if(PEG_Bmtx_14__ap_start_global__q0) begin
          PEG_Bmtx_14__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_14__state == 2'b01) begin
        if(PEG_Bmtx_14__ap_ready) begin
          if(PEG_Bmtx_14__ap_done) begin
            PEG_Bmtx_14__state <= 2'b10;
          end else begin
            PEG_Bmtx_14__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_14__state == 2'b11) begin
        if(PEG_Bmtx_14__ap_done) begin
          PEG_Bmtx_14__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_14__state == 2'b10) begin
        if(PEG_Bmtx_14__ap_done_global__q0) begin
          PEG_Bmtx_14__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_14__ap_start = (PEG_Bmtx_14__state == 2'b01);
  assign PEG_Bmtx_15__ap_start_global__q0 = ap_start__q0;
  assign PEG_Bmtx_15__is_done__q0 = (PEG_Bmtx_15__state == 2'b10);
  assign PEG_Bmtx_15__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Bmtx_15__state <= 2'b00;
    end else begin
      if(PEG_Bmtx_15__state == 2'b00) begin
        if(PEG_Bmtx_15__ap_start_global__q0) begin
          PEG_Bmtx_15__state <= 2'b01;
        end
      end
      if(PEG_Bmtx_15__state == 2'b01) begin
        if(PEG_Bmtx_15__ap_ready) begin
          if(PEG_Bmtx_15__ap_done) begin
            PEG_Bmtx_15__state <= 2'b10;
          end else begin
            PEG_Bmtx_15__state <= 2'b11;
          end
        end
      end
      if(PEG_Bmtx_15__state == 2'b11) begin
        if(PEG_Bmtx_15__ap_done) begin
          PEG_Bmtx_15__state <= 2'b10;
        end
      end
      if(PEG_Bmtx_15__state == 2'b10) begin
        if(PEG_Bmtx_15__ap_done_global__q0) begin
          PEG_Bmtx_15__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Bmtx_15__ap_start = (PEG_Bmtx_15__state == 2'b01);
  assign PEG_Cmtx_0__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_0__is_done__q0 = (PEG_Cmtx_0__state == 2'b10);
  assign PEG_Cmtx_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_0__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_0__state == 2'b00) begin
        if(PEG_Cmtx_0__ap_start_global__q0) begin
          PEG_Cmtx_0__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_0__state == 2'b01) begin
        if(PEG_Cmtx_0__ap_ready) begin
          if(PEG_Cmtx_0__ap_done) begin
            PEG_Cmtx_0__state <= 2'b10;
          end else begin
            PEG_Cmtx_0__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_0__state == 2'b11) begin
        if(PEG_Cmtx_0__ap_done) begin
          PEG_Cmtx_0__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_0__state == 2'b10) begin
        if(PEG_Cmtx_0__ap_done_global__q0) begin
          PEG_Cmtx_0__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_0__ap_start = (PEG_Cmtx_0__state == 2'b01);
  assign PEG_Cmtx_1__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_1__is_done__q0 = (PEG_Cmtx_1__state == 2'b10);
  assign PEG_Cmtx_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_1__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_1__state == 2'b00) begin
        if(PEG_Cmtx_1__ap_start_global__q0) begin
          PEG_Cmtx_1__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_1__state == 2'b01) begin
        if(PEG_Cmtx_1__ap_ready) begin
          if(PEG_Cmtx_1__ap_done) begin
            PEG_Cmtx_1__state <= 2'b10;
          end else begin
            PEG_Cmtx_1__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_1__state == 2'b11) begin
        if(PEG_Cmtx_1__ap_done) begin
          PEG_Cmtx_1__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_1__state == 2'b10) begin
        if(PEG_Cmtx_1__ap_done_global__q0) begin
          PEG_Cmtx_1__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_1__ap_start = (PEG_Cmtx_1__state == 2'b01);
  assign PEG_Cmtx_2__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_2__is_done__q0 = (PEG_Cmtx_2__state == 2'b10);
  assign PEG_Cmtx_2__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_2__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_2__state == 2'b00) begin
        if(PEG_Cmtx_2__ap_start_global__q0) begin
          PEG_Cmtx_2__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_2__state == 2'b01) begin
        if(PEG_Cmtx_2__ap_ready) begin
          if(PEG_Cmtx_2__ap_done) begin
            PEG_Cmtx_2__state <= 2'b10;
          end else begin
            PEG_Cmtx_2__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_2__state == 2'b11) begin
        if(PEG_Cmtx_2__ap_done) begin
          PEG_Cmtx_2__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_2__state == 2'b10) begin
        if(PEG_Cmtx_2__ap_done_global__q0) begin
          PEG_Cmtx_2__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_2__ap_start = (PEG_Cmtx_2__state == 2'b01);
  assign PEG_Cmtx_3__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_3__is_done__q0 = (PEG_Cmtx_3__state == 2'b10);
  assign PEG_Cmtx_3__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_3__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_3__state == 2'b00) begin
        if(PEG_Cmtx_3__ap_start_global__q0) begin
          PEG_Cmtx_3__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_3__state == 2'b01) begin
        if(PEG_Cmtx_3__ap_ready) begin
          if(PEG_Cmtx_3__ap_done) begin
            PEG_Cmtx_3__state <= 2'b10;
          end else begin
            PEG_Cmtx_3__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_3__state == 2'b11) begin
        if(PEG_Cmtx_3__ap_done) begin
          PEG_Cmtx_3__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_3__state == 2'b10) begin
        if(PEG_Cmtx_3__ap_done_global__q0) begin
          PEG_Cmtx_3__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_3__ap_start = (PEG_Cmtx_3__state == 2'b01);
  assign PEG_Cmtx_4__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_4__is_done__q0 = (PEG_Cmtx_4__state == 2'b10);
  assign PEG_Cmtx_4__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_4__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_4__state == 2'b00) begin
        if(PEG_Cmtx_4__ap_start_global__q0) begin
          PEG_Cmtx_4__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_4__state == 2'b01) begin
        if(PEG_Cmtx_4__ap_ready) begin
          if(PEG_Cmtx_4__ap_done) begin
            PEG_Cmtx_4__state <= 2'b10;
          end else begin
            PEG_Cmtx_4__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_4__state == 2'b11) begin
        if(PEG_Cmtx_4__ap_done) begin
          PEG_Cmtx_4__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_4__state == 2'b10) begin
        if(PEG_Cmtx_4__ap_done_global__q0) begin
          PEG_Cmtx_4__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_4__ap_start = (PEG_Cmtx_4__state == 2'b01);
  assign PEG_Cmtx_5__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_5__is_done__q0 = (PEG_Cmtx_5__state == 2'b10);
  assign PEG_Cmtx_5__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_5__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_5__state == 2'b00) begin
        if(PEG_Cmtx_5__ap_start_global__q0) begin
          PEG_Cmtx_5__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_5__state == 2'b01) begin
        if(PEG_Cmtx_5__ap_ready) begin
          if(PEG_Cmtx_5__ap_done) begin
            PEG_Cmtx_5__state <= 2'b10;
          end else begin
            PEG_Cmtx_5__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_5__state == 2'b11) begin
        if(PEG_Cmtx_5__ap_done) begin
          PEG_Cmtx_5__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_5__state == 2'b10) begin
        if(PEG_Cmtx_5__ap_done_global__q0) begin
          PEG_Cmtx_5__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_5__ap_start = (PEG_Cmtx_5__state == 2'b01);
  assign PEG_Cmtx_6__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_6__is_done__q0 = (PEG_Cmtx_6__state == 2'b10);
  assign PEG_Cmtx_6__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_6__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_6__state == 2'b00) begin
        if(PEG_Cmtx_6__ap_start_global__q0) begin
          PEG_Cmtx_6__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_6__state == 2'b01) begin
        if(PEG_Cmtx_6__ap_ready) begin
          if(PEG_Cmtx_6__ap_done) begin
            PEG_Cmtx_6__state <= 2'b10;
          end else begin
            PEG_Cmtx_6__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_6__state == 2'b11) begin
        if(PEG_Cmtx_6__ap_done) begin
          PEG_Cmtx_6__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_6__state == 2'b10) begin
        if(PEG_Cmtx_6__ap_done_global__q0) begin
          PEG_Cmtx_6__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_6__ap_start = (PEG_Cmtx_6__state == 2'b01);
  assign PEG_Cmtx_7__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_7__is_done__q0 = (PEG_Cmtx_7__state == 2'b10);
  assign PEG_Cmtx_7__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_7__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_7__state == 2'b00) begin
        if(PEG_Cmtx_7__ap_start_global__q0) begin
          PEG_Cmtx_7__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_7__state == 2'b01) begin
        if(PEG_Cmtx_7__ap_ready) begin
          if(PEG_Cmtx_7__ap_done) begin
            PEG_Cmtx_7__state <= 2'b10;
          end else begin
            PEG_Cmtx_7__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_7__state == 2'b11) begin
        if(PEG_Cmtx_7__ap_done) begin
          PEG_Cmtx_7__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_7__state == 2'b10) begin
        if(PEG_Cmtx_7__ap_done_global__q0) begin
          PEG_Cmtx_7__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_7__ap_start = (PEG_Cmtx_7__state == 2'b01);
  assign PEG_Cmtx_8__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_8__is_done__q0 = (PEG_Cmtx_8__state == 2'b10);
  assign PEG_Cmtx_8__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_8__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_8__state == 2'b00) begin
        if(PEG_Cmtx_8__ap_start_global__q0) begin
          PEG_Cmtx_8__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_8__state == 2'b01) begin
        if(PEG_Cmtx_8__ap_ready) begin
          if(PEG_Cmtx_8__ap_done) begin
            PEG_Cmtx_8__state <= 2'b10;
          end else begin
            PEG_Cmtx_8__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_8__state == 2'b11) begin
        if(PEG_Cmtx_8__ap_done) begin
          PEG_Cmtx_8__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_8__state == 2'b10) begin
        if(PEG_Cmtx_8__ap_done_global__q0) begin
          PEG_Cmtx_8__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_8__ap_start = (PEG_Cmtx_8__state == 2'b01);
  assign PEG_Cmtx_9__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_9__is_done__q0 = (PEG_Cmtx_9__state == 2'b10);
  assign PEG_Cmtx_9__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_9__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_9__state == 2'b00) begin
        if(PEG_Cmtx_9__ap_start_global__q0) begin
          PEG_Cmtx_9__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_9__state == 2'b01) begin
        if(PEG_Cmtx_9__ap_ready) begin
          if(PEG_Cmtx_9__ap_done) begin
            PEG_Cmtx_9__state <= 2'b10;
          end else begin
            PEG_Cmtx_9__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_9__state == 2'b11) begin
        if(PEG_Cmtx_9__ap_done) begin
          PEG_Cmtx_9__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_9__state == 2'b10) begin
        if(PEG_Cmtx_9__ap_done_global__q0) begin
          PEG_Cmtx_9__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_9__ap_start = (PEG_Cmtx_9__state == 2'b01);
  assign PEG_Cmtx_10__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_10__is_done__q0 = (PEG_Cmtx_10__state == 2'b10);
  assign PEG_Cmtx_10__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_10__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_10__state == 2'b00) begin
        if(PEG_Cmtx_10__ap_start_global__q0) begin
          PEG_Cmtx_10__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_10__state == 2'b01) begin
        if(PEG_Cmtx_10__ap_ready) begin
          if(PEG_Cmtx_10__ap_done) begin
            PEG_Cmtx_10__state <= 2'b10;
          end else begin
            PEG_Cmtx_10__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_10__state == 2'b11) begin
        if(PEG_Cmtx_10__ap_done) begin
          PEG_Cmtx_10__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_10__state == 2'b10) begin
        if(PEG_Cmtx_10__ap_done_global__q0) begin
          PEG_Cmtx_10__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_10__ap_start = (PEG_Cmtx_10__state == 2'b01);
  assign PEG_Cmtx_11__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_11__is_done__q0 = (PEG_Cmtx_11__state == 2'b10);
  assign PEG_Cmtx_11__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_11__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_11__state == 2'b00) begin
        if(PEG_Cmtx_11__ap_start_global__q0) begin
          PEG_Cmtx_11__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_11__state == 2'b01) begin
        if(PEG_Cmtx_11__ap_ready) begin
          if(PEG_Cmtx_11__ap_done) begin
            PEG_Cmtx_11__state <= 2'b10;
          end else begin
            PEG_Cmtx_11__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_11__state == 2'b11) begin
        if(PEG_Cmtx_11__ap_done) begin
          PEG_Cmtx_11__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_11__state == 2'b10) begin
        if(PEG_Cmtx_11__ap_done_global__q0) begin
          PEG_Cmtx_11__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_11__ap_start = (PEG_Cmtx_11__state == 2'b01);
  assign PEG_Cmtx_12__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_12__is_done__q0 = (PEG_Cmtx_12__state == 2'b10);
  assign PEG_Cmtx_12__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_12__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_12__state == 2'b00) begin
        if(PEG_Cmtx_12__ap_start_global__q0) begin
          PEG_Cmtx_12__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_12__state == 2'b01) begin
        if(PEG_Cmtx_12__ap_ready) begin
          if(PEG_Cmtx_12__ap_done) begin
            PEG_Cmtx_12__state <= 2'b10;
          end else begin
            PEG_Cmtx_12__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_12__state == 2'b11) begin
        if(PEG_Cmtx_12__ap_done) begin
          PEG_Cmtx_12__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_12__state == 2'b10) begin
        if(PEG_Cmtx_12__ap_done_global__q0) begin
          PEG_Cmtx_12__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_12__ap_start = (PEG_Cmtx_12__state == 2'b01);
  assign PEG_Cmtx_13__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_13__is_done__q0 = (PEG_Cmtx_13__state == 2'b10);
  assign PEG_Cmtx_13__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_13__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_13__state == 2'b00) begin
        if(PEG_Cmtx_13__ap_start_global__q0) begin
          PEG_Cmtx_13__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_13__state == 2'b01) begin
        if(PEG_Cmtx_13__ap_ready) begin
          if(PEG_Cmtx_13__ap_done) begin
            PEG_Cmtx_13__state <= 2'b10;
          end else begin
            PEG_Cmtx_13__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_13__state == 2'b11) begin
        if(PEG_Cmtx_13__ap_done) begin
          PEG_Cmtx_13__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_13__state == 2'b10) begin
        if(PEG_Cmtx_13__ap_done_global__q0) begin
          PEG_Cmtx_13__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_13__ap_start = (PEG_Cmtx_13__state == 2'b01);
  assign PEG_Cmtx_14__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_14__is_done__q0 = (PEG_Cmtx_14__state == 2'b10);
  assign PEG_Cmtx_14__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_14__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_14__state == 2'b00) begin
        if(PEG_Cmtx_14__ap_start_global__q0) begin
          PEG_Cmtx_14__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_14__state == 2'b01) begin
        if(PEG_Cmtx_14__ap_ready) begin
          if(PEG_Cmtx_14__ap_done) begin
            PEG_Cmtx_14__state <= 2'b10;
          end else begin
            PEG_Cmtx_14__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_14__state == 2'b11) begin
        if(PEG_Cmtx_14__ap_done) begin
          PEG_Cmtx_14__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_14__state == 2'b10) begin
        if(PEG_Cmtx_14__ap_done_global__q0) begin
          PEG_Cmtx_14__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_14__ap_start = (PEG_Cmtx_14__state == 2'b01);
  assign PEG_Cmtx_15__ap_start_global__q0 = ap_start__q0;
  assign PEG_Cmtx_15__is_done__q0 = (PEG_Cmtx_15__state == 2'b10);
  assign PEG_Cmtx_15__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Cmtx_15__state <= 2'b00;
    end else begin
      if(PEG_Cmtx_15__state == 2'b00) begin
        if(PEG_Cmtx_15__ap_start_global__q0) begin
          PEG_Cmtx_15__state <= 2'b01;
        end
      end
      if(PEG_Cmtx_15__state == 2'b01) begin
        if(PEG_Cmtx_15__ap_ready) begin
          if(PEG_Cmtx_15__ap_done) begin
            PEG_Cmtx_15__state <= 2'b10;
          end else begin
            PEG_Cmtx_15__state <= 2'b11;
          end
        end
      end
      if(PEG_Cmtx_15__state == 2'b11) begin
        if(PEG_Cmtx_15__ap_done) begin
          PEG_Cmtx_15__state <= 2'b10;
        end
      end
      if(PEG_Cmtx_15__state == 2'b10) begin
        if(PEG_Cmtx_15__ap_done_global__q0) begin
          PEG_Cmtx_15__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Cmtx_15__ap_start = (PEG_Cmtx_15__state == 2'b01);
  assign Scatter_1_2_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Scatter_1_2_0__ap_start <= 1'b0;
    end else if(Scatter_1_2_0__ap_start_global__q0) begin
      Scatter_1_2_0__ap_start <= 1'b1;
    end
  end

  assign Scatter_1_2_1__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Scatter_1_2_1__ap_start <= 1'b0;
    end else if(Scatter_1_2_1__ap_start_global__q0) begin
      Scatter_1_2_1__ap_start <= 1'b1;
    end
  end

  assign Scatter_1_2_2__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Scatter_1_2_2__ap_start <= 1'b0;
    end else if(Scatter_1_2_2__ap_start_global__q0) begin
      Scatter_1_2_2__ap_start <= 1'b1;
    end
  end

  assign Scatter_1_2_3__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Scatter_1_2_3__ap_start <= 1'b0;
    end else if(Scatter_1_2_3__ap_start_global__q0) begin
      Scatter_1_2_3__ap_start <= 1'b1;
    end
  end

  assign Scatter_1_2_4__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Scatter_1_2_4__ap_start <= 1'b0;
    end else if(Scatter_1_2_4__ap_start_global__q0) begin
      Scatter_1_2_4__ap_start <= 1'b1;
    end
  end

  assign Scatter_1_2_5__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Scatter_1_2_5__ap_start <= 1'b0;
    end else if(Scatter_1_2_5__ap_start_global__q0) begin
      Scatter_1_2_5__ap_start <= 1'b1;
    end
  end

  assign Scatter_1_2_6__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Scatter_1_2_6__ap_start <= 1'b0;
    end else if(Scatter_1_2_6__ap_start_global__q0) begin
      Scatter_1_2_6__ap_start <= 1'b1;
    end
  end

  assign Scatter_1_2_7__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Scatter_1_2_7__ap_start <= 1'b0;
    end else if(Scatter_1_2_7__ap_start_global__q0) begin
      Scatter_1_2_7__ap_start <= 1'b1;
    end
  end

  assign black_hole_float_v16_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      black_hole_float_v16_0__ap_start <= 1'b0;
    end else if(black_hole_float_v16_0__ap_start_global__q0) begin
      black_hole_float_v16_0__ap_start <= 1'b1;
    end
  end

  assign black_hole_float_v16_1__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      black_hole_float_v16_1__ap_start <= 1'b0;
    end else if(black_hole_float_v16_1__ap_start_global__q0) begin
      black_hole_float_v16_1__ap_start <= 1'b1;
    end
  end

  assign black_hole_float_v16_2__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      black_hole_float_v16_2__ap_start <= 1'b0;
    end else if(black_hole_float_v16_2__ap_start_global__q0) begin
      black_hole_float_v16_2__ap_start <= 1'b1;
    end
  end

  assign black_hole_float_v16_3__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      black_hole_float_v16_3__ap_start <= 1'b0;
    end else if(black_hole_float_v16_3__ap_start_global__q0) begin
      black_hole_float_v16_3__ap_start <= 1'b1;
    end
  end

  assign black_hole_int_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      black_hole_int_0__ap_start <= 1'b0;
    end else if(black_hole_int_0__ap_start_global__q0) begin
      black_hole_int_0__ap_start <= 1'b1;
    end
  end

  assign black_hole_int_1__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      black_hole_int_1__ap_start <= 1'b0;
    end else if(black_hole_int_1__ap_start_global__q0) begin
      black_hole_int_1__ap_start <= 1'b1;
    end
  end

  assign read_A_0__ap_start_global__q0 = ap_start__q0;
  assign read_A_0__is_done__q0 = (read_A_0__state == 2'b10);
  assign read_A_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_0__state <= 2'b00;
    end else begin
      if(read_A_0__state == 2'b00) begin
        if(read_A_0__ap_start_global__q0) begin
          read_A_0__state <= 2'b01;
        end
      end
      if(read_A_0__state == 2'b01) begin
        if(read_A_0__ap_ready) begin
          if(read_A_0__ap_done) begin
            read_A_0__state <= 2'b10;
          end else begin
            read_A_0__state <= 2'b11;
          end
        end
      end
      if(read_A_0__state == 2'b11) begin
        if(read_A_0__ap_done) begin
          read_A_0__state <= 2'b10;
        end
      end
      if(read_A_0__state == 2'b10) begin
        if(read_A_0__ap_done_global__q0) begin
          read_A_0__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_0__ap_start = (read_A_0__state == 2'b01);
  assign read_A_1__ap_start_global__q0 = ap_start__q0;
  assign read_A_1__is_done__q0 = (read_A_1__state == 2'b10);
  assign read_A_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_1__state <= 2'b00;
    end else begin
      if(read_A_1__state == 2'b00) begin
        if(read_A_1__ap_start_global__q0) begin
          read_A_1__state <= 2'b01;
        end
      end
      if(read_A_1__state == 2'b01) begin
        if(read_A_1__ap_ready) begin
          if(read_A_1__ap_done) begin
            read_A_1__state <= 2'b10;
          end else begin
            read_A_1__state <= 2'b11;
          end
        end
      end
      if(read_A_1__state == 2'b11) begin
        if(read_A_1__ap_done) begin
          read_A_1__state <= 2'b10;
        end
      end
      if(read_A_1__state == 2'b10) begin
        if(read_A_1__ap_done_global__q0) begin
          read_A_1__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_1__ap_start = (read_A_1__state == 2'b01);
  assign read_A_2__ap_start_global__q0 = ap_start__q0;
  assign read_A_2__is_done__q0 = (read_A_2__state == 2'b10);
  assign read_A_2__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_2__state <= 2'b00;
    end else begin
      if(read_A_2__state == 2'b00) begin
        if(read_A_2__ap_start_global__q0) begin
          read_A_2__state <= 2'b01;
        end
      end
      if(read_A_2__state == 2'b01) begin
        if(read_A_2__ap_ready) begin
          if(read_A_2__ap_done) begin
            read_A_2__state <= 2'b10;
          end else begin
            read_A_2__state <= 2'b11;
          end
        end
      end
      if(read_A_2__state == 2'b11) begin
        if(read_A_2__ap_done) begin
          read_A_2__state <= 2'b10;
        end
      end
      if(read_A_2__state == 2'b10) begin
        if(read_A_2__ap_done_global__q0) begin
          read_A_2__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_2__ap_start = (read_A_2__state == 2'b01);
  assign read_A_3__ap_start_global__q0 = ap_start__q0;
  assign read_A_3__is_done__q0 = (read_A_3__state == 2'b10);
  assign read_A_3__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_3__state <= 2'b00;
    end else begin
      if(read_A_3__state == 2'b00) begin
        if(read_A_3__ap_start_global__q0) begin
          read_A_3__state <= 2'b01;
        end
      end
      if(read_A_3__state == 2'b01) begin
        if(read_A_3__ap_ready) begin
          if(read_A_3__ap_done) begin
            read_A_3__state <= 2'b10;
          end else begin
            read_A_3__state <= 2'b11;
          end
        end
      end
      if(read_A_3__state == 2'b11) begin
        if(read_A_3__ap_done) begin
          read_A_3__state <= 2'b10;
        end
      end
      if(read_A_3__state == 2'b10) begin
        if(read_A_3__ap_done_global__q0) begin
          read_A_3__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_3__ap_start = (read_A_3__state == 2'b01);
  assign read_A_4__ap_start_global__q0 = ap_start__q0;
  assign read_A_4__is_done__q0 = (read_A_4__state == 2'b10);
  assign read_A_4__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_4__state <= 2'b00;
    end else begin
      if(read_A_4__state == 2'b00) begin
        if(read_A_4__ap_start_global__q0) begin
          read_A_4__state <= 2'b01;
        end
      end
      if(read_A_4__state == 2'b01) begin
        if(read_A_4__ap_ready) begin
          if(read_A_4__ap_done) begin
            read_A_4__state <= 2'b10;
          end else begin
            read_A_4__state <= 2'b11;
          end
        end
      end
      if(read_A_4__state == 2'b11) begin
        if(read_A_4__ap_done) begin
          read_A_4__state <= 2'b10;
        end
      end
      if(read_A_4__state == 2'b10) begin
        if(read_A_4__ap_done_global__q0) begin
          read_A_4__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_4__ap_start = (read_A_4__state == 2'b01);
  assign read_A_5__ap_start_global__q0 = ap_start__q0;
  assign read_A_5__is_done__q0 = (read_A_5__state == 2'b10);
  assign read_A_5__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_5__state <= 2'b00;
    end else begin
      if(read_A_5__state == 2'b00) begin
        if(read_A_5__ap_start_global__q0) begin
          read_A_5__state <= 2'b01;
        end
      end
      if(read_A_5__state == 2'b01) begin
        if(read_A_5__ap_ready) begin
          if(read_A_5__ap_done) begin
            read_A_5__state <= 2'b10;
          end else begin
            read_A_5__state <= 2'b11;
          end
        end
      end
      if(read_A_5__state == 2'b11) begin
        if(read_A_5__ap_done) begin
          read_A_5__state <= 2'b10;
        end
      end
      if(read_A_5__state == 2'b10) begin
        if(read_A_5__ap_done_global__q0) begin
          read_A_5__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_5__ap_start = (read_A_5__state == 2'b01);
  assign read_A_6__ap_start_global__q0 = ap_start__q0;
  assign read_A_6__is_done__q0 = (read_A_6__state == 2'b10);
  assign read_A_6__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_6__state <= 2'b00;
    end else begin
      if(read_A_6__state == 2'b00) begin
        if(read_A_6__ap_start_global__q0) begin
          read_A_6__state <= 2'b01;
        end
      end
      if(read_A_6__state == 2'b01) begin
        if(read_A_6__ap_ready) begin
          if(read_A_6__ap_done) begin
            read_A_6__state <= 2'b10;
          end else begin
            read_A_6__state <= 2'b11;
          end
        end
      end
      if(read_A_6__state == 2'b11) begin
        if(read_A_6__ap_done) begin
          read_A_6__state <= 2'b10;
        end
      end
      if(read_A_6__state == 2'b10) begin
        if(read_A_6__ap_done_global__q0) begin
          read_A_6__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_6__ap_start = (read_A_6__state == 2'b01);
  assign read_A_7__ap_start_global__q0 = ap_start__q0;
  assign read_A_7__is_done__q0 = (read_A_7__state == 2'b10);
  assign read_A_7__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_7__state <= 2'b00;
    end else begin
      if(read_A_7__state == 2'b00) begin
        if(read_A_7__ap_start_global__q0) begin
          read_A_7__state <= 2'b01;
        end
      end
      if(read_A_7__state == 2'b01) begin
        if(read_A_7__ap_ready) begin
          if(read_A_7__ap_done) begin
            read_A_7__state <= 2'b10;
          end else begin
            read_A_7__state <= 2'b11;
          end
        end
      end
      if(read_A_7__state == 2'b11) begin
        if(read_A_7__ap_done) begin
          read_A_7__state <= 2'b10;
        end
      end
      if(read_A_7__state == 2'b10) begin
        if(read_A_7__ap_done_global__q0) begin
          read_A_7__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_7__ap_start = (read_A_7__state == 2'b01);
  assign read_B_0__ap_start_global__q0 = ap_start__q0;
  assign read_B_0__is_done__q0 = (read_B_0__state == 2'b10);
  assign read_B_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_B_0__state <= 2'b00;
    end else begin
      if(read_B_0__state == 2'b00) begin
        if(read_B_0__ap_start_global__q0) begin
          read_B_0__state <= 2'b01;
        end
      end
      if(read_B_0__state == 2'b01) begin
        if(read_B_0__ap_ready) begin
          if(read_B_0__ap_done) begin
            read_B_0__state <= 2'b10;
          end else begin
            read_B_0__state <= 2'b11;
          end
        end
      end
      if(read_B_0__state == 2'b11) begin
        if(read_B_0__ap_done) begin
          read_B_0__state <= 2'b10;
        end
      end
      if(read_B_0__state == 2'b10) begin
        if(read_B_0__ap_done_global__q0) begin
          read_B_0__state <= 2'b00;
        end
      end
    end
  end

  assign read_B_0__ap_start = (read_B_0__state == 2'b01);
  assign read_B_1__ap_start_global__q0 = ap_start__q0;
  assign read_B_1__is_done__q0 = (read_B_1__state == 2'b10);
  assign read_B_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_B_1__state <= 2'b00;
    end else begin
      if(read_B_1__state == 2'b00) begin
        if(read_B_1__ap_start_global__q0) begin
          read_B_1__state <= 2'b01;
        end
      end
      if(read_B_1__state == 2'b01) begin
        if(read_B_1__ap_ready) begin
          if(read_B_1__ap_done) begin
            read_B_1__state <= 2'b10;
          end else begin
            read_B_1__state <= 2'b11;
          end
        end
      end
      if(read_B_1__state == 2'b11) begin
        if(read_B_1__ap_done) begin
          read_B_1__state <= 2'b10;
        end
      end
      if(read_B_1__state == 2'b10) begin
        if(read_B_1__ap_done_global__q0) begin
          read_B_1__state <= 2'b00;
        end
      end
    end
  end

  assign read_B_1__ap_start = (read_B_1__state == 2'b01);
  assign read_B_2__ap_start_global__q0 = ap_start__q0;
  assign read_B_2__is_done__q0 = (read_B_2__state == 2'b10);
  assign read_B_2__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_B_2__state <= 2'b00;
    end else begin
      if(read_B_2__state == 2'b00) begin
        if(read_B_2__ap_start_global__q0) begin
          read_B_2__state <= 2'b01;
        end
      end
      if(read_B_2__state == 2'b01) begin
        if(read_B_2__ap_ready) begin
          if(read_B_2__ap_done) begin
            read_B_2__state <= 2'b10;
          end else begin
            read_B_2__state <= 2'b11;
          end
        end
      end
      if(read_B_2__state == 2'b11) begin
        if(read_B_2__ap_done) begin
          read_B_2__state <= 2'b10;
        end
      end
      if(read_B_2__state == 2'b10) begin
        if(read_B_2__ap_done_global__q0) begin
          read_B_2__state <= 2'b00;
        end
      end
    end
  end

  assign read_B_2__ap_start = (read_B_2__state == 2'b01);
  assign read_B_3__ap_start_global__q0 = ap_start__q0;
  assign read_B_3__is_done__q0 = (read_B_3__state == 2'b10);
  assign read_B_3__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_B_3__state <= 2'b00;
    end else begin
      if(read_B_3__state == 2'b00) begin
        if(read_B_3__ap_start_global__q0) begin
          read_B_3__state <= 2'b01;
        end
      end
      if(read_B_3__state == 2'b01) begin
        if(read_B_3__ap_ready) begin
          if(read_B_3__ap_done) begin
            read_B_3__state <= 2'b10;
          end else begin
            read_B_3__state <= 2'b11;
          end
        end
      end
      if(read_B_3__state == 2'b11) begin
        if(read_B_3__ap_done) begin
          read_B_3__state <= 2'b10;
        end
      end
      if(read_B_3__state == 2'b10) begin
        if(read_B_3__ap_done_global__q0) begin
          read_B_3__state <= 2'b00;
        end
      end
    end
  end

  assign read_B_3__ap_start = (read_B_3__state == 2'b01);
  assign read_C_0__ap_start_global__q0 = ap_start__q0;
  assign read_C_0__is_done__q0 = (read_C_0__state == 2'b10);
  assign read_C_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_C_0__state <= 2'b00;
    end else begin
      if(read_C_0__state == 2'b00) begin
        if(read_C_0__ap_start_global__q0) begin
          read_C_0__state <= 2'b01;
        end
      end
      if(read_C_0__state == 2'b01) begin
        if(read_C_0__ap_ready) begin
          if(read_C_0__ap_done) begin
            read_C_0__state <= 2'b10;
          end else begin
            read_C_0__state <= 2'b11;
          end
        end
      end
      if(read_C_0__state == 2'b11) begin
        if(read_C_0__ap_done) begin
          read_C_0__state <= 2'b10;
        end
      end
      if(read_C_0__state == 2'b10) begin
        if(read_C_0__ap_done_global__q0) begin
          read_C_0__state <= 2'b00;
        end
      end
    end
  end

  assign read_C_0__ap_start = (read_C_0__state == 2'b01);
  assign read_C_1__ap_start_global__q0 = ap_start__q0;
  assign read_C_1__is_done__q0 = (read_C_1__state == 2'b10);
  assign read_C_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_C_1__state <= 2'b00;
    end else begin
      if(read_C_1__state == 2'b00) begin
        if(read_C_1__ap_start_global__q0) begin
          read_C_1__state <= 2'b01;
        end
      end
      if(read_C_1__state == 2'b01) begin
        if(read_C_1__ap_ready) begin
          if(read_C_1__ap_done) begin
            read_C_1__state <= 2'b10;
          end else begin
            read_C_1__state <= 2'b11;
          end
        end
      end
      if(read_C_1__state == 2'b11) begin
        if(read_C_1__ap_done) begin
          read_C_1__state <= 2'b10;
        end
      end
      if(read_C_1__state == 2'b10) begin
        if(read_C_1__ap_done_global__q0) begin
          read_C_1__state <= 2'b00;
        end
      end
    end
  end

  assign read_C_1__ap_start = (read_C_1__state == 2'b01);
  assign read_C_2__ap_start_global__q0 = ap_start__q0;
  assign read_C_2__is_done__q0 = (read_C_2__state == 2'b10);
  assign read_C_2__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_C_2__state <= 2'b00;
    end else begin
      if(read_C_2__state == 2'b00) begin
        if(read_C_2__ap_start_global__q0) begin
          read_C_2__state <= 2'b01;
        end
      end
      if(read_C_2__state == 2'b01) begin
        if(read_C_2__ap_ready) begin
          if(read_C_2__ap_done) begin
            read_C_2__state <= 2'b10;
          end else begin
            read_C_2__state <= 2'b11;
          end
        end
      end
      if(read_C_2__state == 2'b11) begin
        if(read_C_2__ap_done) begin
          read_C_2__state <= 2'b10;
        end
      end
      if(read_C_2__state == 2'b10) begin
        if(read_C_2__ap_done_global__q0) begin
          read_C_2__state <= 2'b00;
        end
      end
    end
  end

  assign read_C_2__ap_start = (read_C_2__state == 2'b01);
  assign read_C_3__ap_start_global__q0 = ap_start__q0;
  assign read_C_3__is_done__q0 = (read_C_3__state == 2'b10);
  assign read_C_3__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_C_3__state <= 2'b00;
    end else begin
      if(read_C_3__state == 2'b00) begin
        if(read_C_3__ap_start_global__q0) begin
          read_C_3__state <= 2'b01;
        end
      end
      if(read_C_3__state == 2'b01) begin
        if(read_C_3__ap_ready) begin
          if(read_C_3__ap_done) begin
            read_C_3__state <= 2'b10;
          end else begin
            read_C_3__state <= 2'b11;
          end
        end
      end
      if(read_C_3__state == 2'b11) begin
        if(read_C_3__ap_done) begin
          read_C_3__state <= 2'b10;
        end
      end
      if(read_C_3__state == 2'b10) begin
        if(read_C_3__ap_done_global__q0) begin
          read_C_3__state <= 2'b00;
        end
      end
    end
  end

  assign read_C_3__ap_start = (read_C_3__state == 2'b01);
  assign read_C_4__ap_start_global__q0 = ap_start__q0;
  assign read_C_4__is_done__q0 = (read_C_4__state == 2'b10);
  assign read_C_4__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_C_4__state <= 2'b00;
    end else begin
      if(read_C_4__state == 2'b00) begin
        if(read_C_4__ap_start_global__q0) begin
          read_C_4__state <= 2'b01;
        end
      end
      if(read_C_4__state == 2'b01) begin
        if(read_C_4__ap_ready) begin
          if(read_C_4__ap_done) begin
            read_C_4__state <= 2'b10;
          end else begin
            read_C_4__state <= 2'b11;
          end
        end
      end
      if(read_C_4__state == 2'b11) begin
        if(read_C_4__ap_done) begin
          read_C_4__state <= 2'b10;
        end
      end
      if(read_C_4__state == 2'b10) begin
        if(read_C_4__ap_done_global__q0) begin
          read_C_4__state <= 2'b00;
        end
      end
    end
  end

  assign read_C_4__ap_start = (read_C_4__state == 2'b01);
  assign read_C_5__ap_start_global__q0 = ap_start__q0;
  assign read_C_5__is_done__q0 = (read_C_5__state == 2'b10);
  assign read_C_5__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_C_5__state <= 2'b00;
    end else begin
      if(read_C_5__state == 2'b00) begin
        if(read_C_5__ap_start_global__q0) begin
          read_C_5__state <= 2'b01;
        end
      end
      if(read_C_5__state == 2'b01) begin
        if(read_C_5__ap_ready) begin
          if(read_C_5__ap_done) begin
            read_C_5__state <= 2'b10;
          end else begin
            read_C_5__state <= 2'b11;
          end
        end
      end
      if(read_C_5__state == 2'b11) begin
        if(read_C_5__ap_done) begin
          read_C_5__state <= 2'b10;
        end
      end
      if(read_C_5__state == 2'b10) begin
        if(read_C_5__ap_done_global__q0) begin
          read_C_5__state <= 2'b00;
        end
      end
    end
  end

  assign read_C_5__ap_start = (read_C_5__state == 2'b01);
  assign read_C_6__ap_start_global__q0 = ap_start__q0;
  assign read_C_6__is_done__q0 = (read_C_6__state == 2'b10);
  assign read_C_6__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_C_6__state <= 2'b00;
    end else begin
      if(read_C_6__state == 2'b00) begin
        if(read_C_6__ap_start_global__q0) begin
          read_C_6__state <= 2'b01;
        end
      end
      if(read_C_6__state == 2'b01) begin
        if(read_C_6__ap_ready) begin
          if(read_C_6__ap_done) begin
            read_C_6__state <= 2'b10;
          end else begin
            read_C_6__state <= 2'b11;
          end
        end
      end
      if(read_C_6__state == 2'b11) begin
        if(read_C_6__ap_done) begin
          read_C_6__state <= 2'b10;
        end
      end
      if(read_C_6__state == 2'b10) begin
        if(read_C_6__ap_done_global__q0) begin
          read_C_6__state <= 2'b00;
        end
      end
    end
  end

  assign read_C_6__ap_start = (read_C_6__state == 2'b01);
  assign read_C_7__ap_start_global__q0 = ap_start__q0;
  assign read_C_7__is_done__q0 = (read_C_7__state == 2'b10);
  assign read_C_7__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_C_7__state <= 2'b00;
    end else begin
      if(read_C_7__state == 2'b00) begin
        if(read_C_7__ap_start_global__q0) begin
          read_C_7__state <= 2'b01;
        end
      end
      if(read_C_7__state == 2'b01) begin
        if(read_C_7__ap_ready) begin
          if(read_C_7__ap_done) begin
            read_C_7__state <= 2'b10;
          end else begin
            read_C_7__state <= 2'b11;
          end
        end
      end
      if(read_C_7__state == 2'b11) begin
        if(read_C_7__ap_done) begin
          read_C_7__state <= 2'b10;
        end
      end
      if(read_C_7__state == 2'b10) begin
        if(read_C_7__ap_done_global__q0) begin
          read_C_7__state <= 2'b00;
        end
      end
    end
  end

  assign read_C_7__ap_start = (read_C_7__state == 2'b01);
  assign read_edge_list_ptr_0__ap_start_global__q0 = ap_start__q0;
  assign read_edge_list_ptr_0__is_done__q0 = (read_edge_list_ptr_0__state == 2'b10);
  assign read_edge_list_ptr_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_edge_list_ptr_0__state <= 2'b00;
    end else begin
      if(read_edge_list_ptr_0__state == 2'b00) begin
        if(read_edge_list_ptr_0__ap_start_global__q0) begin
          read_edge_list_ptr_0__state <= 2'b01;
        end
      end
      if(read_edge_list_ptr_0__state == 2'b01) begin
        if(read_edge_list_ptr_0__ap_ready) begin
          if(read_edge_list_ptr_0__ap_done) begin
            read_edge_list_ptr_0__state <= 2'b10;
          end else begin
            read_edge_list_ptr_0__state <= 2'b11;
          end
        end
      end
      if(read_edge_list_ptr_0__state == 2'b11) begin
        if(read_edge_list_ptr_0__ap_done) begin
          read_edge_list_ptr_0__state <= 2'b10;
        end
      end
      if(read_edge_list_ptr_0__state == 2'b10) begin
        if(read_edge_list_ptr_0__ap_done_global__q0) begin
          read_edge_list_ptr_0__state <= 2'b00;
        end
      end
    end
  end

  assign read_edge_list_ptr_0__ap_start = (read_edge_list_ptr_0__state == 2'b01);
  assign write_C_0__ap_start_global__q0 = ap_start__q0;
  assign write_C_0__is_done__q0 = (write_C_0__state == 2'b10);
  assign write_C_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      write_C_0__state <= 2'b00;
    end else begin
      if(write_C_0__state == 2'b00) begin
        if(write_C_0__ap_start_global__q0) begin
          write_C_0__state <= 2'b01;
        end
      end
      if(write_C_0__state == 2'b01) begin
        if(write_C_0__ap_ready) begin
          if(write_C_0__ap_done) begin
            write_C_0__state <= 2'b10;
          end else begin
            write_C_0__state <= 2'b11;
          end
        end
      end
      if(write_C_0__state == 2'b11) begin
        if(write_C_0__ap_done) begin
          write_C_0__state <= 2'b10;
        end
      end
      if(write_C_0__state == 2'b10) begin
        if(write_C_0__ap_done_global__q0) begin
          write_C_0__state <= 2'b00;
        end
      end
    end
  end

  assign write_C_0__ap_start = (write_C_0__state == 2'b01);
  assign write_C_1__ap_start_global__q0 = ap_start__q0;
  assign write_C_1__is_done__q0 = (write_C_1__state == 2'b10);
  assign write_C_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      write_C_1__state <= 2'b00;
    end else begin
      if(write_C_1__state == 2'b00) begin
        if(write_C_1__ap_start_global__q0) begin
          write_C_1__state <= 2'b01;
        end
      end
      if(write_C_1__state == 2'b01) begin
        if(write_C_1__ap_ready) begin
          if(write_C_1__ap_done) begin
            write_C_1__state <= 2'b10;
          end else begin
            write_C_1__state <= 2'b11;
          end
        end
      end
      if(write_C_1__state == 2'b11) begin
        if(write_C_1__ap_done) begin
          write_C_1__state <= 2'b10;
        end
      end
      if(write_C_1__state == 2'b10) begin
        if(write_C_1__ap_done_global__q0) begin
          write_C_1__state <= 2'b00;
        end
      end
    end
  end

  assign write_C_1__ap_start = (write_C_1__state == 2'b01);
  assign write_C_2__ap_start_global__q0 = ap_start__q0;
  assign write_C_2__is_done__q0 = (write_C_2__state == 2'b10);
  assign write_C_2__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      write_C_2__state <= 2'b00;
    end else begin
      if(write_C_2__state == 2'b00) begin
        if(write_C_2__ap_start_global__q0) begin
          write_C_2__state <= 2'b01;
        end
      end
      if(write_C_2__state == 2'b01) begin
        if(write_C_2__ap_ready) begin
          if(write_C_2__ap_done) begin
            write_C_2__state <= 2'b10;
          end else begin
            write_C_2__state <= 2'b11;
          end
        end
      end
      if(write_C_2__state == 2'b11) begin
        if(write_C_2__ap_done) begin
          write_C_2__state <= 2'b10;
        end
      end
      if(write_C_2__state == 2'b10) begin
        if(write_C_2__ap_done_global__q0) begin
          write_C_2__state <= 2'b00;
        end
      end
    end
  end

  assign write_C_2__ap_start = (write_C_2__state == 2'b01);
  assign write_C_3__ap_start_global__q0 = ap_start__q0;
  assign write_C_3__is_done__q0 = (write_C_3__state == 2'b10);
  assign write_C_3__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      write_C_3__state <= 2'b00;
    end else begin
      if(write_C_3__state == 2'b00) begin
        if(write_C_3__ap_start_global__q0) begin
          write_C_3__state <= 2'b01;
        end
      end
      if(write_C_3__state == 2'b01) begin
        if(write_C_3__ap_ready) begin
          if(write_C_3__ap_done) begin
            write_C_3__state <= 2'b10;
          end else begin
            write_C_3__state <= 2'b11;
          end
        end
      end
      if(write_C_3__state == 2'b11) begin
        if(write_C_3__ap_done) begin
          write_C_3__state <= 2'b10;
        end
      end
      if(write_C_3__state == 2'b10) begin
        if(write_C_3__ap_done_global__q0) begin
          write_C_3__state <= 2'b00;
        end
      end
    end
  end

  assign write_C_3__ap_start = (write_C_3__state == 2'b01);
  assign write_C_4__ap_start_global__q0 = ap_start__q0;
  assign write_C_4__is_done__q0 = (write_C_4__state == 2'b10);
  assign write_C_4__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      write_C_4__state <= 2'b00;
    end else begin
      if(write_C_4__state == 2'b00) begin
        if(write_C_4__ap_start_global__q0) begin
          write_C_4__state <= 2'b01;
        end
      end
      if(write_C_4__state == 2'b01) begin
        if(write_C_4__ap_ready) begin
          if(write_C_4__ap_done) begin
            write_C_4__state <= 2'b10;
          end else begin
            write_C_4__state <= 2'b11;
          end
        end
      end
      if(write_C_4__state == 2'b11) begin
        if(write_C_4__ap_done) begin
          write_C_4__state <= 2'b10;
        end
      end
      if(write_C_4__state == 2'b10) begin
        if(write_C_4__ap_done_global__q0) begin
          write_C_4__state <= 2'b00;
        end
      end
    end
  end

  assign write_C_4__ap_start = (write_C_4__state == 2'b01);
  assign write_C_5__ap_start_global__q0 = ap_start__q0;
  assign write_C_5__is_done__q0 = (write_C_5__state == 2'b10);
  assign write_C_5__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      write_C_5__state <= 2'b00;
    end else begin
      if(write_C_5__state == 2'b00) begin
        if(write_C_5__ap_start_global__q0) begin
          write_C_5__state <= 2'b01;
        end
      end
      if(write_C_5__state == 2'b01) begin
        if(write_C_5__ap_ready) begin
          if(write_C_5__ap_done) begin
            write_C_5__state <= 2'b10;
          end else begin
            write_C_5__state <= 2'b11;
          end
        end
      end
      if(write_C_5__state == 2'b11) begin
        if(write_C_5__ap_done) begin
          write_C_5__state <= 2'b10;
        end
      end
      if(write_C_5__state == 2'b10) begin
        if(write_C_5__ap_done_global__q0) begin
          write_C_5__state <= 2'b00;
        end
      end
    end
  end

  assign write_C_5__ap_start = (write_C_5__state == 2'b01);
  assign write_C_6__ap_start_global__q0 = ap_start__q0;
  assign write_C_6__is_done__q0 = (write_C_6__state == 2'b10);
  assign write_C_6__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      write_C_6__state <= 2'b00;
    end else begin
      if(write_C_6__state == 2'b00) begin
        if(write_C_6__ap_start_global__q0) begin
          write_C_6__state <= 2'b01;
        end
      end
      if(write_C_6__state == 2'b01) begin
        if(write_C_6__ap_ready) begin
          if(write_C_6__ap_done) begin
            write_C_6__state <= 2'b10;
          end else begin
            write_C_6__state <= 2'b11;
          end
        end
      end
      if(write_C_6__state == 2'b11) begin
        if(write_C_6__ap_done) begin
          write_C_6__state <= 2'b10;
        end
      end
      if(write_C_6__state == 2'b10) begin
        if(write_C_6__ap_done_global__q0) begin
          write_C_6__state <= 2'b00;
        end
      end
    end
  end

  assign write_C_6__ap_start = (write_C_6__state == 2'b01);
  assign write_C_7__ap_start_global__q0 = ap_start__q0;
  assign write_C_7__is_done__q0 = (write_C_7__state == 2'b10);
  assign write_C_7__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      write_C_7__state <= 2'b00;
    end else begin
      if(write_C_7__state == 2'b00) begin
        if(write_C_7__ap_start_global__q0) begin
          write_C_7__state <= 2'b01;
        end
      end
      if(write_C_7__state == 2'b01) begin
        if(write_C_7__ap_ready) begin
          if(write_C_7__ap_done) begin
            write_C_7__state <= 2'b10;
          end else begin
            write_C_7__state <= 2'b11;
          end
        end
      end
      if(write_C_7__state == 2'b11) begin
        if(write_C_7__ap_done) begin
          write_C_7__state <= 2'b10;
        end
      end
      if(write_C_7__state == 2'b10) begin
        if(write_C_7__ap_done_global__q0) begin
          write_C_7__state <= 2'b00;
        end
      end
    end
  end

  assign write_C_7__ap_start = (write_C_7__state == 2'b01);

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      tapa_state <= 2'b00;
    end else begin
      case(tapa_state)
        2'b00: begin
          if(ap_start__q0) begin
            tapa_state <= 2'b01;
          end
        end
        2'b01: begin
          if(FloatvMultConst_0__is_done__q0 && FloatvMultConst_1__is_done__q0 && FloatvMultConst_2__is_done__q0 && FloatvMultConst_3__is_done__q0 && FloatvMultConst_4__is_done__q0 && FloatvMultConst_5__is_done__q0 && FloatvMultConst_6__is_done__q0 && FloatvMultConst_7__is_done__q0 && FloatvMultConst_8__is_done__q0 && FloatvMultConst_9__is_done__q0 && FloatvMultConst_10__is_done__q0 && FloatvMultConst_11__is_done__q0 && FloatvMultConst_12__is_done__q0 && FloatvMultConst_13__is_done__q0 && FloatvMultConst_14__is_done__q0 && FloatvMultConst_15__is_done__q0 && PEG_Bmtx_0__is_done__q0 && PEG_Bmtx_1__is_done__q0 && PEG_Bmtx_2__is_done__q0 && PEG_Bmtx_3__is_done__q0 && PEG_Bmtx_4__is_done__q0 && PEG_Bmtx_5__is_done__q0 && PEG_Bmtx_6__is_done__q0 && PEG_Bmtx_7__is_done__q0 && PEG_Bmtx_8__is_done__q0 && PEG_Bmtx_9__is_done__q0 && PEG_Bmtx_10__is_done__q0 && PEG_Bmtx_11__is_done__q0 && PEG_Bmtx_12__is_done__q0 && PEG_Bmtx_13__is_done__q0 && PEG_Bmtx_14__is_done__q0 && PEG_Bmtx_15__is_done__q0 && PEG_Cmtx_0__is_done__q0 && PEG_Cmtx_1__is_done__q0 && PEG_Cmtx_2__is_done__q0 && PEG_Cmtx_3__is_done__q0 && PEG_Cmtx_4__is_done__q0 && PEG_Cmtx_5__is_done__q0 && PEG_Cmtx_6__is_done__q0 && PEG_Cmtx_7__is_done__q0 && PEG_Cmtx_8__is_done__q0 && PEG_Cmtx_9__is_done__q0 && PEG_Cmtx_10__is_done__q0 && PEG_Cmtx_11__is_done__q0 && PEG_Cmtx_12__is_done__q0 && PEG_Cmtx_13__is_done__q0 && PEG_Cmtx_14__is_done__q0 && PEG_Cmtx_15__is_done__q0 && read_A_0__is_done__q0 && read_A_1__is_done__q0 && read_A_2__is_done__q0 && read_A_3__is_done__q0 && read_A_4__is_done__q0 && read_A_5__is_done__q0 && read_A_6__is_done__q0 && read_A_7__is_done__q0 && read_B_0__is_done__q0 && read_B_1__is_done__q0 && read_B_2__is_done__q0 && read_B_3__is_done__q0 && read_C_0__is_done__q0 && read_C_1__is_done__q0 && read_C_2__is_done__q0 && read_C_3__is_done__q0 && read_C_4__is_done__q0 && read_C_5__is_done__q0 && read_C_6__is_done__q0 && read_C_7__is_done__q0 && read_edge_list_ptr_0__is_done__q0 && write_C_0__is_done__q0 && write_C_1__is_done__q0 && write_C_2__is_done__q0 && write_C_3__is_done__q0 && write_C_4__is_done__q0 && write_C_5__is_done__q0 && write_C_6__is_done__q0 && write_C_7__is_done__q0) begin
            tapa_state <= 2'b10;
          end
        end
        2'b10: begin
          tapa_state <= 2'b00;
          countdown <= 1'd0;
        end
        2'b11: begin
          if(countdown == 1'd0) begin
            tapa_state <= 2'b00;
          end else begin
            countdown <= (countdown - 1'd1);
          end
        end
      endcase
    end
  end

  assign ap_idle = (tapa_state == 2'b00);
  assign ap_done = ap_done__q0;
  assign ap_ready = ap_done__q0;
  assign ap_start__q0 = ap_start;
  assign ap_done__q0 = (tapa_state == 2'b10);

endmodule
