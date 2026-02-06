module JK_FF(input J,K,clk,reset,output reg Q);
  always@(posedge clk)
    begin
      if(reset)  // ACtive high reset
        Q <= 0;
      else
        case ({J,K})
          2'b00: Q <= Q;
          2'b01: Q <= 0;
          2'b10: Q <= 1;
          2'b11: Q <= ~Q;
          default: Q <= Q;
        endcase
          
    end
endmodule

module JK_FF(input J,K,clk,reset,output reg Q);
  always@(posedge clk)
    begin
      if(!reset) // Active low reset
        Q <= 0;
      else
        case ({J,K})
          2'b00: Q <= Q;
          2'b01: Q <= 0;
          2'b10: Q <= 1;
          2'b11: Q <= ~Q;
          default: Q <= Q;
        endcase
          
    end
endmodule
