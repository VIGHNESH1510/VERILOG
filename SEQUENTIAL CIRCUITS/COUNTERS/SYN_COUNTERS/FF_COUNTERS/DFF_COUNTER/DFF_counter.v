module DFF_count #(parameter N=4)(input clk,reset,output [N-1:0]Q);
wire [N-1:0]d;
genvar i;
generate
  for(i=0;i<N;i=i+1)
    begin
      // UP COUNTER
      assign d[i] = ((i==1'b0) ? ~Q[i] : (Q[i]^ (& Q[(i-1'b1):0])));
      // DOWN COUNTER
      // assign d[i] = ((i==1'b0) ? ~Q[i] : (Q[i] ^ (~| Q[(i-1'b1):0])));
      dff d1(clk,reset,d[i],Q[i]);
    end
  endgenerate
endmodule

module dff(input clk,reset,D,output reg Q);
  always @(posedge clk or posedge reset)
  begin
    Q <= reset? 1'b0: D;
  end
endmodule
