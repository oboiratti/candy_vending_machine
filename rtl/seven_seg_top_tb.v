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
	reg [3:0] data_in5;
	reg [3:0] data_in4;
	reg [3:0] data_in3;
	reg [3:0] data_in2;
	reg [3:0] data_in1;
	reg [3:0] data_in0;

	// Outputs
	wire [5:0] addr;
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	seven_seg_top uut (
		.clk(clk), 
		.reset(reset), 
		.data_in5(data_in5), 
		.data_in4(data_in4), 
		.data_in3(data_in3), 
		.data_in2(data_in2), 
		.data_in1(data_in1), 
		.data_in0(data_in0), 
		.addr(addr), 
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
			data_in5 = {$random} % 10;
			data_in4 = {$random} % 10;
			data_in3 = {$random} % 10;	
			data_in2 = {$random} % 10;
			data_in1 = {$random} % 10;
			data_in0 = {$random} % 10;
			#50;
		end

		#(clk_period); #(clk_period / 2); reset = 0;
	end
      
endmodule

