module bin2gray
  #(parameter width_p = 5)
  (input [width_p-1 : 0] bin_i
  ,output [width_p-1 : 0] gray_o);

  assign gray_o[width_p-1] = bin_i[width_p-1];

  genvar i;

  for(i = width_p-2; i >= 0; i--) begin
    assign gray_o[i] = bin_i[i] ^ bin_i[i+1];
  end

endmodule
