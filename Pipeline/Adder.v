`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 04:21:25 PM
// Design Name: 
// Module Name: Adder
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


module Adder(
    input [31:0] pcin, //current program counter value
    output reg [31:0] pcout // program counter value + 4 
    );
    
    always @(*)
    //add 4 to currrent pc for sequential instr addy
    //32 bit or 4 byte inst.
        pcout = pcin + 32'd4; //32 bit decimal 4
endmodule
