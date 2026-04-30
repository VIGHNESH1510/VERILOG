
module tb;
  reg clk ,reset,J,K;
  wire Q;
  always #5 clk = ~clk;
  jk_FSM dut(.clk(clk),.reset(reset),.J(J),.K(K),.Q(Q));
  initial 
  begin 
    $monitor("Time = %0t  reset = %b  J = %b  K = %b  Q = %b",$time,reset,J,K,Q);
    $dumpfile("JK_FSM.vcd");
    $dumpvars(0,tb);
    clk =0; reset=1; J=0; K=0;
    #10;
    reset =0;
    #12;
    J=0; K=1;
    #10;
    J=1; K=0;
    #10;
    J=1; K=1;
    #20; 
    $finish;
    
  end

endmodule

/*
Time = 0  reset = 1  J = 0  K = 0  Q = 0
Time = 10  reset = 0  J = 0  K = 0  Q = 0
Time = 22  reset = 0  J = 0  K = 1  Q = 0
Time = 32  reset = 0  J = 1  K = 0  Q = 0
Time = 35  reset = 0  J = 1  K = 0  Q = 1
Time = 42  reset = 0  J = 1  K = 1  Q = 1
Time = 45  reset = 0  J = 1  K = 1  Q = 0
Time = 55  reset = 0  J = 1  K = 1  Q = 1
*/
