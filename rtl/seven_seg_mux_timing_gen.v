`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:57 11/05/2014 
// Design Name: 
// Module Name:    seven_seg_mux_timing_gen 
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
module seven_seg_mux_timing_gen(
  input clk, reset,
  output wire [2:0] mux_sel,
  output reg [5:0] addr
);

reg [2:0] qout;
always @ (posedge clk or posedge reset)
  if (reset) qout <= 0;
  else qout <= qout + 1;

assign mux_sel = qout;

always @(qout)
  case (qout)
    3'b000: addr = 6'b000001;
    3'b001: addr = 6'b000010;
    3'b010: addr = 6'b000100;
    3'b011: addr = 6'b001000;
    3'b100: addr = 6'b010000;
    3'b101: addr = 6'b100000;
    default: addr = 6'b000000;
  endcase
endmodule
