`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////
// Module Name: GPR

// 
//////////////////////////////////////////////////////////////////////////////////


module GPR(
    output [3:0] Q,
    input [3:0] S,
    input [3:0] D,
    input CLR,
    input CLK,
    input L_in,
    input R_in
    );
    
    
    basic_cell cell3(Q[3], CLR, CLK, S, {D[3], Q[2], L_in, Q[3]});
    basic_cell cell2(Q[2], CLR, CLK, S, {D[2], Q[1], Q[3], Q[2]});
    basic_cell cell1(Q[1], CLR, CLK, S, {D[1], Q[0], Q[2], Q[1]});
    basic_cell cell0(Q[0], CLR, CLK, S, {D[0], R_in, Q[1], Q[0]});
endmodule
