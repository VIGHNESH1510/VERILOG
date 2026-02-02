module full_add_tb;
  reg a,b,cin;
  wire sum,carry;
  full_add f(.a(a),.b(b),.c(cin),.sum(sum),.carry(carry));
  initial begin
    $monitor("time=%0t a=%b b=%b cin=%b sum=%b carry=%b",$time,a,b,cin,sum,carry);
    $dumpfile("h_a.vcd");
    $dumpvars(1,full_add_tb);
    a=0; b=0; cin=0; #10;
    a=0; b=1; cin=0; #10;
    a=1; b=1; cin=0; #10;
    a=1; b=1; cin=1; #10;
    $finish;
  end
endmodule
