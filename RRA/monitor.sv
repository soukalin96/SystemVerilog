`define MON_IF vif.MONITOR.monitor_cb
  class monitor;
           
  int  repeat_count; 
  virtual rrarbiter_intf   vif;
 

  mailbox mon2scb;
 
  function new(virtual rrarbiter_intf vif,mailbox mon2scb); 
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task run(); 
   forever begin
    transaction trans;
     trans = new();
     
     @(posedge vif.MONITOR.clk);
     wait(`MON_IF.req0 || `MON_IF.req1 || `MON_IF.req2 || `MON_IF.req3);
        trans.req0     = `MON_IF.req0;
        trans.req1     = `MON_IF.req1;
        trans.req2     = `MON_IF.req2;
        trans.req3     = `MON_IF.req3;
     @(posedge vif.MONITOR.clk);
        trans.gnt0     = `MON_IF.gnt0;
        trans.gnt1     = `MON_IF.gnt1;
        trans.gnt2     = `MON_IF.gnt2;
        trans.gnt3     = `MON_IF.gnt3;
       @(posedge vif.MONITOR.clk);
       @(posedge vif.MONITOR.clk);
       @(posedge vif.MONITOR.clk);
      	trans.eot0     = `MON_IF.eot0;
        trans.eot1     = `MON_IF.eot1;
        trans.eot2     = `MON_IF.eot2;
     	trans.eot3     = `MON_IF.eot3;

	@(posedge vif.MONITOR.clk);
      mon2scb.put(trans);
       // trans.display("==MON==");
     //$display("- eot0 = %0b,  eot1 = %0b,  eot2 = %0b,  eot3 = %0b", trans.eot0, trans.eot1, trans.eot2, trans.eot3);
    end
    
  endtask
endclass