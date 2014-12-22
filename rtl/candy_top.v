`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:41:10 11/04/2014 
// Design Name: 
// Module Name:    candy_top 
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
module candy_top(
  input clk, reset,
  input [3:0] key_in,
  output [7:0] display_column,
  output [7:0] out,
  output [2:0] col,
  output [4:0] can_buy
);

wire [2:0] db_key_out;
wire [3:0] sum;
wire [2:0] candy_sum;

keypad_map km (
  .clk(clk), 
  .reset(reset),
  .row(key_in),
  .kp_out(db_key_out),
  .col(col)
);

candy_control cc (
  .clk(clk), 
  .in(db_key_out),  
  .sum(sum), 
  .candy_sum(candy_sum),
  .can_buy(can_buy)
);

seven_seg_top sst (
  .clk(clk), 
  .reset(reset), 
  .sum(sum), 
  .candy_sum(candy_sum),  
  .display_column(display_column), 
  .out(out)
);

endmodule
