
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"

class environment;
  
  generator gen;
  driver    driv;
  mailbox gen2driv; //defining handles
  
  virtual intf vif; //defining vitual interface for env.
  
  function new(virtual intf vif);
    this.vif = vif; //calling from test
    gen2driv = new();
   
    gen  = new(gen2driv);
    driv = new(vif,gen2driv);//sharing the same Mailbox
  endfunction
  
  //defining tasks
  
  task initiate();
    driv.reset();
  endtask
  
  task main_test();
    fork 
    gen.main();
    driv.main();
    join_any
  endtask
  
  task terminate();
    wait(gen.ended.triggered);
    wait(gen.repeat_count == driv.no_transactions);
  endtask  
  
  task run;
    initiate();
    main_test();
    terminate();
    $finish;
  endtask
  
endclass