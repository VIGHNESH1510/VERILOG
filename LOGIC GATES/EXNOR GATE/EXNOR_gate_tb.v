module EXNOR_gate_tb;
  reg a,b;
  wire out;
  EXNOR_gate dut(.a(a),.b(b),.out(out));
  initial begin
    $monitor("time = %0t | a = %b | b = %b | out = %b",$time,a,b,out);
    $dumpfile("EXNOR_tb.vcd");
    $dumpvars(0,EXNOR_gate_tb);
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;
    $finish;
  end
endmodule
