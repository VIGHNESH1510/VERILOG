// positive edge clock up counter
module ripple_count#(parameter N=4)(input clk,reset,output reg [N-1:0]Q);
always @(posedge clk or posedge reset)
begin
  if(reset)
    Q<=0;
  else
    Q <= Q+1;
end
endmodule

// positive edge clock down counter
module ripple_count#(parameter N=4)(input clk,reset,output reg [N-1:0]Q);
always @(posedge clk or posedge reset)
begin
  if(reset)
    Q<= {N{1'b1}};
  else
    Q <= Q-1;
end
endmodule
