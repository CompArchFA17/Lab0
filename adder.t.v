// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit();
    reg[3:0] a, b;
    wire[3:0] sum;
    wire overflow, carryout;

    FullAdder4bit adder (sum, carryout, overflow, a, b);

    initial begin
      $dumpfile("adder4bit.vcd");
      $dumpvars;

      $display("A    B     | Sum  Cout Overflow ");
      a=4'b0000;b=4'b0000; #1000;
      $display("%b %b  | %b %b    %b", a, b, sum, carryout, overflow);
      a=4'b0001;b=4'b0001; #1000;
      $display("%b %b  | %b %b    %b", a, b, sum, carryout, overflow);
      a=4'b0011;b=4'b0000; #1000;
      $display("%b %b  | %b %b    %b", a, b, sum, carryout, overflow);
      a=4'b0000;b=4'b0011; #10000;
      $display("%b %b  | %b %b    %b", a, b, sum, carryout, overflow);
      a=4'b0101;b=4'b0010; #10000;
      $display("%b %b  | %b %b    %b", a, b, sum, carryout, overflow);
      a=4'b0101;b=4'b0011; #10000;
      $display("%b %b  | %b %b    %b", a, b, sum, carryout, overflow);
      a=4'b1001;b=4'b1110; #10000;
      $display("%b %b  | %b %b    %b", a, b, sum, carryout, overflow);
      a=4'b1101;b=4'b1011; #10000;
      $display("%b %b  | %b %b    %b", a, b, sum, carryout, overflow);
      $finish;
    end
endmodule
