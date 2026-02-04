module half_sub(input a,b,output diff, borrow);
  assign diff= a^b;
  assign borrow = a&~b;
endmodule
module full_sub(input a,b,c,output diff, borrow);
  wire d1,d2,b1,b2;
  half_sub h1(.a(b),.b(c),.diff(d1),.borrow(b1));
  half_sub h2(.a(a),.b(d1),.diff(diff),.borrow(b2));
  assign borrow= b1 | a&~d1;
endmodule
 // diff = a^b^c;
// carry = bc' + a(b xnor c);
