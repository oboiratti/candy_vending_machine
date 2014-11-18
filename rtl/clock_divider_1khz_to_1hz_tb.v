`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:55:53 11/06/2014
// Design Name:   clock_divider_1khz_to_1hz
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/clock_divider_1khz_to_1hz_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_divider_1khz_to_1hz
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clock_divider_1khz_to_1hz_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire clk1hz;

	// Instantiate the Unit Under Test (UUT)
	clock_divider_1khz_to_1hz uut (
		.clk(clk), 
		.reset(reset), 
		.clk1hz(clk1hz)
	);

	parameter clk_period = 2;

	initial begin
		clk = 1'b0;
		forever #(clk_period / 2) clk = ~clk;
	end

	initial begin
		reset = 0;
		#(clk_period) reset = 1;
		#(clk_period) reset = 0;
	end

	initial
		#10000 $finish;

	initial
	 $monitor($realtime, "ns %b %b", clk, clk1hz);
      
endmodule

