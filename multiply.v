`timescale 1ns / 1ps

module multiply(a,b,c);

parameter width=8;
parameter decimal=4;

input [width-1:0] a,b;
output [width-1:0] c;

reg[width*2-1:0] mul0; // double-width of a.
reg[width*2-1:0] mul1; // double-width of b.
wire[width*2-1:0] ones; // double-width of ones.
wire[width*2-1:0] ab; // intermediate result of a * b.

assign ones=(~0);

//your code here=============
always @(*) begin
if (a[width-1] == 1'b1)
	mul0 =  {{width{1'b1}},a[width-1:0]};
else mul0 =  {{width{1'b0}},a[width-1:0]};
if (b[width-1] == 1'b1)
	mul1 =  {{width{1'b1}},b[width-1:0]};
else mul1 =  {{width{1'b0}},b[width-1:0]};
end
//your code here=============
assign	ab = mul0*mul1;
assign c=ab[width-1+decimal:decimal];

endmodule
