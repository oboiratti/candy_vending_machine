`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:24 11/06/2014 
// Design Name: 
// Module Name:    clock_divider_1khz_to_1hz 
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
module clock_divider_1khz_to_1hz(
  input clk, reset,
  output clk1hz
);

reg clkcnt;
reg [9:0] count;

always @(posedge clk or posedge reset)
  if(reset) begin
    clkcnt <= 1'b0;
    count <= 10'd1000;
  end
  else begin
    count <= count - 1;
    if (count == 0)
      clkcnt <= ~clkcnt;
  end

// always @(count)
//   if(count == 0)
//     clkcnt <= ~clkcnt;

assign clk1hz = clkcnt;

endmodule
