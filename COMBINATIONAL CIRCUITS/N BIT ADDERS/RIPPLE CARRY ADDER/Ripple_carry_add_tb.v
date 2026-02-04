module ripple_carry_tb #(parameter N =8);
  reg [N-1:0]a,b;
  reg cin;
  wire [N-1:0]sum;
  wire carry;
  ripple_carry rc(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
  initial begin
    $dumpfile("rcf_tb.vcd");
    $dumpvars(1,ripple_carry_tb);
    $monitor("time=%0t a=%b(%d) b=%b(%d) cin=%b sum=%b(%d) carry=%b ",$time,a,a,b,b,cin,sum,sum,carry);
    a=8'h18; b=8'h18; cin=1; #10;
    a=8'hAF; b=8'hEE; cin=0; #10;
    a=8'h22; b=8'h55; cin=1; #10;
    a=8'h38; b=8'hBB; cin=1; #10;
    $finish;
  end
endmodule
