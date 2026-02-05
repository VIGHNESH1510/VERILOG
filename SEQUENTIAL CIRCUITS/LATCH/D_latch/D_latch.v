module dff(input D,clk,output reg Q);
  always @(clk or D)
begin
  if (clk)
    Q<=D;
end
endmodule
