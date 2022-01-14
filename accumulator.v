
//Accumulator

module accum (clk, res, D, Q); 
input clk, res; 
input  [3:0] D; 
output [3:0] Q; 
reg    [3:0] tmp;  
 
  always @(posedge clk or posedge res) 
    begin 
      if (res) 
        tmp = 4'b0000; 
      else 
        tmp = tmp + D; 
    end 
  assign Q = tmp; 
endmodule 


 //===== TB ======

    module test;
      reg [3:0] in; reg clk; reg reset; wire [3:0] acc;
      
      accum a1(clk, reset, in, acc);
      initial begin
        
                 $dumpfile("dump.vcd");
        $dumpvars(1);
        $monitor($time, " clk= %b reset =%b d= %b out = %b", clk, reset, in, acc);
        
        #0; reset = 1'b1;clk = 1'b0;
        #5; reset = 1'b0; 
        
        in = 4'b0001;
	#50 in = 4'b0010;
	#50 in = 4'b0011;
      end
        
      always #10 clk = ~clk;
		initial #200 $stop;
      

endmodule  //==
