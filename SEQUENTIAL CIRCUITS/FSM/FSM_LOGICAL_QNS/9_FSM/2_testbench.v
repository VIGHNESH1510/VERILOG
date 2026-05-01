module tb #(parameter N=8);
  reg clk,reset;
  reg [N-1:0]data;
  wire [N-1:0] data_in;
  wire e_0,o_0,e_1,o_1;
  
  fsm dut(.clk(clk),.reset(reset),.data(data),.even_0(e_0), .odd_0(o_0),.even_1(e_1),.odd_1(o_1),.data_in(data_in));
  always #5 clk = ~clk;
  
  initial 
    begin
      $dumpfile("fsm.vcd");
      $dumpvars;
      $monitor("$time = %0t reset =%b even_0 = %b even_1 = %b odd_0 = %b odd_1 = %b data_in = %b",$time,reset,e_0,e_1,o_0,o_1,data_in);
      reset =1; clk=0; data =8'b11011001;
      #10;
      $display("DATA = %0b ",data);
      reset=0; 
      #80;
      $finish;
    end
endmodule

/*
$time = 0 reset =1 even_0 = 1 even_1 = 1 odd_0 = 0 odd_1 = 0 data_in = xxxxxxxx
DATA = 11011001 
$time = 10 reset =0 even_0 = 1 even_1 = 1 odd_0 = 0 odd_1 = 0 data_in = xxxxxxxx
$time = 15 reset =0 even_0 = 1 even_1 = 0 odd_0 = 0 odd_1 = 1 data_in = 1xxxxxxx
$time = 25 reset =0 even_0 = 0 even_1 = 0 odd_0 = 1 odd_1 = 1 data_in = 01xxxxxx
$time = 35 reset =0 even_0 = 1 even_1 = 0 odd_0 = 0 odd_1 = 1 data_in = 001xxxxx
$time = 45 reset =0 even_0 = 1 even_1 = 1 odd_0 = 0 odd_1 = 0 data_in = 1001xxxx
$time = 55 reset =0 even_0 = 1 even_1 = 0 odd_0 = 0 odd_1 = 1 data_in = 11001xxx
$time = 65 reset =0 even_0 = 0 even_1 = 0 odd_0 = 1 odd_1 = 1 data_in = 011001xx
$time = 75 reset =0 even_0 = 0 even_1 = 1 odd_0 = 1 odd_1 = 0 data_in = 1011001x
$time = 85 reset =0 even_0 = 0 even_1 = 0 odd_0 = 1 odd_1 = 1 data_in = 11011001
testbench.sv:22: $finish called at 90 (1s)
*/
