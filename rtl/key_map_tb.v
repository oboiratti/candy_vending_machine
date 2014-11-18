`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:06:37 11/17/2014
// Design Name:   key_map
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/key_map_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: key_map
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module key_map_tb;

	// Inputs
	reg [5:0] key_in;

	// Outputs
	wire [2:0] key_out;

	// Instantiate the Unit Under Test (UUT)
	key_map uut (
		.key_in(key_in), 
		.key_out(key_out)
	);

	initial begin
		key_in = 6'b100_000;
		#10;
        
		key_in = 6'b010_000;
		#10;

		key_in = 6'b001_000;
		#10;

		key_in = 6'b000_100;
		#10;

		key_in = 6'b000_010;
		#10;

		key_in = 6'b000_001;
		#10;

	end
      
endmodule

