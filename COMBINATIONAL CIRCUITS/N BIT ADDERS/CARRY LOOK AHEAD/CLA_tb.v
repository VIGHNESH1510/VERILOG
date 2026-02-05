module CLA_tb;
reg c;
reg[3:0]a,b;
wire [3:0]sum;
wire carry;
CLA r(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
initial begin
$monitor("time = %0t | a = %b(%d) | b = %b(%d) | c = %b | sum = %b(%d) | carry = %b",$time,a,a,b,b,c,sum,sum,carry);
$dumpfile("CLA_adder.vcd");
$dumpvars;
a= 4'b0001; b=4'b1100; c=1; #10;
a=4'b0010; b=4'b1111; c=0; #10;
a=4'b1010; b=4'b1101; c=1; #10;
a=4'b1111; b=4'b1111; c=1; #10;
a=4'b1101; b=4'b1101; c=0; #10;
$finish;
end
endmodule
