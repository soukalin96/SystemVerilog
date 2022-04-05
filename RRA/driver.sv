`define DRIV_IF vif.DRIVER.driver_cb

class driver;
  
  int no_transactions; 
  virtual rrarbiter_intf vif; 
  mailbox gen2drive;            
  transaction trans;          
  
  
  function new(virtual rrarbiter_intf vif,mailbox gen2drive);
    this.vif=vif;            
    this.gen2drive=gen2drive;   
  endfunction : new

 
  
  task reset();
    wait(!vif.rstn);
      `DRIV_IF.req0<=0;
      `DRIV_IF.req1<=0;
      `DRIV_IF.req2<=0;
      `DRIV_IF.req3<=0;
      `DRIV_IF.eot0<=0;
      `DRIV_IF.eot1<=0;
      `DRIV_IF.eot2<=0;
      `DRIV_IF.eot3<=0;
    wait(vif.rstn);
      $display("waiting for reset completed");
  endtask
 
  task drive();
  
    gen2drive.get(trans);
      
    @(posedge vif.DRIVER.clk);
    `DRIV_IF.req0<=trans.req0;
    `DRIV_IF.req1<=trans.req1;
    `DRIV_IF.req2<=trans.req2;
    `DRIV_IF.req3<=trans.req3;
  
  endtask : drive

  task assert_eot0();
    @(posedge vif.DRIVER.clk);
    if(trans.req0)
    begin    
      @(posedge vif.DRIVER.clk);
      trans.gnt0 <= `DRIV_IF.gnt0;
      repeat(2)
      @(posedge vif.DRIVER.clk);
      `DRIV_IF.eot0<=1;
      @(posedge vif.DRIVER.clk);
      `DRIV_IF.eot0<=0;
      `DRIV_IF.req0<=0;
    end
  endtask : assert_eot0

  task assert_eot1();
    @(posedge vif.DRIVER.clk);
    if(trans.req1)
    begin
      @(posedge vif.DRIVER.clk);
      trans.gnt1 <= `DRIV_IF.gnt1;
      repeat(2)
      @(posedge vif.DRIVER.clk);
      `DRIV_IF.eot1<=1;
      @(posedge vif.DRIVER.clk);
      `DRIV_IF.eot1<=0;
      `DRIV_IF.req1<=0;
    end
  
  endtask : assert_eot1

  task assert_eot2();
    @(posedge vif.DRIVER.clk);
    if(trans.req2)
    begin
      @(posedge vif.DRIVER.clk);
      trans.gnt2 <= `DRIV_IF.gnt2;
      repeat(2)
      @(posedge vif.DRIVER.clk);
      `DRIV_IF.eot2<=1;
      @(posedge vif.DRIVER.clk);
      `DRIV_IF.eot2<=0;
      `DRIV_IF.req2<=0;
    end
  endtask : assert_eot2

  task assert_eot3();
    @(posedge vif.DRIVER.clk);
    if(trans.req3)begin
    @(posedge vif.DRIVER.clk);
      trans.gnt3 <= `DRIV_IF.gnt3;
      repeat(2)
      @(posedge vif.DRIVER.clk);
      `DRIV_IF.eot3<=1;
      @(posedge vif.DRIVER.clk);
      `DRIV_IF.eot3<=0;
      `DRIV_IF.req3<=0;
    end
  endtask : assert_eot3
  
  task run();
    forever begin
        @(posedge vif.DRIVER.clk);
     //$display("--------- [DRIVER-TRANSFER: %0d] ---------",no_transactions);	
      drive(); 
   
      fork
        begin
        assert_eot0();
        end
        begin
        assert_eot1();
        end
        begin
        assert_eot2();
        end
        begin
        assert_eot3();
        end
      join
      disable fork;
      no_transactions++; 
       // trans.display("==Driver==");
    end
  endtask
endclass