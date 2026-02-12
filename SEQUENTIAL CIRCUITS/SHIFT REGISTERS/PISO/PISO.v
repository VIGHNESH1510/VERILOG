module piso#(parameter N=4)(input clk,reset,load,input [N-1:0]data,output Q);
reg [N-1:0]q;
always @(posedge clk or posedge reset)
begin
  if(reset)
    q <=0;
  else
  begin
    //if(load)
    q <= load ? data:{1'b0,q[N-1:1]};
  end
end
assign Q = q[0];
endmodule
