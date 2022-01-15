//3 input NAND switch

module nand3 (y,a,b,c);
  output y;
  input a,b,c;
  supply0 gnd;
  supply1 vdd;
  wire w1,w2;
  
  pmos p1(y,vdd,a);
  pmos p2(y,vdd,b);
  pmos p3(y,vdd,c);
  
  nmos n1(y,w1,a);
  nmos n2(w1,w2,b);
  nmos n3(w2,gnd,c);
  
endmodule

//TB_________

module tb;
  wire y; 
  reg [2:0]in ;
  
  nand3 a1 ( y, in[0], in[1], in[2]);
  
  initial begin
    $dumpfile("dump.vcd");
        $dumpvars(1);
   #0 in = 3'b000;
	repeat(7)
	begin
	#10
	in = in + 3'b001;
	end
  end 
  initial #100 $stop;
  endmodule


//CMOS_NOT

module cmos_tran(output out, input in);
  
supply0 gnd;
supply1 vdd;
  pmos #(1,1) (out, vdd, in);
  nmos #(1,1) (out, gnd, in);
endmodule
   //___TB____


module tb;
  wire y; 
  reg in ;
  
  cmos_tran c1 (y,in);
  
  always #5 in = ~in;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    #0 in = 0;
  end 
  
  initial #100 $stop;
  endmodule
//___________


