
module jk_FSM(input J,K,clk,reset ,output reg Q);
  localparam S0=1'b0,S1=1'b1;
  reg state ,next_state;
  
  always @(posedge clk or posedge reset)
    begin
      if(reset) begin
        state <= 0;
        
      end
      
      else begin
        state <= next_state;
      end
    end
  
  always @(*) begin
    Q =0;
    case (state)
      S0: next_state = J ? S1: S0;
      S1: begin 
        next_state = K ? S0 : S1;
        Q =1;
      end
      default : next_state = S0; 
    endcase
  end
 
endmodule
