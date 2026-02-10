module D_ring_count#(parameter N=4)(input clk,reset,output [N-1:0]Q);
   wire [N-1:0]D;
   assign D ={Q[0],Q[N-1:1]};
   genvar i;
   generate
     for(i=0;i<N;i=i+1)
         D_FF d(.clk(clk),.reset(reset),.data((i==0)?1'b1:1'b0),.D(D[i]),.Q(Q[i]));
   endgenerate
   endmodule
 
  module D_FF(input clk,reset,D,data,output reg Q);
  always @(posedge clk or posedge reset)
  begin
    Q <= reset? data:D;
  end
  endmodule
