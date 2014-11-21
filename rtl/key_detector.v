`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:46 11/18/2014 
// Design Name: 
// Module Name:    key_detector 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module key_detector(
  input clk, reset, 
  input sw_in, 
  output sw_out
);

reg [1:0] sample;

always @(posedge clk or posedge reset)
  if (reset) sample <= 0;
  else begin
    sample[1] <= sample[0];
    sample[0] <= sw_in;
  end

assign sw_out = (sw_in & sample[0]) & (~sample[1]);

// always @(posedge clk or posedge reset)
//   if (reset) dout <= 0;
//   else dout <= d;

// assign sw_out = dout;


// // this could also work
// reg [1:0] count;
// always @(posedge clk or posedge reset)
//   if (reset) count <= 0;
//   else begin
//     count <= count + 1;
//   end

// always @(posedge clk or posedge reset)
//   if (reset) sample <= 0;
//   else begin
//     if (count == 2'b11) begin
//      //sample[2] <= sample[1];
//      sample[1] <= sample[0];
//      sample[0] <= sw_in;
//     end
//   end

// assign sw_out = (sample[0] & sample[1]);

// // always @(posedge clk or posedge reset)
// //   if (reset) dout <= 0;
// //   else dout <= d;

// // assign sw_out = d & ~dout;

endmodule
