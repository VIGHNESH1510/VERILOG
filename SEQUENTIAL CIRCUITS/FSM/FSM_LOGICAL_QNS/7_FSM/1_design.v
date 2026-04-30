
module fsm(input clk,reset,A,output [1:0] state);
  localparam [1:0] S0=0,S1=1,S2=2,S3=3;
  reg [1:0]state_r ,next;
  
  always @(posedge clk or posedge reset)
    begin
      if(reset) begin
        state_r <= S0;
      end
      else begin
        state_r <= next;
      end
    end
  
  always @(*) 
    begin
      case(state_r)
        S0: next = A ? S2: S1;
        S1: next = A ? S2: S0;
        S2: next = !A ? S0: S3;
        S3: next = !A ? S0: S2;
        default: next = S0;
      endcase
    end
  
  assign state = state_r;
endmodule
