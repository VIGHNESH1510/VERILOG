module piso_tb #(parameter N=4);
reg clk,reset,load;
reg [N-1:0] data;
wire Q;
piso dut(.clk(clk),.reset(reset),.load(load),.Q(Q),.data(data));
always #5 clk=~clk;
initial
begin
  $monitor("time=%0t reset=%b data=%b load=%b Q=%b",$time,reset,data,load,Q);
  $dumpfile("piso.vcd");
  $dumpvars;
  clk=0; reset=1; data= 4'b1010;
  load=1;
  #20 reset =0;
  #30 load =0;
  #50 $finish;
end
endmodule
