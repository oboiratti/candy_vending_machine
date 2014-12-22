`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:21 11/06/2014 
// Design Name: 
// Module Name:    candy_control 
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
module candy_control(
  input clk,
  input [2:0] in,
  output [3:0] sum,
  output [2:0] candy_sum,
  output reg [4:0] can_buy
);

localparam beg        = 3'b001, 
           obeg       = 3'b010,
           idle       = 4'b0000, 
           one        = 4'b0001, 
           two        = 4'b0010,
           three      = 4'b0011, 
           four       = 4'b0100, 
           five       = 4'b0101,
           six        = 4'b0110, 
           seven      = 4'b0111, 
           eight      = 4'b1000,
           nine       = 4'b1001, 
           ten        = 4'b1010, 
           vend       = 3'b101, 
           change     = 3'b110,
           ticker_max = 2'd2;

reg candy;
reg [3:0] ps, ns;
reg [2:0] count;
reg [3:0] sum_out;
reg [13:0] ticker;
reg cbp;

assign a_reset = (in == 3'b111) ? 1'b1 : 1'b0;

always @(posedge clk or posedge a_reset)
  if (a_reset) begin 
    ps <= idle;
    cbp <= 0;
  end
  else begin
    ps <= ns;
    if (ps == idle) cbp <= 0;
    else 
      if (in == change) cbp <= 1;
  end

always @(in or ticker or ps or cbp)
  case (ps)
    idle:       begin
                  if (in == beg) ns = one;
                  else if (in == obeg) ns = five;
                  else ns = idle;
                end

    one:        begin
                  if (cbp) begin
                    if (ticker == ticker_max) ns = idle;
                    else ns = ps;
                  end
                  else begin
                    if (in == beg) ns = two;
                    else if (in == obeg) ns = six;
                    else if (in == change) ns = idle;
                    else ns = ps;
                  end
                end

    two:        begin
                  if (cbp) begin
                    if (ticker == ticker_max) ns = one;
                    else ns = ps;
                  end
                  else begin
                    if (in == beg) ns = three;
                    else if (in == obeg) ns = seven;
                    else if (in == vend) ns = idle;
                    else if (in == change) ns = one;
                    else ns = ps;
                  end
                end

    three:      begin
                  if (cbp) begin
                    if (ticker == ticker_max) ns = two;
                    else ns = ps;
                  end
                  else begin
                    if (in == beg) ns = four;
                    else if (in == obeg) ns = eight;
                    else if (in == vend) ns = one;
                    else if (in == change) ns = two;
                    else ns = ps;
                  end
                end

    four:       begin
                  if (cbp) begin
                    if (ticker == ticker_max) ns = three;
                    else ns = ps;
                  end
                  else begin
                    if (in == beg) ns = five;
                    else if (in == obeg) ns = nine;
                    else if (in == vend) ns = two;
                    else if (in == change) ns = three;
                    else ns = ps;
                  end
                end

    five:       begin
                  if (cbp) begin
                    if (ticker == ticker_max) ns = idle;
                    else ns = ps;
                  end
                  else begin
                    if (in == beg) ns = six;
                    else if (in == obeg) ns = ten;
                    else if (in == vend) ns = three;
                    else if (in == change) ns = idle;
                    else ns = ps;
                  end
                end

    six:        begin
                  if (cbp) begin
                    if (ticker == ticker_max) ns = one;
                    else ns = ps;
                  end
                  else begin
                    if (in == beg) ns = seven;
                    else if (in == vend) ns = four;
                    else if (in == change) ns = one;
                    else ns = ps;
                  end
                end

    seven:      begin
                  if (cbp) begin
                    if (ticker == ticker_max) ns = two;
                    else ns = ps;
                  end
                  else begin
                    if (in == beg) ns = eight;
                    else if (in == vend) ns = five;
                    else if (in == change) ns = two;
                    else ns = ps;
                  end
                end

    eight:      begin
                  if (cbp) begin
                    if (ticker == ticker_max) ns = three;
                    else ns = ps;
                  end
                  else begin
                    if (in == beg) ns = nine;
                    else if (in == vend) ns = six;
                    else if (in == change) ns = three;
                    else ns = ps;
                  end
                end

    nine:       begin
                  if (cbp) begin
                    if (ticker == ticker_max) ns = four;
                    else ns = ps;
                  end
                  else begin
                    if (in == beg) ns = ten;
                    else if (in == vend) ns = seven;
                    else if (in == change) ns = four;
                    else ns = ps;
                  end
                end

    ten:        begin
                  if (cbp) begin
                    if (ticker == ticker_max) ns = five;
                    else ns = ps;
                  end
                  else begin
                    if (in == vend) ns = eight;
                    else if (in == change) ns = five;
                    else ns = ps;
                  end
                end

    default: ns = idle;
  endcase

always @ (posedge clk or posedge a_reset) begin
  if (a_reset) begin  
    candy <= 1'b0;
    sum_out <= 4'b0000;
    can_buy <= 5'b00000;
  end
  else case (ps)
    idle:       begin
                  sum_out <= 4'b0000;
                  can_buy <= 5'b00000; 
                  candy <= 1'b0;
                end

    one:        begin
                  sum_out <= one;
                  can_buy <= 5'b00000;
                  candy <= 1'b0;
                end

    two:        begin
                  sum_out <= two;
                  can_buy <= 5'b00001;
                  if (in == vend) candy <= 1'b1;
                  else candy <= 1'b0;
                end

    three:      begin
                  sum_out <= three;
                  can_buy <= 5'b00001;
                  if (in == vend) candy <= 1'b1;
                  else candy <= 1'b0;
                end

    four:       begin
                  sum_out <= four;
                  can_buy <= 5'b00011;
                  if (in == vend) candy <= 1'b1;
                  else candy <= 1'b0;
                end

    five:       begin
                  sum_out <= five;
                  can_buy <= 5'b00011;
                  if (in == vend) candy <= 1'b1;
                  else candy <= 1'b0;
                end

    six:        begin
                  sum_out <= six;
                  can_buy <= 5'b00111;
                  if (in == vend) candy <= 1'b1;
                  else candy <= 1'b0;
                end

    seven:      begin
                  sum_out <= seven;
                  can_buy <= 5'b00111;
                  if (in == vend) candy <= 1'b1;
                  else candy <= 1'b0;
                end

    eight:      begin
                  sum_out <= eight;
                  can_buy <= 5'b01111;
                  if (in == vend) candy <= 1'b1;
                  else candy <= 1'b0;
                end

    nine:       begin
                  sum_out <= nine;
                  can_buy <= 5'b01111;
                  if (in == vend) candy <= 1'b1;
                  else candy <= 1'b0;
                end

    ten:        begin
                  sum_out <= ten;
                  can_buy <= 5'b11111;
                  if (in == vend) candy <= 1'b1;
                  else candy <= 1'b0;
                end

    default:    begin
                  sum_out <= 4'b0000;
                  candy <= 1'b0;
                end
  endcase
end

//  count the number of candies
always @(negedge clk) begin
  if (a_reset) begin
    count <= 3'b000;
  end
  else begin
    if (candy) begin
      count <= count + 1;
    end
    else if (in == change) count <= 3'b000;
    else count <= count;
  end
end

// counter for change output
always @(negedge clk or posedge a_reset)
  if (a_reset) ticker <= 0;
  else if (cbp) begin
    if(ticker > ticker_max) ticker <= 0;
    else ticker <= ticker + 1;
  end

assign sum = sum_out;
assign candy_sum = (a_reset) ? 3'b000 : count;

endmodule
