module pattern#(parameter N=6);
  task spa;
     input integer n;
     for(integer i=0;i<n;i=i+1)
       $write(" ");
   endtask

   task num;
     input integer n;
     for(integer i=0;i<n;i=i+1)
       begin
         $write("%0d",n);
         if(i!=n-1)
           $write(" ");
       end
   endtask

  integer i,j,k;
initial
  begin
    for(i=1;i<(N*2);i=i+1)
      begin
        if(i<=N) begin
         spa(N-i);
         num(i);
       end
       else begin
         spa(i-N);
         num((N*2)-i);
       end
        $display();
      end
  end
endmodule
/*
     1
    2 2
   3 3 3
  4 4 4 4
 5 5 5 5 5
6 6 6 6 6 6
 5 5 5 5 5
  4 4 4 4
   3 3 3
    2 2
     1
     */
