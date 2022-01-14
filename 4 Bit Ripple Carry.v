//4 Bit ripple carry adder 


module ripple_carry_adder(a, b, in, sum, cout);
	input [3:0] a;
	input [3:0] b;
	input cin;
	output [3:0] sum;
	output cout;

	wire c1, c2, c3;
	full_adder fa0(a[0], b[0], cin, sum[0], c1);
	full_adder fa1(a[1], b[1], c1, sum[1], c2);
	full_adder fa2(a[2], b[2], c2, sum[2], c3);
	full_adder fa3(a[3], b[3], c3, sum[3], cout);

endmodule

//===== TB ======

module ripple_carry_adder_tb;

	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	wire [3:0] sum;
	wire cout;

	ripple_carry_adder rca(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
		
		initial begin

		a = 4'b1111; b = 4'b1100; #10
		a = 4'b1011; b = 4'b1101; cin = 0;  #10
		a = 4'b1001; b = 4'b1110; cin = 0;  #10
		a = 4'b0111; b = 4'b1011; cin = 0;
	end

	initial begin
		$dumpfile("ripple-carry-adder.vcd");
		$dumpvars(0, ripple_carry_adder_tb);
		$monitor($time, " a= %b b= %b sum = %b cout = %b", a, b, sum, cout);
	end

endmodule

//____________________________________________________________________________________________

//N Bit ripple carry

module NbitRippleCarryAdder(a, b, cin, sum, cout, N);
    parameter N;

    input [N-1:0] a;
    input [N-1:0] b;
    input cin;

    output [N-1:0] sum;
    output cout;

    wire [N-1:0] carry;

    genvar i;
    generate
    for (i = 0; i < N; i = i + 1) begin
        if (i == 0)
            full_adder f(a[0], b[0], cin, sum[0], carry[0]);
        else
            full_adder f(a[i], b[i], carry[i-1], s[i], carry[i]);
    end

    assign cout = carry[N-1];
    endgenerate
endmodule
