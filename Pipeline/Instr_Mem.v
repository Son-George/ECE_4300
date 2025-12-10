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
    input [31:0] addr, //prorgam counter value as addy
    input clk,
    output reg [31:0] Instr //instr at the given addy
    );
    
    reg [31:0] memory [0:31]; //ea element is 32 bits wide and a depth of 32 words
    //always @(posedge CLK)
    initial begin
            memory[0] = 32'hA00000AA;
            memory[1] = 32'h10000011;
            memory[2] = 32'h20000022;
            memory[3] = 32'h30000033;
            memory[4] = 32'h40000044;
            memory[5] = 32'h50000055;
            memory[6] = 32'h60000066;
            memory[7] = 32'h70000077;
            memory[8] = 32'h80000088;
            memory[9] = 32'h90000099;
    end
    // shift divide by 4
    wire [31:0] word_addr = addr >>2;
    
    // read in
    always @(posedge clk) begin
        if (word_addr < 10)
            Instr = memory[word_addr];
        
        else
            Instr = 32'h00000000;
    end
endmodule
