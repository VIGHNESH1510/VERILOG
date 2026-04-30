module tb;
  reg clk,reset,A;
  wire [1:0]state;
  
  fsm dut(.clk(clk),.reset(reset),.A(A),.state(state));
  always #5 clk = ~clk;
  
  initial 
    begin
      $monitor("$time = %0t reset =%b A=%b state = %0d",$time,reset,A,state);
      reset =1; clk=0; A=0;
      #10;
      reset=0; 
      #70;
      A=1;
      #80;
      A=0;
      #50;
      $finish;
    end
endmodule

/*
$time = 0 reset =1 A=0 state = 0
$time = 10 reset =0 A=0 state = 0
$time = 15 reset =0 A=0 state = 1
$time = 25 reset =0 A=0 state = 0
$time = 35 reset =0 A=0 state = 1
$time = 45 reset =0 A=0 state = 0
$time = 55 reset =0 A=0 state = 1
$time = 65 reset =0 A=0 state = 0
$time = 75 reset =0 A=0 state = 1
$time = 80 reset =0 A=1 state = 1
$time = 85 reset =0 A=1 state = 2
$time = 95 reset =0 A=1 state = 3
$time = 105 reset =0 A=1 state = 2
$time = 115 reset =0 A=1 state = 3
$time = 125 reset =0 A=1 state = 2
$time = 135 reset =0 A=1 state = 3
$time = 145 reset =0 A=1 state = 2
$time = 155 reset =0 A=1 state = 3
$time = 160 reset =0 A=0 state = 3
$time = 165 reset =0 A=0 state = 0
$time = 175 reset =0 A=0 state = 1
$time = 185 reset =0 A=0 state = 0
$time = 195 reset =0 A=0 state = 1
$time = 205 reset =0 A=0 state = 0
*/
