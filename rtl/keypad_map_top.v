`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:04 11/19/2014 
// Design Name: 
// Module Name:    keypad_map_top 
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
module keypad_map_top(
  input clk, reset,
  input [3:0] key_in,
  output [7:0] display_column,
  output [7:0] out,
  output [2:0] col
);

wire [7:0] kp_out;
wire [2:0] candy_sum = 3'b000;

keypad_map km1 (
  .clk(clk), 
  .reset(reset),
  .row(key_in),
  .kp_out(kp_out),
  .col(col)
);

seven_seg_top sst (
    .clk(clk), .reset(reset), .sum(kp_out), .candy_sum(candy_sum),  
    .display_column(display_column), .out(out)
  );
endmodule
