class generator;
   
  //declaring transaction class
  rand transaction trans;
   
  //declaring mailbox
  mailbox gen2drive;
   
  // loop , to specify number of items to generate
  int  tx_count; 
 
  //event
  event ended;
 
  //constructor
  function new(mailbox gen2drive);
    this.gen2drive = gen2drive;
  endfunction
   
  task run();
  
    repeat(tx_count) begin
      trans = new();
      assert(trans.randomize());
     // trans.display("  Generator  ");
      gen2drive.put(trans);
    end
   -> ended;
   
  endtask
endclass