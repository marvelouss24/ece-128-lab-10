`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2026 11:06:23 AM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    input [2:0] adr1_rom,
    input [2:0] adr2_rom,
    input [2:0] adr_ram,
    output [7:0] result
);

wire w, da, sa1, sa2, w_r;
wire [2:0] rom_adr;
control_unit fsm (clk, rst, adr1_rom, adr2_rom, w, da, sa1, sa2, w_r, rom_adr);

wire [3:0] rom_data;
ROM rom (rom_adr, rom_data);

wire [3:0] data1, data2;
register_file rf (clk, rst, rom_data, w, da, sa1, sa2, data1, data2);

wire [7:0] product;
multiplier multiplier (data1, data2, product);

RAM ram (clk, rst, w_r, product, adr_ram, result);

endmodule
