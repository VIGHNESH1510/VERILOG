module SIPO_tb#(parameter N=4);
reg clk=0,reset;
reg data;
wire [N-1:0]Q;
SIPO s(.clk(clk),.reset(reset),.data(data),.Q(Q));
always #5 clk=~clk;
initial begin
  $monitor("time=%0t reset=%b data=%b Q=%b",$time,reset,data,Q);
  $dumpfile("sipo.vcd");
  $dumpvars;
  data=1; reset=1;
  #20 reset=0;
  #60 $finish;
end
endmodule
