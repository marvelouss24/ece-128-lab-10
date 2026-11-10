`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2026 11:06:23 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb;

reg clk;
reg rst;
reg [2:0] adr1_rom;
reg [2:0] adr2_rom;
reg [2:0] adr_ram;
wire [7:0] result;

top uut (clk, rst, adr1_rom, adr2_rom, adr_ram, result);

always #5 clk = ~clk;

initial begin 
    clk = 1'b0; rst = 1'b1; adr1_rom = 3'd0; adr2_rom = 3'd0; adr_ram = 3'd0;
    
    #20 rst = 1'b0; adr1_rom = 3'd0; adr2_rom = 3'd6; adr_ram = 3'd0;
    #80 rst = 1'b1;
    
    #20 rst = 1'b0; adr1_rom = 3'd5; adr2_rom = 3'd1; adr_ram = 3'd0;
    #80 rst = 1'b1;
    
    #20 rst = 1'b0; adr1_rom = 3'd7; adr2_rom = 3'd6; adr_ram = 3'd3;
    #80 rst = 1'b1;
    
    #20 rst = 1'b0; adr1_rom = 3'd7; adr2_rom = 3'd7; adr_ram = 3'd5;
    #80 adr_ram = 3'd7;
    
	#80 $stop;
	
end
endmodule
