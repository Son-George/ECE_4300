module Control(
    input [5:0] in,
    input clk, rst,
    output reg [1:0] WB,
    output reg [2:0] M,
    output reg [3:0] out
    ); 
    parameter RTYPE = 6'b000000;
    
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter BEQ = 6'b000100;
    parameter NOP = 6'b100000;
    
    initial begin
        WB = 2'd0;
        M = 3'd0;
        out = 4'd0;
    end
    
    always @(posedge clk) begin
        if(rst) begin
            WB = 2'd0;
            M = 3'd0;
            out = 4'd0;
        end
        else begin
        case(in)
            RTYPE: begin
                WB = 2'b10;
                M = 3'b000;
                out = 4'b1100; 
            end
            
            LW: begin
                WB = 2'b11;
                M = 3'b010;
                out = 4'b0001; 
            end
            
            SW: begin
                WB = 2'b00;
                M = 3'b001;
                out = 4'b0001; 
            end
            
            BEQ: begin
                WB = 2'b10;
                M = 3'b000;
                out = 4'b0100; 
            end
            
            NOP: begin
                WB = 2'b00;
                M = 3'b100;
                out = 4'b0010; 
            end
            default: begin
                WB = 2'b00;
                M = 3'b000;
                out = 4'b0000; 
            end
            endcase
            end
    end
    
endmodule