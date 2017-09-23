// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit();
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carryout, overflow;

    // behavioralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit adder (sum[3:0], carryout, overflow, a[3:0], b[3:0]); // Swap after testing

    initial begin
    // $dumpfile("adder.vcd");
    // $dumpvars();
    $display(" A    B   | Cout Overflow   S  | Expected Output");
    a='b0000;b='b0000; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 0 S: 0000 ", a, b, carryout, overflow, sum);
    a='b1111;b='b1111; #1000
    $display("%b %b |   %b     %b     %b | Cout: 1 Overflow: 1 S: 1110 ", a, b, carryout, overflow, sum);
    a='b1111;b='b0000; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 0 S: 1111 ", a, b, carryout, overflow, sum);
    a='b0101;b='b0011; #1000
    $display("%b %b |   %b     %b     %b | Cout: 0 Overflow: 1 S: 1000 ", a, b, carryout, overflow, sum);  
    // $display("%b %b  %b  |   %b  %b | Both true,  total = 3", a, b, overflow, carryout, sum);
    // $finish();
    end
endmodule


// module testFullAdder1bit();
//     reg a, b, carryin;
//     wire sum, carryout;

//     // behavioralFullAdder adder (sum, carryout, a, b, carryin);
//     FullAdder1bit adder (sum, carryout, a, b, carryin); // Swap after testing

//     initial begin
//     $dumpfile("adder.vcd");
//     $dumpvars();
//     $display("A B Cin | Cout S | Expected Output");
//     a=0;b=0;carryin=0; #1000
//     $display("%b %b  %b  |   %b  %b | Both false, total = 0", a, b, carryin, carryout, sum);
//     a=1;b=0;carryin=0; #1000
//     $display("%b %b  %b  |   %b  %b | S only,     total = 1", a, b, carryin, carryout, sum);
//     a=0;b=1;carryin=0; #1000
//     $display("%b %b  %b  |   %b  %b | S only,     total = 1", a, b, carryin, carryout, sum);
//     a=0;b=0;carryin=1; #1000
//     $display("%b %b  %b  |   %b  %b | S only,     total = 1", a, b, carryin, carryout, sum);
//     a=1;b=1;carryin=0; #1000
//     $display("%b %b  %b  |   %b  %b | Cout only,  total = 2", a, b, carryin, carryout, sum);
//     a=1;b=0;carryin=1; #1000
//     $display("%b %b  %b  |   %b  %b | Cout only,  total = 2", a, b, carryin, carryout, sum);
//     a=0;b=1;carryin=1; #1000
//     $display("%b %b  %b  |   %b  %b | Cout only,  total = 2", a, b, carryin, carryout, sum);
//     a=1;b=1;carryin=1; #1000
//     $display("%b %b  %b  |   %b  %b | Both true,  total = 3", a, b, carryin, carryout, sum);
//     $finish();
//     end
// endmodule