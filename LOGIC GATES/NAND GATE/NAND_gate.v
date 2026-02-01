module NAND_gate(input a,b,output out);
  assign out= ~(a&b);
//   nand n(out,a,b);
endmodule
