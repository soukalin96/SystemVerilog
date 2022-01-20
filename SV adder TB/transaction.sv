class transaction;
  
  rand bit [3:0] a;
  rand bit [3:0] b;
       bit [6:0] c;
 
  function void display(string main_name);
    $display("-------------------------");
    $display("- %s ", main_name);
    $display("-------------------------");
    $display("- a = %0d, b = %0d",a,b);
    $display("- c = %0d",c);
    $display("-------------------------");
  endfunction
endclass
