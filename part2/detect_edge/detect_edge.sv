module detect_edge
   (input [0:0] clk_i
    // reset_i will go low at least one cycle before a button is pushed.
   ,input logic [0:0] reset_i
   ,input [0:0] button_i
    // Should go high for 1 cycle, after a positive edge
   ,output logic [0:0] button_o
    // Should go high for 1 cycle, after a negative edge
   ,output logic [0:0] unbutton_o
   );

   wire [1:0] data_w;

   shift
      #(.width_p(2))
   shift_inst
   (.clk_i(clk_i),
   .reset_i(reset_i),
   .enable_i('1),
   .d_i(button_i),
   .load_i('0),
   .data_i('0),
   .data_o(data_w)
   );

   assign button_o = (~data_w[1] & data_w[0]);
   assign unbutton_o = (data_w[1] & ~data_w[0]);

endmodule
