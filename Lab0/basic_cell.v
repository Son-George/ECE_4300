`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// basic_cell
//////////////////////////////////////////////////////////////////////////////////


module basic_cell(
    output reg Q,
    input CLR, CLK,
    input [1:0] Sel,
    input [3:0] I
    );
    
    wire data;
    
    // D Flip FLop
    always @ (posedge CLK or negedge CLR)
    if(!CLR)
        Q <= 0;
    else
        Q <= data;
    
    //  Mux
    assign data = I[Sel];
    
endmodule
