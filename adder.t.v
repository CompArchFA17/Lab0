// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg [3:0] a;
    reg [3:0] b;
    wire[3:0] s;
    wire carryout;
    wire overflow;

    FullAdder4bit adder (s, carryout, overflow, a, b);

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0,testFullAdder);
        // Your test code here
        
        $display("general case for no carryout and no overflow");
        $display("a0 a1 a2 a3 b0 b1 b2 b3 | s0 s1 s2 s3 | carryout overflow");
        a=4'b0000;b=4'b0101; #1000
        $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b  %b  |        %b        %b", a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], s[0], s[1], s[2], s[3], carryout, overflow);
        a=4'b0011;b=4'b0001; #1000
        $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b  %b  |        %b        %b", a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], s[0], s[1], s[2], s[3], carryout, overflow);
        
        $display("case with overflow and no carryout");
        a=4'b0101;b=4'b0011; #1000
        $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b  %b  |        %b        %b", a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], s[0], s[1], s[2], s[3], carryout, overflow);
        a=4'b0111;b=4'b0110; #1000
        $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b  %b  |        %b        %b", a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], s[0], s[1], s[2], s[3], carryout, overflow);

        $display("case with overflow and carrayout");
        a=4'b1001;b=4'b1110; #1000 
        $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b  %b  |        %b        %b", a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], s[0], s[1], s[2], s[3], carryout, overflow);
        a=4'b1011;b=4'b1011; #1000 
        $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b  %b  |        %b        %b", a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], s[0], s[1], s[2], s[3], carryout, overflow);

        $display("case with no overblow but carryout");
        a=4'b1101;b=4'b1011; #1000
        $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b  %b  |        %b        %b", a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], s[0], s[1], s[2], s[3], carryout, overflow);
        a=4'b1111;b=4'b1010; #1000
        $display("%b  %b  %b  %b  %b  %b  %b  %b  | %b  %b  %b  %b  |        %b        %b", a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], s[0], s[1], s[2], s[3], carryout, overflow);
    end
endmodule
