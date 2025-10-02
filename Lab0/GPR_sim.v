`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 01:02:01 PM
// Design Name: 
// Module Name: Simulation
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


module Simulation();

    reg [3:0] D;
    reg [1:0] S;
    reg L_in, R_in, CLK = 0, CLR;
    wire [3:0] Q;
    
    GPR dut (Q, S, D, CLR, CLK, L_in, R_in);
    
    //create simulation clock 
    initial forever #5 CLK = ~CLK;
    
    initial begin
    S = 0; D = 4'b1100;     //clear
    CLR = 0; L_in = 0; R_in = 0; // clear
    
    #10 S = 3; CLR = 1; //Parallel load
    #10 S = 1;          //Shift Right
    #10 S = 2;          //Shift Left
    #10 S = 1; L_in = 1;//Shift Right inserting '1'
    #10 S = 1; R_in = 1;//Shift Left Inserting '1'
    
    end
    
    
endmodule
