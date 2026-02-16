module D_FF(input clk,reset,D,output reg Q);
always @(posedge clk or posedge reset)
begin
  if(reset)
     Q <=0;
   else
     Q <= D;
end
endmodule


module T_FF(input clk, reset,T,output Q);
D_FF d(.clk(clk),.reset(reset),.D(T^Q),.Q(Q));
endmodule
