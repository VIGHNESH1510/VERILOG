module N_bit_counters#(parameter N=4)(input clk,reset,output reg [N-1:0]Q);
wire mod;
assign mod= Q[3] & ~Q[2] & ~Q[1] & Q[0];

//assign mod= Q[3] & ~Q[2] & Q[1] & ~Q[0];

always@(posedge clk or posedge reset)
begin
  if(reset || mod)
    Q <= {N{1'b0}};
  else
    Q <= Q+1;
end
endmodule
