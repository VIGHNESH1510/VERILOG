module ripple_carry #(parameter N=8)(
                        input [N-1:0]a,b,
  						input cin,
  output [N-1:0]sum,
  output carry);
  wire [N:0]c;
  assign c[0]=cin;
  
  genvar i;
  
  generate 
    for(i=0;i<N;i++) begin
      full_adder f(.a(a[i]),.b(b[i]),.c(c[i]),.sum(sum[i]),.carry(c[i+1]));
    end
    endgenerate
  
      assign carry=c[N];
endmodule


module full_adder(input a,b,c,output sum,carry);
  assign {carry,sum}=a+b+c;
endmodule
