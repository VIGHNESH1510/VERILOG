// 50 MHz -> 5 KHz
module freq_divider (input clk,rst,output reg f_clk);
integer max= 4999,cnt =0; 
always @ (posedge clk or posedge rst)
begin
  if(rst)
    f_clk <=1'b0;
  else
  begin
    if(cnt == max)
    begin
      f_clk <= ~f_clk;
      cnt= 0;
    end
    else
      cnt =cnt+1;
  end
end
 endmodule
