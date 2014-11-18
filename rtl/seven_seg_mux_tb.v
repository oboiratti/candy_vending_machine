`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:03:20 11/05/2014
// Design Name:   seven_seg_mux
// Module Name:   E:/projects/verilog/candy_vending_system/rtl/seven_seg_mux_tb.v
// Project Name:  candy_vending_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_seg_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_seg_mux_tb;

	// Inputs
	reg [3:0] data_in5;
	reg [3:0] data_in4;
	reg [3:0] data_in3;
	reg [3:0] data_in2;
	reg [3:0] data_in1;
	reg [3:0] data_in0;
	reg [2:0] mux_sel;

	// Outputs
	wire [3:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	seven_seg_mux uut (
		.data_in5(data_in5), 
		.data_in4(data_in4), 
		.data_in3(data_in3), 
		.data_in2(data_in2), 
		.data_in1(data_in1), 
		.data_in0(data_in0), 
		.mux_sel(mux_sel), 
		.data_out(data_out)
	);

	integer i;

	initial begin
    for(i = 0; i < 10; i = i + 1) begin
    	data_in0 = $random % 10;
    	data_in1 = $random % 10;
    	data_in2 = $random % 10;
    	data_in3 = $random % 10;
    	data_in4 = $random % 10;
    	data_in5 = $random % 10;
    	mux_sel = i[2:0];
    	#20;
    end
	end
   
endmodule

