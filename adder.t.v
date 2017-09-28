`timescale 1 ns / 1 ps
`include "adder.v"

module test4BitFullAdder();
  reg[3:0] a;
	reg[3:0] b;
	wire[3:0] sum;
  wire carryout;
  wire carryout2;
	wire overflow;
  //integer i;
  //integer j;

	FullAdder4bit adder(sum, carryout, carryout2, overflow, a, b);

  initial begin
  	$dumpfile("fulladder.vcd");
  	$dumpvars(0, a[3:0], b[3:0], sum[3:0], carryout, carryout2, overflow);

    $display(" a  |  b  |  S  C2 |  COut  |  OverFlow | Sum | ECout | EOvrflow");
    //for(i = -8; i < 8; i = i + 7)
    //begin
      //for(j = -8; j < 8; j = j + 1)
      //begin

    a = 0;
    b = 0;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |   0  |   0   |     0   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = -1;
    b = -1;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |  -2  |   1   |     0   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 1;
    b = 1;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |   2  |   0   |     0   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 7;
    b = -7;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |   0  |   1   |     0   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 6;
    b = -2;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |   4  |   1   |     0   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 6;
    b = 5;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |11(-5)|   0   |     1   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 5;
    b = -7;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |  -2  |   0   |     0   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 7;
    b = 3;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |10(-6)|   0   |     1   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = -5;
    b = -5;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |-10(6)|   1   |     1   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = -8;
    b = -8;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |-16(0)|   1   |     1   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 7;
    b = -8;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |  -1  |   0   |     0   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 7;
    b = 7;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |14(-2)|   0   |     1   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 5;
    b = 2;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |   7  |   0   |     0   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 5;
    b = 3;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |8(-8) |   0   |     1   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = -5;
    b = -3;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |  -8  |   1   |     0   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = -5;
    b = -4;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b |-9(7) |   1   |     1   ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);

      //end
    //end

    end
endmodule
