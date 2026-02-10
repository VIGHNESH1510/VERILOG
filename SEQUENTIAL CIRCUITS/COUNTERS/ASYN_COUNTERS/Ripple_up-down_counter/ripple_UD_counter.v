module ripple_UD #(parameter N=4)(input clk,reset,mode,output reg [N-1:0]Q);
always @(posedge clk or posedge reset)
begin
  if(reset && mode)
    Q <= {4{1'b0}};
  else if(reset && !mode)
    Q <= {4{1'b1}};
  else if(mode)
    Q <= Q+1;
  else if(!mode)
    Q <= Q-1;
  else
     Q <=Q;
end
endmodule
