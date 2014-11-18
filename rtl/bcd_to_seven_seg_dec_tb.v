`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:46:14 11/05/2014
// Design Name:   bcd_to_seven_seg_dec
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/bcd_to_seven_seg_dec_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bcd_to_seven_seg_dec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bcd_to_seven_seg_dec_tb;

	// Inputs
	reg [3:0] in;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	bcd_to_seven_seg_dec uut (
		.in(in), 
		.out(out)
	);

	integer i;

	initial begin
		for(i = 0; i < 10; i = i + 1) begin
			in = i[3:0]; #100; end    
	end

	initial
		$monitor($realtime, "ns %d %h", in, out);
endmodule

