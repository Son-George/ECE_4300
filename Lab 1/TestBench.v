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
    input wire clk, rst, ex_mem_pc_src,
    input wire [31:0] ex_mem_npc,
    output wire [31:0] id_instr, id_addr
    );
    wire [31:0] mux_out, pc_out, instr_out, adder_out, mem_out;

    Mux m1 (.a_true(ex_mem_npc),
            .b_false(adder_out), 
            .y(mux_out), 
            .PC_Select(ex_mem_pc_src));

    PC pc1 (.PC_in(mux_out),
            .clk(clk),
            .rst(rst),
            .PC_out(pc_out));

    Adder add1 (.pcin(pc_out), 
                .pcout(adder_out));

    Instr_Mem instr1 (.addr(pc_out), 
                      .clk(clk),
                      .Instr(mem_out));

    Latch L1 (.pc_in(adder_out), 
              .Instr(mem_out), 
              .clk(clk),
              .rst(rst) ,
              .pc_out(id_instr), 
              .instr_out(id_addr));

endmodule
