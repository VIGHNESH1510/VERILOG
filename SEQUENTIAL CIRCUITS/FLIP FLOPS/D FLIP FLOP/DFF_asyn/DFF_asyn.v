module dff(input D,clk,reset,output reg Q);
  always @(posedge clk or posedge reset)      //Active high reset Asynchronous D FF
begin
  if (reset)
    Q<=0;
  else
    Q<=D;
end
endmodule

module dff(input D,clk,reset,output reg Q);
  always @(posedge clk or negedge reset)   //Active Low reset Asynchronous D FF
begin
  if (!reset)
    Q<=0;
  else
    Q<=D;
end
endmodule

