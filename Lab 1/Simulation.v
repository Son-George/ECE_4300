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

reg clk, rst;
    reg [31:0] ex_mem_npc; //branch addy
    reg ex_mem_pc_src; //cntrl signal for branch (0 = seq, 1 = branch)
    wire [31:0] Instr, //instr output from latch
                Address; //pc + 4 from latch
    
    TestBench sim (.clk(clk), .rst(rst),
                   .ex_mem_pc_src(ex_mem_pc_src), 
                   .ex_mem_npc(ex_mem_npc), 
                   .id_instr(Instr), 
                   .id_addr(Address));
    
    // creates simulation clock
    initial forever #5 clk = ~clk;
    
    initial begin
    clk = 0; rst = 1;
    ex_mem_pc_src = 0;
    ex_mem_npc = 32'h00000000;
    
    //release rst after delay
    #10 rst = 0;
    
    //normal pc increment
    #40;
    
    //branch to new addy
    ex_mem_pc_src = 1;
    ex_mem_npc = 32'h00000004;
    #10 ex_mem_pc_src = 0;
    
    //continue seq flow
    #40;
    
//    //branch to new addy
//    ex_mem_pc_src = 1;
//    ex_mem_npc = 32'h00000080;
//    #10 ex_mem_pc_src = 0;
    
    #60;
    $stop;
    
    end
endmodule
