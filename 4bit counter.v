//logic level
module counter ( input clk, input res, output reg[3:0] out);
  always @ (posedge clk or posedge res) begin 
    if (!res)
      out <= 0;
    else 
      out <= out + 1;
  end 
endmodule 

//Combinational async.

module dff (input d,input clk,input res,output reg q,output qn);  
  always @ (posedge clk or posedge res)  
     if (res)  
         q <= 0;  
      else  
         q <= d;  
  assign qn = ~q;  
endmodule  
  
module counter ( input clk,input res,output [3:0] out);  
  
   wire  q0;wire  qn0;wire  q1;wire  qn1;wire  q2;  
   wire  qn2;wire  q3;wire  qn3;  
  
  // Combination Logic
  // d_n = ~q_n , q_n = clock_(n+1) 
  dff ff0 ( qn0, clk, res, q0, qn0);  
  dff ff1 ( qn1, q0, res, q1, qn1);  
  dff ff2 ( qn2, q1, res, q2, qn2);  
  dff ff3 ( qn3, q2, res, q3, qn3);  
  
  assign out = {qn3, qn2, qn1, qn0};  
  
endmodule  


//TB
module test;
  reg clk;
  reg res;
  wire [3:0] out;
  
  counter a1 ( clk, res, out);
  always #5 clk = ~clk;
   initial begin
     
        $dumpfile("dump.vcd");
        $dumpvars(1);
         $monitor($time, " clk= %b reset =%b out = %b", clk, res, out);
        
     clk = 0;
     res = 1;
     
     #20  res = 0;
     #180 res = 1;
     #40 res = 0;
   #20 $finish;
   end 
  
endmodule
