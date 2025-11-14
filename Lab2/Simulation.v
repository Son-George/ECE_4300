module Simulation();

    reg clk, rst, RegWrite;
    
    reg [4:0] wb_latch;
    
    reg [31:0] wb_mux,
               NPC_in,
               instr_IF_ID;
               
    wire [1:0] Latch_WB;
    wire [2:0] Latch_mem;
    wire [3:0] Latch_execute;    
    wire [31:0] Latch_NPC,
                Latch_RD1,
                Latch_RD2,
                Latch_Sign_Ext;
    wire [4:0] Latch_Instr_2016,
               Latch_Instr_1511;
    
    
    
Main sim ( 
    .instr_IF_ID(instr_IF_ID),
    .WR(wb_latch), // write register 
    .WD(wb_mux), // write data
    .clk(clk),
    .rst(rst),
    .RegWrite(RegWrite),
    .NPC_in(NPC_in),
    .WB_out(Latch_WB),
    .M_out(Latch_mem),
    .exe_out(Latch_execute),
    .NPC_out(Latch_NPC),
    .WD1_out(Latch_RD1),
    .WD2_out(Latch_RD2),
    .Sign_out(Latch_Sign_Ext),
    .Instr_20_16_out(Latch_Instr_2016),
    .Instr_15_11_out(Latch_Instr_1511)
    );
    
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
    
    
    initial begin
        // first reset everything
        rst = 1;
        RegWrite = 0;
        wb_latch = 5'd2;
        wb_mux = 32'h64;
        NPC_in = 32'h00000001;
        // Add Sv0, Sa1, Sa0
        instr_IF_ID = 32'h00A41020;
        
        #2 // turn off the reset
        rst = 0;
        
        #4// Decode  BEQ
        NPC_in = 32'h00000002;
        instr_IF_ID = 32'h10000008;
        
        #4 // Decode LW
        NPC_in = 32'h00000003;
        instr_IF_ID = 32'h8C820002;
        
        #4// Decode  Sw
        NPC_in = 32'h00000004;
        instr_IF_ID = 32'hAC820002;
        
        #4// Decode  write to reg
        NPC_in = 32'h00000005;
        RegWrite = 1'b1;
        
        #4 // ADD Sv0, Sv0, Sv0
        NPC_in = 32'h00421020;
        instr_IF_ID = 32'h00000006;
        
    end
        
        
        
    
    
endmodule
