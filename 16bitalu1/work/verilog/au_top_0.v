/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [16-1:0] M_alu_out;
  wire [1-1:0] M_alu_n;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  reg [6-1:0] M_alu_alufn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  alucombine_1 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .out(M_alu_out),
    .n(M_alu_n),
    .z(M_alu_z),
    .v(M_alu_v)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam START_state = 5'd0;
  localparam INPUTA_state = 5'd1;
  localparam INPUTB_state = 5'd2;
  localparam CALCULATE_state = 5'd3;
  localparam AUTO_state = 5'd4;
  localparam TESTADDER1_state = 5'd5;
  localparam TESTADDER2_state = 5'd6;
  localparam TESTADDER3_state = 5'd7;
  localparam TESTADDER4_state = 5'd8;
  localparam TESTADDER5_state = 5'd9;
  localparam TESTADDER6_state = 5'd10;
  localparam TESTADDER7_state = 5'd11;
  localparam TESTADDER8_state = 5'd12;
  localparam TESTADDER9_state = 5'd13;
  localparam TESTADDER10_state = 5'd14;
  localparam TESTBOOL1_state = 5'd15;
  localparam TESTBOOL2_state = 5'd16;
  localparam TESTBOOL3_state = 5'd17;
  localparam TESTSHIFT1_state = 5'd18;
  localparam TESTSHIFT2_state = 5'd19;
  localparam TESTSHIFT3_state = 5'd20;
  localparam TESTSHIFT4_state = 5'd21;
  localparam TESTSHIFT5_state = 5'd22;
  localparam TESTSHIFT6_state = 5'd23;
  localparam TESTCMP1_state = 5'd24;
  localparam TESTCMP2_state = 5'd25;
  localparam TESTCMP3_state = 5'd26;
  localparam TESTCMP4_state = 5'd27;
  localparam TESTCMP5_state = 5'd28;
  localparam TESTCMP6_state = 5'd29;
  localparam PASS_state = 5'd30;
  localparam ERROR_state = 5'd31;
  
  reg [4:0] M_state_d, M_state_q = START_state;
  reg [15:0] M_inputA_d, M_inputA_q = 1'h0;
  reg [15:0] M_inputB_d, M_inputB_q = 1'h0;
  reg [26:0] M_counter_d, M_counter_q = 1'h0;
  wire [3-1:0] M_ctr_value;
  counter_3 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [32-1:0] M_seg_values;
  sevensegment_display_4 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_inputB_d = M_inputB_q;
    M_inputA_d = M_inputA_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    io_led[16+7+0-:1] = io_dip[16+7+0-:1];
    M_alu_a = M_inputA_q;
    M_alu_b = M_inputB_q;
    M_alu_alufn = 1'h0;
    M_seg_values = 32'h00000000;
    
    case (M_state_q)
      START_state: begin
        M_seg_values = 32'h050d0b0d;
        if (io_button[0+0-:1] == 1'h1) begin
          M_state_d = INPUTA_state;
        end
      end
      INPUTA_state: begin
        M_seg_values = 32'h0b0f0f0f;
        io_led[8+0+7-:8] = io_dip[8+7-:8];
        io_led[0+0+7-:8] = io_dip[0+7-:8];
        M_inputA_d = {io_dip[8+0+7-:8], io_dip[0+0+7-:8]};
        if (io_button[2+0-:1] == 1'h1) begin
          M_state_d = INPUTB_state;
        end else begin
          if (io_button[3+0-:1] == 1'h1) begin
            M_state_d = START_state;
          end
        end
      end
      INPUTB_state: begin
        M_seg_values = 32'h080f0f0f;
        io_led[8+0+7-:8] = io_dip[8+7-:8];
        io_led[0+0+7-:8] = io_dip[0+7-:8];
        M_inputB_d = {io_dip[8+0+7-:8], io_dip[0+0+7-:8]};
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = CALCULATE_state;
        end else begin
          if (io_button[3+0-:1] == 1'h1) begin
            M_state_d = START_state;
          end
        end
      end
      CALCULATE_state: begin
        M_seg_values = 32'h150b1d15;
        M_alu_a = M_inputA_q;
        M_alu_b = M_inputB_q;
        M_alu_alufn = io_dip[16+0+5-:6];
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
        if (io_button[3+0-:1] == 1'h1) begin
          M_state_d = START_state;
        end
      end
      AUTO_state: begin
        M_seg_values = 32'h0b100d00;
      end
      TESTADDER1_state: begin
        M_seg_values = 32'h0b121201;
        M_alu_a = 16'h0003;
        M_alu_b = 16'h4001;
        M_alu_alufn = 6'h00;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTADDER2_state: begin
        M_seg_values = 32'h0b121202;
        M_alu_a = 16'h0003;
        M_alu_b = 16'hbc0f;
        M_alu_alufn = 6'h00;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTADDER3_state: begin
        M_seg_values = 32'h0b121203;
        M_alu_a = 16'h0000;
        M_alu_b = 16'h0000;
        M_alu_alufn = 6'h00;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTADDER4_state: begin
        M_seg_values = 32'h0b121204;
        M_alu_a = 16'hbc0f;
        M_alu_b = 16'h8001;
        M_alu_alufn = 6'h00;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTADDER5_state: begin
        M_seg_values = 32'h05131801;
        M_alu_a = 16'h7fff;
        M_alu_b = 16'h00ff;
        M_alu_alufn = 6'h01;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTADDER6_state: begin
        M_seg_values = 32'h05131802;
        M_alu_a = 16'h0001;
        M_alu_b = 16'h0003;
        M_alu_alufn = 6'h01;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTADDER7_state: begin
        M_seg_values = 32'h05131803;
        M_alu_a = 16'h7fff;
        M_alu_b = 16'h7fff;
        M_alu_alufn = 6'h01;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTADDER8_state: begin
        M_seg_values = 32'h14130101;
        M_alu_a = 16'h4001;
        M_alu_b = 16'h0003;
        M_alu_alufn = 6'h02;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTADDER9_state: begin
        M_seg_values = 32'h14130102;
        M_alu_a = 16'h0001;
        M_alu_b = 16'hffff;
        M_alu_alufn = 6'h02;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTADDER10_state: begin
        M_seg_values = 32'h14130103;
        M_alu_a = 16'hffff;
        M_alu_b = 16'hfff8;
        M_alu_alufn = 6'h02;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTBOOL1_state: begin
        M_seg_values = 32'h0b191201;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h18;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTBOOL2_state: begin
        M_seg_values = 32'h0017010f;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h1e;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTBOOL3_state: begin
        M_seg_values = 32'h1a111701;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h16;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTCMP1_state: begin
        M_seg_values = 32'h151c0901;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h33;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTCMP2_state: begin
        M_seg_values = 32'h151c0902;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h5555;
        M_alu_alufn = 6'h33;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTCMP3_state: begin
        M_seg_values = 32'h15011b01;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h35;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0001;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTCMP4_state: begin
        M_seg_values = 32'h15011b02;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h5557;
        M_alu_alufn = 6'h35;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0001;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTCMP5_state: begin
        M_seg_values = 32'h15011c01;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h2aab;
        M_alu_alufn = 6'h37;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0001;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTCMP6_state: begin
        M_seg_values = 32'h15011c02;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h5557;
        M_alu_alufn = 6'h37;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_b = 16'h0001;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        io_led[16+0+0-:1] = M_alu_n;
        io_led[16+1+0-:1] = M_alu_z;
        io_led[16+2+0-:1] = M_alu_v;
      end
      TESTSHIFT1_state: begin
        M_seg_values = 32'h050c0101;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h000a;
        M_alu_alufn = 6'h20;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_a = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT2_state: begin
        M_seg_values = 32'h050c0102;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h0005;
        M_alu_alufn = 6'h20;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_a = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT3_state: begin
        M_seg_values = 32'h050c2301;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h000a;
        M_alu_alufn = 6'h21;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_a = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT4_state: begin
        M_seg_values = 32'h05122302;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h0005;
        M_alu_alufn = 6'h21;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_a = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT5_state: begin
        M_seg_values = 32'h05231701;
        M_alu_a = 16'h5555;
        M_alu_b = 16'h000a;
        M_alu_alufn = 6'h23;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_a = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      TESTSHIFT6_state: begin
        M_seg_values = 32'h05231702;
        M_alu_a = 16'haaaa;
        M_alu_b = 16'h0005;
        M_alu_alufn = 6'h23;
        if (io_dip[16+7+0-:1] == 1'h1) begin
          M_alu_a = 16'h0000;
          M_alu_a = 16'h0000;
        end
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
      end
      PASS_state: begin
        M_seg_values = 32'h0a0b0505;
      end
      ERROR_state: begin
        M_seg_values = 32'h0e17170f;
      end
    endcase
    if (M_counter_q[0+26-:27] == 1'h0) begin
      
      case (M_state_q)
        START_state: begin
          if (io_button[4+0-:1] == 1'h1) begin
            M_state_d = AUTO_state;
          end
        end
        AUTO_state: begin
          M_state_d = TESTADDER1_state;
        end
        TESTADDER1_state: begin
          if (M_alu_out == 16'h4004) begin
            M_state_d = TESTADDER2_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTADDER2_state: begin
          if (M_alu_out == 16'hbc12) begin
            M_state_d = TESTADDER3_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTADDER3_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTADDER4_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTADDER4_state: begin
          if (M_alu_out == 16'h3c10) begin
            M_state_d = TESTADDER5_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTADDER5_state: begin
          if (M_alu_out == 16'h7f00) begin
            M_state_d = TESTADDER6_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTADDER6_state: begin
          if (M_alu_out == 16'hfffe) begin
            M_state_d = TESTADDER7_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTADDER7_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTADDER8_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTADDER8_state: begin
          if (M_alu_out == 16'hc003) begin
            M_state_d = TESTADDER9_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTADDER9_state: begin
          if (M_alu_out == 16'hffff) begin
            M_state_d = TESTADDER10_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTADDER10_state: begin
          if (M_alu_out == 16'h0008) begin
            M_state_d = TESTBOOL1_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTBOOL1_state: begin
          if (M_alu_out == 16'h0001) begin
            M_state_d = TESTBOOL2_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTBOOL2_state: begin
          if (M_alu_out == 16'h7fff) begin
            M_state_d = TESTBOOL3_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTBOOL3_state: begin
          if (M_alu_out == 16'h7ffe) begin
            M_state_d = TESTCMP1_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTCMP1_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTCMP2_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTCMP2_state: begin
          if (M_alu_out == 16'h0001) begin
            M_state_d = TESTCMP3_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTCMP3_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTCMP4_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTCMP4_state: begin
          if (M_alu_out == 16'h0001) begin
            M_state_d = TESTCMP5_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTCMP5_state: begin
          if (M_alu_out == 16'h0000) begin
            M_state_d = TESTCMP6_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTCMP6_state: begin
          if (M_alu_out == 16'h0001) begin
            M_state_d = TESTSHIFT1_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTSHIFT1_state: begin
          if (M_alu_out == 16'h5400) begin
            M_state_d = TESTSHIFT2_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTSHIFT2_state: begin
          if (M_alu_out == 16'haaa0) begin
            M_state_d = TESTSHIFT3_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTSHIFT3_state: begin
          if (M_alu_out == 16'h0015) begin
            M_state_d = TESTSHIFT4_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTSHIFT4_state: begin
          if (M_alu_out == 16'h02aa) begin
            M_state_d = TESTSHIFT5_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTSHIFT5_state: begin
          if (M_alu_out == 16'h0015) begin
            M_state_d = TESTSHIFT6_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        TESTSHIFT6_state: begin
          if (M_alu_out == 16'hfd55) begin
            M_state_d = PASS_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
        PASS_state: begin
          if (M_counter_q == 1'h0) begin
            M_state_d = START_state;
          end
        end
        ERROR_state: begin
          if (M_counter_q == 1'h0) begin
            M_state_d = START_state;
          end
        end
      endcase
    end
    M_counter_d = M_counter_q + 1'h1;
  end
  
  always @(posedge clk) begin
    M_inputA_q <= M_inputA_d;
    M_inputB_q <= M_inputB_d;
    M_counter_q <= M_counter_d;
    M_state_q <= M_state_d;
  end
  
endmodule
