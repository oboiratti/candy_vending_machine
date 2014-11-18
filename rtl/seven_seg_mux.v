`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:44:29 11/04/2014 
// Design Name: 
// Module Name:    seven_seg_mux 
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
module seven_seg_mux(
  input [3:0] data_in5, data_in4, data_in3, data_in2, data_in1, data_in0,
  input [2:0] mux_sel,
  output reg [3:0] data_out
);

always @(*)
  case (mux_sel)
    3'b000: data_out = data_in0;
    3'b001: data_out = data_in1;
    3'b010: data_out = data_in2;
    3'b011: data_out = data_in3;
    3'b100: data_out = data_in4;
    3'b101: data_out = data_in5;
    default: data_out = 4'b1010;
  endcase
endmodule
