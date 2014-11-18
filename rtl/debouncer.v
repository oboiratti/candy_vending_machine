`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:32 11/17/2014 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
  input clk, reset, 
  input [2:0] keyin,
  output [2:0] keyout
);
reg [2:0] q;
always @(posedge clk or posedge reset)
  if (reset) q <= 0;
  else q <= keyin;

assign keyout = q;

endmodule
