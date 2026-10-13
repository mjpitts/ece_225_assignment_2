module debounce
  #(parameter min_delay_p = 4)
   (input [0:0] clk_i
   ,input [0:0] reset_i
   ,input [0:0] button_i
   ,output [0:0] button_o);

   wire [$clog2(min_delay_p):0] delay_w;

   counter
    #(.width_p($clog2(min_delay_p)+1))
   counter_inst
   (.clk_i(clk_i),
    .reset_i(reset_i),
    .up_i(button_i),
    .down_i('0),
    .count_o(delay_w)
   );

   assign button_o = delay_w[$clog2(min_delay_p)];
   
endmodule
