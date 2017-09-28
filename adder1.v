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
    wire bc;
    wire ac;
    // and together pairs of the three inputs
    `AND aANDb(ab, a, b);
    `AND bANDc(bc, b, carryin);
    `AND aANDc(ac, a, carryin);

    // if any set of two is true, there is a carryout
    `OR cout(carryout, ab, bc, ac);
    // the sum is just the three inputs XORed
    `XOR sumout(sum, a, b, carryin);
    
endmodule
