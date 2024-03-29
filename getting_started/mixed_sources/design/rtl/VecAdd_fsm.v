module VecAdd_fsm
(
  ap_clk,
  ap_rst_n,
  ap_start,
  ap_ready,
  ap_done,
  ap_idle,
  Add_0__ap_start,
  Add_0__ap_ready,
  Add_0__ap_done,
  Add_0__ap_idle,
  Mmap2Stream_0__ap_start,
  Mmap2Stream_0__ap_ready,
  Mmap2Stream_0__ap_done,
  Mmap2Stream_0__ap_idle,
  Mmap2Stream_1__ap_start,
  Mmap2Stream_1__ap_ready,
  Mmap2Stream_1__ap_done,
  Mmap2Stream_1__ap_idle,
  Stream2Mmap_0__ap_start,
  Stream2Mmap_0__ap_ready,
  Stream2Mmap_0__ap_done,
  Stream2Mmap_0__ap_idle
);

  (* RS_CLK *) input ap_clk;
  (* RS_RST = "ff" *) input ap_rst_n;
  (* RS_AP_CTRL = "VecAdd.ap_start" *) input ap_start;
  (* RS_AP_CTRL = "VecAdd.ap_ready" *) output ap_ready;
  (* RS_FF = "VecAdd__ap_done" *) output ap_done;
  (* RS_FF = "VecAdd__ap_idle" *) output ap_idle;
  (* RS_AP_CTRL = "Add_0.ap_start" *) output Add_0__ap_start;
  (* RS_AP_CTRL = "Add_0.ap_ready" *) input Add_0__ap_ready;
  (* RS_FF = "Add_0__ap_done" *) input Add_0__ap_done;
  (* RS_FF = "Add_0__ap_idle" *) input Add_0__ap_idle;
  (* RS_AP_CTRL = "Mmap2Stream_0.ap_start" *) output Mmap2Stream_0__ap_start;
  (* RS_AP_CTRL = "Mmap2Stream_0.ap_ready" *) input Mmap2Stream_0__ap_ready;
  (* RS_FF = "Mmap2Stream_0__ap_done" *) input Mmap2Stream_0__ap_done;
  (* RS_FF = "Mmap2Stream_0__ap_idle" *) input Mmap2Stream_0__ap_idle;
  (* RS_AP_CTRL = "Mmap2Stream_1.ap_start" *) output Mmap2Stream_1__ap_start;
  (* RS_AP_CTRL = "Mmap2Stream_1.ap_ready" *) input Mmap2Stream_1__ap_ready;
  (* RS_FF = "Mmap2Stream_1__ap_done" *) input Mmap2Stream_1__ap_done;
  (* RS_FF = "Mmap2Stream_1__ap_idle" *) input Mmap2Stream_1__ap_idle;
  (* RS_AP_CTRL = "Stream2Mmap_0.ap_start" *) output Stream2Mmap_0__ap_start;
  (* RS_AP_CTRL = "Stream2Mmap_0.ap_ready" *) input Stream2Mmap_0__ap_ready;
  (* RS_FF = "Stream2Mmap_0__ap_done" *) input Stream2Mmap_0__ap_done;
  (* RS_FF = "Stream2Mmap_0__ap_idle" *) input Stream2Mmap_0__ap_idle;

  wire Add_0__ap_start_global__q0;
  wire Add_0__is_done__q0;
  wire Add_0__ap_done_global__q0;
  wire Add_0__ap_start;
  wire Add_0__ap_ready;
  wire Add_0__ap_done;
  wire Add_0__ap_idle;
  reg [1:0] Add_0__state;
  wire Mmap2Stream_0__ap_start_global__q0;
  wire Mmap2Stream_0__is_done__q0;
  wire Mmap2Stream_0__ap_done_global__q0;
  wire Mmap2Stream_0__ap_start;
  wire Mmap2Stream_0__ap_ready;
  wire Mmap2Stream_0__ap_done;
  wire Mmap2Stream_0__ap_idle;
  reg [1:0] Mmap2Stream_0__state;
  wire Mmap2Stream_1__ap_start_global__q0;
  wire Mmap2Stream_1__is_done__q0;
  wire Mmap2Stream_1__ap_done_global__q0;
  wire Mmap2Stream_1__ap_start;
  wire Mmap2Stream_1__ap_ready;
  wire Mmap2Stream_1__ap_done;
  wire Mmap2Stream_1__ap_idle;
  reg [1:0] Mmap2Stream_1__state;
  wire Stream2Mmap_0__ap_start_global__q0;
  wire Stream2Mmap_0__is_done__q0;
  wire Stream2Mmap_0__ap_done_global__q0;
  wire Stream2Mmap_0__ap_start;
  wire Stream2Mmap_0__ap_ready;
  wire Stream2Mmap_0__ap_done;
  wire Stream2Mmap_0__ap_idle;
  reg [1:0] Stream2Mmap_0__state;
  reg [1:0] tapa_state;
  reg [0:0] countdown;
  wire ap_start__q0;
  wire ap_done__q0;
  assign Add_0__ap_start_global__q0 = ap_start__q0;
  assign Add_0__is_done__q0 = (Add_0__state == 2'b10);
  assign Add_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Add_0__state <= 2'b00;
    end else begin
      if(Add_0__state == 2'b00) begin
        if(Add_0__ap_start_global__q0) begin
          Add_0__state <= 2'b01;
        end
      end
      if(Add_0__state == 2'b01) begin
        if(Add_0__ap_ready) begin
          if(Add_0__ap_done) begin
            Add_0__state <= 2'b10;
          end else begin
            Add_0__state <= 2'b11;
          end
        end
      end
      if(Add_0__state == 2'b11) begin
        if(Add_0__ap_done) begin
          Add_0__state <= 2'b10;
        end
      end
      if(Add_0__state == 2'b10) begin
        if(Add_0__ap_done_global__q0) begin
          Add_0__state <= 2'b00;
        end
      end
    end
  end

  assign Add_0__ap_start = (Add_0__state == 2'b01);
  assign Mmap2Stream_0__ap_start_global__q0 = ap_start__q0;
  assign Mmap2Stream_0__is_done__q0 = (Mmap2Stream_0__state == 2'b10);
  assign Mmap2Stream_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Mmap2Stream_0__state <= 2'b00;
    end else begin
      if(Mmap2Stream_0__state == 2'b00) begin
        if(Mmap2Stream_0__ap_start_global__q0) begin
          Mmap2Stream_0__state <= 2'b01;
        end
      end
      if(Mmap2Stream_0__state == 2'b01) begin
        if(Mmap2Stream_0__ap_ready) begin
          if(Mmap2Stream_0__ap_done) begin
            Mmap2Stream_0__state <= 2'b10;
          end else begin
            Mmap2Stream_0__state <= 2'b11;
          end
        end
      end
      if(Mmap2Stream_0__state == 2'b11) begin
        if(Mmap2Stream_0__ap_done) begin
          Mmap2Stream_0__state <= 2'b10;
        end
      end
      if(Mmap2Stream_0__state == 2'b10) begin
        if(Mmap2Stream_0__ap_done_global__q0) begin
          Mmap2Stream_0__state <= 2'b00;
        end
      end
    end
  end

  assign Mmap2Stream_0__ap_start = (Mmap2Stream_0__state == 2'b01);
  assign Mmap2Stream_1__ap_start_global__q0 = ap_start__q0;
  assign Mmap2Stream_1__is_done__q0 = (Mmap2Stream_1__state == 2'b10);
  assign Mmap2Stream_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Mmap2Stream_1__state <= 2'b00;
    end else begin
      if(Mmap2Stream_1__state == 2'b00) begin
        if(Mmap2Stream_1__ap_start_global__q0) begin
          Mmap2Stream_1__state <= 2'b01;
        end
      end
      if(Mmap2Stream_1__state == 2'b01) begin
        if(Mmap2Stream_1__ap_ready) begin
          if(Mmap2Stream_1__ap_done) begin
            Mmap2Stream_1__state <= 2'b10;
          end else begin
            Mmap2Stream_1__state <= 2'b11;
          end
        end
      end
      if(Mmap2Stream_1__state == 2'b11) begin
        if(Mmap2Stream_1__ap_done) begin
          Mmap2Stream_1__state <= 2'b10;
        end
      end
      if(Mmap2Stream_1__state == 2'b10) begin
        if(Mmap2Stream_1__ap_done_global__q0) begin
          Mmap2Stream_1__state <= 2'b00;
        end
      end
    end
  end

  assign Mmap2Stream_1__ap_start = (Mmap2Stream_1__state == 2'b01);
  assign Stream2Mmap_0__ap_start_global__q0 = ap_start__q0;
  assign Stream2Mmap_0__is_done__q0 = (Stream2Mmap_0__state == 2'b10);
  assign Stream2Mmap_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Stream2Mmap_0__state <= 2'b00;
    end else begin
      if(Stream2Mmap_0__state == 2'b00) begin
        if(Stream2Mmap_0__ap_start_global__q0) begin
          Stream2Mmap_0__state <= 2'b01;
        end
      end
      if(Stream2Mmap_0__state == 2'b01) begin
        if(Stream2Mmap_0__ap_ready) begin
          if(Stream2Mmap_0__ap_done) begin
            Stream2Mmap_0__state <= 2'b10;
          end else begin
            Stream2Mmap_0__state <= 2'b11;
          end
        end
      end
      if(Stream2Mmap_0__state == 2'b11) begin
        if(Stream2Mmap_0__ap_done) begin
          Stream2Mmap_0__state <= 2'b10;
        end
      end
      if(Stream2Mmap_0__state == 2'b10) begin
        if(Stream2Mmap_0__ap_done_global__q0) begin
          Stream2Mmap_0__state <= 2'b00;
        end
      end
    end
  end

  assign Stream2Mmap_0__ap_start = (Stream2Mmap_0__state == 2'b01);

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
          if(Add_0__is_done__q0 && Mmap2Stream_0__is_done__q0 && Mmap2Stream_1__is_done__q0 && Stream2Mmap_0__is_done__q0) begin
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
