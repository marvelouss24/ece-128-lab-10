`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2026 11:06:23 AM
// Design Name: 
// Module Name: control_unit
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

module control_unit(
    input clk,
    input rst,
    input [2:0] adr1_rom,
    input [2:0] adr2_rom,
    output reg w,
    output reg da,
    output reg sa1,
    output reg sa2,
    output reg w_r,
    output reg [2:0] rom_adr
);

localparam idle = 3'b000,
           load_a = 3'b001,
           load_b = 3'b010,
           write = 3'b011,
           read = 3'b100;
           
reg [2:0] present_state;
reg [2:0] next_state;

always @ (posedge clk) begin
    if (rst) begin
        present_state <= idle;
    end
    else
        present_state <= next_state;
end

always @ (adr1_rom or adr2_rom or present_state) begin
    sa1 = 1'b0;
    sa2 = 1'b1;
    rom_adr = 3'bxxx;
    w = 1'b0;
    da = 1'bx;
    w_r = 1'b0;
    case(present_state)
        idle: begin
            rom_adr = 3'bxxx;
            w = 1'b0;
            da = 1'bx;
            w_r = 1'b0;
            next_state = load_a;
        end
        load_a: begin
            rom_adr = adr1_rom;
            w = 1'b1;
            da = 1'b0;
            w_r = 1'b0;
            next_state = load_b;
        end
        load_b: begin
            rom_adr = adr2_rom;
            w = 1'b1;
            da = 1'b1;
            w_r = 1'b0;
            next_state = write;
        end
        write: begin
            rom_adr = 3'bxxx;
            w = 1'b0;
            da = 1'bx;
            w_r = 1'b1;
            next_state = read;
        end
        read: begin
            rom_adr = 3'bxxx;
            w = 1'b0;
            da = 1'bx;
            w_r = 1'b0;
            next_state = read;
        end
        default: next_state = idle;
    endcase    
end
endmodule

