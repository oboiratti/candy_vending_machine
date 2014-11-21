`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:34:04 11/19/2014
// Design Name:   keypad_map
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/keypad_map_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: keypad_map
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module keypad_map_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] row;

	//Outputs
	wire [7:0] kp_out;
	wire [2:0] col;

	// Instantiate the Unit Under Test (UUT)
	keypad_map uut (
		.clk(clk), 
		.reset(reset),
		.row(row),
		.kp_out(kp_out),
		.col(col)
	);

	parameter clk_period = 20;

	initial begin
		clk = 1'b0;
		forever #(clk_period / 2) clk = ~clk;
	end

	initial begin
		row = 4'b0000;
		reset = 1; #(clk_period / 2);
		reset = 0; #(clk_period);

		row = 4'b0001; #200;

		row = 4'b0010; #200;

		row = 4'b0100; #200;

		row = 4'b1000; #200;
	end
      
endmodule

