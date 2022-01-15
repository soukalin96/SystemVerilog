//DFF
//logic
module dff (input d,input clk,input res,output reg q,output qn);  
  always @ (posedge clk or posedge res)  
     if (res)  
         q <= 0;  
      else  
         q <= d;  
  assign qn = ~q;  
endmodule  

//Gate netlist
module dff (input d,input clk,input res,output reg q,output qn); 
	wire  w1; wire  w2; wire  w3; wire  w4;
  reg resn;
  
  not a1 (resn,res);
	
	nand n1 (w1,w4,w2);
  nand n2 (w2,w1,clk,resn);
	nand n3 (w3,clk,w2,w4);
  nand n4 (w4,w3,d,resn);
	nand n6 (q,w2,qn);
  nand n5 (qn,q,w3,resn);
	
endmodule

	
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

