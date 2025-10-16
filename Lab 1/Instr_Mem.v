`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 04:21:25 PM
// Design Name: 
// Module Name: Instr_Mem
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


module Instr_Mem(
    input [31:0] Address,
    input CLK,
    output reg [31:0] Instr
    );
    
    always @(posedge CLK)
        begin
            Instr = Address - 1'b1;
        end
endmodule
