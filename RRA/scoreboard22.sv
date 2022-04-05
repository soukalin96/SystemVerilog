// First rev - sou
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
    i=0;
    j=0;
  endfunction
  
  task main;
    
    forever begin
    m2s.get(trans);
      trans.display("==[Scoreboard]==");
      $display("Previous Grant = %0b",gnt_history);
    gnt_actual = {trans.gnt3,trans.gnt2,trans.gnt1,trans.gnt0};
       req = {trans.req3,trans.req2,trans.req1,trans.req0};
    
    
      if(req == 4'b0)begin
      gnt_history = 4'b1000;
      gnt_expected = 4'b0000;
      $display("gnt_history = %0d",gnt_history);
  
    end
      
      if (trans.req0||trans.req1||trans.req2||trans.req3)
   begin
      if(gnt_history == 4'b1000)begin
      if(req[0])begin
        $display("Req = %b, gnt_his = %b 1",req,gnt_history);
        gnt_expected = 4'b0001;
        gnt_history = 4'b0001;
        
     
      end
      
        else if(req[1])begin
          
          $display("Req = %b, gnt_his = %b 2",req,gnt_history);
        gnt_expected = 4'b0010;
        gnt_history = 4'b0010;
          $display("next gnt_his = %b ",gnt_history);
      end
      
      else if(req[2])begin
        $display("Req = %b, gnt_his = %b  3",req,gnt_history);
        gnt_expected = 4'b0100;
        gnt_history = 4'b0100;
      end
      
        else if(req[3])begin
          $display("Req = %b, gnt_his = %b 4",req,gnt_history);
        gnt_expected = 4'b1000;
        gnt_history = 4'b1000;
      end
    end
    
    if(gnt_history == 4'b0001)begin
      if(req[1])begin
        $display("Req = %b, gnt_his = %b",req,gnt_history);
        gnt_expected = 4'b0010;
        gnt_history = 4'b0010;
      end
      
      else if(req[2])begin
        gnt_expected = 4'b0100;
        gnt_history = 4'b0100;
      end
      
      else if(req[3])begin
        gnt_expected = 4'b1000;
        gnt_history = 4'b1000;
      end
      
      else if(req[0])begin
        gnt_expected = 4'b0001;
        gnt_history = 4'b0001;
      end
    end
    
    if(gnt_history == 4'b0010)begin
      if(req[2])begin
        gnt_expected = 4'b0100;
        gnt_history = 4'b0100;
      end
      
      else if(req[3])begin
        gnt_expected = 4'b1000;
        gnt_history = 4'b1000;
      end
      
      else if(req[0])begin
        gnt_expected = 4'b0001;
        gnt_history = 4'b0001;
      end
      
      else if(req[1])begin
        gnt_expected = 4'b0010;
        gnt_history = 4'b0010;
      end
    end
    
    if(gnt_history == 4'b0100)begin
      if(req[3])begin
        gnt_expected = 4'b1000;
        gnt_history = 4'b1000;
      end
      
      else if(req[0])begin
        gnt_expected = 4'b0001;
        gnt_history = 4'b0001;
      end
      
      else if(req[1])begin
        gnt_expected = 4'b0010;
        gnt_history = 4'b0010;
      end
      
      else if(req[2])begin
        gnt_expected = 4'b0100;
        gnt_history = 4'b0100;
      end
    end
   end
    
    
    
    if(gnt_actual == gnt_expected)
      $display("Recieved Grabt = %0b and Expected Grant = %0b ---<<PASS>>",gnt_actual,gnt_expected);
    else
      $display("Recieved Grabt = %0b and Expected Grant = %0b  ---<<FAIL>>",gnt_actual,gnt_expected);
      
      $display("***************************************************");
      
      if(gnt_actual == gnt_expected)
        i = i+1;
      else 
        j = j+1;
    
    no_transactions++;
    
    end
        
  endtask
  
endclass
  
  
  
  