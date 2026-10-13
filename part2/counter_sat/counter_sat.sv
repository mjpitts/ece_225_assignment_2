module counter_sat
  #(parameter width_p = 4,
    /* verilator lint_off WIDTHTRUNC */
    parameter [width_p-1:0] reset_val_p = '0,
    /* verilator lint_off WIDTHTRUNC */
    parameter [width_p-1:0] sat_val_p = '0
    )
   (input [0:0] clk_i
   ,input [0:0] reset_i
   ,input [0:0] up_i
   ,input [0:0] down_i
   ,output logic [width_p-1:0] count_o);


   always_ff @(posedge clk_i) begin
    if(reset_i) count_o <= reset_val_p;
    else if(up_i & down_i | (sat_val_p == '0)) count_o <= count_o;
    else begin
      if(count_o == sat_val_p) count_o <= count_o - {{width_p-1{1'b0}}, down_i};        
      else if(count_o == '0)        count_o <= count_o + {{width_p-1{1'b0}}, up_i};
      else   count_o <= count_o + {{width_p-1{1'b0}}, up_i} - {{width_p-1{1'b0}}, down_i};
    end 
   end

endmodule
