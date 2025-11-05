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
    input [31:0] pc_in, //program counter +4
    input [31:0] Instr, //instruction from memory
    input wire clk,
    input wire rst,
    output reg [31:0] pc_out, //new addy program counter +4 to ID stage
    output reg [31:0] instr_out //data, instrcution to ID stage
    );
    
    always @(posedge clk or posedge rst)
    begin
    if (rst) begin
        pc_out <= 32'd0;
        instr_out<=32'd0;
    end else begin
        pc_out <= pc_in; //store PC+4
        instr_out <= Instr; //store inst.
    end
    
end
    
endmodule
