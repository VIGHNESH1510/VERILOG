
module fsm #(parameter N =8)(input clk,reset,input [N-1:0] data, output reg OUT,done);
  localparam [1:0]S0=0, S1=1 ,S2=2;
  reg [1:0]state ,next;
  reg [2:0]last_3;
  reg [N-1:0] count,data_r;
  
  always @(posedge clk or posedge reset)
    begin
      if(reset) state <= S0;
      else state <= next;
    end
  
  always @(*) 
    begin
      case(state)
        S0 :begin 
          next = !reset ? S1 : S0;
          OUT =0;
          done =0;
        end
        S1:begin
          next = (count== N-1) ? S2 : S1;
          
        end
        S2: begin
          OUT = (last_3 > 3'd1) ? 1'b1 : 1'b0;
          next = reset ? S0 : S2;
          done=1;
        end
      endcase
    end
  
  always @(posedge clk or posedge reset)
    begin
      case(state)
        S0: begin
          count <= 0;
          last_3 <= 0;
          data_r <= data;
        end
        S1: begin
          last_3 <= {last_3[1:0],data_r[7]};
          data_r <= {data_r[6:0],1'b0};
          count <= count+1;
        end
        S2: begin
          //last_3 <=0;
          count <=0;
        end
        endcase
    end
endmodule

