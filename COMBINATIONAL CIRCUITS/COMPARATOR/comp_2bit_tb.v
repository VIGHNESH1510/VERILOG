module tb;
  reg[1:0] A,B;
  wire 	Y1,Y2,Y3;	
  compare_2bit nn(A,B, Y1,Y2,Y3);
  initial begin
    $monitor("time=%0t A=%b B=%b y1=%b y2=%b y3=%b ",$time,A,B,Y1,Y2,Y3);   
    A=2'b11; B=2'b10; #10;
     A=2'b01; B=2'b10; #10;
     A=2'b11; B=2'b11; #10;
    A=2'b00; B=2'b11; #10;
    $finish;
  end
endmodule
