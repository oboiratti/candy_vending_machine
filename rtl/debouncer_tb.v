`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:32:13 11/19/2014
// Design Name:   debouncer
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/debouncer_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module debouncer_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] key_in;

	// Outputs
	wire [3:0] key_out;

	// Instantiate the Unit Under Test (UUT)
	debouncer uut (
		.clk(clk), 
		.reset(reset), 
		.key_in(key_in), 
		.key_out(key_out)
	);

	parameter clk_period = 20;

	initial begin
		clk = 1'b0;
		forever #(clk_period / 2) clk = ~clk;
	end

	initial begin
		reset = 1; #(clk_period / 2);
		key_in = 4'b0001; #(clk_period / 2);

		reset = 0; #100;

		key_in = 4'b0010 ;#100;

		key_in = 4'b0100 ;#100;

		key_in = 4'b1000 ;#100;
	end
      
endmodule

