

module vadd_bw_fsm
(
  ap_clk,
  ap_rst_n,
  ap_start,
  ap_ready,
  ap_done,
  ap_idle,
  n,
  rmem0,
  wmem0,
  Mmap2Stream_0___n__q0,
  Mmap2Stream_0___rmem0__q0,
  Mmap2Stream_0__ap_start,
  Mmap2Stream_0__ap_ready,
  Mmap2Stream_0__ap_done,
  Mmap2Stream_0__ap_idle,
  Stream2Mmap_0___n__q0,
  Stream2Mmap_0___wmem0__q0,
  Stream2Mmap_0__ap_start,
  Stream2Mmap_0__ap_ready,
  Stream2Mmap_0__ap_done,
  Stream2Mmap_0__ap_idle,
  yshift_0___n__q0,
  yshift_0__ap_start,
  yshift_0__ap_ready,
  yshift_0__ap_done,
  yshift_0__ap_idle
);

  // pragma RS clk port=ap_clk
  // pragma RS rst port=ap_rst_n active=low
  // pragma RS ap-ctrl ap_start=ap_start ap_done=ap_done ap_idle=ap_idle ap_ready=ap_ready scalar=(rmem0|wmem0|n)
  // pragma RS ap-ctrl ap_start=Mmap2Stream_0__ap_start ap_done=Mmap2Stream_0__ap_done ap_idle=Mmap2Stream_0__ap_idle ap_ready=Mmap2Stream_0__ap_ready scalar=Mmap2Stream_0___.*
  // pragma RS ap-ctrl ap_start=Stream2Mmap_0__ap_start ap_done=Stream2Mmap_0__ap_done ap_idle=Stream2Mmap_0__ap_idle ap_ready=Stream2Mmap_0__ap_ready scalar=Stream2Mmap_0___.*
  // pragma RS ap-ctrl ap_start=yshift_0__ap_start ap_done=yshift_0__ap_done ap_idle=yshift_0__ap_idle ap_ready=yshift_0__ap_ready scalar=yshift_0___.*

  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_ready;
  output ap_done;
  output ap_idle;
  input [63:0] n;
  input [63:0] rmem0;
  input [63:0] wmem0;
  output [63:0] Mmap2Stream_0___n__q0;
  output [63:0] Mmap2Stream_0___rmem0__q0;
  output Mmap2Stream_0__ap_start;
  input Mmap2Stream_0__ap_ready;
  input Mmap2Stream_0__ap_done;
  input Mmap2Stream_0__ap_idle;
  output [63:0] Stream2Mmap_0___n__q0;
  output [63:0] Stream2Mmap_0___wmem0__q0;
  output Stream2Mmap_0__ap_start;
  input Stream2Mmap_0__ap_ready;
  input Stream2Mmap_0__ap_done;
  input Stream2Mmap_0__ap_idle;
  output [63:0] yshift_0___n__q0;
  output yshift_0__ap_start;
  input yshift_0__ap_ready;
  input yshift_0__ap_done;
  input yshift_0__ap_idle;
  wire [63:0] Mmap2Stream_0___n__q0;
  wire [63:0] Mmap2Stream_0___rmem0__q0;
  wire Mmap2Stream_0__ap_start_global__q0;
  wire Mmap2Stream_0__is_done__q0;
  wire Mmap2Stream_0__ap_done_global__q0;
  wire Mmap2Stream_0__ap_start;
  wire Mmap2Stream_0__ap_ready;
  wire Mmap2Stream_0__ap_done;
  wire Mmap2Stream_0__ap_idle;
  reg [1:0] Mmap2Stream_0__state;
  wire [63:0] Stream2Mmap_0___n__q0;
  wire [63:0] Stream2Mmap_0___wmem0__q0;
  wire Stream2Mmap_0__ap_start_global__q0;
  wire Stream2Mmap_0__is_done__q0;
  wire Stream2Mmap_0__ap_done_global__q0;
  wire Stream2Mmap_0__ap_start;
  wire Stream2Mmap_0__ap_ready;
  wire Stream2Mmap_0__ap_done;
  wire Stream2Mmap_0__ap_idle;
  reg [1:0] Stream2Mmap_0__state;
  wire [63:0] yshift_0___n__q0;
  wire yshift_0__ap_start_global__q0;
  wire yshift_0__is_done__q0;
  wire yshift_0__ap_done_global__q0;
  wire yshift_0__ap_start;
  wire yshift_0__ap_ready;
  wire yshift_0__ap_done;
  wire yshift_0__ap_idle;
  reg [1:0] yshift_0__state;
  reg [1:0] tapa_state;
  reg [0:0] countdown;
  wire ap_start__q0;
  wire ap_done__q0;
  assign Mmap2Stream_0___n__q0 = n;
  assign Mmap2Stream_0___rmem0__q0 = rmem0;
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
  assign Stream2Mmap_0___n__q0 = n;
  assign Stream2Mmap_0___wmem0__q0 = wmem0;
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
  assign yshift_0___n__q0 = n;
  assign yshift_0__ap_start_global__q0 = ap_start__q0;
  assign yshift_0__is_done__q0 = (yshift_0__state == 2'b10);
  assign yshift_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      yshift_0__state <= 2'b00;
    end else begin
      if(yshift_0__state == 2'b00) begin
        if(yshift_0__ap_start_global__q0) begin
          yshift_0__state <= 2'b01;
        end
      end
      if(yshift_0__state == 2'b01) begin
        if(yshift_0__ap_ready) begin
          if(yshift_0__ap_done) begin
            yshift_0__state <= 2'b10;
          end else begin
            yshift_0__state <= 2'b11;
          end
        end
      end
      if(yshift_0__state == 2'b11) begin
        if(yshift_0__ap_done) begin
          yshift_0__state <= 2'b10;
        end
      end
      if(yshift_0__state == 2'b10) begin
        if(yshift_0__ap_done_global__q0) begin
          yshift_0__state <= 2'b00;
        end
      end
    end
  end

  assign yshift_0__ap_start = (yshift_0__state == 2'b01);

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
          if(Mmap2Stream_0__is_done__q0 && Stream2Mmap_0__is_done__q0 && yshift_0__is_done__q0) begin
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
