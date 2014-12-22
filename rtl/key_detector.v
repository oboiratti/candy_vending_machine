`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:46 11/18/2014 
// Design Name: 
// Module Name:    key_detector 
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
module key_detector(
  input clk, reset, 
  input sw_in, 
  output sw_out
);

reg [1:0] sample;

always @(posedge clk or posedge reset)
  if (reset) sample <= 0;
  else begin
    sample[1] <= sample[0];
    sample[0] <= sw_in;
  end

assign sw_out = (sw_in & sample[0]) & (~sample[1]);

endmodule
