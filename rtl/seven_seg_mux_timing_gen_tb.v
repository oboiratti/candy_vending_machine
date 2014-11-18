`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:06:53 11/05/2014
// Design Name:   seven_seg_mux_timing_gen
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/seven_seg_mux_timing_gen_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_seg_mux_timing_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_seg_mux_timing_gen_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [2:0] mux_sel;
	wire [5:0] addr;

	// Instantiate the Unit Under Test (UUT)
	seven_seg_mux_timing_gen uut (
		.clk(clk), 
		.reset(reset), 
		.mux_sel(mux_sel), 
		.addr(addr)
	);

	parameter clk_period = 20;

	initial begin
		clk = 1'b0;
		forever #(clk_period / 2) clk = ~clk;
	end

	initial begin
		reset = 1;
		#(clk_period);
		reset = 0;
	end

	initial
		#1000 $finish;

	initial
		$monitor($realtime, "ns %db %b", mux_sel, addr);
      
endmodule

