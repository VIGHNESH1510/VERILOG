module full_add(input a,b,c,output sum, carry);
  // assign sum= a^b^c;
  // assign carry = a&b | c&(a^b);
  wire s1,s2;
  wire c1,c2;
  
  half_add h1(a,b,s1,c1);
  half_add h2(s1,c,sum,c2);
  assign carry= c1 | s1&c;
endmodule


module half_add(input a,b,output sum,carry);
  assign sum=a^b;
  assign carry= a&b;
endmodule
