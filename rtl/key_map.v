`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:09 11/17/2014 
// Design Name: 
// Module Name:    key_map 
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
module key_map(
  input [5:0] key_in,
  output reg [2:0] key_out
);

always @(*)
  case (key_in)
    6'b100_000: key_out = 3'b001; // 100
    6'b010_000: key_out = 3'b010; // 500
    6'b001_000: key_out = 3'b101; // candy out
    6'b000_100: key_out = 3'b110; // change out
    default: key_out = 3'b000;
  endcase

endmodule
