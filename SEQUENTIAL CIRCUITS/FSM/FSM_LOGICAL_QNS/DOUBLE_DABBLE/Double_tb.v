module double_tb #(parameter N=4);
reg clk=0,en=1;
reg [N-1:0]in;
wire [7:0]y;
double dut(.clk(clk),.in(in),.en(en),.y(y));
always #5 clk =~clk;
initial begin
  $monitor("time=%0t in=%0t en=%b y=%b",$time,in,en,y);
  $dumpfile("dd.vcd");
  $dumpvars;
  in=0;
  #5 en=0; in=4'b1010;
  #100 $finish;
end
endmodule
