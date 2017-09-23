// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit();
    reg[3:0] a, b;
    wire[3:0] sum;
    wire overflow, carryout;

    FullAdder4bit adder (sum, carryout, overflow, a, b);

    initial begin
      //$dumpfile("../resources/adder.vcd");
      //$dumpvars;

      $display("A    B     | Cout Sum ");
      // a=0000;b=0000; #1000;
      // $display("%b %b  | %b    %b", a, b, carryout, sum);
      // a=0001;b=0000; #1000;
      // $display("%b %b  | %b    %b", a, b, carryout, sum);
      // a=0001;b=0001; #1000;
      // $display("%b %b  | %b    %b", a, b, carryout, sum);
      a=0011;b=0000; #1000;
      $display("%b %b  | %b    %b", a, b, carryout, sum);
      // a=0;b=0;carryin=1; #1000;
      // $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      // a=1;b=0;carryin=1; #1000;
      // $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      // a=0;b=1;carryin=1; #1000;
      // $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      // a=1;b=1;carryin=1; #1000;
      // $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
    end
endmodule
