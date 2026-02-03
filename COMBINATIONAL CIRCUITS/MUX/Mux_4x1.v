module mux_4x1(input [3:0]a,input [1:0]s,output  y);
  assign y = (~s[0] & ~s[1] & a[3]) | 
              (s[0] & ~s[1] & a[2]) | 
              (~s[0] & s[1] & a[1]) |
              (~s[0] & ~s[1] & a[0]);

//   always@(s,a)
//     begin
//       if(s==2'b00)
//         y = a[3];
//       else if(s==2'b01)
//         y = a[2];
//       else if(s==2'b10)
//         y = a[1];
//       else
//         y = a[0];
      
//     end
endmodule
