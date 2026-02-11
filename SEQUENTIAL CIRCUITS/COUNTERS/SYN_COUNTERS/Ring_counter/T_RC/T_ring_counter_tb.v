module T_rc_tb #(parameter N=4);
reg clk=0,reset=1;
wire [N-1:0]Q;
T_rc dut(.clk(clk),.reset(reset),.Q(Q));
always #5 clk=~clk;
initial
begin
  $monitor("time=%0t reset=%b Q=%b",$time,reset,Q);
  $dumpfile("T_rc.vcd");
  $dumpvars;
  #20 reset=0;
  #5 reset=1;
  #10 reset=0;
  #80 $finish;
end
endmodule
