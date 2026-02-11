module SIPO #(parameter N=4)(input clk,reset,input data,output reg [N-1:0]Q);
always @(posedge clk or posedge reset)
begin
  if(reset)
    Q <= 0;
  else
     Q <= {Q[N-2:0],data};

end
endmodule
