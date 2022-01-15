//dff bhv.
module dff (input d, clk,res,output reg q,qn);  
  always @ (posedge clk or posedge res)  
     if (res)  
         q <= 0;  
      else  
         q <= d;  
  assign qn = ~q;  
endmodule   

//tff
module tff(input T,clk,res,output q,qn);
wire w;
  xor (w,T,q);
  dff d1(w,clk,res,q,qn);
endmodule

//sync up 4bit
module sync_up4bit (t,clk,res,q,qb);
input t,clock, reset;
output [3:0]q,qb;
wire x1,x2;
  
tff T0(t,clk, res,q[0],qb[0]);
tff T1(q[0],clk, res,q[1],qb[1]);
and A1(x1,q[0],q[1]);
tff T2(x1,clk, res,q[2],qb[2]);
and A2(x2,q[2],x1);
tff T3(x2,clk, res,q[3],qb[3]);
  
endmodule

//TB

module tb;
reg clk,reset,T;
wire [3:0]q;
  wire [3:0]qb;
  
  sync4bit c1(T,clk,reset,q,qb);
  
  always #10 clk=~clk;

initial
begin
       $dumpfile("dump.vcd");
        $dumpvars(1);
      $monitor($time , " T = %b , Clock=%b , q= %d , q= %b , Reset= %b ",T,clk,q,q,reset);
clk=1'b0;
T=1'b1;
reset=1'b1;
  #15 reset=1'b0;
  #45 reset=1'b1;
  #15 reset=1'b0;
#200 $finish;
end

endmodule
