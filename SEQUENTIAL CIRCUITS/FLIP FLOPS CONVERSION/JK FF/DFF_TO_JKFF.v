module D_FF(input clk,reset,D,output reg Q);
always @(posedge clk or posedge reset)
begin
  if(reset)
     Q <=0;
   else
     Q <= D;
end
endmodule

module JK_FF(input clk,reset,J,K,output Q);
wire jk;
assign jk= (J& ~Q) | (~K & Q);
D_FF d(.clk(clk),.reset(reset),.D(jk),.Q(Q));
endmodule
