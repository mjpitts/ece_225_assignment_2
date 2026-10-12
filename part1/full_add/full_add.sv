module full_add
  (input [0:0] a_i
  ,input [0:0] b_i
  ,input [0:0] carry_i
  ,output [0:0] carry_o
  ,output [0:0] sum_o);

   assign carry_o = (a_i & b_i) | (a_i & carry_i) | (carry_i & b_i);
   assign sum_o = carry_i ^ a_i ^ b_i; 

endmodule
