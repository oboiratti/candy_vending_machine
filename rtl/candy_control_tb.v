`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:16:39 11/11/2014
// Design Name:   candy_control
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/candy_control_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: candy_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module candy_control_tb;

	// Inputs
	reg clk;
	reg [2:0] in;

	// Outputs
	wire [3:0] sum;
	wire [2:0] candy_sum;
	wire [4:0] can_buy;

	// Instantiate the Unit Under Test (UUT)
	candy_control uut (
		.clk(clk), 
		.in(in),
		.sum(sum),
		.candy_sum(candy_sum),
		.can_buy(can_buy)
	);

	parameter clk_period = 20;

	initial begin
		clk = 1'b0;
		forever #(clk_period / 2) clk = ~clk;
	end

	initial begin
		in = 3'b111;
		#(clk_period / 2);
		in = 3'b000;
		#(clk_period / 2);
		#(clk_period);

		in = 3'b010; #(clk_period); //input 500
		in = 3'b000; #(clk_period);

		in = 3'b010; #(clk_period); // input 500
		in = 3'b000; #(clk_period);

		in = 3'b101; #(clk_period); // press vend
		in = 3'b000; #(clk_period);

		in = 3'b101; #(clk_period); // press vend again
		in = 3'b000; #(clk_period);

		in = 3'b101; #(clk_period); // press vend again
		in = 3'b000; #(clk_period);

		in = 3'b110; #(clk_period); // press change
		in = 3'b000; #(clk_period);
	end
      
endmodule

