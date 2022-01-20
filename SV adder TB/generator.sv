//generator
class generator;
  
  rand transaction trans; //declaring trans class

  int  repeat_count; //no. of item to gen
  
  mailbox gen2driv;
  
  event ended; //end event
 
  function new(mailbox gen2driv);
    this.gen2driv = gen2driv; //share same mailbox
  endfunction
  
  task main();
    repeat(repeat_count) begin
    trans = new();
    if(!trans.randomize());
      trans.display("  Generator  ");
      gen2driv.put(trans); //puts into mailbox
    end
    -> ended; //calling end event
  endtask
  
endclass
