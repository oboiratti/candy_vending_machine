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
	reg [3:0] key_in;

	// Outputs
	wire [7:0] display_column;
	wire [7:0] out;
	wire [2:0] col;
	wire [4:0] can_buy;

	// Instantiate the Unit Under Test (UUT)
	candy_top uut (
		.clk(clk), 
		.reset(reset), 
		// .coin(coin), 
		// .btn(btn),
		.key_in(key_in) ,
		.display_column(display_column), 
		.out(out), 
		.col(col),
		.can_buy(can_buy)
	);

	parameter clk_period = 20;
	integer i;

	initial begin
		clk = 1'b0;
		forever #(clk_period / 2) clk = ~clk;
	end

	initial begin
		key_in = 4'b0000;
		reset = 1; #(clk_period / 2);
		reset = 0; #(clk_period);
		key_in = 4'b1000; #30; //input 500
		key_in = 4'b0000; #(clk_period);
		#(clk_period);#(clk_period);

		key_in = 4'b0010; #50; //input 500
		key_in = 4'b0000; #(clk_period); #(clk_period); #(clk_period);

		key_in = 4'b0010; #50; // input 500
		key_in = 4'b0000; #(clk_period); #200;

		key_in = 4'b1000; #50; // press vend
		key_in = 4'b0000; #(clk_period); #(clk_period); #(clk_period);

		key_in = 4'b1000; #50; // press vend again
		key_in = 4'b0000; #(clk_period); #(clk_period); #(clk_period);

		key_in = 4'b1000; #50; // press vend again
		key_in = 4'b0000; #(clk_period); #(clk_period); #110;

		key_in = 4'b1000; #50; // press change
		key_in = 4'b0000; #(clk_period); #(clk_period);
	end
      
endmodule

