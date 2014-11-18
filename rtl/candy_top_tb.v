`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:11:52 11/13/2014
// Design Name:   candy_top
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/candy_top_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: candy_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module candy_top_tb;

	// Inputs
	reg clk;
	reg reset;
	// reg [1:0] coin;
	// reg [1:0] btn;
	reg [5:0] key_in;

	// Outputs
	wire [5:0] addr;
	wire [7:0] out;
	wire candy;
	wire [2:0] change_beg;
	wire change_obeg;

	// Instantiate the Unit Under Test (UUT)
	candy_top uut (
		.clk(clk), 
		.reset(reset), 
		// .coin(coin), 
		// .btn(btn),
		.key_in(key_in) ,
		.addr(addr), 
		.out(out), 
		.candy(candy), 
		.change_beg(change_beg), 
		.change_obeg(change_obeg)
	);

	parameter clk_period = 2;
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
		// #(clk_period / 2);

		//	input 100 and press candy out
		key_in = 6'b100_000; #(clk_period * 2000); key_in = 6'b001_000;
		#(clk_period * 2000); #(clk_period * 2000);

		//	input 100 and press candy out
		key_in = 6'b100_000; #(clk_period * 2000); key_in = 6'b001_000;
		#(clk_period * 2000); #(clk_period * 2000);

		// for (i = 0; i < 128; i = i + 1) begin
		// 	key_in = 2 ** i;
		// 	#4000;
		// 	// btn = $random;
		// 	// #3000;
		// end
	end
      
endmodule

