module ripple_count #(parameter N=4)(input clk,reset,output [N-1:0]Q);
genvar i;
generate
  for(i=0;i<N;i=i+1)
  begin
    if(i==0)
      D_FF ff(.clk(clk),.reset(reset),.D(~Q[i]),.Q(Q[i]));  
    else
      D_FF ff(.clk(~Q[i-1]),.reset(reset),.D(~Q[i]),.Q(Q[i])); // positive clock edge up counter
      // positive clock edge down counter
      // D_FF ff(.clk(Q[i-1]),.reset(reset),.D(~Q[i]),.Q(Q[i])); 
  end
endgenerate
endmodule

module D_FF(input clk,reset,D,output reg Q);
always @(posedge clk or posedge reset)
begin
  if(reset)
     Q <= 0;
   else
     Q <= D;
end
endmodule
