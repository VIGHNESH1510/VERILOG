module T_ms(input clk,T,reset,output Q);
wire q1,t;
  T_latch d(~clk,T,reset,q1); //MASTER T latch
assign t= q1^Q;
  T_latch tl(clk,t,reset,Q); // SLAVE T latch
//D_latch d1(clk,q1,Q);
//SR_latch s(clk,q1,~q1,Q);
endmodule
