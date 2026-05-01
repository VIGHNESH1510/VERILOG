module fsm(input clk,reset,in,output out);
  
  localparam [2:0] S0=0,S1=1,S2=2,S3=3;
  reg [2:0] state, next;
  
  always @(posedge clk or posedge reset)
    begin
      if(reset) state <= S0;
      else state <= next;
    end
  
  always @(*)
    begin
      case(state)
        S0: next = in ? S1: S0;
        S1: next = in ? S2: S1;
        S2: next = in ? S3: S2;
        S3: next = in ? S0: S3;
      endcase
    end
  assign out = (state==S0) ? 1'b1: 1'b0;
  
endmodule
