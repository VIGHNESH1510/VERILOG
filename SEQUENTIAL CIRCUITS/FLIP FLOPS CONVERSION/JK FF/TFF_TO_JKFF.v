module T_FF (input clk,reset,T,output reg Q);
always @(posedge clk or posedge reset) begin
  if(reset)
    Q <=0;
  else
     Q<= T? ~Q:Q;
end
endmodule


module JK_FF(input clk,reset,J,K,output Q);
wire jk;
assign jk= (J& ~Q) | (K & Q);
T_FF t(.clk(clk),.reset(reset),.T(jk),.Q(Q));
endmodule
