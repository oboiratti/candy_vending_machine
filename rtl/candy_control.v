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
  input clk, reset,
  // input [1:0] coin,
  // input [1:0] btn,
  input [2:0] in,
  output reg candy,
  output reg [2:0] change_beg,
  output reg change_obeg,
  output [7:0] sum,
  output [2:0] candy_sum
);
localparam no_coin = 3'b111, beg = 3'b001, obeg = 3'b010;
localparam idle = 4'b0000, one = 4'b0001, two = 4'b0010,
           three = 4'b0011, four = 4'b0100, five = 4'b0101,
           six = 4'b0110, seven = 4'b0111, eight = 4'b1000,
           nine = 4'b1001, ten = 4'b1010; 
           //candy_out = 4'b1011, change_out = 4'b1100;

localparam candy_button_pressed = 3'b101, change_button_pressed = 3'b110;
reg [3:0] ps, ns;
reg [2:0] count;
// reg [2:0] temp_count;
reg [7:0] sum_out;

always @(posedge clk or posedge reset)
  if (reset) ps <= idle;
  else ps <= ns;

always @(*)
  case (ps)
    idle:       begin
                  // candy = 1'b0; 
                  if (in == beg) ns = one;
                  else if (in == obeg) ns = five;
                  else ns = idle;
                end

    one:        begin
                  // candy = 1'b0; 
                  if (in == beg) ns = two;
                  else if (in == obeg) ns = six;
                  else if (in == change_button_pressed) ns = idle;
                  else ns = ps;
                end

    two:        begin
                  // candy = 1'b0; 
                  if (in == beg) ns = three;
                  else if (in == obeg) ns = seven;
                  else if (in == candy_button_pressed) ns = idle;
                  else if (in == change_button_pressed) ns = idle;
                  else ns = ps;
                end

    three:      begin
                  // candy = 1'b0; 
                  if (in == beg) ns = four;
                  else if (in == obeg) ns = eight;
                  //else ns = ps;
                  else if (in == candy_button_pressed) ns = one;
                  else if (in == change_button_pressed) ns = idle;
                  else ns = ps;
                end

    four:       begin
                  // candy = 1'b0; 
                  if (in == beg) ns = five;
                  else if (in == obeg) ns = nine;
                  //else ns = ps;
                  else if (in == candy_button_pressed) ns = two;
                  else if (in == change_button_pressed) ns = idle;
                  else ns = ps;
                end

    five:       begin
                  // candy = 1'b0; 
                  if (in == beg) ns = six;
                  else if (in == obeg) ns = ten;
                  //else ns = ps;
                  else if (in == candy_button_pressed) ns = three;
                  else if (in == change_button_pressed) ns = idle;
                  else ns = ps;
                end

    six:        begin
                  // candy = 1'b0; 
                  if (in == beg) ns = seven;
                  //else ns = ps;
                  else if (in == candy_button_pressed) ns = four;
                  else if (in == change_button_pressed) ns = idle;
                  else ns = ps;
                end

    seven:      begin
                  // candy = 1'b0; 
                  if (in == beg) ns = eight;
                  //else ns = ps;
                  else if (in == candy_button_pressed) ns = five;
                  else if (in == change_button_pressed) ns = idle;
                  else ns = ps;
                end

    eight:      begin
                  // candy = 1'b0; 
                  if (in == beg) ns = nine;
                  //else ns = ps;
                  else if (in == candy_button_pressed) ns = six;
                  else if (in == change_button_pressed) ns = idle;
                  else ns = ps;
                end

    nine:       begin
                  // candy = 1'b0; 
                  if (in == beg) ns = ten;
                  //else ns = ps;
                  else if (in == candy_button_pressed) ns = seven;
                  else if (in == change_button_pressed) ns = idle;
                  else ns = ps;
                end

    ten:        begin
                  if (in == candy_button_pressed) ns = eight;
                  else if (in == change_button_pressed) ns = idle;
                  else ns = ps;
                end

    // candy_out:  if (in == change_button_pressed) ns = change_out;

    // change_out: ns = idle;
    default: ns = idle;
  endcase

always @ (posedge clk or posedge reset) begin
  if (reset) begin 
    change_beg <= 3'b000; 
    change_obeg <= 1'b0; 
    candy <= 1'b0;
    sum_out <= 8'b0000_0000;
  end
  else case (ps)
    idle:       begin
                  sum_out <= 8'b0000_0000;
                  change_beg <= 3'b000; 
                  change_obeg <= 1'b0; 
                  candy <= 1'b0;
                end

    one:        begin
                  sum_out <= {4'b1110, one};
                  if (count > 0) begin
                    change_beg <= 3'b001;
                    change_obeg <= 1'b0;
                    candy <= 1'b0;
                  end
                end

    two:        begin
                  sum_out <= {4'b1010, two};
                  if (in == candy_button_pressed) candy <= 1'b1;
                  else if (!candy && in == change_button_pressed) begin
                    change_beg <= 3'b010;
                    change_obeg <= 1'b0;
                    candy <= 1'b0;
                  end
                  else candy <= 1'b0;
                end

    three:      begin
                  sum_out <= {4'b1010, three};
                  if (in == candy_button_pressed) candy <= 1'b1;
                  else if (candy && in == change_button_pressed) begin
                    change_beg <= 3'b001;
                    change_obeg <= 1'b0;
                    candy <= 1'b0;
                  end
                  else if (!candy && in == change_button_pressed) begin
                    change_beg <= 3'b011;
                    change_obeg <= 1'b0;
                    candy <= 1'b0;
                  end
                  else candy <= 1'b0;
                end

    four:       begin
                  sum_out <= {4'b1010, four};
                  if (in == candy_button_pressed) candy <= 1'b1;
                  else if (candy && in == change_button_pressed) begin
                    change_beg <= 3'b010;
                    change_obeg <= 1'b0;
                    candy <= 1'b0;
                  end
                  else if (!candy && in == change_button_pressed) begin
                    change_beg <= 3'b100;
                    change_obeg <= 1'b0;
                    candy <= 1'b0;
                  end
                  else candy <= 1'b0;
                end

    five:       begin
                  sum_out <= {4'b1010, five};
                  if (in == candy_button_pressed) candy <= 1'b1;
                  else if (candy && in == change_button_pressed) begin
                    change_beg <= 3'b011;
                    change_obeg <= 1'b0;
                    candy <= 1'b0;
                  end
                  else if (!candy && in == change_button_pressed) begin
                    change_beg <= 3'b000;
                    change_obeg <= 1'b1;
                    candy <= 1'b0;
                  end
                  else candy <= 1'b0;
                end

    six:        begin
                  sum_out <= {4'b1010, six};
                  if (in == candy_button_pressed) candy <= 1'b1;
                  else if (candy && in == change_button_pressed) begin
                    change_beg <= 3'b100;
                    change_obeg <= 1'b0;
                    candy <= 1'b0;
                  end
                  else if (!candy && in == change_button_pressed) begin
                    change_beg <= 3'b001;
                    change_obeg <= 1'b1;
                    candy <= 1'b0;
                  end
                  else candy <= 1'b0;
                end

    seven:      begin
                  sum_out <= {4'b1010, seven};
                  if (in == candy_button_pressed) candy <= 1'b1;
                  else if (candy && in == change_button_pressed) begin
                    change_beg <= 3'b000;
                    change_obeg <= 1'b1;
                    candy <= 1'b0;
                  end
                  else if (!candy && in == change_button_pressed) begin
                    change_beg <= 3'b010;
                    change_obeg <= 1'b1;
                    candy <= 1'b0;
                  end
                  else candy <= 1'b0;
                end

    eight:      begin
                  sum_out <= {4'b1010, eight};
                  if (in == candy_button_pressed) candy <= 1'b1;
                  else if (candy && in == change_button_pressed) begin
                    change_beg <= 3'b001;
                    change_obeg <= 1'b1;
                    candy <= 1'b0;
                  end
                  else if (!candy && in == change_button_pressed) begin
                    change_beg <= 3'b011;
                    change_obeg <= 1'b1;
                    candy <= 1'b0;
                  end
                  else candy <= 1'b0;
                end

    nine:       begin
                  sum_out <= {4'b1010, nine};
                  if (in == candy_button_pressed) candy <= 1'b1;
                  else if (candy && in == change_button_pressed) begin
                    change_beg <= 3'b010;
                    change_obeg <= 1'b1;
                    candy <= 1'b0;
                  end
                  else if (!candy && in == change_button_pressed) begin
                    change_beg <= 3'b100;
                    change_obeg <= 1'b1;
                    candy <= 1'b0;
                  end
                  else candy <= 1'b0;
                end

    ten:        begin
                  sum_out <= {one, idle};
                  if (in == candy_button_pressed) candy <= 1'b1;
                  else if (candy && in == change_button_pressed) begin
                    change_beg <= 3'b011;
                    change_obeg <= 1'b1;
                    candy <= 1'b0;
                  end
                  else if (!candy && in == change_button_pressed) begin
                    change_beg <= 3'b101;
                    change_obeg <= 1'b1;
                    candy <= 1'b0;
                  end
                  else candy <= 1'b0;
                end

    // candy_out:  if (in == change_button_pressed) candy = 1'b1;

    // change_out: begin
    //               change_beg <= 3'b000;
    //               change_obeg <= 1'b0;
    //             end

    default:    begin
                  sum_out <= 8'b0000_0000;
                  change_beg <= 3'b000; 
                  change_obeg <= 1'b0; 
                  candy <= 1'b0;
                end
  endcase
end

//  count the number of candies
always @(negedge clk) begin
  if (reset) begin
    count <= 3'b000;
    // temp_count <= 3'b000;
  end
  else begin
    if (candy) begin
      count <= count + 1;
      // temp_count <= count;
    end
    else count <= 3'b000;
  end
end

assign sum = sum_out;
assign candy_sum = count;
endmodule
