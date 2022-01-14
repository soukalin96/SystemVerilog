//logic level
module counter ( input clk, input res, output reg[2:0] out);
  always @ (posedge clk) begin 
    if (res)
      out <= 0;
    else 
      out <= out + 1;
  end 
endmodule 









//TB
module test;
  reg clk;
  reg res;
  wire [2:0] out;
  
  counter a1 ( clk, res, out);
  always #5 clk = ~clk;
   initial begin
     
        $dumpfile("dump.vcd");
        $dumpvars(1);
         $monitor($time, " clk= %b reset =%b out = %b", clk, res, out);
        
     clk = 0;
     res = 1;
     
     #20  res = 0;
     #80 res = 1;
     #40 res = 0;
   #20 $finish;
   end 
  
endmodule
