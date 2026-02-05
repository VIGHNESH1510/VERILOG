module CLA(input [3:0]a,b,input c,output [3:0]sum,output carry);
wire [3:0]pro,gen;
assign pro=a^b;
assign gen=a&b;
wire [4:0] ca;
assign ca[0]=c;
assign ca[1]= gen[0] | (pro[0] & ca[0]);
assign ca[2]= gen[1] | (pro[1] & (gen[0] | pro[0]& ca[0]));
assign ca[3]= gen[2] | (pro[2] & (gen[1] | (pro[1] & (gen[0] | pro[0]& ca[0]))));
assign ca[4]= gen[3] | (pro[3] &  gen[2] | (pro[2] & (gen[1] | (pro[1] & (gen[0] | pro[0]& ca[0])))));
assign carry= ca[4];
assign sum = pro^ca[3:0];
endmodule
