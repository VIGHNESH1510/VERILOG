module D_ms(input clk,D,reset,output Q);
wire q1,T;
  D_latch d(~clk,D,reset,q1);     // MASTER D latch
  D_latch d1(clk,q1,Q); // SLAVE D latch
  
// assign T= q1^Q;               // SLAVE T latch
 //T_latch t(clk,T,reset,Q);

  //SR_latch s(clk,q1,~q1,Q);     // SLAVE SR/JK latch
endmodule

module D_latch(input clk,D,reset,output reg Q);
always @(clk or D)
  if(reset)
    Q =0;
  else begin
  if(clk)
    Q =D;
end
endmodule


module T_latch(input clk,T,reset,output reg Q);
always @(*)
begin
  if(reset)
    Q=0;
  else begin
  if(clk)
    Q = T? ~Q: Q;
end
end
endmodule

module SR_latch(input clk,S,R,reset, output reg Q);
always @(clk or S or R)
begin
  if(reset)
    Q=0;
  else begin
  if(clk)
    begin
      case({S,R})
        2'b01: Q =0;
        2'b10: Q =1;
        2'b11: Q= 1'bx;
      endcase
    end
  end
end
endmodule

