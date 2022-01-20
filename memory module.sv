//32bit memory

module memr (clk_w, adr_w,data_w, w_en,clk_r, adr_r, data_r);
  
  parameter d_width = 32, adr_width = 5,adr_max = 32; //2^adr
  
  reg [d_width-1:0] memory [adr_max-1:0];

  //----write----- 
  input  clk_w; input [adr_width-1:0] adr_w; input [d_width-1:0] data_w;input w_en;

  //---read----
  input  clk_r; input [adr_width-1:0] adr_r; output [d_width-1:0] data_r;
  reg    [d_width-1:0] data_r;
  
  //write memory
  always @(posedge clk_w) begin
    if (w_en) begin
      memory[adr_w] = data_w;
    end
  end

  //read memory
  always @(posedge clk_r) begin
    data_r = memory[adr_r];
  end

endmodule

//====tb====

module test;

  reg  clk_w,clk_r,wen;
  reg  [4:0] adr_w;
  reg  [7:0] data_w;
  reg  [4:0] adr_r;
  wire [7:0] data_out;

  memr DUT (clk_w, adr_w, data_w, wen, clk_r, adr_r, data_out);
    
  initial begin
  
    $dumpfile("dump.vcd");
    $dumpvars(1, test);
    
    clk_w = 0; clk_r = 0; wen = 0; adr_r = 0;adr_w = 0;
    
    //1 R
    $display("Read initial data.");
     adr_r = 5'h1A; 
    toggle_clk_r;
    $display("data[%0h]: %0h",
      adr_r, data_out);
    //2 W
    $display("Write new data.");
    wen = 1;
    data_w = 8'hC5;
    adr_w = 5'h1A; 
    toggle_clk_w;
    wen = 0;
    //3 R
    $display("Read new data.");
    toggle_clk_r;
    adr_r = 5'h1A; 
    $display("data[%0h]: %0h",
      adr_r, data_out);
    //4 W
     $display("Write new data.");
    wen = 1;
    adr_w = 5'h1B; 
    data_w = 8'hD5;
    toggle_clk_w;
    wen = 0;
    //5 R
    $display("Read new data.");
     adr_r = 5'h1A;
    toggle_clk_r; 
    $display("data[%0h]: %0h",
      adr_r, data_out);
    //6 R
    $display("Read new data.");
     adr_r = 5'h1B; 
    toggle_clk_r;
      $display("data[%0h]: %0h",
      adr_r, data_out);
     end
  
  task toggle_clk_w;
    begin
      #10 clk_w = ~clk_w;
      #10 clk_w = ~clk_w;
    end
  endtask

  task toggle_clk_r;
    begin
      #10 clk_r = ~clk_r;
      #10 clk_r = ~clk_r;
    end
  endtask

endmodule
