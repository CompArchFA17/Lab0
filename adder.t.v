// define gates with delays
`define AND and #50
`define OR or #50
`define XOR xor #50
`define XNOR xnor #50

// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg[3:0] a;
    reg[3:0] b;
    wire[3:0] sum;
    wire carryout, overflow;

    FullAdder4bit dut(sum, carryout, overflow, a, b);

    initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0, testFullAdder);
    `include "test.v"
    end
endmodule
