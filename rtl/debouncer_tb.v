`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:07:41 11/17/2014
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
	reg [2:0] keyin;

	// Outputs
	wire [2:0] keyout;

	// Instantiate the Unit Under Test (UUT)
	debouncer uut (
		.clk(clk), 
		.reset(reset), 
		.keyin(keyin), 
		.keyout(keyout)
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
			keyin = i[2:0];
			#10;
		end
	end
      
endmodule

