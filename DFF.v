//DFF
//behaviour
module dff (input d,clk,res,output reg q,qn);  
  always @ (posedge clk or posedge res)  
     if (res)  
         q <= 0;  
      else  
         q <= d;  
  assign qn = ~q;  
endmodule  

//Gate level
module dff (input d,clk,res,output reg q, qn); 
	wire  w1; wire  w2; wire  w3; wire  w4;
	
  nand n1 (w1,w4,w2,1);
  nand n2 (w2,w1,clk,res);
  nand n3 (w3,clk,w2,w4);
  nand n4 (w4,w3,d,res);
  nand n6 (q,w2,qn,1);
  nand n5 (qn,q,w3,res);
	
endmodule

//Switch Level

module dff (input d,clk,output q, qn); 
  
  wire w1,w2,w3,w4;
    supply0 gnd;
	supply1 vdd;

  tranif0 t1(d,w1,clk);

  pmos p1(w2, vdd, w1);
  nmos n1(w2, gnd, w1);
  
  pmos p2(w3, vdd, w2);
  nmos n2(w3, gnd, w2);
  
  tranif0 t2(w3,w1,~clk);
  
  
  tranif0 t3(w2,w4,~clk);
  
  pmos p3(q,vdd, w4);
  nmos n3(q, gnd, w4);
  
  pmos p4(qn, vdd, q);
  nmos n4(qn, gnd, q);
  
  tranif0 t4(qn,w4,clk);
  
endmodule

/*   module test;
      reg d; reg clk;
      wire q; wire qn;
      
    dff a1 (d,clk,q,qn);
      	  
      initial begin
         $dumpfile("dump.vcd");
        $dumpvars(1);
        $monitor($time, " clk= %b d= %b out = %b", clk,d,q);          
        #0; d=1; clk = 0;
        forever #25 d = ~d;
      end 
      always #10 clk = ~clk;
      initial #200 $stop;
  endmodule  */


	
  //===== TB ======
  module test;
      reg d; reg clk; reg res;
      wire q; wire qn;
      
    dff a1 (d,clk,res,q,qn);
      	  
      initial begin
         $dumpfile("dump.vcd");
        $dumpvars(1);
        $monitor($time, " clk= %b reset =%b d= %b out = %b", clk,d,res, q);          
        #0; d=0; res = 1; clk = 0;
	      #20;res = 1'b0; #20;res = 1'b1; #60; res = 1'b0;	  
        forever #25 d = ~d;
      end 
      always #10 clk = ~clk;
      initial #200 $stop;
  endmodule

