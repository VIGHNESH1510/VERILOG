module dff(input D,clk,reset,output reg Q);
  always @(posedge clk)  // Active high reset
begin
  if (reset)
    Q<=0;
  else
    Q<=D;
end
endmodule

module dff(input D,clk,reset,output reg Q);
  always @(posedge clk) // Active low reset
begin
  if (!reset)
    Q<=0;
  else
    Q<=D;
end
endmodule
