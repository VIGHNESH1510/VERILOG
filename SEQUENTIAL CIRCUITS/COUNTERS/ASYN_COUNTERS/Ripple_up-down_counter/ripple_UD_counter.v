module ripple_ud #(parameter N=4)(input clk,reset,mode,output reg [N-1:0]Q);
always @(posedge clk or posedge reset)
begin
  if(reset)
    Q <= {N{1'b0}};
  else if(mode)
    Q <= Q+1;
  else
    Q <= Q-1;
end
endmodule
