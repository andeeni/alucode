/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seven_segment_10 (
    input [7:0] char,
    output reg [6:0] segment
  );
  
  
  
  always @* begin
    
    case (char)
      1'h0: begin
        segment = 7'h3f;
      end
      1'h1: begin
        segment = 7'h06;
      end
      2'h2: begin
        segment = 7'h5b;
      end
      2'h3: begin
        segment = 7'h4f;
      end
      3'h4: begin
        segment = 7'h66;
      end
      3'h5: begin
        segment = 7'h6d;
      end
      3'h6: begin
        segment = 7'h7d;
      end
      3'h7: begin
        segment = 7'h07;
      end
      4'h8: begin
        segment = 7'h7f;
      end
      4'h9: begin
        segment = 7'h67;
      end
      4'ha: begin
        segment = 7'h73;
      end
      4'hb: begin
        segment = 7'h77;
      end
      4'hc: begin
        segment = 7'h74;
      end
      4'hd: begin
        segment = 7'h31;
      end
      4'he: begin
        segment = 7'h79;
      end
      4'hf: begin
        segment = 7'h40;
      end
      5'h10: begin
        segment = 7'h3e;
      end
      5'h11: begin
        segment = 7'h5c;
      end
      5'h12: begin
        segment = 7'h5e;
      end
      5'h13: begin
        segment = 7'h1c;
      end
      5'h14: begin
        segment = 7'h37;
      end
      5'h15: begin
        segment = 7'h39;
      end
      5'h16: begin
        segment = 7'h71;
      end
      5'h17: begin
        segment = 7'h50;
      end
      5'h18: begin
        segment = 7'h7c;
      end
      5'h19: begin
        segment = 7'h54;
      end
      5'h1a: begin
        segment = 7'h76;
      end
      5'h1b: begin
        segment = 7'h78;
      end
      5'h1c: begin
        segment = 7'h58;
      end
      5'h1d: begin
        segment = 7'h38;
      end
      default: begin
        segment = 7'h00;
      end
    endcase
  end
endmodule
