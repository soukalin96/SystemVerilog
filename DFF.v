//DFF

module dff(clk,rst,d,q,qb);
//inputs
input clk,rst,d;
//output
output q,qb;
//register
reg q;

always @(posedge clk)
begin
if(rst)
q=0;
else
q=d;
end
//q bar assignment
assign qb=~q;
endmodule


  //===== TB ======

    module test;
      reg [2:0]a;
      wire [1:0]out;
      
      dff a1 (a[0],a[1],a[2],out[0],out[1]);
      
       always #10 a[0] = ~a[0];  
      
      initial begin
         $dumpfile("dump.vcd");
        $dumpvars(1);
        $monitor($time, " clk= %b reset =%b d= %b out = %b", a[0],a[1], a[2], out[0]);
		
	#0;          
          a = 3'b010;
   #20;   a[1] = 1'b0;

   #20;
	 forever #40 a[2] = ~ a[2];
        #100 $stop;
      end
      

endmodule  


