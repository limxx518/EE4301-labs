`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2018 08:30:25
// Design Name: 
// Module Name: Control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Control(input Rb, reset, clk, input[3:0] sum, output roll, win, lose, base);

    reg[2:0] state = 3'b0, nextState = 3'b0;
    reg[3:0] pastSum;
    wire load;
    
    localparam Base = 3'b000;
    localparam firstRoll = 3'b001;
    localparam passStage = 3'b010;
    localparam subsequentRoll = 3'b011;
    localparam Win = 3'b100;
    localparam Lose = 3'b101;
    
    //state logic
    always@(posedge clk)begin
        state <= nextState;
    if(load) 
        pastSum <= sum;
    end
    
        
    //next state logic
    always@(posedge clk)begin
    if(reset)
        nextState = Base;
    else begin
    case(state)
    Base: if(Rb) nextState = firstRoll;
          else nextState = Base;
    firstRoll: if(Rb) nextState = firstRoll;
               else begin
               if (sum == 7 | sum == 11) nextState = Win;
               else if (sum == 2 | sum == 3 | sum == 12) nextState = Lose;
               else 
               nextState = passStage; 
               end
    passStage: if(Rb) nextState = subsequentRoll;
               else nextState = passStage;
    subsequentRoll: if(Rb) nextState <= subsequentRoll;
                    else begin
                    if(sum == 7) nextState = Lose;
                    else if(pastSum == sum) nextState = Win;
                    else 
                    nextState = passStage;
                    end
     Win: if(reset) nextState = Base;
          else nextState = Win;
     Lose: if(reset) nextState = Base;
           else nextState = Lose;
     endcase
     end
     end
     
     assign roll = (state==firstRoll & Rb) | (state==subsequentRoll & Rb);
     assign load = (nextState==passStage & state==firstRoll);
     assign base = (state==Base);
          
     //output logic
     assign win = (state == Win);
     assign lose = (state == Lose); 
               
endmodule
