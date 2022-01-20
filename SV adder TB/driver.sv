
class driver;
  
  int no_transactions; //to be matched with repeat
  
  virtual intf vif;
  mailbox gen2driv;
  

  function new(virtual intf vif,mailbox gen2driv);
  
    this.vif = vif;
    this.gen2driv = gen2driv; //getting mailbox from env
  endfunction
  

  
  //transaction->intf.
  task main;
    forever begin
      transaction trans;
      gen2driv.get(trans);
      @(posedge vif.clk);
      vif.valid <= 1;
      vif.a     <= trans.a;
      vif.b     <= trans.b;
      @(posedge vif.clk);
      vif.valid <= 0;
      trans.c   = vif.c;
      @(posedge vif.clk);
      trans.display("  Driver  ");
      no_transactions++;
    end
  endtask
  
    task reset;
    wait(vif.reset);
      $display(" reset initiated");
    vif.a <= 0;
    vif.b <= 0;
    vif.valid <= 0;
    wait(!vif.reset);
      $display("done");
  endtask
  
endclass