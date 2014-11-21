`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:56:49 11/18/2014
// Design Name:   seven_seg_col_sel
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/seven_seg_col_sel_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_seg_col_sel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_seg_col_sel_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] sum;
	reg [2:0] candy_sum;

	// Outputs
	wire [3:0] data_out;
	wire [7:0] display_column;

	// Instantiate the Unit Under Test (UUT)
	seven_seg_col_sel uut (
		.clk(clk), 
		.reset(reset), 
		.sum(sum), 
		.candy_sum(candy_sum), 
		.data_out(data_out), 
		.display_column(display_column)
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

		for (i = 0; i < 16; i = i + 1) begin
			sum = $random;
			candy_sum = $random;
		#10;
		end
	end
      
endmodule

