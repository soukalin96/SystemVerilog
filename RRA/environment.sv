`include "monitor.sv"
`include "scoreboard3.sv"
class environment;
  generator     gen;      
  driver       driv;
  monitor       mon; 
  scoreboard scb;
  
  mailbox      gen2drive; 
   mailbox  mon2scb;
  
  
  virtual rrarbiter_intf  vif;
  
  function new(virtual rrarbiter_intf vif);
    this.vif = vif;
    
    gen2drive = new();
    mon2scb = new();

    gen = new(gen2drive);
    driv = new(vif, gen2drive);
    mon = new(vif, mon2scb);
    scb  = new(mon2scb);
  
  endfunction
  
  task pre_test();
    driv.reset();
  endtask
 
 task test();
  fork
      gen.run();
     
      driv.run();
    mon.run();
    scb.main();
  
    join_any
  endtask
  
    task post_test();
    wait(gen.ended.triggered);
    wait(gen.tx_count == scb.no_transactions);
      $display("Passes - %0d   Fails - %0d",scb.i,scb.j);
      $display("***************************************************");
      $display("***************************************************");
      $display("***************************************************");
   
  endtask  
 
task run;
    pre_test();
    test();
  post_test();
  #10;
  $finish;
    
  endtask  
  
endclass