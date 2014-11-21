`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:46 11/18/2014 
// Design Name: 
// Module Name:    seven_seg_col_sel 
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
module seven_seg_col_sel(
  input clk, reset,
  input [7:0] sum,
  input [2:0] candy_sum,
  output reg [3:0] data_out,
  output reg [7:0] display_column
);

localparam idle = 4'b0000, col_1 = 4'b0001, col_2 = 4'b0010, col_3 = 4'b0011, 
          col_4 = 4'b0100, col_5 = 4'b0101, col_6 = 4'b0110, col_7 = 4'b0111, 
          col_8 = 4'b1000; 
reg [3:0] ns, ps;

always @(posedge clk or posedge reset)
  if (reset) ps <= idle;
  else ps <= ns;

always @(*)
  case (ps)
    idle:     begin
                data_out <= 4'b1010;
                display_column <= 8'b1111_1111;
                ns <= col_1;
              end

    col_1:    begin
                data_out <= 4'b0000;
                display_column <= 8'b1111_1110;
                ns <= col_2;
              end

    col_2:    begin
                data_out <= 4'b0000;
                display_column <= 8'b1111_1101;
                ns <= col_3;
              end

    col_3:    begin
                data_out <= sum[3:0];
                display_column <= 8'b1111_1011;
                ns <= col_4;
              end

    col_4:    begin
                data_out <= sum[7:4];
                display_column <= 8'b1111_0111;
                ns <= col_5;
              end

    col_5:    begin
                data_out <= 4'b1010;
                display_column <= 8'b1110_1111;
                ns <= col_6;
              end

    col_6:    begin
                data_out <= {1'b0, candy_sum};
                display_column <= 8'b1101_1111;
                ns <= col_7;
              end

    col_7:    begin
                data_out <= 4'b1010;
                display_column <= 8'b1011_1111;
                ns <= col_8;
              end

    col_8:    begin
                data_out <= 4'b1010;
                display_column <= 8'b0111_1111;
                ns <= col_1;
              end

    default:  begin
                data_out <= 4'b1010;
                display_column <= 8'b1111_1111;
                ns <= idle;
              end
  endcase
endmodule
