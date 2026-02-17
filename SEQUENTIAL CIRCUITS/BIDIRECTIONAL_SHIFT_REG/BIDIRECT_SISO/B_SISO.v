module b_siso #(parameter N=4)(input clk,reset,data,mode,output Q);
reg [N-1:0] q;
always @(posedge clk or posedge reset)
begin
  if(reset)
    q<= {N{1'b0}};
  else begin
    if(mode)
      q <= {data,q[N-1:1]};
    else
      q<= {q[N-2:0],data};
  end
end
assign Q = mode? q[0] : q[N-1];
endmodule
