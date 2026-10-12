module adder
  #(parameter width_p = 5)
  (input [width_p-1:0] a_i
  ,input [width_p-1:0] b_i
  ,output [width_p:0] sum_o);

  assign sum_o = a_i + b_i;

endmodule
