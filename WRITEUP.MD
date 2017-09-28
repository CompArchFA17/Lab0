# Lab 0
### Taylor Sheneman and Alexander Hoppe

## Introduction
In this lab exercise, we used Alex's full adder implementation from HW2 to make a 4-bit adder. To do this we chained together four full adder modules, carry-out to carry-in. We then ran a simulated test bench as well as testing on a Xilinx ZYBO FPGA dev kit.


## Full Adder Behavior
Our full adder is made up of four chained-together full adder modules, each of which is was designed like the following:

![full-adder]()

Each of these full-adders has the following delay characteristics

  | A/B | Cin
 --- | :---: | :---:
 S | 2 | 1
 Cout | 3 |  2

When chained together, they have the following delay characteristics:

 | Cin | A/B0 | A/B1 | A/B2 | A/B3 |
---|:---:|:---:|:---:|:---:|:---:
S0 | 1 | 2 | X | X | X
C0 | 2 |  | | |
S1 | 3 |  | | |
C1 | 4 |  | | |
S2 | 5 |  | | |
C2 | 6 | | | |
S3 | 7 | | | |
Cout | 8 | | | |
OVF | 9 | | | |

Worst Case Delay Analysis (-1 + 1, does every carry out)

Waveforms

## Test Bench

## Implementation on FPGA

## Synthesis Statistics
