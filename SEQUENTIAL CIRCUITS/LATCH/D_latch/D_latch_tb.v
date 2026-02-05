module d_latch_tb;
reg D=0,clk=0;
wire Q;
always  #5 clk=~clk;
always #15 D=~D;
//   always #20 reset=~reset;
d_latch d(.D(D),.clk(clk),.Q(Q));
initial begin
  $monitor("time =%0t clock=%b D=%b Q=%b",$time,clk,D,Q);
    $dumpfile("D_tb.vcd");
    $dumpvars(1,dff_tb);
    #100 $finish;
end
endmodule
