module usr#(parameter N=4)(input [N-1:0]data,input clk,reset,input [1:0]sel,output reg [N-1:0]Q);
always @(posedge clk or posedge reset) 
begin
  if(reset)
    Q <=0;
  else
  begin
    case(sel)
      2'b00: Q <= Q;
      2'b01: Q <= {data[N-1],Q[N-1:1]};
      2'b10: Q <= {Q[N-2:0],data[0]};
      2'b11: Q <= data;
    endcase
  end
end

endmodule
