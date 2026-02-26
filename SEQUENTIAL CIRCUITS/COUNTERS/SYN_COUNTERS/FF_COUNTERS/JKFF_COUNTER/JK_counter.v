module jk_count #(parameter N=4)(input clk,rst,output [N-1:0]Q);
genvar i;
wire [N-1:0] T;
generate
  for(i=0;i<N;i=i+1)
  begin
    // UP COUNTER
    assign T[i] = ((i==0) ? 1'b1 : (& Q[i-1'b1:0]));
    // DOWN COUNTER
    // assign T[i] = ((i==0) ? 1'b1 : (~| Q[i-1'b1:0]));
    jk_ff ins(.clk(clk),.rst(rst),.j(T[i]),.k(T[i]),.Q(Q[i]));
  end
endgenerate
endmodule

module jk_ff(input clk,rst,j,k,output reg Q);
always @(posedge clk or posedge rst)
begin
  if (rst)
    Q <=1'b0;
  else begin
  case({j,k})
    2'b00: Q<= Q;
    2'b01: Q <= 1'b0;
    2'b10: Q <= 1'b1;
    2'b11: Q <= ~Q;
  endcase
end
end
endmodule
