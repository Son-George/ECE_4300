module Register(
    input [4:0] reg1, reg2,
    input [4:0] WR, // write register
    input [31:0] WB, // write Data
    input clk, rst, Write_Reg,
    output reg [31:0] RD1, RD2 // write data 1 and 2
    );
    
    reg [31:0] REG [0:31]; //ea element is 32 bits wide and a depth of 32 words
    //always @(posedge CLK)
    initial begin
            REG[0] = 32'h002300AA;
            REG[1] = 32'h10654321;
            REG[2] = 32'h00100022;
            REG[3] = 32'h8C123456;
            REG[4] = 32'h8F123456;
            REG[5] = 32'hAD654321;
            REG[6] = 32'h60000006;
            REG[7] = 32'h13012345;
            REG[8] = 32'hAC654321;
            REG[9] = 32'h12012345;
    end
    
    always @(posedge clk) begin
        if (rst) begin
            RD1 = 32'd0;
            RD2 = 32'd0;
        end
        else begin
            if (Write_Reg) begin
                REG[WR] = WB;
            end
            
            else begin
                RD1 = REG[reg1];
                RD2 = REG[reg2];
            end
            
        end
    end
    
endmodule
