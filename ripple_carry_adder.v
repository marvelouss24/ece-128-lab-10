`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2026 02:52:57 PM
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder(
    input [3:0] A,
    input [3:0] B,
    input CI,
    output [3:0] SUM,
    output CO
);

wire c1, c2, c3;
full_adder bit0(A[0], B[0], CI, SUM[0], c1);
full_adder bit1(A[1], B[1], c1, SUM[1], c2);
full_adder bit2(A[2], B[2], c2, SUM[2], c3);
full_adder bit3(A[3], B[3], c3, SUM[3], CO);
    
endmodule
