`include "adder.v"

module FullAdder4bit_test();
  reg [3:0] A, B;
  wire [3:0] sum;
  wire carryout, overflow;

  FullAdder4bit adder(sum, carryout, overflow, A, B);

  reg [3:0] testAVals [15:0];
  reg [3:0] testBVals [15:0];
  reg [3:0] outputs [15:0];
  reg [3:0] overflows [15:0];

  task testAdd;
    input [3:0] a, b, expectedOut, expectedOverflow;
    begin
      A=a; B=b; #500
      if (sum == expectedOut && overflow == expectedOverflow)
        $display("Test succeeded (output %b) for inputs %b and %b", sum, a, b);
      else if (sum == expectedOut && overflow)
        $display("Output matches (%b), unexpected overflow (%b) for inputs %b and %b", sum, overflow, a, b);
      else
        $display("Expected %b for inputs %b and %b, got %b.", expectedOut, a, b, sum);
    end
  endtask

  integer i;

  initial begin
    testAVals[0] = 4'b0000; testBVals[0] = 4'b0000; outputs[0] = 4'b0000; overflows[0] = 0;
    testAVals[1] = 4'b0001; testBVals[1] = 4'b0001; outputs[1] = 4'b0010; overflows[1] = 0;
    testAVals[2] = 4'b0011; testBVals[2] = 4'b0010; outputs[2] = 4'b0101; overflows[2] = 0;
    testAVals[3] = 4'b1100; testBVals[3] = 4'b0100; outputs[3] = 4'b0000; overflows[3] = 0;
    testAVals[4] = 4'b1111; testBVals[4] = 4'b1111; outputs[4] = 4'b1110; overflows[4] = 0;
    testAVals[5] = 4'b0111; testBVals[5] = 4'b0001; outputs[5] = 4'b1000; overflows[5] = 1;
    testAVals[6] = 4'b1011; testBVals[6] = 4'b1100; outputs[6] = 4'b0111; overflows[6] = 1;
    testAVals[7] = 4'b1100; testBVals[7] = 4'b1100; outputs[7] = 4'b1000; overflows[7] = 0;
    testAVals[8] = 4'b1101; testBVals[8] = 4'b0101; outputs[8] = 4'b0010; overflows[8] = 0;
    testAVals[9] = 4'b0001; testBVals[9] = 4'b1010; outputs[9] = 4'b1011; overflows[9] = 0;
    testAVals[10] = 4'b0001; testBVals[10] = 4'b0110; outputs[10] = 4'b0111; overflows[10] = 0;
    testAVals[11] = 4'b0000; testBVals[11] = 4'b1100; outputs[11] = 4'b1100; overflows[11] = 0;
    testAVals[12] = 4'b0010; testBVals[12] = 4'b0000; outputs[12] = 4'b0010; overflows[12] = 0;
    testAVals[13] = 4'b1110; testBVals[13] = 4'b0000; outputs[13] = 4'b1110; overflows[13] = 0;
    testAVals[14] = 4'b0111; testBVals[14] = 4'b1011; outputs[14] = 4'b0010; overflows[14] = 0;
    testAVals[15] = 4'b0010; testBVals[15] = 4'b0010; outputs[15] = 4'b0100; overflows[15] = 0;

    $display("Commencing test bench...");
    for (i = 0; i < 16; i = i + 1) begin
      testAdd(testAVals[i], testBVals[i], outputs[i], overflows[i]);
    end
  end
endmodule
