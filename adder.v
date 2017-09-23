`include "fulladder.v"

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    // Your Code Here

structuralFullAdder adder0 (sum[0], carryout0, a[0], b[0], 0);
structuralFullAdder adder1 (sum[1], carryout1, a[1], b[1], carryout0);
structuralFullAdder adder2 (sum[2], carryout2, a[2], b[2], carryout1);
structuralFullAdder adder3 (sum[3], carryout, a[3], b[3], carryout2);


// Overflow when carry in to the most significant column does not equal carry out
// carryout1 is the carryin of the 0th bit and carryout is the carryout of the 0th bit
xor getoverflow(overflow, carryout2, carryout);






//   Inputs   |   Output  
//a    b      | sum    carryout overflow 
//0100 0100   | 0010   0        0 

endmodule