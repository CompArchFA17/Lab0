`timescale 1 ns / 1 ps
`include "adder.v"

module test4BitFullAdder();
  reg[3:0] a;
	reg[3:0] b;
	wire[3:0] sum;
  wire carryout;
	wire overflow;
  integer i;
  integer j;

	FullAdder4bit adder(sum, carryout, overflow, a, b);

  initial begin
  	$dumpfile("fulladder.vcd");
  	$dumpvars(0, a[3:0], b[3:0], sum[3:0], carryout, overflow);

    $display(" a  |  b  |  S  |  COut  |  OverFlow");
    for(i = -8; i < 8; i = i + 1)
    begin
      for(j = -8; j < 8; j = j + 1)
      begin

        a = i;
        b = j;
        #1000
        $display(" %d  |  %d  |  %d  |     %b  |        %b ", $signed(a), $signed(b), $signed(sum), carryout, overflow);
      end
    end

    end
endmodule
