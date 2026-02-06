module Tff(input T,clk,reset,output reg Q);
  always @(posedge clk) 
  begin
    if(reset) // Active high reset
      Q<=0;
    else if(T)
      Q<= ~Q;
    else
      Q <=Q;
    
  end
endmodule

module Tff(input T,clk,reset,output reg Q);
  always @(posedge clk) 
  begin
    if(!reset) // Active low reset
      Q<=0;
    else if(T)
      Q<= ~Q;
    else
      Q <=Q;
    
  end
endmodule
