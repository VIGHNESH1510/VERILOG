module asyn_fifo_tb #(parameter w=8, d=4);
reg w_clk=0,r_clk=0,w_en,r_en,r_rst_n,w_rst_n;
reg [w-1:0]d_in;
wire [w-1:0] d_out;
wire full,empty;

topModule dut(.w_clk(w_clk),.r_clk(r_clk),.w_en(w_en),.r_en(r_en),.r_rst_n(r_rst_n),.w_rst_n(w_rst_n),.d_in(d_in),.d_out(d_out),.full(full),.empty(empty));

always #5 w_clk = ~w_clk;
always #10 r_clk = ~r_clk;

task write;
  input integer count;
  begin
    repeat(count)
  begin
    @(posedge w_clk);
    if(!full)
    begin
      w_en =1;
      d_in =$random;
      $display("time =%0t In Write mode , data_in = %0b",$time,d_in);
    end
    else
    begin
      w_en =0;
      $display("FIFO is Full at time =%0t",$time);
    end
    @(posedge w_clk);
    w_en =0;
  end
  end
endtask
  
task read;
  input integer count;
  begin
    repeat(count)
  begin
    @(posedge r_clk);
    if(!empty)
    begin
      r_en =1;
      //data =$random;
      $display("time =%0t In Read mode , data_out = %0b",$time,d_out);
    end
    else
    begin
      r_en =0;
      $display("FIFO is empty at time =%0t",$time);
    end
    @(posedge r_clk);
    r_en =0;
  end
  end
endtask

initial
begin
  $dumpfile("asyn.vcd");
  $dumpvars;
  w_en=0; r_en =0; r_rst_n =0; w_rst_n =0;

  #12;
  w_rst_n = 1; r_rst_n =1;
  #8;
  write(10);
  #50;
  read(10);
  #20;
  $finish;

end
endmodule
