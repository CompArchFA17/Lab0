# Lab 0
### Taylor Sheneman and Alexander Hoppe

## Introduction
In this lab exercise, we used Alex's full adder implementation from HW2 to make a 4-bit adder. To do this we chained together four full adder modules, carry-out to carry-in. We then ran a simulated test bench as well as testing on a Xilinx ZYBO FPGA dev kit.


## Full Adder Behavior
Our full adder is made up of four chained-together full adder modules, each of which is was designed like the following:

![full-adder]()

Each of these full-adders has the following delay characteristics (assuming AND and XOR have the same unit gate delay, in our case 50 ns).

  | A/B | Cin
 --- | :---: | :---:
 S | 2 | 1
 Cout | 3 |  2

These modules are then chained together as in the following diagram:

![four_bit_adder]()

When chained together, they have the following delay characteristics (in gate delay units):

 | Cin | A/B0 | A/B1 | A/B2 | A/B3 |
---|:---:|:---:|:---:|:---:|:---:
S0 | 1 | 2 | X | X | X
C0 | 2 | 3 | X | X | X
S1 | 3 | 4 | 2 | X | X
C1 | 4 | 5 | 3 | X | X
S2 | 5 | 6 | 4 | 2 | X
C2 | 6 | 7 | 5 | 3 | X
S3 | 7 | 8 | 6 | 4 | 2
Cout | 8 | 9 | 7 | 5 | 3
OVF | 9 | 10 | 8 | 6 | 4

So, the worst case here is that the overflow bit takes 10 unit gate delays to stabilize if it's affected by the least significant bits of the operands.

The operation that we used to show the worst-case delay (passing through all of the carry-outs from the LSB of each operand) was -1 + 1, which renders as `F` + `1` in GTKWave (`b1111` + `b0001`).

![all_gate_delays](all_gate_delays.png)
This is the waveform for our entire test bench.

![worst_case_delay](worst_case_gate_delay.png)
This is the worst case gate delay we simulated. Visible is the overflow stabilizing at the very end of the propagation chain.

## Test Bench
In writing our test bench, we decided to cover a few different types of adder case. These were as follows:


## Implementation on FPGA

## Synthesis Statistics
