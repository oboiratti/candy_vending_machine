`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:38 11/05/2014 
// Design Name: 
// Module Name:    seven_seg_top 
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
module seven_seg_top(
  input clk, reset,
  input [7:0] sum,
  input [2:0] candy_sum,
  output [7:0] display_column,
  output [7:0] out
);

// wire [2:0] mux_sel;
wire [3:0] data_out;

// seven_seg_mux_timing_gen seven_seg_mux_timing_gen(
//   .clk(clk), .reset(reset), 
//   .mux_sel(mux_sel), .addr(addr)
// );

// seven_seg_mux seven_seg_mux(
//   .data_in5(data_in5), .data_in4(data_in4), 
//   .data_in3(data_in3), .data_in2(data_in2), 
//   .data_in1(data_in1), .data_in0(data_in0), 
//   .mux_sel(mux_sel), .data_out(data_out)
// );

seven_seg_col_sel seven_seg_col_sel1 (
    .clk(clk), .reset(reset), .sum(sum), 
    .candy_sum(candy_sum), .data_out(data_out), 
    .display_column(display_column)
  );

bcd_to_seven_seg_dec bcd_to_seven_seg_dec1(
  .in(data_out), .out(out)
);

endmodule
