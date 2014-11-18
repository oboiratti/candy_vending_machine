`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:56:53 11/04/2014 
// Design Name: 
// Module Name:    bcd_to_seven_seg_dec 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bcd_to_seven_seg_dec(
  input [3:0] in,
  output reg [7:0] out
);

always @(*)
  case (in)
    4'b0000: out = 8'b0011_1111;
    4'b0001: out = 8'b0000_0110;
    4'b0010: out = 8'b0101_1011; 
    4'b0011: out = 8'b0100_1111;
    4'b0100: out = 8'b0110_0110;
    4'b0101: out = 8'b0110_1101;
    4'b0110: out = 8'b0111_1101;
    4'b0111: out = 8'b0000_0111;
    4'b1000: out = 8'b0111_1111;
    4'b1001: out = 8'b0110_1111;
    default: out = 8'b0000_0000;
  endcase
endmodule
