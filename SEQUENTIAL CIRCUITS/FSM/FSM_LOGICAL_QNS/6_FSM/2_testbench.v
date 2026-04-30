module tb #(parameter N=8);
  reg clk,reset;
  reg [N-1:0] data;
  wire OUT,done;
  fsm dut(.reset(reset),.clk(clk),.data(data),.OUT(OUT),.done(done));
  always # 5clk =~clk;
  initial begin
    $monitor("time = %0t reset = %b done=%b OUT = %b",$time,reset,done,OUT);
    $dumpfile("fsm.vcd");
    $dumpvars(0,tb);
    clk=0; reset=1; data= 8'b1001_0000;
    $display("CASE 1 ,DATA = %b",data);
    #12;
    
    reset =0;
    #90;
    
    reset=1; data= 8'b1001_1000;
    $display("CASE 2 ,DATA = %b",data);
    #2 reset=0;
    #90;
    
    reset=1; data= 8'b1001_1101;
    $display("CASE 3, DATA = %b",data);
    #2 reset=0;
    #90;
    #2 $finish;
  end
endmodule

/*
CASE 1 ,DATA = 10010000
time = 0 reset = 1 done=0 OUT = 0
time = 12 reset = 0 done=0 OUT = 0
time = 95 reset = 0 done=1 OUT = 0
CASE 2 ,DATA = 10011000
time = 102 reset = 1 done=0 OUT = 0
time = 104 reset = 0 done=0 OUT = 0
time = 185 reset = 0 done=1 OUT = 0
CASE 3, DATA = 10011101
time = 194 reset = 1 done=0 OUT = 0
time = 196 reset = 0 done=0 OUT = 0
time = 285 reset = 0 done=1 OUT = 1
*/
