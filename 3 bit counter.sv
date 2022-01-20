//== DFF ==

module dff (output wire q, qn, input reg d,clk,res); 
wire w1,w2,w3,w4;
 
//master
tranif0 t1(d,w1,clk);
nand n1(w2,w1,res,1);
not(w3,w2);  
tranif0 t2(w3,w1,~clk);
  
 //slave 
 tranif0 t3(w2,w4,~clk);
 not i2(q,w4);
 nand n2(qn,q,res,1);
 tranif0 t4(qn,w4,clk);
  
endmodule

//==TFF==

module tff(input reg T,clk,res,output wire q,qn);
wire w;
xor2 x1(w,T,q);
dff d1(q,qn,w,clk,res);
endmodule


/* sync up count.

module c3s(t,clk,res,q,qb);
input t,clk, res;
output [3:0]q,qb;
wire x1,x2;
  
tff T0(t,clk, res,q[0],qb[0]);
tff T1(q[0],clk, res,q[1],qb[1]);
and A1(x1,q[0],q[1]);
tff T2(x1,clk, res,q[2],qb[2]);
  
endmodule */

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


/* async down count.

module c3a ( input t, clk,res,output [2:0] out);  
  
   wire  q0;wire  qn0;wire  q1;wire  qn1;wire  q2;  
   wire  qn2;
  
  // Combination Logic
  // T =1  , ~q_n = clock_(n+1) 
  tff ff0 (t, clk, res, q0, qn0);  
  tff ff1 (t, q0, res, q1, qn1);  
  tff ff2 (t, q1, res, q2, qn2);  
  
 assign out = {q2, q1, q0};  
	// assign out = {qn2, qn1, qn0}; upcounter//  

endmodule */



//===== TB updwn======


module test;
  reg clk,t,M;
  reg res;
  wire q0,q1,q2;
  reg [2:0]out,qb;
   assign out = {q2, q1, q0};  
  
  c3sud a1 (t, clk, res,M,{q2, q1, q0},qb);
  
  always #10 clk = ~clk;
   initial begin
     
     $dumpfile("dump.vcd"); $dumpvars(1,clk,out,res,M);
	  $monitor($time, " clk= %b reset =%b out = %d", clk, res, out);
     	t = 1; clk = 0;res=1;M=0;
     

    #5 res_sig;    $display("Initiate UP mode");
     
 
    #151 toggle_M;   $display("Toggle to Down mode");  
     
   
     #60 res_sig;   $display("Reset");
  
   end 
  
  // define reset task
    task res_sig;
    begin
         res = 0;
      #5 res = ~res;
    end
  //define up-down toggle    
    endtask 
    task toggle_M;
    begin
       M = ~M;
    end
    endtask 
  
  // total run time 
  initial #400 $stop;
     
endmodule
