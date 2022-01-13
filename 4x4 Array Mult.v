//4x4 Array Multiplier

module 4x4arrMult(a,b,q);

input [3:0]a,b;

output [7:0]q;

wire [39:0]net;

//AND
and a1(net[0],a[0],b[0]);
and a2(net[1],a[1],b[0]);
and a3(net[2],a[2],b[0]);
and a4(net[3],a[3],b[0]);

and a5(net[4],a[0],b[1]);
and a6(net[5],a[1],b[1]);
and a7(net[6],a[2],b[1]);
and a8(net[7],a[3],b[1]);

and a9(net[8],a[0],b[2]);
and a10(net[9],a[1],b[2]);
and a11(net[10],a[2],b[2]);
and a12(net[11],a[3],b[2]);

and a13(net[12],a[0],b[3]);
and a14(net[13],a[1],b[3]);
and a15(net[14],a[2],b[3]);
and a16(net[15],a[3],b[3]);

  
//FA
fulladder a17(1'b0,net[1],net[4],net[16],net[17]);
fulladder a18(1'b0,net[2],net[5],net[18],net[19]);
fulladder a19(1'b0,net[3],net[6],net[20],net[21]);

fulladder a20(net[8],net[17],net[18],net[22],net[23]);
fulladder a21(net[9],net[19],net[20],net[24],net[25]);
fulladder a22(net[10],net[7],net[21],net[26],net[27]);

fulladder a23(net[12],net[23],net[24],net[28],net[29]);
fulladder a24(net[13],net[25],net[26],net[30],net[31]);
fulladder a25(net[14],net[11],net[27],net[32],net[33]);

fulladder a26(1'b0,net[29],net[30],net[34],net[35]);
fulladder a27(net[31],net[32],net[35],net[36],net[37]);
fulladder a28(net[15],net[33],net[37],net[38],net[39]);
	
	module fulladder(a,b,c,s,ca);

input a,b,c;

output s,ca;

assign s=(a^b^c);
assign ca=((a&b)|(b&c)|(c&a));
endmodule 


//output 
  
assign q[0]=net[0];
assign q[1]=net[16];
assign q[2]=net[22];
assign q[3]=net[28];
assign q[4]=net[34];
assign q[5]=net[36];
assign q[6]=net[38];
assign q[7]=net[39];

endmodule


  //===== TB ======

    module test4M;
      reg [3:0]a,b;
      wire [7:0]out;
      
      4x4arrMult sou4x (a,b,out);
		
		initial begin //manual checking
#10
		a = 4'b1111; b = 4'b1100; #10
		a = 4'b1011; b = 4'b1101;  #10
		a = 4'b1001; b = 4'b1110;  #10
		a = 4'b0111; b = 4'b1011; 
end
initial
begin
  $display("Full Adder test");
	$dumpfile("fullader.vcd");
  $dumpvars(0, test4M);
  $monitor($time, " a= %b b= %b out = %b", a, b, out);
end
endmodule  

