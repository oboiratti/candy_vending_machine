`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:49:08 11/18/2014
// Design Name:   key_detector
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/key_detector_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: key_detector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module key_detector_tb;

	// Inputs
	reg clk;
	reg reset;
	reg sw_in;

	// Outputs
	wire sw_out;

	// Instantiate the Unit Under Test (UUT)
	key_detector uut (
		.clk(clk), 
		.reset(reset), 
		.sw_in(sw_in), 
		.sw_out(sw_out)
	);

	parameter clk_period = 20;
	integer i;

	initial begin
		clk = 1'b0;
		forever #(clk_period / 2) clk = ~clk;
	end

	initial begin
	reset = 1;
		#(clk_period / 2);
		reset = 0;
		#(clk_period / 2);

		for (i = 0; i < 16; i = i + 1) begin
			sw_in = $random;
			#90;
		end
	end
      
endmodule

