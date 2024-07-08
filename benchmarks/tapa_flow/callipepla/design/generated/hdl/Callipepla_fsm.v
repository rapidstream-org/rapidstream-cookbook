

module Callipepla_fsm
(
  ap_clk,
  ap_rst_n,
  ap_start,
  ap_ready,
  ap_done,
  ap_idle,
  Arbiter_Y_0__ap_start,
  Arbiter_Y_0__ap_ready,
  Arbiter_Y_0__ap_done,
  Arbiter_Y_0__ap_idle,
  Arbiter_Y_1__ap_start,
  Arbiter_Y_1__ap_ready,
  Arbiter_Y_1__ap_done,
  Arbiter_Y_1__ap_idle,
  Arbiter_Y_2__ap_start,
  Arbiter_Y_2__ap_ready,
  Arbiter_Y_2__ap_done,
  Arbiter_Y_2__ap_idle,
  Arbiter_Y_3__ap_start,
  Arbiter_Y_3__ap_ready,
  Arbiter_Y_3__ap_done,
  Arbiter_Y_3__ap_idle,
  Arbiter_Y_4__ap_start,
  Arbiter_Y_4__ap_ready,
  Arbiter_Y_4__ap_done,
  Arbiter_Y_4__ap_idle,
  Arbiter_Y_5__ap_start,
  Arbiter_Y_5__ap_ready,
  Arbiter_Y_5__ap_done,
  Arbiter_Y_5__ap_idle,
  Arbiter_Y_6__ap_start,
  Arbiter_Y_6__ap_ready,
  Arbiter_Y_6__ap_done,
  Arbiter_Y_6__ap_idle,
  Arbiter_Y_7__ap_start,
  Arbiter_Y_7__ap_ready,
  Arbiter_Y_7__ap_done,
  Arbiter_Y_7__ap_idle,
  Merger_Y_0__ap_start,
  PEG_Xvec_0__ap_start,
  PEG_Xvec_0__ap_ready,
  PEG_Xvec_0__ap_done,
  PEG_Xvec_0__ap_idle,
  PEG_Xvec_1__ap_start,
  PEG_Xvec_1__ap_ready,
  PEG_Xvec_1__ap_done,
  PEG_Xvec_1__ap_idle,
  PEG_Xvec_2__ap_start,
  PEG_Xvec_2__ap_ready,
  PEG_Xvec_2__ap_done,
  PEG_Xvec_2__ap_idle,
  PEG_Xvec_3__ap_start,
  PEG_Xvec_3__ap_ready,
  PEG_Xvec_3__ap_done,
  PEG_Xvec_3__ap_idle,
  PEG_Xvec_4__ap_start,
  PEG_Xvec_4__ap_ready,
  PEG_Xvec_4__ap_done,
  PEG_Xvec_4__ap_idle,
  PEG_Xvec_5__ap_start,
  PEG_Xvec_5__ap_ready,
  PEG_Xvec_5__ap_done,
  PEG_Xvec_5__ap_idle,
  PEG_Xvec_6__ap_start,
  PEG_Xvec_6__ap_ready,
  PEG_Xvec_6__ap_done,
  PEG_Xvec_6__ap_idle,
  PEG_Xvec_7__ap_start,
  PEG_Xvec_7__ap_ready,
  PEG_Xvec_7__ap_done,
  PEG_Xvec_7__ap_idle,
  PEG_Xvec_8__ap_start,
  PEG_Xvec_8__ap_ready,
  PEG_Xvec_8__ap_done,
  PEG_Xvec_8__ap_idle,
  PEG_Xvec_9__ap_start,
  PEG_Xvec_9__ap_ready,
  PEG_Xvec_9__ap_done,
  PEG_Xvec_9__ap_idle,
  PEG_Xvec_10__ap_start,
  PEG_Xvec_10__ap_ready,
  PEG_Xvec_10__ap_done,
  PEG_Xvec_10__ap_idle,
  PEG_Xvec_11__ap_start,
  PEG_Xvec_11__ap_ready,
  PEG_Xvec_11__ap_done,
  PEG_Xvec_11__ap_idle,
  PEG_Xvec_12__ap_start,
  PEG_Xvec_12__ap_ready,
  PEG_Xvec_12__ap_done,
  PEG_Xvec_12__ap_idle,
  PEG_Xvec_13__ap_start,
  PEG_Xvec_13__ap_ready,
  PEG_Xvec_13__ap_done,
  PEG_Xvec_13__ap_idle,
  PEG_Xvec_14__ap_start,
  PEG_Xvec_14__ap_ready,
  PEG_Xvec_14__ap_done,
  PEG_Xvec_14__ap_idle,
  PEG_Xvec_15__ap_start,
  PEG_Xvec_15__ap_ready,
  PEG_Xvec_15__ap_done,
  PEG_Xvec_15__ap_idle,
  PEG_Yvec_0__ap_start,
  PEG_Yvec_0__ap_ready,
  PEG_Yvec_0__ap_done,
  PEG_Yvec_0__ap_idle,
  PEG_Yvec_1__ap_start,
  PEG_Yvec_1__ap_ready,
  PEG_Yvec_1__ap_done,
  PEG_Yvec_1__ap_idle,
  PEG_Yvec_2__ap_start,
  PEG_Yvec_2__ap_ready,
  PEG_Yvec_2__ap_done,
  PEG_Yvec_2__ap_idle,
  PEG_Yvec_3__ap_start,
  PEG_Yvec_3__ap_ready,
  PEG_Yvec_3__ap_done,
  PEG_Yvec_3__ap_idle,
  PEG_Yvec_4__ap_start,
  PEG_Yvec_4__ap_ready,
  PEG_Yvec_4__ap_done,
  PEG_Yvec_4__ap_idle,
  PEG_Yvec_5__ap_start,
  PEG_Yvec_5__ap_ready,
  PEG_Yvec_5__ap_done,
  PEG_Yvec_5__ap_idle,
  PEG_Yvec_6__ap_start,
  PEG_Yvec_6__ap_ready,
  PEG_Yvec_6__ap_done,
  PEG_Yvec_6__ap_idle,
  PEG_Yvec_7__ap_start,
  PEG_Yvec_7__ap_ready,
  PEG_Yvec_7__ap_done,
  PEG_Yvec_7__ap_idle,
  PEG_Yvec_8__ap_start,
  PEG_Yvec_8__ap_ready,
  PEG_Yvec_8__ap_done,
  PEG_Yvec_8__ap_idle,
  PEG_Yvec_9__ap_start,
  PEG_Yvec_9__ap_ready,
  PEG_Yvec_9__ap_done,
  PEG_Yvec_9__ap_idle,
  PEG_Yvec_10__ap_start,
  PEG_Yvec_10__ap_ready,
  PEG_Yvec_10__ap_done,
  PEG_Yvec_10__ap_idle,
  PEG_Yvec_11__ap_start,
  PEG_Yvec_11__ap_ready,
  PEG_Yvec_11__ap_done,
  PEG_Yvec_11__ap_idle,
  PEG_Yvec_12__ap_start,
  PEG_Yvec_12__ap_ready,
  PEG_Yvec_12__ap_done,
  PEG_Yvec_12__ap_idle,
  PEG_Yvec_13__ap_start,
  PEG_Yvec_13__ap_ready,
  PEG_Yvec_13__ap_done,
  PEG_Yvec_13__ap_idle,
  PEG_Yvec_14__ap_start,
  PEG_Yvec_14__ap_ready,
  PEG_Yvec_14__ap_done,
  PEG_Yvec_14__ap_idle,
  PEG_Yvec_15__ap_start,
  PEG_Yvec_15__ap_ready,
  PEG_Yvec_15__ap_done,
  PEG_Yvec_15__ap_idle,
  black_hole_bool_0__ap_start,
  black_hole_bool_1__ap_start,
  black_hole_double_v8_0__ap_start,
  black_hole_int_0__ap_start,
  ctrl_AP_0__ap_start,
  ctrl_AP_0__ap_ready,
  ctrl_AP_0__ap_done,
  ctrl_AP_0__ap_idle,
  ctrl_P_0__ap_start,
  ctrl_P_0__ap_ready,
  ctrl_P_0__ap_done,
  ctrl_P_0__ap_idle,
  ctrl_R_0__ap_start,
  ctrl_R_0__ap_ready,
  ctrl_R_0__ap_done,
  ctrl_R_0__ap_idle,
  ctrl_X_0__ap_start,
  ctrl_X_0__ap_ready,
  ctrl_X_0__ap_done,
  ctrl_X_0__ap_idle,
  dot_alpha_0__ap_start,
  dot_alpha_0__ap_ready,
  dot_alpha_0__ap_done,
  dot_alpha_0__ap_idle,
  dot_res_0__ap_start,
  dot_res_0__ap_ready,
  dot_res_0__ap_done,
  dot_res_0__ap_idle,
  dot_rznew_0__ap_start,
  dot_rznew_0__ap_ready,
  dot_rznew_0__ap_done,
  dot_rznew_0__ap_idle,
  duplicator_0__ap_start,
  left_div_0__ap_start,
  left_div_0__ap_ready,
  left_div_0__ap_done,
  left_div_0__ap_idle,
  rdwr_vec_0__ap_start,
  rdwr_vec_1__ap_start,
  rdwr_vec_2__ap_start,
  rdwr_vec_3__ap_start,
  rdwr_vec_4__ap_start,
  rdwr_vec_5__ap_start,
  rdwr_vec_6__ap_start,
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
  read_A_8__ap_start,
  read_A_8__ap_ready,
  read_A_8__ap_done,
  read_A_8__ap_idle,
  read_A_9__ap_start,
  read_A_9__ap_ready,
  read_A_9__ap_done,
  read_A_9__ap_idle,
  read_A_10__ap_start,
  read_A_10__ap_ready,
  read_A_10__ap_done,
  read_A_10__ap_idle,
  read_A_11__ap_start,
  read_A_11__ap_ready,
  read_A_11__ap_done,
  read_A_11__ap_idle,
  read_A_12__ap_start,
  read_A_12__ap_ready,
  read_A_12__ap_done,
  read_A_12__ap_idle,
  read_A_13__ap_start,
  read_A_13__ap_ready,
  read_A_13__ap_done,
  read_A_13__ap_idle,
  read_A_14__ap_start,
  read_A_14__ap_ready,
  read_A_14__ap_done,
  read_A_14__ap_idle,
  read_A_15__ap_start,
  read_A_15__ap_ready,
  read_A_15__ap_done,
  read_A_15__ap_idle,
  read_digA_0__ap_start,
  read_digA_0__ap_ready,
  read_digA_0__ap_done,
  read_digA_0__ap_idle,
  read_edge_list_ptr_0__ap_start,
  read_edge_list_ptr_0__ap_ready,
  read_edge_list_ptr_0__ap_done,
  read_edge_list_ptr_0__ap_idle,
  term_signal_router_0__ap_start,
  updt_p_0__ap_start,
  updt_p_0__ap_ready,
  updt_p_0__ap_done,
  updt_p_0__ap_idle,
  updt_r_0__ap_start,
  updt_r_0__ap_ready,
  updt_r_0__ap_done,
  updt_r_0__ap_idle,
  updt_x_0__ap_start,
  updt_x_0__ap_ready,
  updt_x_0__ap_done,
  updt_x_0__ap_idle,
  vecp_mux_0__ap_start,
  vecp_mux_0__ap_ready,
  vecp_mux_0__ap_done,
  vecp_mux_0__ap_idle,
  wr_r_0__ap_start,
  wr_r_0__ap_ready,
  wr_r_0__ap_done,
  wr_r_0__ap_idle
);

  (* RS_CLK *)input ap_clk;
  (* RS_RST = "ff" *)input ap_rst_n;
  (* RS_AP_CTRL = "Callipepla.ap_start" *)input ap_start;
  (* RS_AP_CTRL = "Callipepla.ap_ready" *)output ap_ready;
  (* RS_FF = "Callipepla__ap_done" *)output ap_done;
  (* RS_FF = "Callipepla__ap_idle" *)output ap_idle;
  (* RS_AP_CTRL = "Arbiter_Y_0.ap_start" *)output Arbiter_Y_0__ap_start;
  (* RS_AP_CTRL = "Arbiter_Y_0.ap_ready" *)input Arbiter_Y_0__ap_ready;
  (* RS_FF = "Arbiter_Y_0__ap_done" *)input Arbiter_Y_0__ap_done;
  (* RS_FF = "Arbiter_Y_0__ap_idle" *)input Arbiter_Y_0__ap_idle;
  (* RS_AP_CTRL = "Arbiter_Y_1.ap_start" *)output Arbiter_Y_1__ap_start;
  (* RS_AP_CTRL = "Arbiter_Y_1.ap_ready" *)input Arbiter_Y_1__ap_ready;
  (* RS_FF = "Arbiter_Y_1__ap_done" *)input Arbiter_Y_1__ap_done;
  (* RS_FF = "Arbiter_Y_1__ap_idle" *)input Arbiter_Y_1__ap_idle;
  (* RS_AP_CTRL = "Arbiter_Y_2.ap_start" *)output Arbiter_Y_2__ap_start;
  (* RS_AP_CTRL = "Arbiter_Y_2.ap_ready" *)input Arbiter_Y_2__ap_ready;
  (* RS_FF = "Arbiter_Y_2__ap_done" *)input Arbiter_Y_2__ap_done;
  (* RS_FF = "Arbiter_Y_2__ap_idle" *)input Arbiter_Y_2__ap_idle;
  (* RS_AP_CTRL = "Arbiter_Y_3.ap_start" *)output Arbiter_Y_3__ap_start;
  (* RS_AP_CTRL = "Arbiter_Y_3.ap_ready" *)input Arbiter_Y_3__ap_ready;
  (* RS_FF = "Arbiter_Y_3__ap_done" *)input Arbiter_Y_3__ap_done;
  (* RS_FF = "Arbiter_Y_3__ap_idle" *)input Arbiter_Y_3__ap_idle;
  (* RS_AP_CTRL = "Arbiter_Y_4.ap_start" *)output Arbiter_Y_4__ap_start;
  (* RS_AP_CTRL = "Arbiter_Y_4.ap_ready" *)input Arbiter_Y_4__ap_ready;
  (* RS_FF = "Arbiter_Y_4__ap_done" *)input Arbiter_Y_4__ap_done;
  (* RS_FF = "Arbiter_Y_4__ap_idle" *)input Arbiter_Y_4__ap_idle;
  (* RS_AP_CTRL = "Arbiter_Y_5.ap_start" *)output Arbiter_Y_5__ap_start;
  (* RS_AP_CTRL = "Arbiter_Y_5.ap_ready" *)input Arbiter_Y_5__ap_ready;
  (* RS_FF = "Arbiter_Y_5__ap_done" *)input Arbiter_Y_5__ap_done;
  (* RS_FF = "Arbiter_Y_5__ap_idle" *)input Arbiter_Y_5__ap_idle;
  (* RS_AP_CTRL = "Arbiter_Y_6.ap_start" *)output Arbiter_Y_6__ap_start;
  (* RS_AP_CTRL = "Arbiter_Y_6.ap_ready" *)input Arbiter_Y_6__ap_ready;
  (* RS_FF = "Arbiter_Y_6__ap_done" *)input Arbiter_Y_6__ap_done;
  (* RS_FF = "Arbiter_Y_6__ap_idle" *)input Arbiter_Y_6__ap_idle;
  (* RS_AP_CTRL = "Arbiter_Y_7.ap_start" *)output Arbiter_Y_7__ap_start;
  (* RS_AP_CTRL = "Arbiter_Y_7.ap_ready" *)input Arbiter_Y_7__ap_ready;
  (* RS_FF = "Arbiter_Y_7__ap_done" *)input Arbiter_Y_7__ap_done;
  (* RS_FF = "Arbiter_Y_7__ap_idle" *)input Arbiter_Y_7__ap_idle;
  (* RS_FF = "Merger_Y_0__ap_start" *)output Merger_Y_0__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_0.ap_start" *)output PEG_Xvec_0__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_0.ap_ready" *)input PEG_Xvec_0__ap_ready;
  (* RS_FF = "PEG_Xvec_0__ap_done" *)input PEG_Xvec_0__ap_done;
  (* RS_FF = "PEG_Xvec_0__ap_idle" *)input PEG_Xvec_0__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_1.ap_start" *)output PEG_Xvec_1__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_1.ap_ready" *)input PEG_Xvec_1__ap_ready;
  (* RS_FF = "PEG_Xvec_1__ap_done" *)input PEG_Xvec_1__ap_done;
  (* RS_FF = "PEG_Xvec_1__ap_idle" *)input PEG_Xvec_1__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_2.ap_start" *)output PEG_Xvec_2__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_2.ap_ready" *)input PEG_Xvec_2__ap_ready;
  (* RS_FF = "PEG_Xvec_2__ap_done" *)input PEG_Xvec_2__ap_done;
  (* RS_FF = "PEG_Xvec_2__ap_idle" *)input PEG_Xvec_2__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_3.ap_start" *)output PEG_Xvec_3__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_3.ap_ready" *)input PEG_Xvec_3__ap_ready;
  (* RS_FF = "PEG_Xvec_3__ap_done" *)input PEG_Xvec_3__ap_done;
  (* RS_FF = "PEG_Xvec_3__ap_idle" *)input PEG_Xvec_3__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_4.ap_start" *)output PEG_Xvec_4__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_4.ap_ready" *)input PEG_Xvec_4__ap_ready;
  (* RS_FF = "PEG_Xvec_4__ap_done" *)input PEG_Xvec_4__ap_done;
  (* RS_FF = "PEG_Xvec_4__ap_idle" *)input PEG_Xvec_4__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_5.ap_start" *)output PEG_Xvec_5__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_5.ap_ready" *)input PEG_Xvec_5__ap_ready;
  (* RS_FF = "PEG_Xvec_5__ap_done" *)input PEG_Xvec_5__ap_done;
  (* RS_FF = "PEG_Xvec_5__ap_idle" *)input PEG_Xvec_5__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_6.ap_start" *)output PEG_Xvec_6__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_6.ap_ready" *)input PEG_Xvec_6__ap_ready;
  (* RS_FF = "PEG_Xvec_6__ap_done" *)input PEG_Xvec_6__ap_done;
  (* RS_FF = "PEG_Xvec_6__ap_idle" *)input PEG_Xvec_6__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_7.ap_start" *)output PEG_Xvec_7__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_7.ap_ready" *)input PEG_Xvec_7__ap_ready;
  (* RS_FF = "PEG_Xvec_7__ap_done" *)input PEG_Xvec_7__ap_done;
  (* RS_FF = "PEG_Xvec_7__ap_idle" *)input PEG_Xvec_7__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_8.ap_start" *)output PEG_Xvec_8__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_8.ap_ready" *)input PEG_Xvec_8__ap_ready;
  (* RS_FF = "PEG_Xvec_8__ap_done" *)input PEG_Xvec_8__ap_done;
  (* RS_FF = "PEG_Xvec_8__ap_idle" *)input PEG_Xvec_8__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_9.ap_start" *)output PEG_Xvec_9__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_9.ap_ready" *)input PEG_Xvec_9__ap_ready;
  (* RS_FF = "PEG_Xvec_9__ap_done" *)input PEG_Xvec_9__ap_done;
  (* RS_FF = "PEG_Xvec_9__ap_idle" *)input PEG_Xvec_9__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_10.ap_start" *)output PEG_Xvec_10__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_10.ap_ready" *)input PEG_Xvec_10__ap_ready;
  (* RS_FF = "PEG_Xvec_10__ap_done" *)input PEG_Xvec_10__ap_done;
  (* RS_FF = "PEG_Xvec_10__ap_idle" *)input PEG_Xvec_10__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_11.ap_start" *)output PEG_Xvec_11__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_11.ap_ready" *)input PEG_Xvec_11__ap_ready;
  (* RS_FF = "PEG_Xvec_11__ap_done" *)input PEG_Xvec_11__ap_done;
  (* RS_FF = "PEG_Xvec_11__ap_idle" *)input PEG_Xvec_11__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_12.ap_start" *)output PEG_Xvec_12__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_12.ap_ready" *)input PEG_Xvec_12__ap_ready;
  (* RS_FF = "PEG_Xvec_12__ap_done" *)input PEG_Xvec_12__ap_done;
  (* RS_FF = "PEG_Xvec_12__ap_idle" *)input PEG_Xvec_12__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_13.ap_start" *)output PEG_Xvec_13__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_13.ap_ready" *)input PEG_Xvec_13__ap_ready;
  (* RS_FF = "PEG_Xvec_13__ap_done" *)input PEG_Xvec_13__ap_done;
  (* RS_FF = "PEG_Xvec_13__ap_idle" *)input PEG_Xvec_13__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_14.ap_start" *)output PEG_Xvec_14__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_14.ap_ready" *)input PEG_Xvec_14__ap_ready;
  (* RS_FF = "PEG_Xvec_14__ap_done" *)input PEG_Xvec_14__ap_done;
  (* RS_FF = "PEG_Xvec_14__ap_idle" *)input PEG_Xvec_14__ap_idle;
  (* RS_AP_CTRL = "PEG_Xvec_15.ap_start" *)output PEG_Xvec_15__ap_start;
  (* RS_AP_CTRL = "PEG_Xvec_15.ap_ready" *)input PEG_Xvec_15__ap_ready;
  (* RS_FF = "PEG_Xvec_15__ap_done" *)input PEG_Xvec_15__ap_done;
  (* RS_FF = "PEG_Xvec_15__ap_idle" *)input PEG_Xvec_15__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_0.ap_start" *)output PEG_Yvec_0__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_0.ap_ready" *)input PEG_Yvec_0__ap_ready;
  (* RS_FF = "PEG_Yvec_0__ap_done" *)input PEG_Yvec_0__ap_done;
  (* RS_FF = "PEG_Yvec_0__ap_idle" *)input PEG_Yvec_0__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_1.ap_start" *)output PEG_Yvec_1__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_1.ap_ready" *)input PEG_Yvec_1__ap_ready;
  (* RS_FF = "PEG_Yvec_1__ap_done" *)input PEG_Yvec_1__ap_done;
  (* RS_FF = "PEG_Yvec_1__ap_idle" *)input PEG_Yvec_1__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_2.ap_start" *)output PEG_Yvec_2__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_2.ap_ready" *)input PEG_Yvec_2__ap_ready;
  (* RS_FF = "PEG_Yvec_2__ap_done" *)input PEG_Yvec_2__ap_done;
  (* RS_FF = "PEG_Yvec_2__ap_idle" *)input PEG_Yvec_2__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_3.ap_start" *)output PEG_Yvec_3__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_3.ap_ready" *)input PEG_Yvec_3__ap_ready;
  (* RS_FF = "PEG_Yvec_3__ap_done" *)input PEG_Yvec_3__ap_done;
  (* RS_FF = "PEG_Yvec_3__ap_idle" *)input PEG_Yvec_3__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_4.ap_start" *)output PEG_Yvec_4__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_4.ap_ready" *)input PEG_Yvec_4__ap_ready;
  (* RS_FF = "PEG_Yvec_4__ap_done" *)input PEG_Yvec_4__ap_done;
  (* RS_FF = "PEG_Yvec_4__ap_idle" *)input PEG_Yvec_4__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_5.ap_start" *)output PEG_Yvec_5__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_5.ap_ready" *)input PEG_Yvec_5__ap_ready;
  (* RS_FF = "PEG_Yvec_5__ap_done" *)input PEG_Yvec_5__ap_done;
  (* RS_FF = "PEG_Yvec_5__ap_idle" *)input PEG_Yvec_5__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_6.ap_start" *)output PEG_Yvec_6__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_6.ap_ready" *)input PEG_Yvec_6__ap_ready;
  (* RS_FF = "PEG_Yvec_6__ap_done" *)input PEG_Yvec_6__ap_done;
  (* RS_FF = "PEG_Yvec_6__ap_idle" *)input PEG_Yvec_6__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_7.ap_start" *)output PEG_Yvec_7__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_7.ap_ready" *)input PEG_Yvec_7__ap_ready;
  (* RS_FF = "PEG_Yvec_7__ap_done" *)input PEG_Yvec_7__ap_done;
  (* RS_FF = "PEG_Yvec_7__ap_idle" *)input PEG_Yvec_7__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_8.ap_start" *)output PEG_Yvec_8__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_8.ap_ready" *)input PEG_Yvec_8__ap_ready;
  (* RS_FF = "PEG_Yvec_8__ap_done" *)input PEG_Yvec_8__ap_done;
  (* RS_FF = "PEG_Yvec_8__ap_idle" *)input PEG_Yvec_8__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_9.ap_start" *)output PEG_Yvec_9__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_9.ap_ready" *)input PEG_Yvec_9__ap_ready;
  (* RS_FF = "PEG_Yvec_9__ap_done" *)input PEG_Yvec_9__ap_done;
  (* RS_FF = "PEG_Yvec_9__ap_idle" *)input PEG_Yvec_9__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_10.ap_start" *)output PEG_Yvec_10__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_10.ap_ready" *)input PEG_Yvec_10__ap_ready;
  (* RS_FF = "PEG_Yvec_10__ap_done" *)input PEG_Yvec_10__ap_done;
  (* RS_FF = "PEG_Yvec_10__ap_idle" *)input PEG_Yvec_10__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_11.ap_start" *)output PEG_Yvec_11__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_11.ap_ready" *)input PEG_Yvec_11__ap_ready;
  (* RS_FF = "PEG_Yvec_11__ap_done" *)input PEG_Yvec_11__ap_done;
  (* RS_FF = "PEG_Yvec_11__ap_idle" *)input PEG_Yvec_11__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_12.ap_start" *)output PEG_Yvec_12__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_12.ap_ready" *)input PEG_Yvec_12__ap_ready;
  (* RS_FF = "PEG_Yvec_12__ap_done" *)input PEG_Yvec_12__ap_done;
  (* RS_FF = "PEG_Yvec_12__ap_idle" *)input PEG_Yvec_12__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_13.ap_start" *)output PEG_Yvec_13__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_13.ap_ready" *)input PEG_Yvec_13__ap_ready;
  (* RS_FF = "PEG_Yvec_13__ap_done" *)input PEG_Yvec_13__ap_done;
  (* RS_FF = "PEG_Yvec_13__ap_idle" *)input PEG_Yvec_13__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_14.ap_start" *)output PEG_Yvec_14__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_14.ap_ready" *)input PEG_Yvec_14__ap_ready;
  (* RS_FF = "PEG_Yvec_14__ap_done" *)input PEG_Yvec_14__ap_done;
  (* RS_FF = "PEG_Yvec_14__ap_idle" *)input PEG_Yvec_14__ap_idle;
  (* RS_AP_CTRL = "PEG_Yvec_15.ap_start" *)output PEG_Yvec_15__ap_start;
  (* RS_AP_CTRL = "PEG_Yvec_15.ap_ready" *)input PEG_Yvec_15__ap_ready;
  (* RS_FF = "PEG_Yvec_15__ap_done" *)input PEG_Yvec_15__ap_done;
  (* RS_FF = "PEG_Yvec_15__ap_idle" *)input PEG_Yvec_15__ap_idle;
  (* RS_FF = "black_hole_bool_0__ap_start" *)output black_hole_bool_0__ap_start;
  (* RS_FF = "black_hole_bool_1__ap_start" *)output black_hole_bool_1__ap_start;
  (* RS_FF = "black_hole_double_v8_0__ap_start" *)output black_hole_double_v8_0__ap_start;
  (* RS_FF = "black_hole_int_0__ap_start" *)output black_hole_int_0__ap_start;
  (* RS_AP_CTRL = "ctrl_AP_0.ap_start" *)output ctrl_AP_0__ap_start;
  (* RS_AP_CTRL = "ctrl_AP_0.ap_ready" *)input ctrl_AP_0__ap_ready;
  (* RS_FF = "ctrl_AP_0__ap_done" *)input ctrl_AP_0__ap_done;
  (* RS_FF = "ctrl_AP_0__ap_idle" *)input ctrl_AP_0__ap_idle;
  (* RS_AP_CTRL = "ctrl_P_0.ap_start" *)output ctrl_P_0__ap_start;
  (* RS_AP_CTRL = "ctrl_P_0.ap_ready" *)input ctrl_P_0__ap_ready;
  (* RS_FF = "ctrl_P_0__ap_done" *)input ctrl_P_0__ap_done;
  (* RS_FF = "ctrl_P_0__ap_idle" *)input ctrl_P_0__ap_idle;
  (* RS_AP_CTRL = "ctrl_R_0.ap_start" *)output ctrl_R_0__ap_start;
  (* RS_AP_CTRL = "ctrl_R_0.ap_ready" *)input ctrl_R_0__ap_ready;
  (* RS_FF = "ctrl_R_0__ap_done" *)input ctrl_R_0__ap_done;
  (* RS_FF = "ctrl_R_0__ap_idle" *)input ctrl_R_0__ap_idle;
  (* RS_AP_CTRL = "ctrl_X_0.ap_start" *)output ctrl_X_0__ap_start;
  (* RS_AP_CTRL = "ctrl_X_0.ap_ready" *)input ctrl_X_0__ap_ready;
  (* RS_FF = "ctrl_X_0__ap_done" *)input ctrl_X_0__ap_done;
  (* RS_FF = "ctrl_X_0__ap_idle" *)input ctrl_X_0__ap_idle;
  (* RS_AP_CTRL = "dot_alpha_0.ap_start" *)output dot_alpha_0__ap_start;
  (* RS_AP_CTRL = "dot_alpha_0.ap_ready" *)input dot_alpha_0__ap_ready;
  (* RS_FF = "dot_alpha_0__ap_done" *)input dot_alpha_0__ap_done;
  (* RS_FF = "dot_alpha_0__ap_idle" *)input dot_alpha_0__ap_idle;
  (* RS_AP_CTRL = "dot_res_0.ap_start" *)output dot_res_0__ap_start;
  (* RS_AP_CTRL = "dot_res_0.ap_ready" *)input dot_res_0__ap_ready;
  (* RS_FF = "dot_res_0__ap_done" *)input dot_res_0__ap_done;
  (* RS_FF = "dot_res_0__ap_idle" *)input dot_res_0__ap_idle;
  (* RS_AP_CTRL = "dot_rznew_0.ap_start" *)output dot_rznew_0__ap_start;
  (* RS_AP_CTRL = "dot_rznew_0.ap_ready" *)input dot_rznew_0__ap_ready;
  (* RS_FF = "dot_rznew_0__ap_done" *)input dot_rznew_0__ap_done;
  (* RS_FF = "dot_rznew_0__ap_idle" *)input dot_rznew_0__ap_idle;
  (* RS_FF = "duplicator_0__ap_start" *)output duplicator_0__ap_start;
  (* RS_AP_CTRL = "left_div_0.ap_start" *)output left_div_0__ap_start;
  (* RS_AP_CTRL = "left_div_0.ap_ready" *)input left_div_0__ap_ready;
  (* RS_FF = "left_div_0__ap_done" *)input left_div_0__ap_done;
  (* RS_FF = "left_div_0__ap_idle" *)input left_div_0__ap_idle;
  (* RS_FF = "rdwr_vec_0__ap_start" *)output rdwr_vec_0__ap_start;
  (* RS_FF = "rdwr_vec_1__ap_start" *)output rdwr_vec_1__ap_start;
  (* RS_FF = "rdwr_vec_2__ap_start" *)output rdwr_vec_2__ap_start;
  (* RS_FF = "rdwr_vec_3__ap_start" *)output rdwr_vec_3__ap_start;
  (* RS_FF = "rdwr_vec_4__ap_start" *)output rdwr_vec_4__ap_start;
  (* RS_FF = "rdwr_vec_5__ap_start" *)output rdwr_vec_5__ap_start;
  (* RS_FF = "rdwr_vec_6__ap_start" *)output rdwr_vec_6__ap_start;
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
  (* RS_AP_CTRL = "read_A_8.ap_start" *)output read_A_8__ap_start;
  (* RS_AP_CTRL = "read_A_8.ap_ready" *)input read_A_8__ap_ready;
  (* RS_FF = "read_A_8__ap_done" *)input read_A_8__ap_done;
  (* RS_FF = "read_A_8__ap_idle" *)input read_A_8__ap_idle;
  (* RS_AP_CTRL = "read_A_9.ap_start" *)output read_A_9__ap_start;
  (* RS_AP_CTRL = "read_A_9.ap_ready" *)input read_A_9__ap_ready;
  (* RS_FF = "read_A_9__ap_done" *)input read_A_9__ap_done;
  (* RS_FF = "read_A_9__ap_idle" *)input read_A_9__ap_idle;
  (* RS_AP_CTRL = "read_A_10.ap_start" *)output read_A_10__ap_start;
  (* RS_AP_CTRL = "read_A_10.ap_ready" *)input read_A_10__ap_ready;
  (* RS_FF = "read_A_10__ap_done" *)input read_A_10__ap_done;
  (* RS_FF = "read_A_10__ap_idle" *)input read_A_10__ap_idle;
  (* RS_AP_CTRL = "read_A_11.ap_start" *)output read_A_11__ap_start;
  (* RS_AP_CTRL = "read_A_11.ap_ready" *)input read_A_11__ap_ready;
  (* RS_FF = "read_A_11__ap_done" *)input read_A_11__ap_done;
  (* RS_FF = "read_A_11__ap_idle" *)input read_A_11__ap_idle;
  (* RS_AP_CTRL = "read_A_12.ap_start" *)output read_A_12__ap_start;
  (* RS_AP_CTRL = "read_A_12.ap_ready" *)input read_A_12__ap_ready;
  (* RS_FF = "read_A_12__ap_done" *)input read_A_12__ap_done;
  (* RS_FF = "read_A_12__ap_idle" *)input read_A_12__ap_idle;
  (* RS_AP_CTRL = "read_A_13.ap_start" *)output read_A_13__ap_start;
  (* RS_AP_CTRL = "read_A_13.ap_ready" *)input read_A_13__ap_ready;
  (* RS_FF = "read_A_13__ap_done" *)input read_A_13__ap_done;
  (* RS_FF = "read_A_13__ap_idle" *)input read_A_13__ap_idle;
  (* RS_AP_CTRL = "read_A_14.ap_start" *)output read_A_14__ap_start;
  (* RS_AP_CTRL = "read_A_14.ap_ready" *)input read_A_14__ap_ready;
  (* RS_FF = "read_A_14__ap_done" *)input read_A_14__ap_done;
  (* RS_FF = "read_A_14__ap_idle" *)input read_A_14__ap_idle;
  (* RS_AP_CTRL = "read_A_15.ap_start" *)output read_A_15__ap_start;
  (* RS_AP_CTRL = "read_A_15.ap_ready" *)input read_A_15__ap_ready;
  (* RS_FF = "read_A_15__ap_done" *)input read_A_15__ap_done;
  (* RS_FF = "read_A_15__ap_idle" *)input read_A_15__ap_idle;
  (* RS_AP_CTRL = "read_digA_0.ap_start" *)output read_digA_0__ap_start;
  (* RS_AP_CTRL = "read_digA_0.ap_ready" *)input read_digA_0__ap_ready;
  (* RS_FF = "read_digA_0__ap_done" *)input read_digA_0__ap_done;
  (* RS_FF = "read_digA_0__ap_idle" *)input read_digA_0__ap_idle;
  (* RS_AP_CTRL = "read_edge_list_ptr_0.ap_start" *)output read_edge_list_ptr_0__ap_start;
  (* RS_AP_CTRL = "read_edge_list_ptr_0.ap_ready" *)input read_edge_list_ptr_0__ap_ready;
  (* RS_FF = "read_edge_list_ptr_0__ap_done" *)input read_edge_list_ptr_0__ap_done;
  (* RS_FF = "read_edge_list_ptr_0__ap_idle" *)input read_edge_list_ptr_0__ap_idle;
  (* RS_FF = "term_signal_router_0__ap_start" *)output term_signal_router_0__ap_start;
  (* RS_AP_CTRL = "updt_p_0.ap_start" *)output updt_p_0__ap_start;
  (* RS_AP_CTRL = "updt_p_0.ap_ready" *)input updt_p_0__ap_ready;
  (* RS_FF = "updt_p_0__ap_done" *)input updt_p_0__ap_done;
  (* RS_FF = "updt_p_0__ap_idle" *)input updt_p_0__ap_idle;
  (* RS_AP_CTRL = "updt_r_0.ap_start" *)output updt_r_0__ap_start;
  (* RS_AP_CTRL = "updt_r_0.ap_ready" *)input updt_r_0__ap_ready;
  (* RS_FF = "updt_r_0__ap_done" *)input updt_r_0__ap_done;
  (* RS_FF = "updt_r_0__ap_idle" *)input updt_r_0__ap_idle;
  (* RS_AP_CTRL = "updt_x_0.ap_start" *)output updt_x_0__ap_start;
  (* RS_AP_CTRL = "updt_x_0.ap_ready" *)input updt_x_0__ap_ready;
  (* RS_FF = "updt_x_0__ap_done" *)input updt_x_0__ap_done;
  (* RS_FF = "updt_x_0__ap_idle" *)input updt_x_0__ap_idle;
  (* RS_AP_CTRL = "vecp_mux_0.ap_start" *)output vecp_mux_0__ap_start;
  (* RS_AP_CTRL = "vecp_mux_0.ap_ready" *)input vecp_mux_0__ap_ready;
  (* RS_FF = "vecp_mux_0__ap_done" *)input vecp_mux_0__ap_done;
  (* RS_FF = "vecp_mux_0__ap_idle" *)input vecp_mux_0__ap_idle;
  (* RS_AP_CTRL = "wr_r_0.ap_start" *)output wr_r_0__ap_start;
  (* RS_AP_CTRL = "wr_r_0.ap_ready" *)input wr_r_0__ap_ready;
  (* RS_FF = "wr_r_0__ap_done" *)input wr_r_0__ap_done;
  (* RS_FF = "wr_r_0__ap_idle" *)input wr_r_0__ap_idle;
  wire Arbiter_Y_0__ap_start_global__q0;
  wire Arbiter_Y_0__is_done__q0;
  wire Arbiter_Y_0__ap_done_global__q0;
  wire Arbiter_Y_0__ap_start;
  wire Arbiter_Y_0__ap_ready;
  wire Arbiter_Y_0__ap_done;
  wire Arbiter_Y_0__ap_idle;
  reg [1:0] Arbiter_Y_0__state;
  wire Arbiter_Y_1__ap_start_global__q0;
  wire Arbiter_Y_1__is_done__q0;
  wire Arbiter_Y_1__ap_done_global__q0;
  wire Arbiter_Y_1__ap_start;
  wire Arbiter_Y_1__ap_ready;
  wire Arbiter_Y_1__ap_done;
  wire Arbiter_Y_1__ap_idle;
  reg [1:0] Arbiter_Y_1__state;
  wire Arbiter_Y_2__ap_start_global__q0;
  wire Arbiter_Y_2__is_done__q0;
  wire Arbiter_Y_2__ap_done_global__q0;
  wire Arbiter_Y_2__ap_start;
  wire Arbiter_Y_2__ap_ready;
  wire Arbiter_Y_2__ap_done;
  wire Arbiter_Y_2__ap_idle;
  reg [1:0] Arbiter_Y_2__state;
  wire Arbiter_Y_3__ap_start_global__q0;
  wire Arbiter_Y_3__is_done__q0;
  wire Arbiter_Y_3__ap_done_global__q0;
  wire Arbiter_Y_3__ap_start;
  wire Arbiter_Y_3__ap_ready;
  wire Arbiter_Y_3__ap_done;
  wire Arbiter_Y_3__ap_idle;
  reg [1:0] Arbiter_Y_3__state;
  wire Arbiter_Y_4__ap_start_global__q0;
  wire Arbiter_Y_4__is_done__q0;
  wire Arbiter_Y_4__ap_done_global__q0;
  wire Arbiter_Y_4__ap_start;
  wire Arbiter_Y_4__ap_ready;
  wire Arbiter_Y_4__ap_done;
  wire Arbiter_Y_4__ap_idle;
  reg [1:0] Arbiter_Y_4__state;
  wire Arbiter_Y_5__ap_start_global__q0;
  wire Arbiter_Y_5__is_done__q0;
  wire Arbiter_Y_5__ap_done_global__q0;
  wire Arbiter_Y_5__ap_start;
  wire Arbiter_Y_5__ap_ready;
  wire Arbiter_Y_5__ap_done;
  wire Arbiter_Y_5__ap_idle;
  reg [1:0] Arbiter_Y_5__state;
  wire Arbiter_Y_6__ap_start_global__q0;
  wire Arbiter_Y_6__is_done__q0;
  wire Arbiter_Y_6__ap_done_global__q0;
  wire Arbiter_Y_6__ap_start;
  wire Arbiter_Y_6__ap_ready;
  wire Arbiter_Y_6__ap_done;
  wire Arbiter_Y_6__ap_idle;
  reg [1:0] Arbiter_Y_6__state;
  wire Arbiter_Y_7__ap_start_global__q0;
  wire Arbiter_Y_7__is_done__q0;
  wire Arbiter_Y_7__ap_done_global__q0;
  wire Arbiter_Y_7__ap_start;
  wire Arbiter_Y_7__ap_ready;
  wire Arbiter_Y_7__ap_done;
  wire Arbiter_Y_7__ap_idle;
  reg [1:0] Arbiter_Y_7__state;
  wire Merger_Y_0__ap_start_global__q0;
  reg Merger_Y_0__ap_start;
  wire PEG_Xvec_0__ap_start_global__q0;
  wire PEG_Xvec_0__is_done__q0;
  wire PEG_Xvec_0__ap_done_global__q0;
  wire PEG_Xvec_0__ap_start;
  wire PEG_Xvec_0__ap_ready;
  wire PEG_Xvec_0__ap_done;
  wire PEG_Xvec_0__ap_idle;
  reg [1:0] PEG_Xvec_0__state;
  wire PEG_Xvec_1__ap_start_global__q0;
  wire PEG_Xvec_1__is_done__q0;
  wire PEG_Xvec_1__ap_done_global__q0;
  wire PEG_Xvec_1__ap_start;
  wire PEG_Xvec_1__ap_ready;
  wire PEG_Xvec_1__ap_done;
  wire PEG_Xvec_1__ap_idle;
  reg [1:0] PEG_Xvec_1__state;
  wire PEG_Xvec_2__ap_start_global__q0;
  wire PEG_Xvec_2__is_done__q0;
  wire PEG_Xvec_2__ap_done_global__q0;
  wire PEG_Xvec_2__ap_start;
  wire PEG_Xvec_2__ap_ready;
  wire PEG_Xvec_2__ap_done;
  wire PEG_Xvec_2__ap_idle;
  reg [1:0] PEG_Xvec_2__state;
  wire PEG_Xvec_3__ap_start_global__q0;
  wire PEG_Xvec_3__is_done__q0;
  wire PEG_Xvec_3__ap_done_global__q0;
  wire PEG_Xvec_3__ap_start;
  wire PEG_Xvec_3__ap_ready;
  wire PEG_Xvec_3__ap_done;
  wire PEG_Xvec_3__ap_idle;
  reg [1:0] PEG_Xvec_3__state;
  wire PEG_Xvec_4__ap_start_global__q0;
  wire PEG_Xvec_4__is_done__q0;
  wire PEG_Xvec_4__ap_done_global__q0;
  wire PEG_Xvec_4__ap_start;
  wire PEG_Xvec_4__ap_ready;
  wire PEG_Xvec_4__ap_done;
  wire PEG_Xvec_4__ap_idle;
  reg [1:0] PEG_Xvec_4__state;
  wire PEG_Xvec_5__ap_start_global__q0;
  wire PEG_Xvec_5__is_done__q0;
  wire PEG_Xvec_5__ap_done_global__q0;
  wire PEG_Xvec_5__ap_start;
  wire PEG_Xvec_5__ap_ready;
  wire PEG_Xvec_5__ap_done;
  wire PEG_Xvec_5__ap_idle;
  reg [1:0] PEG_Xvec_5__state;
  wire PEG_Xvec_6__ap_start_global__q0;
  wire PEG_Xvec_6__is_done__q0;
  wire PEG_Xvec_6__ap_done_global__q0;
  wire PEG_Xvec_6__ap_start;
  wire PEG_Xvec_6__ap_ready;
  wire PEG_Xvec_6__ap_done;
  wire PEG_Xvec_6__ap_idle;
  reg [1:0] PEG_Xvec_6__state;
  wire PEG_Xvec_7__ap_start_global__q0;
  wire PEG_Xvec_7__is_done__q0;
  wire PEG_Xvec_7__ap_done_global__q0;
  wire PEG_Xvec_7__ap_start;
  wire PEG_Xvec_7__ap_ready;
  wire PEG_Xvec_7__ap_done;
  wire PEG_Xvec_7__ap_idle;
  reg [1:0] PEG_Xvec_7__state;
  wire PEG_Xvec_8__ap_start_global__q0;
  wire PEG_Xvec_8__is_done__q0;
  wire PEG_Xvec_8__ap_done_global__q0;
  wire PEG_Xvec_8__ap_start;
  wire PEG_Xvec_8__ap_ready;
  wire PEG_Xvec_8__ap_done;
  wire PEG_Xvec_8__ap_idle;
  reg [1:0] PEG_Xvec_8__state;
  wire PEG_Xvec_9__ap_start_global__q0;
  wire PEG_Xvec_9__is_done__q0;
  wire PEG_Xvec_9__ap_done_global__q0;
  wire PEG_Xvec_9__ap_start;
  wire PEG_Xvec_9__ap_ready;
  wire PEG_Xvec_9__ap_done;
  wire PEG_Xvec_9__ap_idle;
  reg [1:0] PEG_Xvec_9__state;
  wire PEG_Xvec_10__ap_start_global__q0;
  wire PEG_Xvec_10__is_done__q0;
  wire PEG_Xvec_10__ap_done_global__q0;
  wire PEG_Xvec_10__ap_start;
  wire PEG_Xvec_10__ap_ready;
  wire PEG_Xvec_10__ap_done;
  wire PEG_Xvec_10__ap_idle;
  reg [1:0] PEG_Xvec_10__state;
  wire PEG_Xvec_11__ap_start_global__q0;
  wire PEG_Xvec_11__is_done__q0;
  wire PEG_Xvec_11__ap_done_global__q0;
  wire PEG_Xvec_11__ap_start;
  wire PEG_Xvec_11__ap_ready;
  wire PEG_Xvec_11__ap_done;
  wire PEG_Xvec_11__ap_idle;
  reg [1:0] PEG_Xvec_11__state;
  wire PEG_Xvec_12__ap_start_global__q0;
  wire PEG_Xvec_12__is_done__q0;
  wire PEG_Xvec_12__ap_done_global__q0;
  wire PEG_Xvec_12__ap_start;
  wire PEG_Xvec_12__ap_ready;
  wire PEG_Xvec_12__ap_done;
  wire PEG_Xvec_12__ap_idle;
  reg [1:0] PEG_Xvec_12__state;
  wire PEG_Xvec_13__ap_start_global__q0;
  wire PEG_Xvec_13__is_done__q0;
  wire PEG_Xvec_13__ap_done_global__q0;
  wire PEG_Xvec_13__ap_start;
  wire PEG_Xvec_13__ap_ready;
  wire PEG_Xvec_13__ap_done;
  wire PEG_Xvec_13__ap_idle;
  reg [1:0] PEG_Xvec_13__state;
  wire PEG_Xvec_14__ap_start_global__q0;
  wire PEG_Xvec_14__is_done__q0;
  wire PEG_Xvec_14__ap_done_global__q0;
  wire PEG_Xvec_14__ap_start;
  wire PEG_Xvec_14__ap_ready;
  wire PEG_Xvec_14__ap_done;
  wire PEG_Xvec_14__ap_idle;
  reg [1:0] PEG_Xvec_14__state;
  wire PEG_Xvec_15__ap_start_global__q0;
  wire PEG_Xvec_15__is_done__q0;
  wire PEG_Xvec_15__ap_done_global__q0;
  wire PEG_Xvec_15__ap_start;
  wire PEG_Xvec_15__ap_ready;
  wire PEG_Xvec_15__ap_done;
  wire PEG_Xvec_15__ap_idle;
  reg [1:0] PEG_Xvec_15__state;
  wire PEG_Yvec_0__ap_start_global__q0;
  wire PEG_Yvec_0__is_done__q0;
  wire PEG_Yvec_0__ap_done_global__q0;
  wire PEG_Yvec_0__ap_start;
  wire PEG_Yvec_0__ap_ready;
  wire PEG_Yvec_0__ap_done;
  wire PEG_Yvec_0__ap_idle;
  reg [1:0] PEG_Yvec_0__state;
  wire PEG_Yvec_1__ap_start_global__q0;
  wire PEG_Yvec_1__is_done__q0;
  wire PEG_Yvec_1__ap_done_global__q0;
  wire PEG_Yvec_1__ap_start;
  wire PEG_Yvec_1__ap_ready;
  wire PEG_Yvec_1__ap_done;
  wire PEG_Yvec_1__ap_idle;
  reg [1:0] PEG_Yvec_1__state;
  wire PEG_Yvec_2__ap_start_global__q0;
  wire PEG_Yvec_2__is_done__q0;
  wire PEG_Yvec_2__ap_done_global__q0;
  wire PEG_Yvec_2__ap_start;
  wire PEG_Yvec_2__ap_ready;
  wire PEG_Yvec_2__ap_done;
  wire PEG_Yvec_2__ap_idle;
  reg [1:0] PEG_Yvec_2__state;
  wire PEG_Yvec_3__ap_start_global__q0;
  wire PEG_Yvec_3__is_done__q0;
  wire PEG_Yvec_3__ap_done_global__q0;
  wire PEG_Yvec_3__ap_start;
  wire PEG_Yvec_3__ap_ready;
  wire PEG_Yvec_3__ap_done;
  wire PEG_Yvec_3__ap_idle;
  reg [1:0] PEG_Yvec_3__state;
  wire PEG_Yvec_4__ap_start_global__q0;
  wire PEG_Yvec_4__is_done__q0;
  wire PEG_Yvec_4__ap_done_global__q0;
  wire PEG_Yvec_4__ap_start;
  wire PEG_Yvec_4__ap_ready;
  wire PEG_Yvec_4__ap_done;
  wire PEG_Yvec_4__ap_idle;
  reg [1:0] PEG_Yvec_4__state;
  wire PEG_Yvec_5__ap_start_global__q0;
  wire PEG_Yvec_5__is_done__q0;
  wire PEG_Yvec_5__ap_done_global__q0;
  wire PEG_Yvec_5__ap_start;
  wire PEG_Yvec_5__ap_ready;
  wire PEG_Yvec_5__ap_done;
  wire PEG_Yvec_5__ap_idle;
  reg [1:0] PEG_Yvec_5__state;
  wire PEG_Yvec_6__ap_start_global__q0;
  wire PEG_Yvec_6__is_done__q0;
  wire PEG_Yvec_6__ap_done_global__q0;
  wire PEG_Yvec_6__ap_start;
  wire PEG_Yvec_6__ap_ready;
  wire PEG_Yvec_6__ap_done;
  wire PEG_Yvec_6__ap_idle;
  reg [1:0] PEG_Yvec_6__state;
  wire PEG_Yvec_7__ap_start_global__q0;
  wire PEG_Yvec_7__is_done__q0;
  wire PEG_Yvec_7__ap_done_global__q0;
  wire PEG_Yvec_7__ap_start;
  wire PEG_Yvec_7__ap_ready;
  wire PEG_Yvec_7__ap_done;
  wire PEG_Yvec_7__ap_idle;
  reg [1:0] PEG_Yvec_7__state;
  wire PEG_Yvec_8__ap_start_global__q0;
  wire PEG_Yvec_8__is_done__q0;
  wire PEG_Yvec_8__ap_done_global__q0;
  wire PEG_Yvec_8__ap_start;
  wire PEG_Yvec_8__ap_ready;
  wire PEG_Yvec_8__ap_done;
  wire PEG_Yvec_8__ap_idle;
  reg [1:0] PEG_Yvec_8__state;
  wire PEG_Yvec_9__ap_start_global__q0;
  wire PEG_Yvec_9__is_done__q0;
  wire PEG_Yvec_9__ap_done_global__q0;
  wire PEG_Yvec_9__ap_start;
  wire PEG_Yvec_9__ap_ready;
  wire PEG_Yvec_9__ap_done;
  wire PEG_Yvec_9__ap_idle;
  reg [1:0] PEG_Yvec_9__state;
  wire PEG_Yvec_10__ap_start_global__q0;
  wire PEG_Yvec_10__is_done__q0;
  wire PEG_Yvec_10__ap_done_global__q0;
  wire PEG_Yvec_10__ap_start;
  wire PEG_Yvec_10__ap_ready;
  wire PEG_Yvec_10__ap_done;
  wire PEG_Yvec_10__ap_idle;
  reg [1:0] PEG_Yvec_10__state;
  wire PEG_Yvec_11__ap_start_global__q0;
  wire PEG_Yvec_11__is_done__q0;
  wire PEG_Yvec_11__ap_done_global__q0;
  wire PEG_Yvec_11__ap_start;
  wire PEG_Yvec_11__ap_ready;
  wire PEG_Yvec_11__ap_done;
  wire PEG_Yvec_11__ap_idle;
  reg [1:0] PEG_Yvec_11__state;
  wire PEG_Yvec_12__ap_start_global__q0;
  wire PEG_Yvec_12__is_done__q0;
  wire PEG_Yvec_12__ap_done_global__q0;
  wire PEG_Yvec_12__ap_start;
  wire PEG_Yvec_12__ap_ready;
  wire PEG_Yvec_12__ap_done;
  wire PEG_Yvec_12__ap_idle;
  reg [1:0] PEG_Yvec_12__state;
  wire PEG_Yvec_13__ap_start_global__q0;
  wire PEG_Yvec_13__is_done__q0;
  wire PEG_Yvec_13__ap_done_global__q0;
  wire PEG_Yvec_13__ap_start;
  wire PEG_Yvec_13__ap_ready;
  wire PEG_Yvec_13__ap_done;
  wire PEG_Yvec_13__ap_idle;
  reg [1:0] PEG_Yvec_13__state;
  wire PEG_Yvec_14__ap_start_global__q0;
  wire PEG_Yvec_14__is_done__q0;
  wire PEG_Yvec_14__ap_done_global__q0;
  wire PEG_Yvec_14__ap_start;
  wire PEG_Yvec_14__ap_ready;
  wire PEG_Yvec_14__ap_done;
  wire PEG_Yvec_14__ap_idle;
  reg [1:0] PEG_Yvec_14__state;
  wire PEG_Yvec_15__ap_start_global__q0;
  wire PEG_Yvec_15__is_done__q0;
  wire PEG_Yvec_15__ap_done_global__q0;
  wire PEG_Yvec_15__ap_start;
  wire PEG_Yvec_15__ap_ready;
  wire PEG_Yvec_15__ap_done;
  wire PEG_Yvec_15__ap_idle;
  reg [1:0] PEG_Yvec_15__state;
  wire black_hole_bool_0__ap_start_global__q0;
  reg black_hole_bool_0__ap_start;
  wire black_hole_bool_1__ap_start_global__q0;
  reg black_hole_bool_1__ap_start;
  wire black_hole_double_v8_0__ap_start_global__q0;
  reg black_hole_double_v8_0__ap_start;
  wire black_hole_int_0__ap_start_global__q0;
  reg black_hole_int_0__ap_start;
  wire ctrl_AP_0__ap_start_global__q0;
  wire ctrl_AP_0__is_done__q0;
  wire ctrl_AP_0__ap_done_global__q0;
  wire ctrl_AP_0__ap_start;
  wire ctrl_AP_0__ap_ready;
  wire ctrl_AP_0__ap_done;
  wire ctrl_AP_0__ap_idle;
  reg [1:0] ctrl_AP_0__state;
  wire ctrl_P_0__ap_start_global__q0;
  wire ctrl_P_0__is_done__q0;
  wire ctrl_P_0__ap_done_global__q0;
  wire ctrl_P_0__ap_start;
  wire ctrl_P_0__ap_ready;
  wire ctrl_P_0__ap_done;
  wire ctrl_P_0__ap_idle;
  reg [1:0] ctrl_P_0__state;
  wire ctrl_R_0__ap_start_global__q0;
  wire ctrl_R_0__is_done__q0;
  wire ctrl_R_0__ap_done_global__q0;
  wire ctrl_R_0__ap_start;
  wire ctrl_R_0__ap_ready;
  wire ctrl_R_0__ap_done;
  wire ctrl_R_0__ap_idle;
  reg [1:0] ctrl_R_0__state;
  wire ctrl_X_0__ap_start_global__q0;
  wire ctrl_X_0__is_done__q0;
  wire ctrl_X_0__ap_done_global__q0;
  wire ctrl_X_0__ap_start;
  wire ctrl_X_0__ap_ready;
  wire ctrl_X_0__ap_done;
  wire ctrl_X_0__ap_idle;
  reg [1:0] ctrl_X_0__state;
  wire dot_alpha_0__ap_start_global__q0;
  wire dot_alpha_0__is_done__q0;
  wire dot_alpha_0__ap_done_global__q0;
  wire dot_alpha_0__ap_start;
  wire dot_alpha_0__ap_ready;
  wire dot_alpha_0__ap_done;
  wire dot_alpha_0__ap_idle;
  reg [1:0] dot_alpha_0__state;
  wire dot_res_0__ap_start_global__q0;
  wire dot_res_0__is_done__q0;
  wire dot_res_0__ap_done_global__q0;
  wire dot_res_0__ap_start;
  wire dot_res_0__ap_ready;
  wire dot_res_0__ap_done;
  wire dot_res_0__ap_idle;
  reg [1:0] dot_res_0__state;
  wire dot_rznew_0__ap_start_global__q0;
  wire dot_rznew_0__is_done__q0;
  wire dot_rznew_0__ap_done_global__q0;
  wire dot_rznew_0__ap_start;
  wire dot_rznew_0__ap_ready;
  wire dot_rznew_0__ap_done;
  wire dot_rznew_0__ap_idle;
  reg [1:0] dot_rznew_0__state;
  wire duplicator_0__ap_start_global__q0;
  reg duplicator_0__ap_start;
  wire left_div_0__ap_start_global__q0;
  wire left_div_0__is_done__q0;
  wire left_div_0__ap_done_global__q0;
  wire left_div_0__ap_start;
  wire left_div_0__ap_ready;
  wire left_div_0__ap_done;
  wire left_div_0__ap_idle;
  reg [1:0] left_div_0__state;
  wire rdwr_vec_0__ap_start_global__q0;
  reg rdwr_vec_0__ap_start;
  wire rdwr_vec_1__ap_start_global__q0;
  reg rdwr_vec_1__ap_start;
  wire rdwr_vec_2__ap_start_global__q0;
  reg rdwr_vec_2__ap_start;
  wire rdwr_vec_3__ap_start_global__q0;
  reg rdwr_vec_3__ap_start;
  wire rdwr_vec_4__ap_start_global__q0;
  reg rdwr_vec_4__ap_start;
  wire rdwr_vec_5__ap_start_global__q0;
  reg rdwr_vec_5__ap_start;
  wire rdwr_vec_6__ap_start_global__q0;
  reg rdwr_vec_6__ap_start;
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
  wire read_A_8__ap_start_global__q0;
  wire read_A_8__is_done__q0;
  wire read_A_8__ap_done_global__q0;
  wire read_A_8__ap_start;
  wire read_A_8__ap_ready;
  wire read_A_8__ap_done;
  wire read_A_8__ap_idle;
  reg [1:0] read_A_8__state;
  wire read_A_9__ap_start_global__q0;
  wire read_A_9__is_done__q0;
  wire read_A_9__ap_done_global__q0;
  wire read_A_9__ap_start;
  wire read_A_9__ap_ready;
  wire read_A_9__ap_done;
  wire read_A_9__ap_idle;
  reg [1:0] read_A_9__state;
  wire read_A_10__ap_start_global__q0;
  wire read_A_10__is_done__q0;
  wire read_A_10__ap_done_global__q0;
  wire read_A_10__ap_start;
  wire read_A_10__ap_ready;
  wire read_A_10__ap_done;
  wire read_A_10__ap_idle;
  reg [1:0] read_A_10__state;
  wire read_A_11__ap_start_global__q0;
  wire read_A_11__is_done__q0;
  wire read_A_11__ap_done_global__q0;
  wire read_A_11__ap_start;
  wire read_A_11__ap_ready;
  wire read_A_11__ap_done;
  wire read_A_11__ap_idle;
  reg [1:0] read_A_11__state;
  wire read_A_12__ap_start_global__q0;
  wire read_A_12__is_done__q0;
  wire read_A_12__ap_done_global__q0;
  wire read_A_12__ap_start;
  wire read_A_12__ap_ready;
  wire read_A_12__ap_done;
  wire read_A_12__ap_idle;
  reg [1:0] read_A_12__state;
  wire read_A_13__ap_start_global__q0;
  wire read_A_13__is_done__q0;
  wire read_A_13__ap_done_global__q0;
  wire read_A_13__ap_start;
  wire read_A_13__ap_ready;
  wire read_A_13__ap_done;
  wire read_A_13__ap_idle;
  reg [1:0] read_A_13__state;
  wire read_A_14__ap_start_global__q0;
  wire read_A_14__is_done__q0;
  wire read_A_14__ap_done_global__q0;
  wire read_A_14__ap_start;
  wire read_A_14__ap_ready;
  wire read_A_14__ap_done;
  wire read_A_14__ap_idle;
  reg [1:0] read_A_14__state;
  wire read_A_15__ap_start_global__q0;
  wire read_A_15__is_done__q0;
  wire read_A_15__ap_done_global__q0;
  wire read_A_15__ap_start;
  wire read_A_15__ap_ready;
  wire read_A_15__ap_done;
  wire read_A_15__ap_idle;
  reg [1:0] read_A_15__state;
  wire read_digA_0__ap_start_global__q0;
  wire read_digA_0__is_done__q0;
  wire read_digA_0__ap_done_global__q0;
  wire read_digA_0__ap_start;
  wire read_digA_0__ap_ready;
  wire read_digA_0__ap_done;
  wire read_digA_0__ap_idle;
  reg [1:0] read_digA_0__state;
  wire read_edge_list_ptr_0__ap_start_global__q0;
  wire read_edge_list_ptr_0__is_done__q0;
  wire read_edge_list_ptr_0__ap_done_global__q0;
  wire read_edge_list_ptr_0__ap_start;
  wire read_edge_list_ptr_0__ap_ready;
  wire read_edge_list_ptr_0__ap_done;
  wire read_edge_list_ptr_0__ap_idle;
  reg [1:0] read_edge_list_ptr_0__state;
  wire term_signal_router_0__ap_start_global__q0;
  reg term_signal_router_0__ap_start;
  wire updt_p_0__ap_start_global__q0;
  wire updt_p_0__is_done__q0;
  wire updt_p_0__ap_done_global__q0;
  wire updt_p_0__ap_start;
  wire updt_p_0__ap_ready;
  wire updt_p_0__ap_done;
  wire updt_p_0__ap_idle;
  reg [1:0] updt_p_0__state;
  wire updt_r_0__ap_start_global__q0;
  wire updt_r_0__is_done__q0;
  wire updt_r_0__ap_done_global__q0;
  wire updt_r_0__ap_start;
  wire updt_r_0__ap_ready;
  wire updt_r_0__ap_done;
  wire updt_r_0__ap_idle;
  reg [1:0] updt_r_0__state;
  wire updt_x_0__ap_start_global__q0;
  wire updt_x_0__is_done__q0;
  wire updt_x_0__ap_done_global__q0;
  wire updt_x_0__ap_start;
  wire updt_x_0__ap_ready;
  wire updt_x_0__ap_done;
  wire updt_x_0__ap_idle;
  reg [1:0] updt_x_0__state;
  wire vecp_mux_0__ap_start_global__q0;
  wire vecp_mux_0__is_done__q0;
  wire vecp_mux_0__ap_done_global__q0;
  wire vecp_mux_0__ap_start;
  wire vecp_mux_0__ap_ready;
  wire vecp_mux_0__ap_done;
  wire vecp_mux_0__ap_idle;
  reg [1:0] vecp_mux_0__state;
  wire wr_r_0__ap_start_global__q0;
  wire wr_r_0__is_done__q0;
  wire wr_r_0__ap_done_global__q0;
  wire wr_r_0__ap_start;
  wire wr_r_0__ap_ready;
  wire wr_r_0__ap_done;
  wire wr_r_0__ap_idle;
  reg [1:0] wr_r_0__state;
  reg [1:0] tapa_state;
  reg [0:0] countdown;
  wire ap_start__q0;
  wire ap_done__q0;
  assign Arbiter_Y_0__ap_start_global__q0 = ap_start__q0;
  assign Arbiter_Y_0__is_done__q0 = (Arbiter_Y_0__state == 2'b10);
  assign Arbiter_Y_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Arbiter_Y_0__state <= 2'b00;
    end else begin
      if(Arbiter_Y_0__state == 2'b00) begin
        if(Arbiter_Y_0__ap_start_global__q0) begin
          Arbiter_Y_0__state <= 2'b01;
        end
      end
      if(Arbiter_Y_0__state == 2'b01) begin
        if(Arbiter_Y_0__ap_ready) begin
          if(Arbiter_Y_0__ap_done) begin
            Arbiter_Y_0__state <= 2'b10;
          end else begin
            Arbiter_Y_0__state <= 2'b11;
          end
        end
      end
      if(Arbiter_Y_0__state == 2'b11) begin
        if(Arbiter_Y_0__ap_done) begin
          Arbiter_Y_0__state <= 2'b10;
        end
      end
      if(Arbiter_Y_0__state == 2'b10) begin
        if(Arbiter_Y_0__ap_done_global__q0) begin
          Arbiter_Y_0__state <= 2'b00;
        end
      end
    end
  end

  assign Arbiter_Y_0__ap_start = (Arbiter_Y_0__state == 2'b01);
  assign Arbiter_Y_1__ap_start_global__q0 = ap_start__q0;
  assign Arbiter_Y_1__is_done__q0 = (Arbiter_Y_1__state == 2'b10);
  assign Arbiter_Y_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Arbiter_Y_1__state <= 2'b00;
    end else begin
      if(Arbiter_Y_1__state == 2'b00) begin
        if(Arbiter_Y_1__ap_start_global__q0) begin
          Arbiter_Y_1__state <= 2'b01;
        end
      end
      if(Arbiter_Y_1__state == 2'b01) begin
        if(Arbiter_Y_1__ap_ready) begin
          if(Arbiter_Y_1__ap_done) begin
            Arbiter_Y_1__state <= 2'b10;
          end else begin
            Arbiter_Y_1__state <= 2'b11;
          end
        end
      end
      if(Arbiter_Y_1__state == 2'b11) begin
        if(Arbiter_Y_1__ap_done) begin
          Arbiter_Y_1__state <= 2'b10;
        end
      end
      if(Arbiter_Y_1__state == 2'b10) begin
        if(Arbiter_Y_1__ap_done_global__q0) begin
          Arbiter_Y_1__state <= 2'b00;
        end
      end
    end
  end

  assign Arbiter_Y_1__ap_start = (Arbiter_Y_1__state == 2'b01);
  assign Arbiter_Y_2__ap_start_global__q0 = ap_start__q0;
  assign Arbiter_Y_2__is_done__q0 = (Arbiter_Y_2__state == 2'b10);
  assign Arbiter_Y_2__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Arbiter_Y_2__state <= 2'b00;
    end else begin
      if(Arbiter_Y_2__state == 2'b00) begin
        if(Arbiter_Y_2__ap_start_global__q0) begin
          Arbiter_Y_2__state <= 2'b01;
        end
      end
      if(Arbiter_Y_2__state == 2'b01) begin
        if(Arbiter_Y_2__ap_ready) begin
          if(Arbiter_Y_2__ap_done) begin
            Arbiter_Y_2__state <= 2'b10;
          end else begin
            Arbiter_Y_2__state <= 2'b11;
          end
        end
      end
      if(Arbiter_Y_2__state == 2'b11) begin
        if(Arbiter_Y_2__ap_done) begin
          Arbiter_Y_2__state <= 2'b10;
        end
      end
      if(Arbiter_Y_2__state == 2'b10) begin
        if(Arbiter_Y_2__ap_done_global__q0) begin
          Arbiter_Y_2__state <= 2'b00;
        end
      end
    end
  end

  assign Arbiter_Y_2__ap_start = (Arbiter_Y_2__state == 2'b01);
  assign Arbiter_Y_3__ap_start_global__q0 = ap_start__q0;
  assign Arbiter_Y_3__is_done__q0 = (Arbiter_Y_3__state == 2'b10);
  assign Arbiter_Y_3__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Arbiter_Y_3__state <= 2'b00;
    end else begin
      if(Arbiter_Y_3__state == 2'b00) begin
        if(Arbiter_Y_3__ap_start_global__q0) begin
          Arbiter_Y_3__state <= 2'b01;
        end
      end
      if(Arbiter_Y_3__state == 2'b01) begin
        if(Arbiter_Y_3__ap_ready) begin
          if(Arbiter_Y_3__ap_done) begin
            Arbiter_Y_3__state <= 2'b10;
          end else begin
            Arbiter_Y_3__state <= 2'b11;
          end
        end
      end
      if(Arbiter_Y_3__state == 2'b11) begin
        if(Arbiter_Y_3__ap_done) begin
          Arbiter_Y_3__state <= 2'b10;
        end
      end
      if(Arbiter_Y_3__state == 2'b10) begin
        if(Arbiter_Y_3__ap_done_global__q0) begin
          Arbiter_Y_3__state <= 2'b00;
        end
      end
    end
  end

  assign Arbiter_Y_3__ap_start = (Arbiter_Y_3__state == 2'b01);
  assign Arbiter_Y_4__ap_start_global__q0 = ap_start__q0;
  assign Arbiter_Y_4__is_done__q0 = (Arbiter_Y_4__state == 2'b10);
  assign Arbiter_Y_4__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Arbiter_Y_4__state <= 2'b00;
    end else begin
      if(Arbiter_Y_4__state == 2'b00) begin
        if(Arbiter_Y_4__ap_start_global__q0) begin
          Arbiter_Y_4__state <= 2'b01;
        end
      end
      if(Arbiter_Y_4__state == 2'b01) begin
        if(Arbiter_Y_4__ap_ready) begin
          if(Arbiter_Y_4__ap_done) begin
            Arbiter_Y_4__state <= 2'b10;
          end else begin
            Arbiter_Y_4__state <= 2'b11;
          end
        end
      end
      if(Arbiter_Y_4__state == 2'b11) begin
        if(Arbiter_Y_4__ap_done) begin
          Arbiter_Y_4__state <= 2'b10;
        end
      end
      if(Arbiter_Y_4__state == 2'b10) begin
        if(Arbiter_Y_4__ap_done_global__q0) begin
          Arbiter_Y_4__state <= 2'b00;
        end
      end
    end
  end

  assign Arbiter_Y_4__ap_start = (Arbiter_Y_4__state == 2'b01);
  assign Arbiter_Y_5__ap_start_global__q0 = ap_start__q0;
  assign Arbiter_Y_5__is_done__q0 = (Arbiter_Y_5__state == 2'b10);
  assign Arbiter_Y_5__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Arbiter_Y_5__state <= 2'b00;
    end else begin
      if(Arbiter_Y_5__state == 2'b00) begin
        if(Arbiter_Y_5__ap_start_global__q0) begin
          Arbiter_Y_5__state <= 2'b01;
        end
      end
      if(Arbiter_Y_5__state == 2'b01) begin
        if(Arbiter_Y_5__ap_ready) begin
          if(Arbiter_Y_5__ap_done) begin
            Arbiter_Y_5__state <= 2'b10;
          end else begin
            Arbiter_Y_5__state <= 2'b11;
          end
        end
      end
      if(Arbiter_Y_5__state == 2'b11) begin
        if(Arbiter_Y_5__ap_done) begin
          Arbiter_Y_5__state <= 2'b10;
        end
      end
      if(Arbiter_Y_5__state == 2'b10) begin
        if(Arbiter_Y_5__ap_done_global__q0) begin
          Arbiter_Y_5__state <= 2'b00;
        end
      end
    end
  end

  assign Arbiter_Y_5__ap_start = (Arbiter_Y_5__state == 2'b01);
  assign Arbiter_Y_6__ap_start_global__q0 = ap_start__q0;
  assign Arbiter_Y_6__is_done__q0 = (Arbiter_Y_6__state == 2'b10);
  assign Arbiter_Y_6__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Arbiter_Y_6__state <= 2'b00;
    end else begin
      if(Arbiter_Y_6__state == 2'b00) begin
        if(Arbiter_Y_6__ap_start_global__q0) begin
          Arbiter_Y_6__state <= 2'b01;
        end
      end
      if(Arbiter_Y_6__state == 2'b01) begin
        if(Arbiter_Y_6__ap_ready) begin
          if(Arbiter_Y_6__ap_done) begin
            Arbiter_Y_6__state <= 2'b10;
          end else begin
            Arbiter_Y_6__state <= 2'b11;
          end
        end
      end
      if(Arbiter_Y_6__state == 2'b11) begin
        if(Arbiter_Y_6__ap_done) begin
          Arbiter_Y_6__state <= 2'b10;
        end
      end
      if(Arbiter_Y_6__state == 2'b10) begin
        if(Arbiter_Y_6__ap_done_global__q0) begin
          Arbiter_Y_6__state <= 2'b00;
        end
      end
    end
  end

  assign Arbiter_Y_6__ap_start = (Arbiter_Y_6__state == 2'b01);
  assign Arbiter_Y_7__ap_start_global__q0 = ap_start__q0;
  assign Arbiter_Y_7__is_done__q0 = (Arbiter_Y_7__state == 2'b10);
  assign Arbiter_Y_7__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Arbiter_Y_7__state <= 2'b00;
    end else begin
      if(Arbiter_Y_7__state == 2'b00) begin
        if(Arbiter_Y_7__ap_start_global__q0) begin
          Arbiter_Y_7__state <= 2'b01;
        end
      end
      if(Arbiter_Y_7__state == 2'b01) begin
        if(Arbiter_Y_7__ap_ready) begin
          if(Arbiter_Y_7__ap_done) begin
            Arbiter_Y_7__state <= 2'b10;
          end else begin
            Arbiter_Y_7__state <= 2'b11;
          end
        end
      end
      if(Arbiter_Y_7__state == 2'b11) begin
        if(Arbiter_Y_7__ap_done) begin
          Arbiter_Y_7__state <= 2'b10;
        end
      end
      if(Arbiter_Y_7__state == 2'b10) begin
        if(Arbiter_Y_7__ap_done_global__q0) begin
          Arbiter_Y_7__state <= 2'b00;
        end
      end
    end
  end

  assign Arbiter_Y_7__ap_start = (Arbiter_Y_7__state == 2'b01);
  assign Merger_Y_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Merger_Y_0__ap_start <= 1'b0;
    end else if(Merger_Y_0__ap_start_global__q0) begin
      Merger_Y_0__ap_start <= 1'b1;
    end
  end

  assign PEG_Xvec_0__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_0__is_done__q0 = (PEG_Xvec_0__state == 2'b10);
  assign PEG_Xvec_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_0__state <= 2'b00;
    end else begin
      if(PEG_Xvec_0__state == 2'b00) begin
        if(PEG_Xvec_0__ap_start_global__q0) begin
          PEG_Xvec_0__state <= 2'b01;
        end
      end
      if(PEG_Xvec_0__state == 2'b01) begin
        if(PEG_Xvec_0__ap_ready) begin
          if(PEG_Xvec_0__ap_done) begin
            PEG_Xvec_0__state <= 2'b10;
          end else begin
            PEG_Xvec_0__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_0__state == 2'b11) begin
        if(PEG_Xvec_0__ap_done) begin
          PEG_Xvec_0__state <= 2'b10;
        end
      end
      if(PEG_Xvec_0__state == 2'b10) begin
        if(PEG_Xvec_0__ap_done_global__q0) begin
          PEG_Xvec_0__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_0__ap_start = (PEG_Xvec_0__state == 2'b01);
  assign PEG_Xvec_1__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_1__is_done__q0 = (PEG_Xvec_1__state == 2'b10);
  assign PEG_Xvec_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_1__state <= 2'b00;
    end else begin
      if(PEG_Xvec_1__state == 2'b00) begin
        if(PEG_Xvec_1__ap_start_global__q0) begin
          PEG_Xvec_1__state <= 2'b01;
        end
      end
      if(PEG_Xvec_1__state == 2'b01) begin
        if(PEG_Xvec_1__ap_ready) begin
          if(PEG_Xvec_1__ap_done) begin
            PEG_Xvec_1__state <= 2'b10;
          end else begin
            PEG_Xvec_1__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_1__state == 2'b11) begin
        if(PEG_Xvec_1__ap_done) begin
          PEG_Xvec_1__state <= 2'b10;
        end
      end
      if(PEG_Xvec_1__state == 2'b10) begin
        if(PEG_Xvec_1__ap_done_global__q0) begin
          PEG_Xvec_1__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_1__ap_start = (PEG_Xvec_1__state == 2'b01);
  assign PEG_Xvec_2__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_2__is_done__q0 = (PEG_Xvec_2__state == 2'b10);
  assign PEG_Xvec_2__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_2__state <= 2'b00;
    end else begin
      if(PEG_Xvec_2__state == 2'b00) begin
        if(PEG_Xvec_2__ap_start_global__q0) begin
          PEG_Xvec_2__state <= 2'b01;
        end
      end
      if(PEG_Xvec_2__state == 2'b01) begin
        if(PEG_Xvec_2__ap_ready) begin
          if(PEG_Xvec_2__ap_done) begin
            PEG_Xvec_2__state <= 2'b10;
          end else begin
            PEG_Xvec_2__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_2__state == 2'b11) begin
        if(PEG_Xvec_2__ap_done) begin
          PEG_Xvec_2__state <= 2'b10;
        end
      end
      if(PEG_Xvec_2__state == 2'b10) begin
        if(PEG_Xvec_2__ap_done_global__q0) begin
          PEG_Xvec_2__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_2__ap_start = (PEG_Xvec_2__state == 2'b01);
  assign PEG_Xvec_3__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_3__is_done__q0 = (PEG_Xvec_3__state == 2'b10);
  assign PEG_Xvec_3__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_3__state <= 2'b00;
    end else begin
      if(PEG_Xvec_3__state == 2'b00) begin
        if(PEG_Xvec_3__ap_start_global__q0) begin
          PEG_Xvec_3__state <= 2'b01;
        end
      end
      if(PEG_Xvec_3__state == 2'b01) begin
        if(PEG_Xvec_3__ap_ready) begin
          if(PEG_Xvec_3__ap_done) begin
            PEG_Xvec_3__state <= 2'b10;
          end else begin
            PEG_Xvec_3__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_3__state == 2'b11) begin
        if(PEG_Xvec_3__ap_done) begin
          PEG_Xvec_3__state <= 2'b10;
        end
      end
      if(PEG_Xvec_3__state == 2'b10) begin
        if(PEG_Xvec_3__ap_done_global__q0) begin
          PEG_Xvec_3__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_3__ap_start = (PEG_Xvec_3__state == 2'b01);
  assign PEG_Xvec_4__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_4__is_done__q0 = (PEG_Xvec_4__state == 2'b10);
  assign PEG_Xvec_4__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_4__state <= 2'b00;
    end else begin
      if(PEG_Xvec_4__state == 2'b00) begin
        if(PEG_Xvec_4__ap_start_global__q0) begin
          PEG_Xvec_4__state <= 2'b01;
        end
      end
      if(PEG_Xvec_4__state == 2'b01) begin
        if(PEG_Xvec_4__ap_ready) begin
          if(PEG_Xvec_4__ap_done) begin
            PEG_Xvec_4__state <= 2'b10;
          end else begin
            PEG_Xvec_4__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_4__state == 2'b11) begin
        if(PEG_Xvec_4__ap_done) begin
          PEG_Xvec_4__state <= 2'b10;
        end
      end
      if(PEG_Xvec_4__state == 2'b10) begin
        if(PEG_Xvec_4__ap_done_global__q0) begin
          PEG_Xvec_4__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_4__ap_start = (PEG_Xvec_4__state == 2'b01);
  assign PEG_Xvec_5__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_5__is_done__q0 = (PEG_Xvec_5__state == 2'b10);
  assign PEG_Xvec_5__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_5__state <= 2'b00;
    end else begin
      if(PEG_Xvec_5__state == 2'b00) begin
        if(PEG_Xvec_5__ap_start_global__q0) begin
          PEG_Xvec_5__state <= 2'b01;
        end
      end
      if(PEG_Xvec_5__state == 2'b01) begin
        if(PEG_Xvec_5__ap_ready) begin
          if(PEG_Xvec_5__ap_done) begin
            PEG_Xvec_5__state <= 2'b10;
          end else begin
            PEG_Xvec_5__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_5__state == 2'b11) begin
        if(PEG_Xvec_5__ap_done) begin
          PEG_Xvec_5__state <= 2'b10;
        end
      end
      if(PEG_Xvec_5__state == 2'b10) begin
        if(PEG_Xvec_5__ap_done_global__q0) begin
          PEG_Xvec_5__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_5__ap_start = (PEG_Xvec_5__state == 2'b01);
  assign PEG_Xvec_6__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_6__is_done__q0 = (PEG_Xvec_6__state == 2'b10);
  assign PEG_Xvec_6__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_6__state <= 2'b00;
    end else begin
      if(PEG_Xvec_6__state == 2'b00) begin
        if(PEG_Xvec_6__ap_start_global__q0) begin
          PEG_Xvec_6__state <= 2'b01;
        end
      end
      if(PEG_Xvec_6__state == 2'b01) begin
        if(PEG_Xvec_6__ap_ready) begin
          if(PEG_Xvec_6__ap_done) begin
            PEG_Xvec_6__state <= 2'b10;
          end else begin
            PEG_Xvec_6__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_6__state == 2'b11) begin
        if(PEG_Xvec_6__ap_done) begin
          PEG_Xvec_6__state <= 2'b10;
        end
      end
      if(PEG_Xvec_6__state == 2'b10) begin
        if(PEG_Xvec_6__ap_done_global__q0) begin
          PEG_Xvec_6__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_6__ap_start = (PEG_Xvec_6__state == 2'b01);
  assign PEG_Xvec_7__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_7__is_done__q0 = (PEG_Xvec_7__state == 2'b10);
  assign PEG_Xvec_7__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_7__state <= 2'b00;
    end else begin
      if(PEG_Xvec_7__state == 2'b00) begin
        if(PEG_Xvec_7__ap_start_global__q0) begin
          PEG_Xvec_7__state <= 2'b01;
        end
      end
      if(PEG_Xvec_7__state == 2'b01) begin
        if(PEG_Xvec_7__ap_ready) begin
          if(PEG_Xvec_7__ap_done) begin
            PEG_Xvec_7__state <= 2'b10;
          end else begin
            PEG_Xvec_7__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_7__state == 2'b11) begin
        if(PEG_Xvec_7__ap_done) begin
          PEG_Xvec_7__state <= 2'b10;
        end
      end
      if(PEG_Xvec_7__state == 2'b10) begin
        if(PEG_Xvec_7__ap_done_global__q0) begin
          PEG_Xvec_7__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_7__ap_start = (PEG_Xvec_7__state == 2'b01);
  assign PEG_Xvec_8__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_8__is_done__q0 = (PEG_Xvec_8__state == 2'b10);
  assign PEG_Xvec_8__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_8__state <= 2'b00;
    end else begin
      if(PEG_Xvec_8__state == 2'b00) begin
        if(PEG_Xvec_8__ap_start_global__q0) begin
          PEG_Xvec_8__state <= 2'b01;
        end
      end
      if(PEG_Xvec_8__state == 2'b01) begin
        if(PEG_Xvec_8__ap_ready) begin
          if(PEG_Xvec_8__ap_done) begin
            PEG_Xvec_8__state <= 2'b10;
          end else begin
            PEG_Xvec_8__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_8__state == 2'b11) begin
        if(PEG_Xvec_8__ap_done) begin
          PEG_Xvec_8__state <= 2'b10;
        end
      end
      if(PEG_Xvec_8__state == 2'b10) begin
        if(PEG_Xvec_8__ap_done_global__q0) begin
          PEG_Xvec_8__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_8__ap_start = (PEG_Xvec_8__state == 2'b01);
  assign PEG_Xvec_9__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_9__is_done__q0 = (PEG_Xvec_9__state == 2'b10);
  assign PEG_Xvec_9__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_9__state <= 2'b00;
    end else begin
      if(PEG_Xvec_9__state == 2'b00) begin
        if(PEG_Xvec_9__ap_start_global__q0) begin
          PEG_Xvec_9__state <= 2'b01;
        end
      end
      if(PEG_Xvec_9__state == 2'b01) begin
        if(PEG_Xvec_9__ap_ready) begin
          if(PEG_Xvec_9__ap_done) begin
            PEG_Xvec_9__state <= 2'b10;
          end else begin
            PEG_Xvec_9__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_9__state == 2'b11) begin
        if(PEG_Xvec_9__ap_done) begin
          PEG_Xvec_9__state <= 2'b10;
        end
      end
      if(PEG_Xvec_9__state == 2'b10) begin
        if(PEG_Xvec_9__ap_done_global__q0) begin
          PEG_Xvec_9__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_9__ap_start = (PEG_Xvec_9__state == 2'b01);
  assign PEG_Xvec_10__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_10__is_done__q0 = (PEG_Xvec_10__state == 2'b10);
  assign PEG_Xvec_10__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_10__state <= 2'b00;
    end else begin
      if(PEG_Xvec_10__state == 2'b00) begin
        if(PEG_Xvec_10__ap_start_global__q0) begin
          PEG_Xvec_10__state <= 2'b01;
        end
      end
      if(PEG_Xvec_10__state == 2'b01) begin
        if(PEG_Xvec_10__ap_ready) begin
          if(PEG_Xvec_10__ap_done) begin
            PEG_Xvec_10__state <= 2'b10;
          end else begin
            PEG_Xvec_10__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_10__state == 2'b11) begin
        if(PEG_Xvec_10__ap_done) begin
          PEG_Xvec_10__state <= 2'b10;
        end
      end
      if(PEG_Xvec_10__state == 2'b10) begin
        if(PEG_Xvec_10__ap_done_global__q0) begin
          PEG_Xvec_10__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_10__ap_start = (PEG_Xvec_10__state == 2'b01);
  assign PEG_Xvec_11__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_11__is_done__q0 = (PEG_Xvec_11__state == 2'b10);
  assign PEG_Xvec_11__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_11__state <= 2'b00;
    end else begin
      if(PEG_Xvec_11__state == 2'b00) begin
        if(PEG_Xvec_11__ap_start_global__q0) begin
          PEG_Xvec_11__state <= 2'b01;
        end
      end
      if(PEG_Xvec_11__state == 2'b01) begin
        if(PEG_Xvec_11__ap_ready) begin
          if(PEG_Xvec_11__ap_done) begin
            PEG_Xvec_11__state <= 2'b10;
          end else begin
            PEG_Xvec_11__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_11__state == 2'b11) begin
        if(PEG_Xvec_11__ap_done) begin
          PEG_Xvec_11__state <= 2'b10;
        end
      end
      if(PEG_Xvec_11__state == 2'b10) begin
        if(PEG_Xvec_11__ap_done_global__q0) begin
          PEG_Xvec_11__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_11__ap_start = (PEG_Xvec_11__state == 2'b01);
  assign PEG_Xvec_12__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_12__is_done__q0 = (PEG_Xvec_12__state == 2'b10);
  assign PEG_Xvec_12__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_12__state <= 2'b00;
    end else begin
      if(PEG_Xvec_12__state == 2'b00) begin
        if(PEG_Xvec_12__ap_start_global__q0) begin
          PEG_Xvec_12__state <= 2'b01;
        end
      end
      if(PEG_Xvec_12__state == 2'b01) begin
        if(PEG_Xvec_12__ap_ready) begin
          if(PEG_Xvec_12__ap_done) begin
            PEG_Xvec_12__state <= 2'b10;
          end else begin
            PEG_Xvec_12__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_12__state == 2'b11) begin
        if(PEG_Xvec_12__ap_done) begin
          PEG_Xvec_12__state <= 2'b10;
        end
      end
      if(PEG_Xvec_12__state == 2'b10) begin
        if(PEG_Xvec_12__ap_done_global__q0) begin
          PEG_Xvec_12__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_12__ap_start = (PEG_Xvec_12__state == 2'b01);
  assign PEG_Xvec_13__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_13__is_done__q0 = (PEG_Xvec_13__state == 2'b10);
  assign PEG_Xvec_13__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_13__state <= 2'b00;
    end else begin
      if(PEG_Xvec_13__state == 2'b00) begin
        if(PEG_Xvec_13__ap_start_global__q0) begin
          PEG_Xvec_13__state <= 2'b01;
        end
      end
      if(PEG_Xvec_13__state == 2'b01) begin
        if(PEG_Xvec_13__ap_ready) begin
          if(PEG_Xvec_13__ap_done) begin
            PEG_Xvec_13__state <= 2'b10;
          end else begin
            PEG_Xvec_13__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_13__state == 2'b11) begin
        if(PEG_Xvec_13__ap_done) begin
          PEG_Xvec_13__state <= 2'b10;
        end
      end
      if(PEG_Xvec_13__state == 2'b10) begin
        if(PEG_Xvec_13__ap_done_global__q0) begin
          PEG_Xvec_13__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_13__ap_start = (PEG_Xvec_13__state == 2'b01);
  assign PEG_Xvec_14__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_14__is_done__q0 = (PEG_Xvec_14__state == 2'b10);
  assign PEG_Xvec_14__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_14__state <= 2'b00;
    end else begin
      if(PEG_Xvec_14__state == 2'b00) begin
        if(PEG_Xvec_14__ap_start_global__q0) begin
          PEG_Xvec_14__state <= 2'b01;
        end
      end
      if(PEG_Xvec_14__state == 2'b01) begin
        if(PEG_Xvec_14__ap_ready) begin
          if(PEG_Xvec_14__ap_done) begin
            PEG_Xvec_14__state <= 2'b10;
          end else begin
            PEG_Xvec_14__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_14__state == 2'b11) begin
        if(PEG_Xvec_14__ap_done) begin
          PEG_Xvec_14__state <= 2'b10;
        end
      end
      if(PEG_Xvec_14__state == 2'b10) begin
        if(PEG_Xvec_14__ap_done_global__q0) begin
          PEG_Xvec_14__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_14__ap_start = (PEG_Xvec_14__state == 2'b01);
  assign PEG_Xvec_15__ap_start_global__q0 = ap_start__q0;
  assign PEG_Xvec_15__is_done__q0 = (PEG_Xvec_15__state == 2'b10);
  assign PEG_Xvec_15__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Xvec_15__state <= 2'b00;
    end else begin
      if(PEG_Xvec_15__state == 2'b00) begin
        if(PEG_Xvec_15__ap_start_global__q0) begin
          PEG_Xvec_15__state <= 2'b01;
        end
      end
      if(PEG_Xvec_15__state == 2'b01) begin
        if(PEG_Xvec_15__ap_ready) begin
          if(PEG_Xvec_15__ap_done) begin
            PEG_Xvec_15__state <= 2'b10;
          end else begin
            PEG_Xvec_15__state <= 2'b11;
          end
        end
      end
      if(PEG_Xvec_15__state == 2'b11) begin
        if(PEG_Xvec_15__ap_done) begin
          PEG_Xvec_15__state <= 2'b10;
        end
      end
      if(PEG_Xvec_15__state == 2'b10) begin
        if(PEG_Xvec_15__ap_done_global__q0) begin
          PEG_Xvec_15__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Xvec_15__ap_start = (PEG_Xvec_15__state == 2'b01);
  assign PEG_Yvec_0__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_0__is_done__q0 = (PEG_Yvec_0__state == 2'b10);
  assign PEG_Yvec_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_0__state <= 2'b00;
    end else begin
      if(PEG_Yvec_0__state == 2'b00) begin
        if(PEG_Yvec_0__ap_start_global__q0) begin
          PEG_Yvec_0__state <= 2'b01;
        end
      end
      if(PEG_Yvec_0__state == 2'b01) begin
        if(PEG_Yvec_0__ap_ready) begin
          if(PEG_Yvec_0__ap_done) begin
            PEG_Yvec_0__state <= 2'b10;
          end else begin
            PEG_Yvec_0__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_0__state == 2'b11) begin
        if(PEG_Yvec_0__ap_done) begin
          PEG_Yvec_0__state <= 2'b10;
        end
      end
      if(PEG_Yvec_0__state == 2'b10) begin
        if(PEG_Yvec_0__ap_done_global__q0) begin
          PEG_Yvec_0__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_0__ap_start = (PEG_Yvec_0__state == 2'b01);
  assign PEG_Yvec_1__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_1__is_done__q0 = (PEG_Yvec_1__state == 2'b10);
  assign PEG_Yvec_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_1__state <= 2'b00;
    end else begin
      if(PEG_Yvec_1__state == 2'b00) begin
        if(PEG_Yvec_1__ap_start_global__q0) begin
          PEG_Yvec_1__state <= 2'b01;
        end
      end
      if(PEG_Yvec_1__state == 2'b01) begin
        if(PEG_Yvec_1__ap_ready) begin
          if(PEG_Yvec_1__ap_done) begin
            PEG_Yvec_1__state <= 2'b10;
          end else begin
            PEG_Yvec_1__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_1__state == 2'b11) begin
        if(PEG_Yvec_1__ap_done) begin
          PEG_Yvec_1__state <= 2'b10;
        end
      end
      if(PEG_Yvec_1__state == 2'b10) begin
        if(PEG_Yvec_1__ap_done_global__q0) begin
          PEG_Yvec_1__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_1__ap_start = (PEG_Yvec_1__state == 2'b01);
  assign PEG_Yvec_2__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_2__is_done__q0 = (PEG_Yvec_2__state == 2'b10);
  assign PEG_Yvec_2__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_2__state <= 2'b00;
    end else begin
      if(PEG_Yvec_2__state == 2'b00) begin
        if(PEG_Yvec_2__ap_start_global__q0) begin
          PEG_Yvec_2__state <= 2'b01;
        end
      end
      if(PEG_Yvec_2__state == 2'b01) begin
        if(PEG_Yvec_2__ap_ready) begin
          if(PEG_Yvec_2__ap_done) begin
            PEG_Yvec_2__state <= 2'b10;
          end else begin
            PEG_Yvec_2__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_2__state == 2'b11) begin
        if(PEG_Yvec_2__ap_done) begin
          PEG_Yvec_2__state <= 2'b10;
        end
      end
      if(PEG_Yvec_2__state == 2'b10) begin
        if(PEG_Yvec_2__ap_done_global__q0) begin
          PEG_Yvec_2__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_2__ap_start = (PEG_Yvec_2__state == 2'b01);
  assign PEG_Yvec_3__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_3__is_done__q0 = (PEG_Yvec_3__state == 2'b10);
  assign PEG_Yvec_3__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_3__state <= 2'b00;
    end else begin
      if(PEG_Yvec_3__state == 2'b00) begin
        if(PEG_Yvec_3__ap_start_global__q0) begin
          PEG_Yvec_3__state <= 2'b01;
        end
      end
      if(PEG_Yvec_3__state == 2'b01) begin
        if(PEG_Yvec_3__ap_ready) begin
          if(PEG_Yvec_3__ap_done) begin
            PEG_Yvec_3__state <= 2'b10;
          end else begin
            PEG_Yvec_3__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_3__state == 2'b11) begin
        if(PEG_Yvec_3__ap_done) begin
          PEG_Yvec_3__state <= 2'b10;
        end
      end
      if(PEG_Yvec_3__state == 2'b10) begin
        if(PEG_Yvec_3__ap_done_global__q0) begin
          PEG_Yvec_3__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_3__ap_start = (PEG_Yvec_3__state == 2'b01);
  assign PEG_Yvec_4__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_4__is_done__q0 = (PEG_Yvec_4__state == 2'b10);
  assign PEG_Yvec_4__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_4__state <= 2'b00;
    end else begin
      if(PEG_Yvec_4__state == 2'b00) begin
        if(PEG_Yvec_4__ap_start_global__q0) begin
          PEG_Yvec_4__state <= 2'b01;
        end
      end
      if(PEG_Yvec_4__state == 2'b01) begin
        if(PEG_Yvec_4__ap_ready) begin
          if(PEG_Yvec_4__ap_done) begin
            PEG_Yvec_4__state <= 2'b10;
          end else begin
            PEG_Yvec_4__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_4__state == 2'b11) begin
        if(PEG_Yvec_4__ap_done) begin
          PEG_Yvec_4__state <= 2'b10;
        end
      end
      if(PEG_Yvec_4__state == 2'b10) begin
        if(PEG_Yvec_4__ap_done_global__q0) begin
          PEG_Yvec_4__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_4__ap_start = (PEG_Yvec_4__state == 2'b01);
  assign PEG_Yvec_5__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_5__is_done__q0 = (PEG_Yvec_5__state == 2'b10);
  assign PEG_Yvec_5__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_5__state <= 2'b00;
    end else begin
      if(PEG_Yvec_5__state == 2'b00) begin
        if(PEG_Yvec_5__ap_start_global__q0) begin
          PEG_Yvec_5__state <= 2'b01;
        end
      end
      if(PEG_Yvec_5__state == 2'b01) begin
        if(PEG_Yvec_5__ap_ready) begin
          if(PEG_Yvec_5__ap_done) begin
            PEG_Yvec_5__state <= 2'b10;
          end else begin
            PEG_Yvec_5__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_5__state == 2'b11) begin
        if(PEG_Yvec_5__ap_done) begin
          PEG_Yvec_5__state <= 2'b10;
        end
      end
      if(PEG_Yvec_5__state == 2'b10) begin
        if(PEG_Yvec_5__ap_done_global__q0) begin
          PEG_Yvec_5__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_5__ap_start = (PEG_Yvec_5__state == 2'b01);
  assign PEG_Yvec_6__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_6__is_done__q0 = (PEG_Yvec_6__state == 2'b10);
  assign PEG_Yvec_6__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_6__state <= 2'b00;
    end else begin
      if(PEG_Yvec_6__state == 2'b00) begin
        if(PEG_Yvec_6__ap_start_global__q0) begin
          PEG_Yvec_6__state <= 2'b01;
        end
      end
      if(PEG_Yvec_6__state == 2'b01) begin
        if(PEG_Yvec_6__ap_ready) begin
          if(PEG_Yvec_6__ap_done) begin
            PEG_Yvec_6__state <= 2'b10;
          end else begin
            PEG_Yvec_6__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_6__state == 2'b11) begin
        if(PEG_Yvec_6__ap_done) begin
          PEG_Yvec_6__state <= 2'b10;
        end
      end
      if(PEG_Yvec_6__state == 2'b10) begin
        if(PEG_Yvec_6__ap_done_global__q0) begin
          PEG_Yvec_6__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_6__ap_start = (PEG_Yvec_6__state == 2'b01);
  assign PEG_Yvec_7__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_7__is_done__q0 = (PEG_Yvec_7__state == 2'b10);
  assign PEG_Yvec_7__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_7__state <= 2'b00;
    end else begin
      if(PEG_Yvec_7__state == 2'b00) begin
        if(PEG_Yvec_7__ap_start_global__q0) begin
          PEG_Yvec_7__state <= 2'b01;
        end
      end
      if(PEG_Yvec_7__state == 2'b01) begin
        if(PEG_Yvec_7__ap_ready) begin
          if(PEG_Yvec_7__ap_done) begin
            PEG_Yvec_7__state <= 2'b10;
          end else begin
            PEG_Yvec_7__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_7__state == 2'b11) begin
        if(PEG_Yvec_7__ap_done) begin
          PEG_Yvec_7__state <= 2'b10;
        end
      end
      if(PEG_Yvec_7__state == 2'b10) begin
        if(PEG_Yvec_7__ap_done_global__q0) begin
          PEG_Yvec_7__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_7__ap_start = (PEG_Yvec_7__state == 2'b01);
  assign PEG_Yvec_8__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_8__is_done__q0 = (PEG_Yvec_8__state == 2'b10);
  assign PEG_Yvec_8__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_8__state <= 2'b00;
    end else begin
      if(PEG_Yvec_8__state == 2'b00) begin
        if(PEG_Yvec_8__ap_start_global__q0) begin
          PEG_Yvec_8__state <= 2'b01;
        end
      end
      if(PEG_Yvec_8__state == 2'b01) begin
        if(PEG_Yvec_8__ap_ready) begin
          if(PEG_Yvec_8__ap_done) begin
            PEG_Yvec_8__state <= 2'b10;
          end else begin
            PEG_Yvec_8__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_8__state == 2'b11) begin
        if(PEG_Yvec_8__ap_done) begin
          PEG_Yvec_8__state <= 2'b10;
        end
      end
      if(PEG_Yvec_8__state == 2'b10) begin
        if(PEG_Yvec_8__ap_done_global__q0) begin
          PEG_Yvec_8__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_8__ap_start = (PEG_Yvec_8__state == 2'b01);
  assign PEG_Yvec_9__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_9__is_done__q0 = (PEG_Yvec_9__state == 2'b10);
  assign PEG_Yvec_9__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_9__state <= 2'b00;
    end else begin
      if(PEG_Yvec_9__state == 2'b00) begin
        if(PEG_Yvec_9__ap_start_global__q0) begin
          PEG_Yvec_9__state <= 2'b01;
        end
      end
      if(PEG_Yvec_9__state == 2'b01) begin
        if(PEG_Yvec_9__ap_ready) begin
          if(PEG_Yvec_9__ap_done) begin
            PEG_Yvec_9__state <= 2'b10;
          end else begin
            PEG_Yvec_9__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_9__state == 2'b11) begin
        if(PEG_Yvec_9__ap_done) begin
          PEG_Yvec_9__state <= 2'b10;
        end
      end
      if(PEG_Yvec_9__state == 2'b10) begin
        if(PEG_Yvec_9__ap_done_global__q0) begin
          PEG_Yvec_9__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_9__ap_start = (PEG_Yvec_9__state == 2'b01);
  assign PEG_Yvec_10__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_10__is_done__q0 = (PEG_Yvec_10__state == 2'b10);
  assign PEG_Yvec_10__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_10__state <= 2'b00;
    end else begin
      if(PEG_Yvec_10__state == 2'b00) begin
        if(PEG_Yvec_10__ap_start_global__q0) begin
          PEG_Yvec_10__state <= 2'b01;
        end
      end
      if(PEG_Yvec_10__state == 2'b01) begin
        if(PEG_Yvec_10__ap_ready) begin
          if(PEG_Yvec_10__ap_done) begin
            PEG_Yvec_10__state <= 2'b10;
          end else begin
            PEG_Yvec_10__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_10__state == 2'b11) begin
        if(PEG_Yvec_10__ap_done) begin
          PEG_Yvec_10__state <= 2'b10;
        end
      end
      if(PEG_Yvec_10__state == 2'b10) begin
        if(PEG_Yvec_10__ap_done_global__q0) begin
          PEG_Yvec_10__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_10__ap_start = (PEG_Yvec_10__state == 2'b01);
  assign PEG_Yvec_11__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_11__is_done__q0 = (PEG_Yvec_11__state == 2'b10);
  assign PEG_Yvec_11__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_11__state <= 2'b00;
    end else begin
      if(PEG_Yvec_11__state == 2'b00) begin
        if(PEG_Yvec_11__ap_start_global__q0) begin
          PEG_Yvec_11__state <= 2'b01;
        end
      end
      if(PEG_Yvec_11__state == 2'b01) begin
        if(PEG_Yvec_11__ap_ready) begin
          if(PEG_Yvec_11__ap_done) begin
            PEG_Yvec_11__state <= 2'b10;
          end else begin
            PEG_Yvec_11__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_11__state == 2'b11) begin
        if(PEG_Yvec_11__ap_done) begin
          PEG_Yvec_11__state <= 2'b10;
        end
      end
      if(PEG_Yvec_11__state == 2'b10) begin
        if(PEG_Yvec_11__ap_done_global__q0) begin
          PEG_Yvec_11__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_11__ap_start = (PEG_Yvec_11__state == 2'b01);
  assign PEG_Yvec_12__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_12__is_done__q0 = (PEG_Yvec_12__state == 2'b10);
  assign PEG_Yvec_12__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_12__state <= 2'b00;
    end else begin
      if(PEG_Yvec_12__state == 2'b00) begin
        if(PEG_Yvec_12__ap_start_global__q0) begin
          PEG_Yvec_12__state <= 2'b01;
        end
      end
      if(PEG_Yvec_12__state == 2'b01) begin
        if(PEG_Yvec_12__ap_ready) begin
          if(PEG_Yvec_12__ap_done) begin
            PEG_Yvec_12__state <= 2'b10;
          end else begin
            PEG_Yvec_12__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_12__state == 2'b11) begin
        if(PEG_Yvec_12__ap_done) begin
          PEG_Yvec_12__state <= 2'b10;
        end
      end
      if(PEG_Yvec_12__state == 2'b10) begin
        if(PEG_Yvec_12__ap_done_global__q0) begin
          PEG_Yvec_12__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_12__ap_start = (PEG_Yvec_12__state == 2'b01);
  assign PEG_Yvec_13__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_13__is_done__q0 = (PEG_Yvec_13__state == 2'b10);
  assign PEG_Yvec_13__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_13__state <= 2'b00;
    end else begin
      if(PEG_Yvec_13__state == 2'b00) begin
        if(PEG_Yvec_13__ap_start_global__q0) begin
          PEG_Yvec_13__state <= 2'b01;
        end
      end
      if(PEG_Yvec_13__state == 2'b01) begin
        if(PEG_Yvec_13__ap_ready) begin
          if(PEG_Yvec_13__ap_done) begin
            PEG_Yvec_13__state <= 2'b10;
          end else begin
            PEG_Yvec_13__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_13__state == 2'b11) begin
        if(PEG_Yvec_13__ap_done) begin
          PEG_Yvec_13__state <= 2'b10;
        end
      end
      if(PEG_Yvec_13__state == 2'b10) begin
        if(PEG_Yvec_13__ap_done_global__q0) begin
          PEG_Yvec_13__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_13__ap_start = (PEG_Yvec_13__state == 2'b01);
  assign PEG_Yvec_14__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_14__is_done__q0 = (PEG_Yvec_14__state == 2'b10);
  assign PEG_Yvec_14__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_14__state <= 2'b00;
    end else begin
      if(PEG_Yvec_14__state == 2'b00) begin
        if(PEG_Yvec_14__ap_start_global__q0) begin
          PEG_Yvec_14__state <= 2'b01;
        end
      end
      if(PEG_Yvec_14__state == 2'b01) begin
        if(PEG_Yvec_14__ap_ready) begin
          if(PEG_Yvec_14__ap_done) begin
            PEG_Yvec_14__state <= 2'b10;
          end else begin
            PEG_Yvec_14__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_14__state == 2'b11) begin
        if(PEG_Yvec_14__ap_done) begin
          PEG_Yvec_14__state <= 2'b10;
        end
      end
      if(PEG_Yvec_14__state == 2'b10) begin
        if(PEG_Yvec_14__ap_done_global__q0) begin
          PEG_Yvec_14__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_14__ap_start = (PEG_Yvec_14__state == 2'b01);
  assign PEG_Yvec_15__ap_start_global__q0 = ap_start__q0;
  assign PEG_Yvec_15__is_done__q0 = (PEG_Yvec_15__state == 2'b10);
  assign PEG_Yvec_15__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      PEG_Yvec_15__state <= 2'b00;
    end else begin
      if(PEG_Yvec_15__state == 2'b00) begin
        if(PEG_Yvec_15__ap_start_global__q0) begin
          PEG_Yvec_15__state <= 2'b01;
        end
      end
      if(PEG_Yvec_15__state == 2'b01) begin
        if(PEG_Yvec_15__ap_ready) begin
          if(PEG_Yvec_15__ap_done) begin
            PEG_Yvec_15__state <= 2'b10;
          end else begin
            PEG_Yvec_15__state <= 2'b11;
          end
        end
      end
      if(PEG_Yvec_15__state == 2'b11) begin
        if(PEG_Yvec_15__ap_done) begin
          PEG_Yvec_15__state <= 2'b10;
        end
      end
      if(PEG_Yvec_15__state == 2'b10) begin
        if(PEG_Yvec_15__ap_done_global__q0) begin
          PEG_Yvec_15__state <= 2'b00;
        end
      end
    end
  end

  assign PEG_Yvec_15__ap_start = (PEG_Yvec_15__state == 2'b01);
  assign black_hole_bool_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      black_hole_bool_0__ap_start <= 1'b0;
    end else if(black_hole_bool_0__ap_start_global__q0) begin
      black_hole_bool_0__ap_start <= 1'b1;
    end
  end

  assign black_hole_bool_1__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      black_hole_bool_1__ap_start <= 1'b0;
    end else if(black_hole_bool_1__ap_start_global__q0) begin
      black_hole_bool_1__ap_start <= 1'b1;
    end
  end

  assign black_hole_double_v8_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      black_hole_double_v8_0__ap_start <= 1'b0;
    end else if(black_hole_double_v8_0__ap_start_global__q0) begin
      black_hole_double_v8_0__ap_start <= 1'b1;
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

  assign ctrl_AP_0__ap_start_global__q0 = ap_start__q0;
  assign ctrl_AP_0__is_done__q0 = (ctrl_AP_0__state == 2'b10);
  assign ctrl_AP_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      ctrl_AP_0__state <= 2'b00;
    end else begin
      if(ctrl_AP_0__state == 2'b00) begin
        if(ctrl_AP_0__ap_start_global__q0) begin
          ctrl_AP_0__state <= 2'b01;
        end
      end
      if(ctrl_AP_0__state == 2'b01) begin
        if(ctrl_AP_0__ap_ready) begin
          if(ctrl_AP_0__ap_done) begin
            ctrl_AP_0__state <= 2'b10;
          end else begin
            ctrl_AP_0__state <= 2'b11;
          end
        end
      end
      if(ctrl_AP_0__state == 2'b11) begin
        if(ctrl_AP_0__ap_done) begin
          ctrl_AP_0__state <= 2'b10;
        end
      end
      if(ctrl_AP_0__state == 2'b10) begin
        if(ctrl_AP_0__ap_done_global__q0) begin
          ctrl_AP_0__state <= 2'b00;
        end
      end
    end
  end

  assign ctrl_AP_0__ap_start = (ctrl_AP_0__state == 2'b01);
  assign ctrl_P_0__ap_start_global__q0 = ap_start__q0;
  assign ctrl_P_0__is_done__q0 = (ctrl_P_0__state == 2'b10);
  assign ctrl_P_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      ctrl_P_0__state <= 2'b00;
    end else begin
      if(ctrl_P_0__state == 2'b00) begin
        if(ctrl_P_0__ap_start_global__q0) begin
          ctrl_P_0__state <= 2'b01;
        end
      end
      if(ctrl_P_0__state == 2'b01) begin
        if(ctrl_P_0__ap_ready) begin
          if(ctrl_P_0__ap_done) begin
            ctrl_P_0__state <= 2'b10;
          end else begin
            ctrl_P_0__state <= 2'b11;
          end
        end
      end
      if(ctrl_P_0__state == 2'b11) begin
        if(ctrl_P_0__ap_done) begin
          ctrl_P_0__state <= 2'b10;
        end
      end
      if(ctrl_P_0__state == 2'b10) begin
        if(ctrl_P_0__ap_done_global__q0) begin
          ctrl_P_0__state <= 2'b00;
        end
      end
    end
  end

  assign ctrl_P_0__ap_start = (ctrl_P_0__state == 2'b01);
  assign ctrl_R_0__ap_start_global__q0 = ap_start__q0;
  assign ctrl_R_0__is_done__q0 = (ctrl_R_0__state == 2'b10);
  assign ctrl_R_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      ctrl_R_0__state <= 2'b00;
    end else begin
      if(ctrl_R_0__state == 2'b00) begin
        if(ctrl_R_0__ap_start_global__q0) begin
          ctrl_R_0__state <= 2'b01;
        end
      end
      if(ctrl_R_0__state == 2'b01) begin
        if(ctrl_R_0__ap_ready) begin
          if(ctrl_R_0__ap_done) begin
            ctrl_R_0__state <= 2'b10;
          end else begin
            ctrl_R_0__state <= 2'b11;
          end
        end
      end
      if(ctrl_R_0__state == 2'b11) begin
        if(ctrl_R_0__ap_done) begin
          ctrl_R_0__state <= 2'b10;
        end
      end
      if(ctrl_R_0__state == 2'b10) begin
        if(ctrl_R_0__ap_done_global__q0) begin
          ctrl_R_0__state <= 2'b00;
        end
      end
    end
  end

  assign ctrl_R_0__ap_start = (ctrl_R_0__state == 2'b01);
  assign ctrl_X_0__ap_start_global__q0 = ap_start__q0;
  assign ctrl_X_0__is_done__q0 = (ctrl_X_0__state == 2'b10);
  assign ctrl_X_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      ctrl_X_0__state <= 2'b00;
    end else begin
      if(ctrl_X_0__state == 2'b00) begin
        if(ctrl_X_0__ap_start_global__q0) begin
          ctrl_X_0__state <= 2'b01;
        end
      end
      if(ctrl_X_0__state == 2'b01) begin
        if(ctrl_X_0__ap_ready) begin
          if(ctrl_X_0__ap_done) begin
            ctrl_X_0__state <= 2'b10;
          end else begin
            ctrl_X_0__state <= 2'b11;
          end
        end
      end
      if(ctrl_X_0__state == 2'b11) begin
        if(ctrl_X_0__ap_done) begin
          ctrl_X_0__state <= 2'b10;
        end
      end
      if(ctrl_X_0__state == 2'b10) begin
        if(ctrl_X_0__ap_done_global__q0) begin
          ctrl_X_0__state <= 2'b00;
        end
      end
    end
  end

  assign ctrl_X_0__ap_start = (ctrl_X_0__state == 2'b01);
  assign dot_alpha_0__ap_start_global__q0 = ap_start__q0;
  assign dot_alpha_0__is_done__q0 = (dot_alpha_0__state == 2'b10);
  assign dot_alpha_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      dot_alpha_0__state <= 2'b00;
    end else begin
      if(dot_alpha_0__state == 2'b00) begin
        if(dot_alpha_0__ap_start_global__q0) begin
          dot_alpha_0__state <= 2'b01;
        end
      end
      if(dot_alpha_0__state == 2'b01) begin
        if(dot_alpha_0__ap_ready) begin
          if(dot_alpha_0__ap_done) begin
            dot_alpha_0__state <= 2'b10;
          end else begin
            dot_alpha_0__state <= 2'b11;
          end
        end
      end
      if(dot_alpha_0__state == 2'b11) begin
        if(dot_alpha_0__ap_done) begin
          dot_alpha_0__state <= 2'b10;
        end
      end
      if(dot_alpha_0__state == 2'b10) begin
        if(dot_alpha_0__ap_done_global__q0) begin
          dot_alpha_0__state <= 2'b00;
        end
      end
    end
  end

  assign dot_alpha_0__ap_start = (dot_alpha_0__state == 2'b01);
  assign dot_res_0__ap_start_global__q0 = ap_start__q0;
  assign dot_res_0__is_done__q0 = (dot_res_0__state == 2'b10);
  assign dot_res_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      dot_res_0__state <= 2'b00;
    end else begin
      if(dot_res_0__state == 2'b00) begin
        if(dot_res_0__ap_start_global__q0) begin
          dot_res_0__state <= 2'b01;
        end
      end
      if(dot_res_0__state == 2'b01) begin
        if(dot_res_0__ap_ready) begin
          if(dot_res_0__ap_done) begin
            dot_res_0__state <= 2'b10;
          end else begin
            dot_res_0__state <= 2'b11;
          end
        end
      end
      if(dot_res_0__state == 2'b11) begin
        if(dot_res_0__ap_done) begin
          dot_res_0__state <= 2'b10;
        end
      end
      if(dot_res_0__state == 2'b10) begin
        if(dot_res_0__ap_done_global__q0) begin
          dot_res_0__state <= 2'b00;
        end
      end
    end
  end

  assign dot_res_0__ap_start = (dot_res_0__state == 2'b01);
  assign dot_rznew_0__ap_start_global__q0 = ap_start__q0;
  assign dot_rznew_0__is_done__q0 = (dot_rznew_0__state == 2'b10);
  assign dot_rznew_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      dot_rznew_0__state <= 2'b00;
    end else begin
      if(dot_rznew_0__state == 2'b00) begin
        if(dot_rznew_0__ap_start_global__q0) begin
          dot_rznew_0__state <= 2'b01;
        end
      end
      if(dot_rznew_0__state == 2'b01) begin
        if(dot_rznew_0__ap_ready) begin
          if(dot_rznew_0__ap_done) begin
            dot_rznew_0__state <= 2'b10;
          end else begin
            dot_rznew_0__state <= 2'b11;
          end
        end
      end
      if(dot_rznew_0__state == 2'b11) begin
        if(dot_rznew_0__ap_done) begin
          dot_rznew_0__state <= 2'b10;
        end
      end
      if(dot_rznew_0__state == 2'b10) begin
        if(dot_rznew_0__ap_done_global__q0) begin
          dot_rznew_0__state <= 2'b00;
        end
      end
    end
  end

  assign dot_rznew_0__ap_start = (dot_rznew_0__state == 2'b01);
  assign duplicator_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      duplicator_0__ap_start <= 1'b0;
    end else if(duplicator_0__ap_start_global__q0) begin
      duplicator_0__ap_start <= 1'b1;
    end
  end

  assign left_div_0__ap_start_global__q0 = ap_start__q0;
  assign left_div_0__is_done__q0 = (left_div_0__state == 2'b10);
  assign left_div_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      left_div_0__state <= 2'b00;
    end else begin
      if(left_div_0__state == 2'b00) begin
        if(left_div_0__ap_start_global__q0) begin
          left_div_0__state <= 2'b01;
        end
      end
      if(left_div_0__state == 2'b01) begin
        if(left_div_0__ap_ready) begin
          if(left_div_0__ap_done) begin
            left_div_0__state <= 2'b10;
          end else begin
            left_div_0__state <= 2'b11;
          end
        end
      end
      if(left_div_0__state == 2'b11) begin
        if(left_div_0__ap_done) begin
          left_div_0__state <= 2'b10;
        end
      end
      if(left_div_0__state == 2'b10) begin
        if(left_div_0__ap_done_global__q0) begin
          left_div_0__state <= 2'b00;
        end
      end
    end
  end

  assign left_div_0__ap_start = (left_div_0__state == 2'b01);
  assign rdwr_vec_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      rdwr_vec_0__ap_start <= 1'b0;
    end else if(rdwr_vec_0__ap_start_global__q0) begin
      rdwr_vec_0__ap_start <= 1'b1;
    end
  end

  assign rdwr_vec_1__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      rdwr_vec_1__ap_start <= 1'b0;
    end else if(rdwr_vec_1__ap_start_global__q0) begin
      rdwr_vec_1__ap_start <= 1'b1;
    end
  end

  assign rdwr_vec_2__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      rdwr_vec_2__ap_start <= 1'b0;
    end else if(rdwr_vec_2__ap_start_global__q0) begin
      rdwr_vec_2__ap_start <= 1'b1;
    end
  end

  assign rdwr_vec_3__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      rdwr_vec_3__ap_start <= 1'b0;
    end else if(rdwr_vec_3__ap_start_global__q0) begin
      rdwr_vec_3__ap_start <= 1'b1;
    end
  end

  assign rdwr_vec_4__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      rdwr_vec_4__ap_start <= 1'b0;
    end else if(rdwr_vec_4__ap_start_global__q0) begin
      rdwr_vec_4__ap_start <= 1'b1;
    end
  end

  assign rdwr_vec_5__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      rdwr_vec_5__ap_start <= 1'b0;
    end else if(rdwr_vec_5__ap_start_global__q0) begin
      rdwr_vec_5__ap_start <= 1'b1;
    end
  end

  assign rdwr_vec_6__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      rdwr_vec_6__ap_start <= 1'b0;
    end else if(rdwr_vec_6__ap_start_global__q0) begin
      rdwr_vec_6__ap_start <= 1'b1;
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
  assign read_A_8__ap_start_global__q0 = ap_start__q0;
  assign read_A_8__is_done__q0 = (read_A_8__state == 2'b10);
  assign read_A_8__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_8__state <= 2'b00;
    end else begin
      if(read_A_8__state == 2'b00) begin
        if(read_A_8__ap_start_global__q0) begin
          read_A_8__state <= 2'b01;
        end
      end
      if(read_A_8__state == 2'b01) begin
        if(read_A_8__ap_ready) begin
          if(read_A_8__ap_done) begin
            read_A_8__state <= 2'b10;
          end else begin
            read_A_8__state <= 2'b11;
          end
        end
      end
      if(read_A_8__state == 2'b11) begin
        if(read_A_8__ap_done) begin
          read_A_8__state <= 2'b10;
        end
      end
      if(read_A_8__state == 2'b10) begin
        if(read_A_8__ap_done_global__q0) begin
          read_A_8__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_8__ap_start = (read_A_8__state == 2'b01);
  assign read_A_9__ap_start_global__q0 = ap_start__q0;
  assign read_A_9__is_done__q0 = (read_A_9__state == 2'b10);
  assign read_A_9__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_9__state <= 2'b00;
    end else begin
      if(read_A_9__state == 2'b00) begin
        if(read_A_9__ap_start_global__q0) begin
          read_A_9__state <= 2'b01;
        end
      end
      if(read_A_9__state == 2'b01) begin
        if(read_A_9__ap_ready) begin
          if(read_A_9__ap_done) begin
            read_A_9__state <= 2'b10;
          end else begin
            read_A_9__state <= 2'b11;
          end
        end
      end
      if(read_A_9__state == 2'b11) begin
        if(read_A_9__ap_done) begin
          read_A_9__state <= 2'b10;
        end
      end
      if(read_A_9__state == 2'b10) begin
        if(read_A_9__ap_done_global__q0) begin
          read_A_9__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_9__ap_start = (read_A_9__state == 2'b01);
  assign read_A_10__ap_start_global__q0 = ap_start__q0;
  assign read_A_10__is_done__q0 = (read_A_10__state == 2'b10);
  assign read_A_10__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_10__state <= 2'b00;
    end else begin
      if(read_A_10__state == 2'b00) begin
        if(read_A_10__ap_start_global__q0) begin
          read_A_10__state <= 2'b01;
        end
      end
      if(read_A_10__state == 2'b01) begin
        if(read_A_10__ap_ready) begin
          if(read_A_10__ap_done) begin
            read_A_10__state <= 2'b10;
          end else begin
            read_A_10__state <= 2'b11;
          end
        end
      end
      if(read_A_10__state == 2'b11) begin
        if(read_A_10__ap_done) begin
          read_A_10__state <= 2'b10;
        end
      end
      if(read_A_10__state == 2'b10) begin
        if(read_A_10__ap_done_global__q0) begin
          read_A_10__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_10__ap_start = (read_A_10__state == 2'b01);
  assign read_A_11__ap_start_global__q0 = ap_start__q0;
  assign read_A_11__is_done__q0 = (read_A_11__state == 2'b10);
  assign read_A_11__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_11__state <= 2'b00;
    end else begin
      if(read_A_11__state == 2'b00) begin
        if(read_A_11__ap_start_global__q0) begin
          read_A_11__state <= 2'b01;
        end
      end
      if(read_A_11__state == 2'b01) begin
        if(read_A_11__ap_ready) begin
          if(read_A_11__ap_done) begin
            read_A_11__state <= 2'b10;
          end else begin
            read_A_11__state <= 2'b11;
          end
        end
      end
      if(read_A_11__state == 2'b11) begin
        if(read_A_11__ap_done) begin
          read_A_11__state <= 2'b10;
        end
      end
      if(read_A_11__state == 2'b10) begin
        if(read_A_11__ap_done_global__q0) begin
          read_A_11__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_11__ap_start = (read_A_11__state == 2'b01);
  assign read_A_12__ap_start_global__q0 = ap_start__q0;
  assign read_A_12__is_done__q0 = (read_A_12__state == 2'b10);
  assign read_A_12__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_12__state <= 2'b00;
    end else begin
      if(read_A_12__state == 2'b00) begin
        if(read_A_12__ap_start_global__q0) begin
          read_A_12__state <= 2'b01;
        end
      end
      if(read_A_12__state == 2'b01) begin
        if(read_A_12__ap_ready) begin
          if(read_A_12__ap_done) begin
            read_A_12__state <= 2'b10;
          end else begin
            read_A_12__state <= 2'b11;
          end
        end
      end
      if(read_A_12__state == 2'b11) begin
        if(read_A_12__ap_done) begin
          read_A_12__state <= 2'b10;
        end
      end
      if(read_A_12__state == 2'b10) begin
        if(read_A_12__ap_done_global__q0) begin
          read_A_12__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_12__ap_start = (read_A_12__state == 2'b01);
  assign read_A_13__ap_start_global__q0 = ap_start__q0;
  assign read_A_13__is_done__q0 = (read_A_13__state == 2'b10);
  assign read_A_13__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_13__state <= 2'b00;
    end else begin
      if(read_A_13__state == 2'b00) begin
        if(read_A_13__ap_start_global__q0) begin
          read_A_13__state <= 2'b01;
        end
      end
      if(read_A_13__state == 2'b01) begin
        if(read_A_13__ap_ready) begin
          if(read_A_13__ap_done) begin
            read_A_13__state <= 2'b10;
          end else begin
            read_A_13__state <= 2'b11;
          end
        end
      end
      if(read_A_13__state == 2'b11) begin
        if(read_A_13__ap_done) begin
          read_A_13__state <= 2'b10;
        end
      end
      if(read_A_13__state == 2'b10) begin
        if(read_A_13__ap_done_global__q0) begin
          read_A_13__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_13__ap_start = (read_A_13__state == 2'b01);
  assign read_A_14__ap_start_global__q0 = ap_start__q0;
  assign read_A_14__is_done__q0 = (read_A_14__state == 2'b10);
  assign read_A_14__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_14__state <= 2'b00;
    end else begin
      if(read_A_14__state == 2'b00) begin
        if(read_A_14__ap_start_global__q0) begin
          read_A_14__state <= 2'b01;
        end
      end
      if(read_A_14__state == 2'b01) begin
        if(read_A_14__ap_ready) begin
          if(read_A_14__ap_done) begin
            read_A_14__state <= 2'b10;
          end else begin
            read_A_14__state <= 2'b11;
          end
        end
      end
      if(read_A_14__state == 2'b11) begin
        if(read_A_14__ap_done) begin
          read_A_14__state <= 2'b10;
        end
      end
      if(read_A_14__state == 2'b10) begin
        if(read_A_14__ap_done_global__q0) begin
          read_A_14__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_14__ap_start = (read_A_14__state == 2'b01);
  assign read_A_15__ap_start_global__q0 = ap_start__q0;
  assign read_A_15__is_done__q0 = (read_A_15__state == 2'b10);
  assign read_A_15__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_A_15__state <= 2'b00;
    end else begin
      if(read_A_15__state == 2'b00) begin
        if(read_A_15__ap_start_global__q0) begin
          read_A_15__state <= 2'b01;
        end
      end
      if(read_A_15__state == 2'b01) begin
        if(read_A_15__ap_ready) begin
          if(read_A_15__ap_done) begin
            read_A_15__state <= 2'b10;
          end else begin
            read_A_15__state <= 2'b11;
          end
        end
      end
      if(read_A_15__state == 2'b11) begin
        if(read_A_15__ap_done) begin
          read_A_15__state <= 2'b10;
        end
      end
      if(read_A_15__state == 2'b10) begin
        if(read_A_15__ap_done_global__q0) begin
          read_A_15__state <= 2'b00;
        end
      end
    end
  end

  assign read_A_15__ap_start = (read_A_15__state == 2'b01);
  assign read_digA_0__ap_start_global__q0 = ap_start__q0;
  assign read_digA_0__is_done__q0 = (read_digA_0__state == 2'b10);
  assign read_digA_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      read_digA_0__state <= 2'b00;
    end else begin
      if(read_digA_0__state == 2'b00) begin
        if(read_digA_0__ap_start_global__q0) begin
          read_digA_0__state <= 2'b01;
        end
      end
      if(read_digA_0__state == 2'b01) begin
        if(read_digA_0__ap_ready) begin
          if(read_digA_0__ap_done) begin
            read_digA_0__state <= 2'b10;
          end else begin
            read_digA_0__state <= 2'b11;
          end
        end
      end
      if(read_digA_0__state == 2'b11) begin
        if(read_digA_0__ap_done) begin
          read_digA_0__state <= 2'b10;
        end
      end
      if(read_digA_0__state == 2'b10) begin
        if(read_digA_0__ap_done_global__q0) begin
          read_digA_0__state <= 2'b00;
        end
      end
    end
  end

  assign read_digA_0__ap_start = (read_digA_0__state == 2'b01);
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
  assign term_signal_router_0__ap_start_global__q0 = ap_start__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      term_signal_router_0__ap_start <= 1'b0;
    end else if(term_signal_router_0__ap_start_global__q0) begin
      term_signal_router_0__ap_start <= 1'b1;
    end
  end

  assign updt_p_0__ap_start_global__q0 = ap_start__q0;
  assign updt_p_0__is_done__q0 = (updt_p_0__state == 2'b10);
  assign updt_p_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      updt_p_0__state <= 2'b00;
    end else begin
      if(updt_p_0__state == 2'b00) begin
        if(updt_p_0__ap_start_global__q0) begin
          updt_p_0__state <= 2'b01;
        end
      end
      if(updt_p_0__state == 2'b01) begin
        if(updt_p_0__ap_ready) begin
          if(updt_p_0__ap_done) begin
            updt_p_0__state <= 2'b10;
          end else begin
            updt_p_0__state <= 2'b11;
          end
        end
      end
      if(updt_p_0__state == 2'b11) begin
        if(updt_p_0__ap_done) begin
          updt_p_0__state <= 2'b10;
        end
      end
      if(updt_p_0__state == 2'b10) begin
        if(updt_p_0__ap_done_global__q0) begin
          updt_p_0__state <= 2'b00;
        end
      end
    end
  end

  assign updt_p_0__ap_start = (updt_p_0__state == 2'b01);
  assign updt_r_0__ap_start_global__q0 = ap_start__q0;
  assign updt_r_0__is_done__q0 = (updt_r_0__state == 2'b10);
  assign updt_r_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      updt_r_0__state <= 2'b00;
    end else begin
      if(updt_r_0__state == 2'b00) begin
        if(updt_r_0__ap_start_global__q0) begin
          updt_r_0__state <= 2'b01;
        end
      end
      if(updt_r_0__state == 2'b01) begin
        if(updt_r_0__ap_ready) begin
          if(updt_r_0__ap_done) begin
            updt_r_0__state <= 2'b10;
          end else begin
            updt_r_0__state <= 2'b11;
          end
        end
      end
      if(updt_r_0__state == 2'b11) begin
        if(updt_r_0__ap_done) begin
          updt_r_0__state <= 2'b10;
        end
      end
      if(updt_r_0__state == 2'b10) begin
        if(updt_r_0__ap_done_global__q0) begin
          updt_r_0__state <= 2'b00;
        end
      end
    end
  end

  assign updt_r_0__ap_start = (updt_r_0__state == 2'b01);
  assign updt_x_0__ap_start_global__q0 = ap_start__q0;
  assign updt_x_0__is_done__q0 = (updt_x_0__state == 2'b10);
  assign updt_x_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      updt_x_0__state <= 2'b00;
    end else begin
      if(updt_x_0__state == 2'b00) begin
        if(updt_x_0__ap_start_global__q0) begin
          updt_x_0__state <= 2'b01;
        end
      end
      if(updt_x_0__state == 2'b01) begin
        if(updt_x_0__ap_ready) begin
          if(updt_x_0__ap_done) begin
            updt_x_0__state <= 2'b10;
          end else begin
            updt_x_0__state <= 2'b11;
          end
        end
      end
      if(updt_x_0__state == 2'b11) begin
        if(updt_x_0__ap_done) begin
          updt_x_0__state <= 2'b10;
        end
      end
      if(updt_x_0__state == 2'b10) begin
        if(updt_x_0__ap_done_global__q0) begin
          updt_x_0__state <= 2'b00;
        end
      end
    end
  end

  assign updt_x_0__ap_start = (updt_x_0__state == 2'b01);
  assign vecp_mux_0__ap_start_global__q0 = ap_start__q0;
  assign vecp_mux_0__is_done__q0 = (vecp_mux_0__state == 2'b10);
  assign vecp_mux_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      vecp_mux_0__state <= 2'b00;
    end else begin
      if(vecp_mux_0__state == 2'b00) begin
        if(vecp_mux_0__ap_start_global__q0) begin
          vecp_mux_0__state <= 2'b01;
        end
      end
      if(vecp_mux_0__state == 2'b01) begin
        if(vecp_mux_0__ap_ready) begin
          if(vecp_mux_0__ap_done) begin
            vecp_mux_0__state <= 2'b10;
          end else begin
            vecp_mux_0__state <= 2'b11;
          end
        end
      end
      if(vecp_mux_0__state == 2'b11) begin
        if(vecp_mux_0__ap_done) begin
          vecp_mux_0__state <= 2'b10;
        end
      end
      if(vecp_mux_0__state == 2'b10) begin
        if(vecp_mux_0__ap_done_global__q0) begin
          vecp_mux_0__state <= 2'b00;
        end
      end
    end
  end

  assign vecp_mux_0__ap_start = (vecp_mux_0__state == 2'b01);
  assign wr_r_0__ap_start_global__q0 = ap_start__q0;
  assign wr_r_0__is_done__q0 = (wr_r_0__state == 2'b10);
  assign wr_r_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      wr_r_0__state <= 2'b00;
    end else begin
      if(wr_r_0__state == 2'b00) begin
        if(wr_r_0__ap_start_global__q0) begin
          wr_r_0__state <= 2'b01;
        end
      end
      if(wr_r_0__state == 2'b01) begin
        if(wr_r_0__ap_ready) begin
          if(wr_r_0__ap_done) begin
            wr_r_0__state <= 2'b10;
          end else begin
            wr_r_0__state <= 2'b11;
          end
        end
      end
      if(wr_r_0__state == 2'b11) begin
        if(wr_r_0__ap_done) begin
          wr_r_0__state <= 2'b10;
        end
      end
      if(wr_r_0__state == 2'b10) begin
        if(wr_r_0__ap_done_global__q0) begin
          wr_r_0__state <= 2'b00;
        end
      end
    end
  end

  assign wr_r_0__ap_start = (wr_r_0__state == 2'b01);

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
          if(Arbiter_Y_0__is_done__q0 && Arbiter_Y_1__is_done__q0 && Arbiter_Y_2__is_done__q0 && Arbiter_Y_3__is_done__q0 && Arbiter_Y_4__is_done__q0 && Arbiter_Y_5__is_done__q0 && Arbiter_Y_6__is_done__q0 && Arbiter_Y_7__is_done__q0 && PEG_Xvec_0__is_done__q0 && PEG_Xvec_1__is_done__q0 && PEG_Xvec_2__is_done__q0 && PEG_Xvec_3__is_done__q0 && PEG_Xvec_4__is_done__q0 && PEG_Xvec_5__is_done__q0 && PEG_Xvec_6__is_done__q0 && PEG_Xvec_7__is_done__q0 && PEG_Xvec_8__is_done__q0 && PEG_Xvec_9__is_done__q0 && PEG_Xvec_10__is_done__q0 && PEG_Xvec_11__is_done__q0 && PEG_Xvec_12__is_done__q0 && PEG_Xvec_13__is_done__q0 && PEG_Xvec_14__is_done__q0 && PEG_Xvec_15__is_done__q0 && PEG_Yvec_0__is_done__q0 && PEG_Yvec_1__is_done__q0 && PEG_Yvec_2__is_done__q0 && PEG_Yvec_3__is_done__q0 && PEG_Yvec_4__is_done__q0 && PEG_Yvec_5__is_done__q0 && PEG_Yvec_6__is_done__q0 && PEG_Yvec_7__is_done__q0 && PEG_Yvec_8__is_done__q0 && PEG_Yvec_9__is_done__q0 && PEG_Yvec_10__is_done__q0 && PEG_Yvec_11__is_done__q0 && PEG_Yvec_12__is_done__q0 && PEG_Yvec_13__is_done__q0 && PEG_Yvec_14__is_done__q0 && PEG_Yvec_15__is_done__q0 && ctrl_AP_0__is_done__q0 && ctrl_P_0__is_done__q0 && ctrl_R_0__is_done__q0 && ctrl_X_0__is_done__q0 && dot_alpha_0__is_done__q0 && dot_res_0__is_done__q0 && dot_rznew_0__is_done__q0 && left_div_0__is_done__q0 && read_A_0__is_done__q0 && read_A_1__is_done__q0 && read_A_2__is_done__q0 && read_A_3__is_done__q0 && read_A_4__is_done__q0 && read_A_5__is_done__q0 && read_A_6__is_done__q0 && read_A_7__is_done__q0 && read_A_8__is_done__q0 && read_A_9__is_done__q0 && read_A_10__is_done__q0 && read_A_11__is_done__q0 && read_A_12__is_done__q0 && read_A_13__is_done__q0 && read_A_14__is_done__q0 && read_A_15__is_done__q0 && read_digA_0__is_done__q0 && read_edge_list_ptr_0__is_done__q0 && updt_p_0__is_done__q0 && updt_r_0__is_done__q0 && updt_x_0__is_done__q0 && vecp_mux_0__is_done__q0 && wr_r_0__is_done__q0) begin
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
