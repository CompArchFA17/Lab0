#Process
We began by adapting verilog code for the full adder from homework 2 to create a four bit adder. After adding logic for overflow (XORing the MSB of the sum and the final carryout). Next we created a test suite to check that the implementation we had created was valid.
After debugging the code used to generate the test suite for a while we were able to confirm that the output from the 4 bit adder matched the desired results.

## Test Cases
Instead of picking 16 test cases by hand we wrote a python program to exhaustively generate test cases. However, if we were to pick specific test cases we would probably pick ones that would overflow, and with positive and negative numbers, along with test cases that involve simpler operations to make sure normal operation is not overlooked.

