
`include "interface.sv"
`include "env.sv"


program test(intf i_intf);
  environment env;
  
  initial begin
    
    env = new(i_intf);
    env.gen.repeat_count = 10;
    env.run();
  end
endprogram

//----------------------------------------------------------------

module tb_top;
  bit clk;
  bit reset;

  always #5 clk = ~clk;
  
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  
  intf i_intf(clk,reset); //sending to interface
  test t1(i_intf);
  
  adder DUT (
    .clk(i_intf.clk),
    .reset(i_intf.reset),
    .a(i_intf.a),
    .b(i_intf.b),
    .valid(i_intf.valid),
    .c(i_intf.c)
   );
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars(1,clk,reset,i_intf.valid,i_intf.a,i_intf.b,i_intf.c);
  end
endmodule
