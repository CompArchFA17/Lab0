// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg[0:3] a;
    reg[0:3] b;
    wire[0:3] sum;
    wire overflow, carryout;

    FullAdder4bit adder1 (sum, carryout, overflow, a, b);

    initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,adder1);
    // Your test code here
    $display("   Inputs   |   Output  ");
    $display("a    b      | sum    carryout overflow ");
    a='b0000;b='b0000; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    $display("    Testing Overflow    ");
    a='b0100;b='b0000; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b0100;b='b0000; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b1000;b='b0000; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b1100;b='b0000; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    $display("");

    a='b0000;b='b0100; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b0100;b='b0100; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b1000;b='b0100; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b1100;b='b0100; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    $display("");

    a='b0000;b='b1000; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b0100;b='b1000; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b1000;b='b1000; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b1100;b='b1000; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    $display("");

    a='b0000;b='b1100; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b0100;b='b1100; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);

    a='b1000;b='b1100; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);








    $display("      Carryout Test      ");
    a='b1111;b='b1111; #50
    $display("%b %b   | %b   %b        %b ", a, b, sum, carryout, overflow);
    end
endmodule
