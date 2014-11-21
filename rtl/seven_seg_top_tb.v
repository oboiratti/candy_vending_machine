`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:08:07 11/05/2014
// Design Name:   seven_seg_top
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/seven_seg_top_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_seg_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_seg_top_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] sum;
  reg [2:0] candy_sum;
  

	// Outputs
	wire [7:0] display_column;
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	seven_seg_top uut (
		.clk(clk), 
		.reset(reset), 
		.sum(sum), 
		.candy_sum(candy_sum),  
		.display_column(display_column), 
		.out(out)
	);

	integer i;

	parameter clk_period = 20;
	initial begin
		clk = 1'b0;
		forever #(clk_period / 2) clk = ~clk;
	end

	initial begin
		reset = 0;
		#(clk_period); reset = 1;
		#(clk_period); reset = 0;
		
		// MIN + {$random} % (MAX - MIN) - random numbers between MIN and MAX
		for(i = 0; i < 10; i = i + 1) begin
			sum = {$random} % 10;
			candy_sum = {$random} % 10;
			#50;
		end

		#(clk_period); #(clk_period / 2); reset = 0;
	end
      
endmodule

