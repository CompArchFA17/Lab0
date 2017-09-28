`timescale 1 ns / 1 ps
`include "adder.v"

module test4BitFullAdder();
	reg[3:0] a; //Bus for a registers.
	reg[3:0] b; //Bus for b registers.
	wire[3:0] sum; //Bus for the individual sums.
	wire carryout; //final carryout wire.
	wire carryout2;
	wire overflow; //Overflow wire.

	FullAdder4bit adder(sum, carryout, carryout2, overflow, a, b);

  initial begin
  	$dumpfile("fulladder.vcd");
  	$dumpvars(0, a[3:0], b[3:0], sum[3:0], carryout, carryout2, overflow);

    $display(" a  |  b  |  S  C2 |  COut  |  OverFlow");

    a = -8; //Set a register.
    b = -8; //Set b register.
    #1000 //Delay.
    $display(" %d |  %d | %d   %b |    %b   |        %b ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 7;
    b = -8;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 7;
    b = 7;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 5;
    b = 2;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = 5;
    b = 3;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = -5;
    b = -3;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);
    a = -5;
    b = -4;
    #1000
    $display(" %d |  %d | %d   %b |    %b   |        %b ", $signed(a), $signed(b), $signed(sum), carryout2, carryout, overflow);

      //end
    //end

    end
endmodule
