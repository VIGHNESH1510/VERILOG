module b_sipo #(parameter N=4)(input clk,reset,data,mode,output reg [N-1:0] Q);
always @(posedge clk or posedge reset)
begin
  if(reset)
    Q <= {N{1'b0}};
  else begin
    if(mode)
      Q <= {data,Q[N-1:1]};
    else
      Q <= {Q[N-2:0],data};
  end
end
endmodule
