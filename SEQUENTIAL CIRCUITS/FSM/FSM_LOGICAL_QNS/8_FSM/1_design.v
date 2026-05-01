module fsm(input clk, reset,in,output out);
  localparam [1:0] S0=0,S1=1,S2=2;
  reg [1:0] state,next;
  always @(posedge clk or posedge reset)
    begin
      if(reset) state <= S0;
      else state <= next;
    end
  
  always @(*) 
    begin
      case(state)
        S0: next = in ? S1:S0;
        S1: next = in ? S2:S0;
        S2: next = in ? S2:S0;
        default: next = S0;
      endcase
    end
  
  assign out = (state == S2 && in ==1);
endmodule
