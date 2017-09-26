# Lab 0 Report

### Changjun Lim, Sungwoo Park


##### Waveform

![Waveform image](images/lab0/waveform.png)


Above figure shows the waveform of our adder going through few test cases. Notice that even though there are some glitches right after the inputs change, the sum output value stabilizes shortly after. 

It seems like the worst delay occurs when the all bits of two input values changes, which results in change in individual sum bits and intermediate carry-in values between the adders.

##### Test case
 We chose the following 16 test cases among the total 256 test cases. There are two interesting situations that are involved in this operation, namely overflow and carryout. We wanted to comprehensively test each possible scenario involving overflow and carryout. In order to do this, we grouped the test cases into 4 scenarios(whether there is an overflow or a carryout). We selected 4 test cases for each scenario.

 The test case 1~4 show the cases with no sum and carryout. The test case 5~8 are for the cases with overflow but no carryout. The test case 9~12 have only overflow and the test case 13-16 have both carryout and overflow. 

Note: Least significant binary digit has an index 0 in the variables.

(a: a[3], a[2], a[1], a[0],    b: b[3], b[2], b[1], b[0])

(1) a=4'b0000;b=4'b0101;

(2) a=4'b0011;b=4'b0001;

(3) a=4'b0100;b=4'b0011;

(4) a=4'b0010;b=4'b0011;

(5) a=4'b0101;b=4'b0011;

(6) a=4'b0111;b=4'b0110;

(7) a=4'b0111;b=4'b0111;

(8) a=4'b0010;b=4'b0110;

(9) a=4'b1001;b=4'b1110;

(10) a=4'b1011;b=4'b1011;

(11) a=4'b1000;b=4'b1100;

(12) a=4'b1001;b=4'b1001;

(13) a=4'b1101;b=4'b1011;

(14) a=4'b1111;b=4'b1010;

(15) a=4'b1110;b=4'b1101;

(16) a=4'b1011;b=4'b1110;

#####Result of test bench output

![test bench result](images/lab0/test_bench.png)

##### Failed test cases

Our code passed all our initial test cases.


##### Test Result on FPGA

Following pictures are the documentation of our testing process for case 9 (1001 + 1110) using FPGA board.

![A input](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/A%20input.jpg)

![B input](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/B%20input.jpg)

![Sum output](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/Sum%20output.jpg)

![Carryout output](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/Carryout%20output.jpg)
