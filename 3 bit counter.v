// Code your design here



//== NAND == 

module nand3 (y,a,b,c);
  output y;
  input a,b,c;
  supply0 gnd;
  supply1 vdd;
  wire w1,w2;
  
  pmos p1(y,vdd,a);
  pmos p2(y,vdd,b);
  pmos p3(y,vdd,c);
  
  nmos n1(y,w1,a);
  nmos n2(w1,w2,b);
  nmos n3(w2,gnd,c);
  
endmodule

//== DFF ==

module dff (input d,clk,res,output reg q, qn); 
	wire  w1; wire  w2; wire  w3; wire  w4;
 
	
  nand3 n1 (w1,w4,w2,1);
  nand3 n2 (w2,w1,clk,res);
  nand3 n3 (w3,clk,w2,w4);
  nand3 n4 (w4,w3,d,res);
  nand3 n6 (q,w2,qn,1);
  nand3 n5 (qn,q,w3,res);
	
endmodule

//==3BitCounter==

module counter3bitasync ( input clk,input res,output [2:0] out);  
  
   wire  q0;wire  qn0;wire  q1;wire  qn1;wire  q2;  
   wire  qn2;
  
  // Combination Logic
  // d_n = ~q_n , q_n = clock_(n+1) 
  dff ff0 ( qn0, clk, res, q0, qn0);  
  dff ff1 ( qn1, q0, res, q1, qn1);  
  dff ff2 ( qn2, q1, res, q2, qn2);   
  
  assign out = {qn2, qn1, qn0};  
  
endmodule  

//====================


	
  //===== TB ======
module test;
  reg clk;
  reg res;
  wire [2:0] out;
  
  counter3bitasync a1 ( clk, res, out);
  always #5 clk = ~clk;
   initial begin
     
        $dumpfile("dump.vcd");
        $dumpvars(1);
         $monitor($time, " clk= %b reset =%b out = %b", clk, res, out);
        
     clk = 0;
     res = 0;
     
     #22  res = 1;
     #180 res = 0;
     #40 res = 1;
   #20 $finish;
   end 
  
endmodule
