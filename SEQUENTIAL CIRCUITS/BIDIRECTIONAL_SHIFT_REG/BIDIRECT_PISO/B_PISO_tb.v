module b_piso_tb #(parameter N=4);
wire Q;
reg clk,rst,mode,load;
reg [N-1:0] D;
b_piso dut(.clk(clk),.reset(rst),.mode(mode),.load(load),.data(D),.Q(Q));
always #5 clk=~clk;
initial
begin
  $monitor("time=%0t reset=%b mode=%b load=%b data=%b Q=%b",$time,rst,mode,load,D,Q);
  $dumpfile("b_piso.vcd");
  $dumpvars;
  rst=1; load=0; D=4'b1111; clk=0; mode=0;
  #15 rst=0;load =1;
   #5 load=0;
   #20 mode=1;
  #30 $finish;
end
endmodule
