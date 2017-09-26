# Lab 0 Report

### Changjun Lim, Sungwoo Park


##### Waveform


##### Test case

We choose the following 16 cases among total 256 cases.
 Since we group the cases into 4 s(overflow, carryout), We select 4 cases for each 
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




There is no test case failure.


##### Test Result on FPGA



![A input](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/A%20input.jpg)

![B input](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/B%20input.jpg)

![Sum output](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/Sum%20output.jpg)

![Carryout output](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/Carryout%20output.jpg)