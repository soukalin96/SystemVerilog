// Code your testbench here
// or browse Examples
class scoreboard;
  
  mailbox m2s;
  transaction trans;
  int     no_transactions,i,j;
  bit [3:0]gnt_history;
  bit [3:0]gnt_actual,gnt_expected;
  bit[3:0]req;
  function new(mailbox m2s);
    this.m2s = m2s;
    gnt_history = 4'b1000;
    i = 0;
    j = 0;
  endfunction
  
  task main;
    
    forever begin
    m2s.get(trans);
       $display("-------------------------");
      $display("Txn. No. - %0d",no_transactions + 1);
     
      trans.display("==[Scoreboard]==");
      $display("Previous Grant = %0b",gnt_history);
    gnt_actual = {trans.gnt3,trans.gnt2,trans.gnt1,trans.gnt0};
       req = {trans.req3,trans.req2,trans.req1,trans.req0};
    
    
      if(req == 4'b0)begin
      gnt_history = 4'b1000;
      gnt_expected = 4'b0000;
      $display("gnt_history = %0d",gnt_history);
  
    end
       
          case(1'b1)
          gnt_history[3]: begin// Priority order -- agent0, 1, 2, 3
                  if(trans.req0) begin
                     gnt_expected = 4'b0001;
                     gnt_history = 4'b0001;
                  end
                  else if (trans.req1) begin
                     gnt_expected = 4'b0010;
                     gnt_history = 4'b0010;
                  end
                  else if (trans.req2) begin
                     gnt_expected = 4'b0100;
                     gnt_history = 4'b0100;
                  end
                  else if (trans.req3) begin
                     gnt_expected = 4'b1000;
                     gnt_history = 4'b1000;
                  end
               end
               
               
    gnt_history[0]: begin  // Priority order -- agent1, 2, 3, 0
                  if(trans.req1) begin
                     gnt_expected = 4'b0010;
                     gnt_history = 4'b0010;
                  end
                  else if (trans.req2) begin
                     gnt_expected = 4'b0100;
                     gnt_history = 4'b0100;
                  end
                  else if (trans.req3) begin
                     gnt_expected = 4'b1000;
                     gnt_history = 4'b1000;
                  end
                  else if (trans.req0) begin
                     gnt_expected = 4'b0001;
                     gnt_history = 4'b0001;
                  end
               end
               
               
     gnt_history[1]: begin   // Priority order -- agent2, 3, 0, 1
                  if (trans.req2) begin
                     gnt_expected = 4'b0100;
                     gnt_history = 4'b0100;
                  end
                  else if (trans.req3) begin
                     gnt_expected = 4'b1000;
                     gnt_history = 4'b1000;
                  end
                  else if (trans.req0) begin
                     gnt_expected = 4'b0001;
                     gnt_history = 4'b0001;
                  end
                  else if (trans.req1) begin
                     gnt_expected = 4'b0010;
                     gnt_history = 4'b0010;
                  end
               end
               
               
   gnt_history[2]: begin   // Priority order -- agent3, 0, 1, 2
                  if (trans.req3) begin
                     gnt_expected = 4'b1000;
                     gnt_history = 4'b1000;
                  end
                  else if (trans.req0) begin
                     gnt_expected = 4'b0001;
                     gnt_history = 4'b0001;
                  end
                  else if (trans.req1) begin
                     gnt_expected =4'b0010;
                     gnt_history = 4'b0010;
                  end
                  else if (trans.req2) begin
                     gnt_expected = 4'b0100;
                     gnt_history = 4'b0100;
                  end
               end
               
               
               default: begin
               end


             endcase
        
    
      if(gnt_actual == gnt_expected)
      $display("Recieved Grant = %0b and Expected Grant = %0b <<PASS>>",gnt_actual,gnt_expected);
     

   
    else
 
      $display("Recieved Grant = %0b and Expected Grant = %0b  <<FAIL>>",gnt_actual,gnt_expected);
      $display("***************************************************");
      
      if(gnt_actual == gnt_expected)
        i = i+1;
      else 
        j = j+1;
    
    
    no_transactions++;
    
    end
        
  endtask
  
endclass
  
  
  
  