module double #(parameter N=4)(input [N-1:0]in,input clk,en,output reg[7:0]y);
localparam [1:0]idle=2'b00,
                load=2'b01,
                check_add=2'b10;
reg [1:0]state, next;
reg [N-1:0]d;
reg [N-1:0]cnt;
reg [7:0]data;
always @(posedge clk or posedge en)
begin
  if(en)
  begin
    state<= idle;
    cnt <= 0;
    y <=8'd0;
    data <=0;
  end
  else begin
    state <=next;
case(state)
  load : 
  begin 
  data<={data[6:0],d[N-1]};
  d <= {d[N-2:0],1'b0};
  end
  check_add: begin
    cnt <=cnt+1;
      if(data[3:0]>4)
      data[3:0] <= data[3:0]+3;
    if(data[7:4]>4)
      data[7:4] <= data[7:4]+3;
    if(cnt==N-1) begin
      y <=data;
      cnt <= 0;
    end
  end
  endcase
end
end

always @(*)
begin
case (state)
  idle: begin 
  d = in;
  next = !en ? load: idle;
  end
  load: next = check_add;
  check_add: begin
    if(cnt==N-1) begin
      next = idle;
  end
  else
    next =load;
  end
  default: next =idle;
endcase
end

endmodule
