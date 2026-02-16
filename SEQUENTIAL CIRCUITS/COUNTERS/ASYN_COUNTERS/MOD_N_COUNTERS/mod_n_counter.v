module mod_n #(parameter N=4)(input clk,reset, output [N-1:0] Q);
wire mq;
  assign mq = Q[3] & ~Q[2] & Q[1] & ~Q[0];  // mod_10 condition
genvar i;
generate
  for(i=0;i<N;i=i+1)
  begin
   T_FF t(.T(1'b1),.clk((i!=0) ? ~Q[i-1]:clk),.reset(reset || mq),.Q(Q[i]));
 end
 endgenerate
endmodule

module T_FF(input clk,T,reset,output reg Q);
always @(posedge clk or posedge reset)
  begin
    if(reset)
      Q<=0;
    else
      Q <= T? ~Q:Q;
  end
endmodule
