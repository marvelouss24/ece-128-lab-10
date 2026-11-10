`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2026 11:06:23 AM
// Design Name: 
// Module Name: ROM
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


module ROM(
    input [2:0] rom_adr,
    output reg [3:0] rom_data
);

always @(rom_adr) begin
    case (rom_adr)
        3'd0: rom_data = 4'b0000;
        3'd1: rom_data = 4'b1100;
        3'd2: rom_data = 4'b0110;
        3'd3: rom_data = 4'b0111;
        3'd4: rom_data = 4'b1000;
        3'd5: rom_data = 4'b0001;
        3'd6: rom_data = 4'b1101;
        3'd7: rom_data = 4'b1110;
    endcase
end
endmodule