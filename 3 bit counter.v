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

//xor

module xor2 (y,a,b);
  output y;
  input a,b;
  supply0 gnd;
  supply1 vdd;
  wire w;
  
  pmos p1(w,vdd,a);
  pmos p2(y,a,b);
  pmos p3(y,b,a);
  
  nmos n1(w,gnd,a);
  nmos n2(y,w,b);
  nmos n3(y,b,w);
	
endmodule

//== DFF ==

module dff (input d,clk,res,output reg q, qn); 
	wire  w1; wire  w2; wire  w3; wire  w4;
 
	//poseedge clk negedge res//
  nand3 n1 (w1,w4,w2,1);
  nand3 n2 (w2,w1,clk,res);
  nand3 n3 (w3,clk,w2,w4);
  nand3 n4 (w4,w3,d,res);
  nand3 n6 (q,w2,qn,1);
  nand3 n5 (qn,q,w3,res);
	
endmodule

//tff

module tff(input T,clk,res,output q,qn);
wire w;
  xor2 x1(w,T,q);
  dff d1(w,clk,res,q,qn);
endmodule

//async down count.

module c3a ( input t, clk,res,output [2:0] out);  
  
   wire  q0;wire  qn0;wire  q1;wire  qn1;wire  q2;  
   wire  qn2;
  
  // Combination Logic
  // T =1  , ~q_n = clock_(n+1) 
  tff ff0 (t, clk, res, q0, qn0);  
  tff ff1 (t, q0, res, q1, qn1);  
  tff ff2 (t, q1, res, q2, qn2);  
  
 assign out = {q2, q1, q0};  
	// assign out = {qn2, qn1, qn0}; uocounter//  

endmodule 

//sync up count.

module c3s(t,clk,res,q,qb);
input t,clk, res;
output [3:0]q,qb;
wire x1,x2;
  
tff T0(t,clk, res,q[0],qb[0]);
tff T1(q[0],clk, res,q[1],qb[1]);
and A1(x1,q[0],q[1]);
tff T2(x1,clk, res,q[2],qb[2]);

  
endmodule

//sync up-down count. M=0 up

module c3sud(t,clk,res,M,q,qb);
input t,clk, res, M;
  output [2:0]q,qb;
wire w1,w2,w3, w4,w5,w6;
  
tff T0(t,clk, res,q[0],qb[0]);
  and(w1,~M,q[0]);
  and(w2,M,qb[0]);
  or(w3,w1,w2);																						
  
tff T1(w3,clk, res,q[1],qb[1]);
  and(w4,w1,q[1]);
  and(w5,w2,qb[1]);
  or(w6,w4,w5);

tff T2(w6,clk, res,q[2],qb[2]);

  
endmodule


//================

//====================


	
  //===== TB ======
module test;
  reg clk,t;
  reg res;
  wire q0,q1,q2;
  reg [2:0]out;
   assign out = {q2, q1, q0};  
  
  c3a a1 (t, clk, res, {q2, q1, q0});
  always #5 clk = ~clk;
   initial begin
     
        $dumpfile("dump.vcd");
        $dumpvars(1);
         $monitor($time, " clk= %b reset =%b out = %b", clk, res, {q2, q1, q0});
      t = 1;  
     clk = 0;
     res = 0;
     
     #22  res = 1;
     #180 res = 0;
     #40 res = 1;
   #20 $finish;
    
   end 
  
endmodule

//==
  //===== TB updwn======
module test;
  reg clk,t,M;
  reg res;
  wire q0,q1,q2;
  reg [2:0]out;
   assign out = {q2, q1, q0};  
  
  c3sud a1 (t, clk, res,M, {q2, q1, q0});
  always #5 clk = ~clk;
   initial begin
     
        $dumpfile("dump.vcd");
        $dumpvars(1);
         $monitor($time, " clk= %b reset =%b out = %b", clk, res, {q2, q1, q0});
      t = 1;  
     clk = 0;
     res = 0;M=1;
     
     #22  res = 1;
     #35 M=0;
     #180 res = 0;
     #40 res = 1;
   #20 $finish;
    
   end 
  
endmodule
