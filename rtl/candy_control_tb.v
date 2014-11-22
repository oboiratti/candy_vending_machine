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
	reg reset;
	// reg [1:0] coin;
	// reg [1:0] btn;
	reg [2:0] in;

	// Outputs
	wire candy;
	wire [2:0] change_beg;
	wire change_obeg;
	wire [3:0] sum;
	wire [2:0] candy_sum;
	wire [4:0] can_buy;

	// Instantiate the Unit Under Test (UUT)
	candy_control uut (
		.clk(clk), 
		.reset(reset), 
		// .coin(coin), 
		// .btn(btn), 
		.in(in),
		.candy(candy), 
		.change_beg(change_beg), 
		.change_obeg(change_obeg),
		.sum(sum),
		.candy_sum(candy_sum),
		.can_buy(can_buy)
	);

	parameter clk_period = 10;
	integer i;
	// reg [1:0] get_coin;
	// reg [1:0] get_btn;

	initial begin
		clk = 1'b0;
		forever #(clk_period / 2) clk = ~clk;
	end

	initial begin
		
		// reset = 1;
		// #(clk_period / 2);
		// reset = 0;
		// #(clk_period / 2);
		// // #(clk_period / 2);

		// //	input 100
		// coin = 2'b01; #(clk_period); coin = 2'b00; #(clk_period/2); btn = 2'b01; #(clk_period); 
		// btn = 2'b10; #(clk_period);
		
		// //	input 2 100 and press candy out button
		// coin = 2'b01; #(clk_period); coin = 2'b00; #(clk_period/2); btn = 2'b01; #(clk_period);
		// if (!candy || change_beg != 3'b000 || change_obeg != 0)
		// 	$display("error in iteration");
		// else $display(" %b %b %b ", candy, change_beg, change_obeg);

		// reset = 1; #(clk_period / 2); reset = 0; #(clk_period / 2);

		// //	input 2 100 and press change out button
		// coin = 2'b01; #(clk_period); coin = 2'b00; #(clk_period/2); coin = 2'b01; #(clk_period);
		// #(clk_period/2); btn = 2'b10; #(clk_period); coin = 2'b00; btn = 2'b00;
		// if (change_beg != 3'b010 || change_obeg != 0)
		// 	$display("error in iteration");
		// else $display(" %b %b %b ", candy, change_beg, change_obeg);

		// reset = 1; #(clk_period / 2); reset = 0; #(clk_period / 2);

		// //	input 3 100 and press candy out button
		// coin = 2'b01; #(clk_period); coin = 2'b00; #(clk_period/2); coin = 2'b01; #(clk_period); 
		// coin = 2'b00; #(clk_period); #(clk_period/2); coin = 2'b01; #(clk_period); #(clk_period); 
		// coin = 2'b00; #(clk_period); btn = 2'b01; #(clk_period); btn = 2'b00;
		// if (!candy || change_beg != 3'b001 || change_obeg != 0)
		// 	$display("error in iteration");
		// else $display(" %b %b %b ", candy, change_beg, change_obeg);

		// coin = 2'b01; #(clk_period/2); coin = 2'b01; #(clk_period); 
		// 	coin = 2'b00; #(clk_period/2); btn = 2'b10; #(clk_period);


		reset = 1;
		#(clk_period / 2);
		reset = 0;
		#(clk_period / 2);
		#(clk_period / 2);

		for (i = 0; i < 128; i = i + 1) begin
			in = $random;
			#20;



			// get_coin = $random;
			// if (get_coin == 2'b11) coin = 2'b00;
			// else coin = get_coin;
			// #20;
			// get_btn = $random;
			// if (get_btn == 2'b11) btn = 2'b00;
			// else begin 
			// 	if (coin == 2'b00) btn = get_btn;
			// 	else btn = 2'b00;
			// end
			// #30;
		end
	end
      
endmodule

