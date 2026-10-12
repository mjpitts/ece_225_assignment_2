module mux2
  (input [0:0] a_i
  ,input [0:0] b_i
  ,input [0:0] select_i
  ,output [0:0] c_o);

  assign c_o = select_i ? b_i : a_i;

endmodule
