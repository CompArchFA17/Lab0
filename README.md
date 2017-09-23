# CompArch Lab 0: Full Adder on FPGA

###################################333
Test Case:
a=0011;b=0000; #1000;

Expected result: Cout=0, sum = 0011

Result: a=1011 b=0000  | cout=0    sum=1011

Cause: we were referencing things as a=0011 instead of 4'b0011



####################################
Test Case:
a=1000; b=1000;
Result:
a=1000; b=1000; Cout=1 Sum=0000
This would seem to indicate that the left is the most significant bit.

Which is it??


###################################
A    B     | Sum  Cout Overflow
0000 0000  | 0000 0    1

cause: we were doing xnor(sum[3], cout2] instead of xor(carryout, cout2)
