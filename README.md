# CompArch Lab 0: Full Adder on FPGA

Test Case:

a=0011;b=0000; #1000;

Expected result: Cout=0, sum = 0011

Result:

a=1011 b=0000  | cout=0    sum=1011

Cause: the least significant bit is the leftmost, we thought it was the rightmost
