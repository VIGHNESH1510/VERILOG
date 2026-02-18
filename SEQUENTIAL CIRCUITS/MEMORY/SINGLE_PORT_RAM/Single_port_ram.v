module ram(input clk,rw,input [7:0] data,input [2:0]add,output reg [7:0] out);
reg [7:0]mem[7:0];
always @(posedge clk)begin
  if(rw)
    out <= mem[add];
  else
    mem[add] <=data;

end
endmodule
