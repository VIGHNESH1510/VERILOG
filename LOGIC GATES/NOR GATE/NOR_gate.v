module NOR_gate(input a,b,output out);
  assign out = ~(a|b);
  // nor n(out,a,b);
endmodule
