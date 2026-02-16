module JK_FF(input clk,reset,J,K,output reg Q);
always @(posedge clk or negedge reset) begin
  if(reset)
    Q <=0;
  else
  begin
    case({J,K})
      2'b00: Q<=0;
      2'b01: Q<=0;
      2'b10: Q<=1;
      2'b11: Q<= ~Q;
    endcase
  end
end
endmodule

module T_FF(input clk,reset,T,output Q);
 JK_FF t(.clk(clk),.reset(reset),.J(T),.K(T),.Q(Q));
endmodule
