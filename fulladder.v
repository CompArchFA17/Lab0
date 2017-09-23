// Adder circuit

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
not notcarryin(ncarryin, carryin);
not nota(na, a);
not notb(nb, b);

and gets1(s1, na, nb, carryin);
and gets2(s2, na, b, ncarryin);
and gets3(s3, a, nb, ncarryin);
and gets4(s4, a, b, carryin);

or getsum(sum, s1, s2, s3, s4);

and getcarryout1(cout1, na, b, carryin);
and getcarryout2(cout2, a, nb, carryin);
and getcarryout3(cout3, a, b, ncarryin);
and getcarryout4(cout4, a, b, carryin);

or getcarryout(carryout, cout1, cout2, cout3, cout4);

endmodule
