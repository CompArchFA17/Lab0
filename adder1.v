// Adder circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module oneBitAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire ab;
    `AND aANDb(ab, a, b);
    wire bc;
    wire ac;
    `AND bANDc(bc, b, carryin);
    `AND aANDc(ac, a, carryin);

    `OR cout(carryout, ab, bc, ac);
    `XOR sumout(sum, a, b, carryin);
    
endmodule
