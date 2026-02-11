module T_rc #(parameter N=4)(input clk,reset,output [N-1:0]Q);
wire [N-1:0]T;
genvar i,j;
generate
  for(i=0;i<N;i=i+1)
  begin
    if(i==0)
      assign T[i] = Q[N-1] ^ Q[i];
    else
      assign T[i] = Q[i-1] ^ Q[i];
  end
endgenerate
generate
  for(j=0;j<N;j=j+1)
  begin
    TFF t(.clk(clk),.reset(reset),.T(T[j]),.data(j==0? 1'b1:1'b0),.Q(Q[j]));
  end
endgenerate
endmodule

module TFF(input clk,reset,T,data,output reg Q);
always @(posedge clk or posedge reset) begin
  if(reset)
    Q <= data;
  else
    Q <= T ? ~Q: Q;

end
endmodule
