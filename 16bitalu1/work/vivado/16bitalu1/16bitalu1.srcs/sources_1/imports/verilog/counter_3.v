/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = 3
     DIV = 24
     TOP = 0
     UP = 1
*/
module counter_3 (
    input clk,
    input rst,
    output reg [2:0] value
  );
  
  localparam SIZE = 2'h3;
  localparam DIV = 5'h18;
  localparam TOP = 1'h0;
  localparam UP = 1'h1;
  
  
  reg [26:0] M_ctr_d, M_ctr_q = 1'h0;
  
  localparam MAX_VALUE = 25'h0ffffff;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    value = M_ctr_q[24+2-:3];
    if (1'h1) begin
      M_ctr_d = M_ctr_q + 1'h1;
      if (1'h0 && M_ctr_q == 25'h0ffffff) begin
        M_ctr_d = 1'h0;
      end
    end else begin
      M_ctr_d = M_ctr_q - 1'h1;
      if (1'h0 && M_ctr_q == 1'h0) begin
        M_ctr_d = 25'h0ffffff;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule
