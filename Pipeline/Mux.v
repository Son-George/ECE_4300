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
    input [31:0] a_true,
    input [31:0] b_false,
    output reg [31:0] y, //New_Address
    input PC_Select
    );
    always @(*) 
    begin
        case (PC_Select)
            //when program counter is 1, itll branch
            //when program couter is 0, ill increment + 4 to next inst and normal flow
            1'b0: y = b_false; //normal flow = program counter + 4
            1'b1: y = a_true; //branch jump 
        endcase;
    end
endmodule
