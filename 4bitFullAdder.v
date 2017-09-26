`timescale 1 ns  1 ps
`include adder.v

module test4BitFullAdder();
    reg[3:0] a;
	reg[3:0] b;
	wire[3:0] sum;
    wire carryout;
	wire overflow;
	
	FullAdder4bit adder(sum, carryout, overflow, a, b);

    initial begin
	$dumpfile(fulladder.vcd);
	$dumpvars;

    $display("a3  a2  a1  a0  |  b3  b2  b1  b0  |  S3  S2  S1  S0  |  COut  |  OverFlow");
	//Maybe we should do a loop here to make display MUCH MUCH MUCH EASIER :P
	
    end
endmodule
