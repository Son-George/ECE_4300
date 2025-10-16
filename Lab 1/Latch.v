`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 04:21:25 PM
// Design Name: 
// Module Name: Latch
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


module Latch(
    input [31:0] Address,
    input [31:0] Instr,
    input CLK,
    output reg [31:0] New_Address,
    output reg [31:0] New_Instr
    );
    
    always @(posedge CLK)
    begin
        New_Address = Address;
        New_Instr = Instr;
    end
    
endmodule
