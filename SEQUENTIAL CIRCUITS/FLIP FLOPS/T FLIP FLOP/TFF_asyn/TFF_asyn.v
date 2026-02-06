module Tff(input T,clk,reset,output reg Q);
  always @(posedge clk or posedge reset) //Active high reset
  begin
    if(reset)
      Q<=0;
    else if(T)
      Q<= ~Q;
    else
      Q <=Q;
    
  end
endmodule

module Tff(input T,clk,reset,output reg Q);
  always @(posedge clk or negedge reset)  // Active low reset
  begin
    if(!reset)
      Q<=0;
    else if(T)
      Q<= ~Q;
    else
      Q <=Q;
    
  end
endmodule
