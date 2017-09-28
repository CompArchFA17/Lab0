# Process
We began by adapting verilog code for the full adder from homework 2 to create a four bit adder. After adding logic for overflow (XORing the MSB of the sum and the final carryout, then anding that with the xnor of the sign bits of both addends). Next we created a test suite to check that the implementation we had created was valid.
After debugging the code used to generate the test suite for a while we were able to confirm that the output from the 4 bit adder matched the desired results.

## Test Cases
Instead of picking 16 test cases by hand we wrote a python program to exhaustively generate test cases. However, if we were to pick specific test cases we would probably pick ones that would overflow, and with positive and negative numbers, along with test cases that involve simpler operations to make sure normal operation is not overlooked.

## Test Case Failures
At first we had a faulty way of checking for overflow, which caused us to often identify overflow when adding a positive and negative number. When we anded our previous implementation with the xnor of the sign bits of the addend, that problem went away.

# FPGA
After fighting with Vivado for a while we were able to successfully upload the bitstream to the device. After that we tested the sum and flags by cycling through values on the FPGA and found that everything was operating as it was supposed to.
## Timing
![timing](https://github.com/TShapinsky/Lab0/blob/master/Timing.png?raw=true)
## Power
![Power](https://github.com/TShapinsky/Lab0/blob/master/Power.png?raw=true)
## Utilization
![utilization](https://github.com/TShapinsky/Lab0/blob/master/Utilization.png?raw=true)
## DRC
![DRC](https://github.com/TShapinsky/Lab0/blob/master/DRC.png?raw=true)


# Waveforms

![full_waveform](https://github.com/TShapinsky/Lab0/blob/master/full.png?raw=true)
Waveform of all of our tests (all 2^8).
![prop_delay](https://github.com/TShapinsky/Lab0/blob/master/prop_delay.png?raw=true)
Waveform of a subsection of the tests showing the fluctuation between states after an input change.
