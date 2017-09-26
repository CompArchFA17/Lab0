// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

// Test a subset of the possible 2^8 inputs of the adder.
module testFullAdder4bit();
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carryout, overflow;

    FullAdder4bit adder (sum[3:0], carryout, overflow, a[3:0], b[3:0]);

    initial begin
    $dumpfile("adder.vcd");
    $dumpvars();

    // The 16 chosen test cases that match the inputs to the FPGA board.
    $display(" A    B   | Cout Overflow   S  | Expected Output");
    a='b0000;b='b0000; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 0 S: 0000 ", a, b, carryout, overflow, sum);
    a='b1111;b='b1111; #1000
    $display("%b %b |   %b     %b     %b | Cout: 1 Overflow: 0 S: 1110 ", a, b, carryout, overflow, sum);
    a='b1111;b='b0000; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 0 S: 1111 ", a, b, carryout, overflow, sum);
    a='b0010;b='b0100; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 0 S: 0110 ", a, b, carryout, overflow, sum);
    a='b1110;b='b1100; #1000
    $display("%b %b |   %b     %b     %b | Cout: 1 Overflow: 0 S: 1010 ", a, b, carryout, overflow, sum);
    a='b0010;b='b1100; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 0 S: 1110 ", a, b, carryout, overflow, sum);
    a='b0101;b='b0011; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 1 S: 1000 ", a, b, carryout, overflow, sum);
    a='b1110;b='b0100; #1000
    $display("%b %b |   %b     %b     %b | Cout: 1 Overflow: 0 S: 0010 ", a, b, carryout, overflow, sum);
    a='b1000;b='b0001; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 0 S: 1001 ", a, b, carryout, overflow, sum);
    a='b0101;b='b0010; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 0 S: 0111 ", a, b, carryout, overflow, sum);
    a='b1001;b='b1110; #1000
    $display("%b %b |   %b     %b     %b | Cout: 1 Overflow: 1 S: 0111 ", a, b, carryout, overflow, sum);
    a='b1101;b='b1011; #1000
    $display("%b %b |   %b     %b     %b | Cout: 1 Overflow: 0 S: 1000 ", a, b, carryout, overflow, sum);
    a='b0111;b='b0011; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 1 S: 1010 ", a, b, carryout, overflow, sum);
    a='b1100;b='b1011; #1000
    $display("%b %b |   %b     %b     %b | Cout: 1 Overflow: 1 S: 0111 ", a, b, carryout, overflow, sum);
    a='b0101;b='b0100; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 1 S: 1001 ", a, b, carryout, overflow, sum);
    a='b0110;b='b0100; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 1 S: 1010 ", a, b, carryout, overflow, sum);
    
    $finish();
    end
endmodule
