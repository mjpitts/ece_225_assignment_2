module konami
   (input [0:0] clk_i
   ,input [0:0] reset_i
   ,input [0:0] up_i
   ,input [0:0] unup_i
   ,input [0:0] down_i
   ,input [0:0] undown_i
   ,input [0:0] left_i
   ,input [0:0] unleft_i
   ,input [0:0] right_i
   ,input [0:0] unright_i
   ,input [0:0] b_i
   ,input [0:0] unb_i
   ,input [0:0] a_i
   ,input [0:0] una_i
   ,input [0:0] start_i
   ,input [0:0] unstart_i
   ,output logic [0:0] cheat_code_unlocked_o);

   reg [3:0] state_reg;
   reg [6:0] pressed_reg;
   wire [6:0] button_bus_w = {unstart_i, una_i, unb_i, unright_i, unleft_i, undown_i, unup_i};


   always_ff @(posedge clk_i) begin

      if(reset_i) begin
         state_reg <= '0;
         cheat_code_unlocked_o <= '0;
      end

      if(start_i) pressed_reg[6] <= 1'b1;
      if(a_i) pressed_reg[5] <= 1'b1;
      if(b_i) pressed_reg[4] <= 1'b1;
      if(right_i) pressed_reg[3] <= 1'b1;
      if(left_i) pressed_reg[2] <= 1'b1;
      if(down_i) pressed_reg[1] <= 1'b1;
      if(up_i) pressed_reg[0] <= 1'b1;


      // we will assume that no utton starts off pressed.
      case(state_reg)
         4'b0000: begin
            cheat_code_unlocked_o <= 0;
            // Press up
            if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press any other button
            else if(|button_bus_w[6:1]) state_reg <= 4'b0000;
         end
         4'b0001: begin
            cheat_code_unlocked_o <= 0;
            // Press up
            if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0010;
            end
            // Press any other button
            else if(|button_bus_w[6:1]) state_reg <= 4'b0000;
         end
         4'b0010: begin
            // Press down
            if(button_bus_w[1] & pressed_reg[1]) begin
               pressed_reg[1] <= 0;
               state_reg <= 4'b0011;
            end
            // Another Up still means two ups in a row 
            else if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press any other button
            else if(|button_bus_w[6:2]) state_reg <= 4'b0000;
         end
         4'b0011: begin
            // Press down
            if(button_bus_w[1] & pressed_reg[1]) begin
               pressed_reg[1] <= 0;
               state_reg <= 4'b0100;
            end
            // Up always takes us back to state 1
            else if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press any other button
            else if(|button_bus_w[6:2]) state_reg <= 4'b0000;
         end
         4'b0100: begin
            // Press left
            if(button_bus_w[2] & pressed_reg[2]) begin
               pressed_reg[2] <= 0;
               state_reg <= 4'b0101;
            end
            // Up always takes us back to state 1
            else if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press any other button
            else if(|{button_bus_w[6:3], button_bus_w[1]}) state_reg <= 4'b0000;
         end
         4'b0101: begin
            // Press right
            if(button_bus_w[3] & pressed_reg[3]) begin
               pressed_reg[3] <= 0;
               state_reg <= 4'b0110;
            end
            // Up always takes us back to state 1
            else if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press any other button
            else if(|{button_bus_w[6:4], button_bus_w[2:1]}) state_reg <= 4'b0000;
         end
         4'b0110: begin
            // Press left
            if(button_bus_w[2] & pressed_reg[2]) begin
               pressed_reg[2] <= 0;
               state_reg <= 4'b0111;
            end
            // Up always takes us back to state 1
            else if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press any other button
            else if(|{button_bus_w[6:3], button_bus_w[1]}) state_reg <= 4'b0000;
         end
         4'b0111: begin
            // Press right
            if(button_bus_w[3] & pressed_reg[3]) begin
               pressed_reg[3] <= 0;
               state_reg <= 4'b1000;
            end
            // Up always takes us back to state 1
            else if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press any other button
            else if(|{button_bus_w[6:4], button_bus_w[2:1]}) state_reg <= 4'b0000;
         end
         4'b1000: begin
            // Press B
            if(button_bus_w[4] & pressed_reg[4]) begin
               pressed_reg[4] <= 0;
               state_reg <= 4'b1001;
            end
            // Up always takes us back to state 1
            else if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press any other button
            else if(|{button_bus_w[6:5], button_bus_w[3:1]}) state_reg <= 4'b0000;
         end
         4'b1001: begin
            // Press A
            if(button_bus_w[5] & pressed_reg[5]) begin
               pressed_reg[5] <= 0;
               state_reg <= 4'b1010;
            end
            // Up always takes us back to state 1
            else if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press any other button
            else if(|{button_bus_w[6], button_bus_w[4:1]}) state_reg <= 4'b0000;
         end
         4'b1010: begin
            // Press Start
            if(button_bus_w[6] & pressed_reg[6]) begin
               pressed_reg[6] <= 0;
               state_reg <= 4'b1011;
               cheat_code_unlocked_o <= '1;
            end
            // Up always takes us back to state 1
            else if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press any other button
            else if(|button_bus_w[5:1]) state_reg <= 4'b0000;
         end
         // Final State
         4'b1011: begin
            //Set Cheats
            cheat_code_unlocked_o <= '0;
            // Press Up, goes back to 2nd state
            if(button_bus_w[0] & pressed_reg[0]) begin
               pressed_reg[0] <= 0;
               state_reg <= 4'b0001;
            end
            // Press anyother button
            else if(|button_bus_w[6:1]) state_reg <= 4'b0000;
         end
         default: ;
      endcase

   end

endmodule

