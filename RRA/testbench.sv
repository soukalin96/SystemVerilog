//rra_abt_sou

`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "environment.sv"
`include "test.sv"



module top;
// Declaring clock and reset signals
  bit clk;
  bit rstn;
 
  
// create a 50Mhz clock
 always begin
 #5 clk = ~clk;
 end
//reset generation
  initial begin 
    
     rstn=0;
    #5 rstn=1;
  end
  
 rrarbiter_intf intf(clk,rstn);
  test t1 (intf);
 
  rrarbiter DUT(.req0(intf.req0),
                .req1(intf.req1),
                .req2(intf.req2),
                .req3(intf.req3),
                .eot0(intf.eot0),
                .eot1(intf.eot1),
                .eot2(intf.eot2),
                .eot3(intf.eot3),
                .clk(intf.clk)  ,
                .rstn(intf.rstn),
                .gnt0(intf.gnt0),
                .gnt1(intf.gnt1),
                .gnt2(intf.gnt2),
                .gnt3(intf.gnt3));
  
//----------------------------------------------------------
initial begin 
    $dumpfile("dump.vcd"); 
  $dumpvars(1,intf.req0,
              intf.req1,
              intf.req2,
              intf.req3,
                intf.eot0,
                intf.eot1,
                intf.eot2,
                intf.eot3,
           intf.clk,
           intf.rstn,
            intf.gnt0,
            intf.gnt1,
            intf.gnt2,
            intf.gnt3);

end
endmodule