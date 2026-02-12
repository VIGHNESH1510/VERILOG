module pipo #(parameter N=4)(input clk,reset,input [N-1:0]data,output reg [N-1:0]Q);
always @ (posedge clk or posedge reset)
begin
  if(reset)
    Q<= 0;
  else
    Q <= data;
end
endmodule
