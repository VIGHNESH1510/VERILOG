module SR_FF(input clk,reset,S,R,output reg Q);
always @(posedge clk or posedge reset)
begin
if(reset)
  Q <=0;
else
begin
  case ({S,R})
    2'b00: Q <=0;
    2'b01: Q <=0;
    2'b10: Q <=1;
    2'b11: Q <=1'bx;
  endcase
end
end
endmodule


module D_FF(input clk,reset,D,output  Q);
SR_FF d(.clk(clk),.reset(reset),.S(D),.R(~D),.Q(Q));
endmodule
