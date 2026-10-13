module compass
  (
    input logic [0:0]  clk_i,
    input logic [0:0]  reset_i,
    input logic [1:0]  direction_i,
    input logic [0:0]  valid_i,
    output logic [0:0] sequence_detected_o
   );

   reg [1:0] state_reg;
   logic [1:0] next_w;

   always_comb begin
    if(reset_i) begin 
      sequence_detected_o = '0; 
      next_w = 0;
    end
    else begin
      case({state_reg, direction_i})
        4'b0000: begin
          sequence_detected_o = '0; 
          next_w = 2'b01;
        end
        4'b0001: begin
          sequence_detected_o = '0; 
          next_w = 2'b11;
        end
        4'b0010: begin
          sequence_detected_o = '0; 
          next_w = 2'b01;
        end
        4'b0011: begin
          sequence_detected_o = '0; 
          next_w = 2'b00;
        end
        4'b0100: begin
          sequence_detected_o = '0; 
          next_w = 2'b01;
        end
        4'b0101: begin
          sequence_detected_o = '0; 
          next_w = 2'b11;
        end
        4'b0110: begin
          sequence_detected_o = '0; 
          next_w = 2'b01;
        end
        4'b0111: begin
          sequence_detected_o = '0; 
          next_w = 2'b10;
        end
        4'b1000: begin
          sequence_detected_o = valid_i; 
          next_w = 2'b01;
        end
        4'b1001: begin
          sequence_detected_o = valid_i; 
          next_w = 2'b11;
        end
        4'b1010: begin
          sequence_detected_o = '0; 
          next_w = 2'b01;
        end
        4'b1011: begin
          sequence_detected_o = '0; 
          next_w = 2'b00;
        end
        4'b1100: begin
          sequence_detected_o = '0; 
          next_w = 2'b01;
        end
        4'b1101: begin
          sequence_detected_o = '0; 
          next_w = 2'b11;
        end
        4'b1110: begin
          sequence_detected_o = valid_i; 
          next_w = 2'b01;
        end
        4'b1111: begin
          sequence_detected_o = '0; 
          next_w = 2'b00;
        end
        default ;

      endcase
    end
   end

   always_ff @(posedge clk_i) begin
      if(reset_i) state_reg <= '0;
      else if(valid_i) state_reg <= next_w; 
   end


endmodule
