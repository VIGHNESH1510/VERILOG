module counter_4bit (input clk,enable,load,input [3:0]data,output reg [3:0] Q);
always @(posedge clk) begin
  if(enable)
  begin
    if(load)
      Q <= data;
    else if(Q==4'd9)
      Q <=4'd0;
    else
      Q <= Q+1;
  end
  else
    Q <=Q;
end
endmodule

module counter_99(input clk,enable,preset,output [7:0]Q);
wire en=preset | (Q==8'd99);
counter_4bit c1(.clk(clk),.enable(enable),.load(en),.data(4'd9),.Q(Q[3:0]));
counter_4bit c2(.clk(clk),.enable( enable & (Q[3:0]==4'd9)),.load(en),.data(4'd0),.Q(Q[7:4]));

