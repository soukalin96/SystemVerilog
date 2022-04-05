class transaction;
  rand bit 		 req0;
  rand bit 		 req1;
  rand bit 		 req2;
  rand bit 		 req3;
 	   bit       gnt0;
       bit       gnt1;
       bit       gnt2;
       bit       gnt3;
       bit 		 eot0;
       bit 		 eot1;
       bit 		 eot2;
       bit 		 eot3;
  

  
  
  function void display(string main_name);
    $display("-------------------------");
    $display("- %s ", main_name);
    $display("-------------------------");
    $display("- req0 = %0b, req1 = %0b, req2 = %0b, req3 = %0b",req0,
		  req1,
		  req2,
		  req3);      
    $display("- gnt0 = %0b,  gnt1 = %0b,  gnt2 = %0b,  gnt3 = %0b", gnt0,
		  gnt1,
		  gnt2,
		  gnt3);
    $display("-------------------------");
  endfunction
  
  
  
  
  
endclass