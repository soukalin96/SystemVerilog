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


//3 in AND gate  

module and3 (out,a,b,c);
  output out;
  input a,b,c;
  supply0 gnd;
  supply1 vdd;
  wire w1,w2,y;
  
  pmos p1(y,vdd,a);
  pmos p2(y,vdd,b);
  pmos p3(y,vdd,c);
  
  nmos n1(y,w1,a);
  nmos n2(w1,w2,b);
  nmos n3(w2,gnd,c);
	
	pmos  (out, vdd, y);
	nmos  (out, gnd, y);
  
endmodule

// 2 input XOR gate 

module xor2 (y,a,b);
  output y;
  input a,b;
  supply0 gnd;
  supply1 vdd;
  wire w;
  
  pmos p1(w,vdd,a);
  pmos p2(y,a,b);
  pmos p3(y,b,a);
  
  nmos n1(w,gnd,a);
  nmos n2(y,w,b);
  nmos n3(y,b,w);
	
endmodule

//--------

module xor2 (y,a,b);
  output y;
  input a,b;
  supply0 gnd;
  supply1 vdd;
  wire y1,y2,y3;
  
  nand n1(y1,a,b);
  nand n2(y2,y1,a);
  nand n3(y3,y1,b);
  nand n4(y,y3,y2);
  
endmodule

//----TB----

module tb;
  wire y; 
 reg a,b;
  
  xor2 a1 ( y,a,b);
  
  initial begin
    $dumpfile("dump.vcd");
        $dumpvars(1);
   #0; a =1; b=1;
    #10; a=0; b=1;
    #10; a=1; b=0;
    #10; a=0; b=0;
    #10;
    
  end
  endmodule

////------
  
  
  
