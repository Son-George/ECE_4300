`timescale 1ns / 1ps

module bottom_mux(
    //#(parameter BITS = 32)(
    output reg [4:0] y, //[BITS-1:0] y, Output of Multiplexer
    input wire [4:0] a, b, //[BITS-1:0] a, Input 1 of Multiplexer b, // Input 0 of Multiplexer
    input wire sel, clk// Select Input is RegDst
    );
    always @(*)
    begin
        y = sel ? a : b;
        end
endmodule // mux
