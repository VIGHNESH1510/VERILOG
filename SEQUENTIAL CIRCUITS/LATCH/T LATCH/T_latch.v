module T_latch(input T,clk,output reg Q=0);
  always @(clk or T) 
  begin
    if(clk)
      Q<= T? ~Q:Q;
  end
endmodule
