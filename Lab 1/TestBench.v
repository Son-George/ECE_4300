`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 02:06:43 PM
// Design Name: 
// Module Name: TestBench
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


module TestBench(
    input clk, PCSrc,
    input [31:0] ex_mem,
    output wire [31:0] if_id_instr, if_id_addrs
    );
    wire [31:0] mux_out, pc_out, instr_out, adder_out, instr_out;
    
    Mux m1 (.Increment(adder_out), .PC(ex_mem), .New_Address(mux_out), .PC_Select(PCSrc));
    
    PC pc1 (.PC_in(mux_out), .CLK(clk), .PC_out(pc_out));
    
    Adder add1 (.Instr(pc_out), .New_Instr(adder_out));
    
    Instr_Mem instr1 (.Address(pc_out), .CLK(clk), .Instr(instr_out));
    
    Latch L1 (.Address(adder_out), .Instr(instr_out), .CLK(clk), .New_Address(if_id_instr), New_Instr(if_id_addrs));
    
endmodule
