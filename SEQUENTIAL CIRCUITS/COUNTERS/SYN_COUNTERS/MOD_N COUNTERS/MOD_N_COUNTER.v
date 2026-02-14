module N_bit_counters#(parameter N=4)(input clk,reset,input [N-1:0]mod,output reg [N-1:0]Q);
always@(posedge clk )
begin
  if(reset || Q==mod-1 || mod==0)
    Q <= {N{1'b0}};
  else
    Q <= Q+1;
end
endmodule
