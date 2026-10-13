module shift
  #(parameter width_p = 5
   /* verilator lint_off WIDTHTRUNC */
   ,parameter [width_p-1:0] reset_val_p = 0)
   (input [0:0] clk_i
   ,input [0:0] reset_i
   ,input [0:0] enable_i
   ,input [0:0] d_i
   ,input [0:0] load_i
   ,input [width_p-1:0] data_i
   ,output logic [width_p-1:0] data_o);

   always_ff @(posedge clk_i) begin
    if(reset_i) data_o <= reset_val_p;
    else if (load_i) data_o <= data_i;
    else if (enable_i) begin

      data_o[0] <= d_i;
      data_o[width_p-1:1] <= data_o[width_p-2:0];
    end
   end

endmodule
