module b_siso_tb #(parameter N=4);
reg data,clk=0,reset,mode;
wire Q;
b_siso dut(.clk(clk),.reset(reset),.mode(mode),.Q(Q),.data(data));
always #5 clk=~clk;
initial begin
  $monitor("time=%0t reset=%b data=%b mode=%b Q=%b",$time,reset,data,mode,Q);
  $dumpfile("b_siso_tb.vcd");
  $dumpvars;
  reset=1; mode=1; data=1;
  #10 reset=0;
  #40 mode=0;
  #20 $finish;
end
endmodule
