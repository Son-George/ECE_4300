module Main(
    input [31:0] instr_IF_ID,
    input [4:0] WR, // write register 
    input [31:0] WD, // write data
    input clk, rst, RegWrite,
    input [31:0] NPC_in,
    output [1:0] WB_out,
    output [2:0] M_out,
    output [3:0] exe_out,
    output [31:0] NPC_out,
    output [31:0] WD1_out,
    output [31:0] WD2_out,
    output [31:0] Sign_out,
    output [4:0] Instr_20_16_out,
    output [4:0] Instr_15_11_out
    );
    
    wire [1:0] WB_in;
    wire [2:0] M_in;
    wire [3:0] exe_in;
    wire [31:0] RD1_in, RD2_in, Sign_in;
    wire [4:0] Instr_20_16_in, Instr_15_11_in;
    
    Register R1 (
    .reg1(instr_IF_ID[25:21]),
    .reg2(instr_IF_ID[20:16]),
    .WR(WR),
    .WB(WD), // write register, write Data
    .clk(clk),
    .rst(rst),
    .Write_Reg(RegWrite),
    .RD1(RD1_in),
    .RD2(RD2_in)
    );
    
    Control C1 (
    .in(instr_IF_ID[31:26]),
    .clk(clk),
    .rst(rst),
    .WB(WB_in),
    .M(M_in),
    .out(exe_in)
    ); 
    
    SignExt Sign1 (
    .in(instr_IF_ID[16:0]),
    .out(Sign_in)
    );
    
    Latch L1 (
    .clk(clk),
    .rst(rst),
    .WB_in(WB_in),
    .M_in(M_in),
    .Control_in(exe_in),
    .NPC_in(NPC_in),
    .WD1_in(RD1_in),
    .WD2_in(RD2_in),
    .Sign_in(Sign_in),
    .Instr_20_16_in(instr_IF_ID[20:16]),
    .Instr_15_11_in(instr_IF_ID[15:11]),
    .WB_out(WB_out),
    .M_out(M_out),
    .exe_out(exe_out),
    .NPC_out(NPC_out),
    .WD1_out(WD1_out),
    .WD2_out(WD2_out),
    .Sign_out(Sign_out),
    .Instr_20_16_out(Instr_20_16_out),
    .Instr_15_11_out(Instr_15_11_out)
    );
    
endmodule
