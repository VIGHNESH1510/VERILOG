module tb;
  reg clk,reset,in;
  wire out;
  fsm dut(clk,reset,in,out);
  always #5 clk =~clk;
  always @(posedge clk or posedge reset)
    #1 $display("time=%0t reset= %b in = %b out = %b",$time,reset,in,out);
  initial begin
    //$monitor("time=%0t in = %b out = %b",$time,in,out);
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
    clk =0; reset=1; in=0;
    #12
    reset =0;
    #12;
    in = 1;
    #10;
    in =1;
    #10;
    in =1;
    #10;
    in =1;
    #10; in =0;
    #10; in =$random;
    #10; in =$random;
    #10; in =$random;
    #10; in =$random;
    #10; in =$random;
    #10; in =$random;
    #10;
    $finish;
  end
endmodule

/*
time=1 reset= 1 in = 0 out = 1
time=6 reset= 1 in = 0 out = 1
time=16 reset= 0 in = 0 out = 1
time=26 reset= 0 in = 1 out = 0
time=36 reset= 0 in = 1 out = 0
time=46 reset= 0 in = 1 out = 0
time=56 reset= 0 in = 1 out = 1
time=66 reset= 0 in = 0 out = 1
time=76 reset= 0 in = 0 out = 1
time=86 reset= 0 in = 1 out = 0
time=96 reset= 0 in = 1 out = 0
time=106 reset= 0 in = 1 out = 0
time=116 reset= 0 in = 1 out = 1
time=126 reset= 0 in = 1 out = 0
testbench.sv:33: $finish called at 134 (1s)
*/
