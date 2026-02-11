module SISO #(parameter N=4)(input clk,reset,input data,output  Q);
reg [N-1:0]q;
always @(posedge clk or posedge reset)
begin
  if(reset)
    q <= 0;
  else
     q <= {q[N-2:0],data};
end
  assign Q = q[N-1];
endmodule
