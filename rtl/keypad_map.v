`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:56 11/19/2014 
// Design Name: 
// Module Name:    keypad_map 
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
module keypad_map(
  input clk, reset,
  input [3:0] row,
  output reg [2:0] col,
  output reg [2:0] kp_out
);

localparam idle = 3'b000, col_1 = 3'b001, col_2 = 3'b010, col_3 = 3'b100;
wire [6:0] col_row;
wire [3:0] db_row;
reg [2:0] temp_col;
wire ks = |row; //checks if a key is pressed

always @(posedge clk or posedge reset)
  if (reset) col = col_1;
  else if (ks) temp_col <= col;
  else case (col)
    col_1:  col = col_2;
    col_2:  col = col_3;
    col_3:  col = col_1;
  endcase

debouncer db1 (
    .clk(clk), 
    .reset(reset), 
    .key_in(row), 
    .key_out(db_row)
  );

assign rdb = |db_row;
assign col_row = (rdb) ? {temp_col, db_row} : 7'b000_0000;

always @(posedge clk or posedge reset)
  if (reset) kp_out = 3'b000;
  else case (col_row)
    7'b001_0001: kp_out = 3'b001; // 100
    7'b010_0010: kp_out = 3'b010; // 500
    7'b001_1000: kp_out = 3'b101; // candy out
    7'b100_1000: kp_out = 3'b110; // change
    7'b010_1000: kp_out = 3'b111; // reset
    default:     kp_out = 3'b000;   
  endcase

// always @(posedge clk or posedge reset)
//   if (reset) kp_out = 8'b0000_0000;
//   else case (col_row)
//     7'b010_1000: kp_out = 8'b0000_0000;
//     7'b001_0001: kp_out = 8'b0000_0001;
//     7'b010_0001: kp_out = 8'b0000_0010;
//     7'b100_0001: kp_out = 8'b0000_0011;
//     7'b001_0010: kp_out = 8'b0000_0100;
//     7'b010_0010: kp_out = 8'b0000_0101;
//     7'b100_0010: kp_out = 8'b0000_0110;
//     7'b001_0100: kp_out = 8'b0000_0111;
//     7'b010_0100: kp_out = 8'b0000_1000;
//     7'b100_0100: kp_out = 8'b0000_1001;
//     7'b001_1000: kp_out = 8'b0001_0000;
//     7'b100_1000: kp_out = 8'b0001_0001;
//     default:     kp_out = kp_out;   
//   endcase

endmodule
