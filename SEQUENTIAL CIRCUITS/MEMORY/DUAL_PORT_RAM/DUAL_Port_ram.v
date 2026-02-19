module dual_port_ram(input clk,wr_a,wr_b,
  input[1:0]add_a,add_b,
  input [7:0] data_a,data_b,
  output reg[7:0]out_a,out_b);
reg [7:0]mem[3:0];
always @(posedge clk)
begin
  if(wr_a==1)
    mem[add_a] <= data_a;
  else
    out_a <=mem[add_a];
  if(wr_b==1)
    mem[add_b] <= data_b;
  else
    out_b <=mem[add_b];

end

endmodule
