module JK_ms(input clk,J,K,reset,output Q);
wire q1,T;
  JK_latch j(~clk,J,K,reset,q1); // MASTER JK_latch
  JK_latch t(clk,q1,~q1,reset,Q); // SLAVE JK_latch
  
  //D_latch d1(clk,q1,reset,Q); // SLAVE D_LATCH
  
  //assign T= q1^Q;
  //T_latch d1(clk,T,reset,Q); // SLAVE T_LATCH
endmodule

module JK_latch(input clk,J,K,reset, output reg Q);
always @(clk or J or K)
begin
  if(reset)
    Q=0;
  else begin
  if(clk)
    begin
      case({J,K})
        2'b01: Q =0;
        2'b10: Q =1;
        2'b11: Q= ~Q;
      endcase
    end
  end
end
endmodule

