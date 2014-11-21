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
  input [3:0] key_in,
  output [3:0] key_out
);

key_detector kd0 (
  .clk(clk), 
  .reset(reset), 
  .sw_in(key_in[0]), 
  .sw_out(key_out[0])
);

key_detector kd1 (
  .clk(clk), 
  .reset(reset), 
  .sw_in(key_in[1]), 
  .sw_out(key_out[1])
);

key_detector kd2 (
  .clk(clk), 
  .reset(reset), 
  .sw_in(key_in[2]), 
  .sw_out(key_out[2])
);

key_detector kd3 (
  .clk(clk), 
  .reset(reset), 
  .sw_in(key_in[3]), 
  .sw_out(key_out[3])
);

endmodule
