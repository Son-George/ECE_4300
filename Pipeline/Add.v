`timescale 1ns / 1ps
/*
Adds two 32-bit inputs to output a 32-bit value.  Takes in npcout and s_extendout to 
output adder_out.  
*/
module add(
    input wire clk,
    input wire [31:0] add_in1,
    input wire [31:0] add_in2,
    output wire [31:0] add_out
    );
    //reg [31:0] sum;
    //assign sum = add_in1 + add_in2;
    always @(*) 
    begin
        add_out = add_in1 + add_in2;
    end
    
endmodule