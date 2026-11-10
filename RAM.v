`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2026 11:06:23 AM
// Design Name: 
// Module Name: RAM
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


module RAM(clk, rst, w, product, adr_ram, result);

parameter DATA_W = 8;
parameter SIZE = 8;
parameter ADDR_W = 3;

input clk, rst, w;
input [ADDR_W - 1:0] adr_ram;
input [DATA_W - 1:0] product;
output reg [DATA_W - 1:0] result;

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
            mem[adr_ram] <= product;
        else
            result <= mem[adr_ram];
    end 
end

endmodule

