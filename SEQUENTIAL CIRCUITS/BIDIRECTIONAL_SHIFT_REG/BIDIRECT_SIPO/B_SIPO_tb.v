module b_sipo_tb #(parameter N=4);
wire [N-1:0] Q;
reg clk=0,rst,data,mode;
b_sipo dut(.clk(clk),.reset(rst),.data(data),.mode(mode),.Q(Q));
always #5 clk =~clk;
initial begin
  $monitor("time=%0t reset=%b data=%b mode=%b Q=%b",$time,rst,data,mode,Q);
  $dumpfile("b_sipo_tb.vcd");
  $dumpvars;
  rst=1; data=1; mode=1;
  #10 rst=0;
  #40 mode=0; data=0;
  #10 $finish;
end

endmodule
