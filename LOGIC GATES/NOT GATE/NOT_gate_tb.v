module NOT_gate_tb;
  reg a;
  wire out;
  NOT_gate dut(.a(a),.out(out));
  initial begin
    $monitor("time = %0t | a = %b | out = %b",$time,a,out);
    $dumpfile("not_tb.vcd");
    $dumpvars(0,NOT_gate_tb);
       a=0; #10;
       a=1; #10;
    $finish;
  end
endmodule
