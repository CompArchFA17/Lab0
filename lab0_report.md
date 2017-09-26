# Lab 0 Report

### Changjun Lim, Sungwoo Park


##### Waveform


##### Test case

We choose the following 16 cases among total 256 cases.
 Since we group the cases into 4 s(overflow, carryout), We select 4 cases for each 

(a: a3,a2,a1,a0, b: b3,b2,b1,b0)
1. a=0000, b=0101
2. a=0011, b=0001
3. a=0100, b=0011
4. a=0010, b=0011
5. a=0101, b=0011
6. a=0111, b=0110
7. a=0111, b=0111
8. a=0010, b=0110
9. a=1001, b=1110
10. a=1011, b=1011
11. a=1000, b=1100
12. a=1001, b=1001
13. a=1101, b=1011
14. a=1111, b=1010
15. a=1110, b=1101
16. a=1011, b=1110




There is no test case failure.


##### Test Result on FPGA

Test case for #9
A input
![A input](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/A%20input.jpg)
B input
![B input](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/B%20input.jpg)
Sum output
![Sum output](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/Sum%20output.jpg)
Carryout output
![Carryout output](https://raw.githubusercontent.com/SungwooPark/Lab0/master/images/lab0/Carryout%20output.jpg)