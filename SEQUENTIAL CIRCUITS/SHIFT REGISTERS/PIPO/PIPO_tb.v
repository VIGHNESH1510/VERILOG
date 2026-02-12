module pipo_tb#(parameter N=4);
reg clk,reset;
reg [N-1:0] data;
wire [N-1:0] Q;
pipo dut(.clk(clk),.reset(reset),.data(data),.Q(Q));
always #5 clk =~clk;
initial begin
  $monitor("time=%0t reset=%b data=%b Q=%b",$time,reset,data,Q);
  $dumpfile("pipo.vcd");
  $dumpvars;
  clk=0; reset=1; data= $random;
  #20 reset=0;
  #20 data = $random;
  #50 $finish;
end
endmodule
