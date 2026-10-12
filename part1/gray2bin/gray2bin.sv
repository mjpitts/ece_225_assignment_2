module gray2bin
  #(parameter width_p = 5)
   (input [width_p-1 : 0] gray_i
    ,output [width_p-1 : 0] bin_o);

    assign bin_o[width_p-1] = gray_i[width_p-1];

    genvar i;

    for(i = 1; i <= width_p-1; i++) begin
      assign bin_o[width_p-1-i] = ^gray_i[width_p-1:width_p-1-i];
    end


endmodule
