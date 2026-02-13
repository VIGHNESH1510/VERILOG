
module SR_ms(input clk,reset,S,R,output Q);
 wire q1,q2;
 SR_latch sr(.clk(~clk),.reset(reset),.S(S),.R(R),.Q(q1));
 SR_latch sr1(.clk(clk),.reset(reset),.S((q1===1'bx)? 1'b1:q1),.R((q1===1'bx) ? 1'b1:~q1),.Q(Q));
endmodule


module SR_latch(input clk, reset,S,R,output reg Q);
always @(clk or S or R)
begin
  if(reset)
    Q =0;
  else
  begin
    if(clk)
    begin
      case({S,R})
        2'b01: Q = 0;
        2'b10: Q =1;
        2'b11: Q =1'bx;
      endcase
    end
  end
end
endmodule
