module hex2ssd
  (input [3:0] hex_i
  ,output logic [6:0] ssd_o
  );

  always_comb begin
  case(hex_i)
    4'b0000: ssd_o = ~(7'b0111111);
    4'b0001: ssd_o = ~(7'b0000110);
    4'b0010: ssd_o = ~(7'b1011011);
    4'b0011: ssd_o = ~(7'b1001111);
    4'b0100: ssd_o = ~(7'b1100110);
    4'b0101: ssd_o = ~(7'b1101101);
    4'b0110: ssd_o = ~(7'b1111101);
    4'b0111: ssd_o = ~(7'b0000111);
    4'b1000: ssd_o = ~(7'b1111111);
    4'b1001: ssd_o = ~(7'b1100111);
    4'b1010: ssd_o = ~(7'b1110111);
    4'b1011: ssd_o = ~(7'b1111100);
    4'b1100: ssd_o = ~(7'b0111001);
    4'b1101: ssd_o = ~(7'b1011110);
    4'b1110: ssd_o = ~(7'b1111001);
    4'b1111: ssd_o = ~(7'b1110001);
    default: ssd_o = ~(7'b0000000);
  endcase
  end


endmodule
