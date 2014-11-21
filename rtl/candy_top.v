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
  // input [1:0] coin,
  // input [1:0] btn,
  input [3:0] key_in,
  output candy,
  output [2:0] change_beg,
  output change_obeg,
  output [7:0] display_column,
  output [7:0] out,
  output [2:0] col
);

// wire [2:0] key_out;
wire [2:0] db_key_out;
// wire clk1hz;
wire [7:0] sum;
// wire [3:0] data_in1, data_in0, data_in4;
wire [2:0] candy_sum;

// assign data_in0 = 4'b0000;
// assign data_in1 = 4'b0000;
// assign data_in4 = 4'b1010;

// key_map km (
//     .key_in(key_in), .key_out(key_out));

// debouncer db (
//     .clk(clk1hz), .reset(reset), 
//     .keyin(key_out), .keyout(db_key_out));

// clock_divider_1khz_to_1hz clkdiv (
//     .clk(clk), .reset(reset), .clk1hz(clk1hz));

keypad_map km (
  .clk(clk), 
  .reset(reset),
  .row(key_in),
  .kp_out(db_key_out),
  .col(col)
);

candy_control cc (
  .clk(clk), .reset(reset), .in(db_key_out), .candy(candy), 
  .change_beg(change_beg), .change_obeg(change_obeg), .sum(sum), .candy_sum(candy_sum));

seven_seg_top sst (
  .clk(clk), .reset(reset), .sum(sum), .candy_sum(candy_sum),  
  .display_column(display_column), .out(out)
);

// seven_seg_top ss (
//     .clk(clk), .reset(reset), .data_in5({1'b0, candy_sum}), .data_in4(data_in4), 
//     .data_in3(sum[7:4]), .data_in2(sum[3:0]), .data_in1(data_in1), 
//     .data_in0(data_in0), .addr(addr), .out(out));

endmodule
