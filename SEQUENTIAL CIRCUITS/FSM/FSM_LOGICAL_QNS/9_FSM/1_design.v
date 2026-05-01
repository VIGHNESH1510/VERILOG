
module fsm #(parameter N=8)(input clk,reset,input [N-1:0]data,output reg even_0,even_1,odd_1,odd_0,output reg[N-1:0]data_in);
  
  localparam [1:0] S0=2'd0, //even_0 even_1
  				   S1=2'd1, //even_0 odd_1
  				   S2=2'd2, //odd_0 even_1
  		    	   S3=2'd3; //odd_0 odd_1
  
  reg [1:0] state, next;
  reg [N-1:0] i;
  always @(posedge clk or posedge reset)
    begin
      if(reset) begin
        state <= S0;
        i<=0;
       // data_in<=0;
      end
      else begin
        i <= i+1;
        state <= next;
        data_in <= {data[i],data_in[7:1]};
      end
      
    end
  
  always @(*)
    begin
      case(state)
        S0: begin
          next = data[i] ? S1: S2;
          even_0 = 1; odd_0 = 0;
          even_1 = 1; odd_1 =0;
        end
        
        S1: begin
          next = data[i] ? S0: S3;
          even_0 = 1; odd_0 = 0;
          even_1 = 0; odd_1 = 1;
        end
        
        S2: begin
          next = data[i] ? S3: S1;
          even_0 = 0; odd_0 = 1;
          even_1 = 1; odd_1 = 0;
        end
        
        S3: begin
          next = data[i] ? S2: S1;
          even_0 = 0; odd_0 = 1;
          even_1 = 0; odd_1 = 1;
        end
      endcase
    end
  
endmodule
