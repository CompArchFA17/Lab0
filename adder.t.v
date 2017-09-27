// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit();
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carryout, overflow;

    FullAdder4bit adder (sum[3:0], carryout, overflow, a, b);

    initial begin
    $dumpfile("adder.vcd");
    $dumpvars;
    $display("Test Case       |  A   |  B   | Expected Actual | Cout OVF");
    $display("Zero Cases");
    a= 4'b0001; b=4'b0000; #1000
    $display("1+0  (0001+0000)| %b | %b |  0001     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0010; b=4'b0000; #1000
    $display("2+0  (0010+0000)| %b | %b |  0010     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0100; b=4'b0000; #1000
    $display("4+0  (0100+0000)| %b | %b |  0100     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b1111; b=4'b0000; #1000
    $display("-1+0 (1111+0000)| %b | %b |  1111     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b1110; b=4'b0000; #1000
    $display("-2+0 (1110+0000)| %b | %b |  1110     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b1100; b=4'b0000; #1000
    $display("-4+0 (1100+0000)| %b | %b |  1100     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b1000; b=4'b0000; #1000
    $display("-2+0 (1000+0000)| %b | %b |  1000     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0111; b=4'b0000; #1000
    $display(" 7+0 (0111+0000)| %b | %b |  0111     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0000; b=4'b0000; #1000
    $display(" 0+0 (0000+0000)| %b | %b |  0000     %b  |  %b    %b", a, b, sum, carryout, overflow);
    $display("Mirrored Zero Cases");
    a= 4'b0000; b=4'b0001; #1000
    $display(" 0+1 (0000+0001)| %b | %b |  0001     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0000; b=4'b0010; #1000
    $display(" 0+2 (0000+0010)| %b | %b |  0010     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0000; b=4'b0100; #1000
    $display(" 0+4 (0000+0100)| %b | %b |  0100     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0000; b=4'b0111; #1000
    $display(" 0+7 (0000+0111)| %b | %b |  0111     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0000; b=4'b1111; #1000
    $display("0+-1 (0000+1111)| %b | %b |  1111     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0000; b=4'b1110; #1000
    $display("0+-2 (0000+1110)| %b | %b |  1110     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0000; b=4'b1100; #1000
    $display("0+-4 (0000+1100)| %b | %b |  1100     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0000; b=4'b1000; #1000
    $display("0+-8 (0000+1000)| %b | %b |  1000     %b  |  %b    %b", a, b, sum, carryout, overflow);
    $display("Testing Internal Carryouts");
    a= 4'b0001; b=4'b0001; #1000
    $display(" 1+1 (0001+0001)| %b | %b |  0010     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0010; b=4'b0010; #1000
    $display(" 2+2 (0010+0010)| %b | %b |  0100     %b  |  %b    %b", a, b, sum, carryout, overflow);
    $display("Testing External Carryout");
    a= 4'b1111; b=4'b1111; #1000
    $display("-1-1 (1111+1111)| %b | %b |  1110     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b1110; b=4'b1110; #1000
    $display("-2-2 (1110+1110)| %b | %b |  1100     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b1100; b=4'b1100; #1000
    $display("-4-4 (1100+1100)| %b | %b |  1000     %b  |  %b    %b", a, b, sum, carryout, overflow);
    $display("Test Overflows");
    a= 4'b0100; b=4'b0100; #1000
    $display("4+4  (0100+0100)| %b | %b |  1000     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0111; b=4'b0111; #1000
    $display("7+7  (0111+0111)| %b | %b |  1110     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b1000; b=4'b1000; #1000
    $display("-8-8 (1000+1000)| %b | %b |  0000     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0101; b=4'b0100; #1000
    $display(" 5+4 (0101+0100)| %b | %b |  1001     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b1011; b=4'b1100; #1000
    $display("-5-4 (1011+1100)| %b | %b |  0111     %b  |  %b    %b", a, b, sum, carryout, overflow);
    $display("Regular Cases");
    a= 4'b0001; b=4'b0010; #1000
    $display("1+2  (0001+0010)| %b | %b |  0011     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0010; b=4'b0011; #1000
    $display("2+3  (0010+0011)| %b | %b |  0101     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0011; b=4'b0100; #1000
    $display("3+4  (0011+0100)| %b | %b |  0111     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0001; b=4'b1110; #1000
    $display("1+-2 (0001+1110)| %b | %b |  1111     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b1110; b=4'b1100; #1000
    $display("-2-4 (1110+1100)| %b | %b |  1010     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b0010; b=4'b1100; #1000
    $display("2+-4 (0010+1100)| %b | %b |  1110     %b  |  %b    %b", a, b, sum, carryout, overflow);
    a= 4'b1011; b=4'b0111; #1000
    $display("-5+7 (1011+0111)| %b | %b |  0010     %b  |  %b    %b", a, b, sum, carryout, overflow);
    end
endmodule
