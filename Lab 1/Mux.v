`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 04:21:25 PM
// Design Name: 
// Module Name: Mux
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


module Mux(
    input [31:0] Increment,
    input [31:0] PC,
    output reg [31:0] New_Address,
    input PC_Select
    );
    always @(*) 
    bgein
        case (PC_Select)
            1'b0: New_Address <= Increment;
            1'b1: New_Address <= PC;
        endcase;
    end
endmodule
