//Full Adder 

module full_adder(a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;

	assign #1 sum = a ^ b ^ cin;
	assign #1 cout = ((a ^ b) & cin) | (a & b);
endmodule

  //===== TB ======

    module testFA;
reg [2:0] c;
  wire [1:0]f;
    full_adder souFA (.cin(c[0]), .a(c[2]), .b(c[1]), .cout(f[0]), .sum(f[1]));
initial
begin
#10 c = 3'b010;
  #10 c = 3'b110;
  #10 c = 3'b000; //manual inputs
end
initial
begin
  $display("Full Adder test");
	$dumpfile("fullader.vcd");
	$dumpvars(0, testFA);
  $monitor("[a b cin]=%b [sum cout]=%b time=%d",
c, f, $time);
end
endmodule  
