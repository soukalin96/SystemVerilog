//DUT

module adder(input clk,reset,input  [3:0] a	,input  [3:0] b	,input valid, output [6:0] c); 
  
  reg [6:0] tmp_c;
  
  always @(posedge reset) 
    tmp_c <= 0;
  
  always @(posedge clk) 
    if (valid)    tmp_c <= a + b;
  
  assign c = tmp_c;

endmodule


// TB module

  
module test;
  
  bit clk;
  bit reset;
  reg [3:0]a;
  reg [3:0]b;
  reg valid;
  wire [6:0]c;
  
  always #5 clk = ~clk;
  
  initial begin
    reset = 1; valid =1;
    #5 reset =0;
   
    #25 gen;drive; 
     
  end

     adder DUT (clk,reset,a,b,valid,c);
  
 task gen;
    begin
         a =  $urandom();
  		 b =  $urandom();
        $display("-Random generated no.s-");
		$display("- a = %0d, b = %0d",a,b);
    end   
    endtask 
  
  task drive; 
   forever begin 
     @(posedge clk) ;
      $display("-Sum-");
      $display("- c = %0d -",c);
    end   
    endtask
  
 

  initial begin 
    $dumpfile("dump.vcd"); $dumpvars(1,clk,reset,a,b,c);
  end
  initial #200 $stop;
endmodule
