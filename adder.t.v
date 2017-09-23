// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carryout, overflow;

    // behavioralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit adder (sum[3:0], carryout, overflow, a[3:0], b[3:0]); // Swap after testing

    initial begin
    // $dumpfile("adder.vcd");
    // $dumpvars();
    $display("A B Cin | Cout S | Expected Output");
    a=0000;b=0000; #1000
    $display("%b %b  %b  |   %b  %b | Both false, total = 0", a, b, overflow, carryout, sum);
    // a=1;b=0; #1000
    // $display("%b %b  %b  |   %b  %b | S only,     total = 1", a, b, overflow, carryout, sum);
    // a=0;b=1; #1000
    // $display("%b %b  %b  |   %b  %b | S only,     total = 1", a, b, overflow, carryout, sum);
    // a=0;b=0; #1000
    // $display("%b %b  %b  |   %b  %b | S only,     total = 1", a, b, overflow, carryout, sum);
    // a=1;b=1; #1000
    // $display("%b %b  %b  |   %b  %b | Cout only,  total = 2", a, b, overflow, carryout, sum);
    // a=1;b=0; #1000
    // $display("%b %b  %b  |   %b  %b | Cout only,  total = 2", a, b, overflow, carryout, sum);
    // a=0;b=1; #1000
    // $display("%b %b  %b  |   %b  %b | Cout only,  total = 2", a, b, overflow, carryout, sum);
    // a=1;b=1; #1000
    // $display("%b %b  %b  |   %b  %b | Both true,  total = 3", a, b, overflow, carryout, sum);
    // $finish();
    end
endmodule