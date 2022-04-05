

program test(rrarbiter_intf vif);
  environment env;
  
  initial begin
    env = new(vif);
    
    env.gen.tx_count = 10;
    
    env.run();
  end
endprogram