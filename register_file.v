`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2026 11:06:23 AM
// Design Name: 
// Module Name: register_file
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


module register_file(clk, rst, rom_data, w, da, sa1, sa2, data1, data2);

parameter DATA_W = 4;
parameter SIZE = 2;
parameter ADDR_W = 1;

input clk, rst, w;
input [ADDR_W - 1:0] da, sa1, sa2;
input [DATA_W - 1:0] rom_data;
output [DATA_W - 1:0] data1, data2;

reg[DATA_W - 1:0] mem[0:SIZE - 1];

integer i;

always @ (posedge clk) begin
    if (rst) begin 
        for (i = 0; i < SIZE; i = i + 1) begin
            mem[i] <= 0;
        end
    end
    else begin
        if(w)
            mem[da] <= rom_data;
    end
end

assign data1 = mem[sa1];
assign data2 = mem[sa2];

endmodule
