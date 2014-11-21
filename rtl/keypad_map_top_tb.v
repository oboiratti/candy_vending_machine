`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:12:18 11/19/2014
// Design Name:   keypad_map_top
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/keypad_map_top_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: keypad_map_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module keypad_map_top_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] key_in;

	// Outputs
	wire [7:0] display_column;
	wire [7:0] out;
	wire [2:0] col;

	// Instantiate the Unit Under Test (UUT)
	keypad_map_top uut (
		.clk(clk), 
		.reset(reset), 
		.key_in(key_in), 
		.display_column(display_column), 
		.out(out),
		.col(col)
	);

	parameter clk_period = 20;

	initial begin
		clk = 1'b0;
		forever #(clk_period / 2) clk = ~clk;
	end

	initial begin
		key_in = 4'b0000;
		reset = 1; #(clk_period / 2);
		reset = 0; #(clk_period);

		key_in = 4'b0001; #100;

		key_in = 4'b0010; #100;

		key_in = 4'b0100; #100;

		key_in = 4'b1000; #100;

	end
      
endmodule

