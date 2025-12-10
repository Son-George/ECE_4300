`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 04:21:25 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input [31:0] PC_in,//from mux
    input clk,
    output reg [31:0] PC_out, //current pc value in 32 bits
    input wire rst
    );
    
    always @(posedge clk or posedge rst)
    begin
    if (rst)
        PC_out <= 32'd0;
    else
         PC_out <= PC_in; //update with next value
    end
    
endmodule
