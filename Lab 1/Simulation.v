`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 03:03:25 PM
// Design Name: 
// Module Name: Simulation
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


module Simulation();

    reg PCSrc, clk;
    reg [31:0] ExMem;
    wire [31:0] Instr, Address;
    
    TestBench sim (.clk(clk), .PCSrc(PCSrc), .ex_mem(EXMem), .if_id_instr(Instr), .if_id_addrs(Address));
    
    // creates simulation clock
    initial forever #5 clk = ~clk;
    
    initial begin
    PCSrc = 0;
    ExMem = 32'h0000FFFF;
    #8
    PCSrc = 1'b1;
    #5
    PCSrc = 1'b0;
    #30
    ExMem = 32'h0000FFFF;
    end
endmodule
