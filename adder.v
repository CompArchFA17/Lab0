// Adder circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Your adder code here
    wire axorb;
    wire nCarryIn;
    wire notaxorb;
    wire sumWire0;
    wire sumWire1;
    
    `XOR abxorgate(axorb, a, b);
    `AND andgate0(sumWire0, axorb, nCarryIn);
    `NOT invCarryIn(nCarryIn, carryin);
    `NOT invaxorb(notaxorb, axorb);
    `AND andgate1(sumWire1, carryin, notaxorb);
    `OR orgate0(sum, sumWire0, sumWire1);

    wire aandb;
    wire aorb;
    wire carryOutWire;
    
    `AND abandgate(aandb, a, b);
    `OR orgate1(aorb, a, b);
    `AND andgate2(carryOutWire, carryin, aorb);
    `OR orgate2(carryout, aandb, carryOutWire);
endmodule

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    // Your Code Here
    wire carryin1;
    wire carryin2;
    wire carryin3;
    
    structuralFullAdder adder0(sum[0],carryin1,a[0],b[0],0);
    structuralFullAdder adder1(sum[1],carryin2,a[1],b[1],carryin1);
    structuralFullAdder adder2(sum[2],carryin3,a[2],b[2],carryin2);
    structuralFullAdder adder3(sum[3],carryout,a[3],b[3],carryin3);

    `XOR overflowxorgate(overflow, carryin3, carryout);
endmodule
