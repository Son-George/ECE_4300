module Latch(
    input clk, rst,
    input [1:0] WB_in,
    input [2:0] M_in,
    input [3:0] Control_in,
    input [31:0] NPC_in,
    input [31:0] WD1_in,
    input [31:0] WD2_in,
    input [31:0] Sign_in,
    input [4:0] Instr_20_16_in,
    input [4:0] Instr_15_11_in,
    output reg [1:0] WB_out,
    output reg [2:0] M_out,
    output reg [3:0] exe_out,
    output reg [31:0] NPC_out,
    output reg [31:0] WD1_out,
    output reg [31:0] WD2_out,
    output reg [31:0] Sign_out,
    output reg [4:0] Instr_20_16_out,
    output reg [4:0] Instr_15_11_out
    );
    
    always @(posedge clk) begin
        if(rst) begin
            WB_out = 2'd0;
            M_out = 3'd0;
            exe_out = 4'd0;
            NPC_out = 32'd0;
            WD1_out = 32'd0;
            WD2_out = 32'd0;
            Sign_out = 32'd0;
            Instr_20_16_out = 32'd0;
            Instr_15_11_out = 32'd0;
        end
        
        else begin
            WB_out = WB_in;
            M_out = M_in;
            exe_out = Control_in;
            NPC_out = NPC_in;
            WD1_out = WD1_in;
            WD2_out = WD2_in;
            Sign_out = Sign_in;
            Instr_20_16_out = Instr_20_16_in;
            Instr_15_11_out = Instr_15_11_in;
        end
        
            
    end
    
endmodule