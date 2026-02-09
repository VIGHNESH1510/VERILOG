module ripple_carry #(parameter N=4)(input clk,reset,output [N-1:0]Q);
 genvar i;
 generate
   for(i=0; i<N;i=i+1)
   begin
     if(i==0)
       T_FF t(.clk(clk),.T(1'b1),.reset(reset),.Q(Q[i]));
     else begin
       // positive clock edge up counter
       T_FF t(.clk(~Q[i-1]),.T(1'b1),.reset(reset),.Q(Q[i])); 
       //negative clock edge down counter
       // T_FF t(.clk(Q[i-1]),.T(1'b1),.reset(reset),.Q(Q[i]));
     end
   end
 endgenerate
endmodule

module T_FF(input T,clk,reset,output reg Q);
always @(posedge clk or posedge reset)
begin
  if(reset)
    Q <=0;
  else begin
    Q <= T ? ~Q:Q;
  end
end
endmodule
