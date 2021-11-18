`timescale 1ns / 1ps
`include "IIR_unfold.v"
module IIR_unfold_tb(
    );

//your code here=============
reg clk;
reg rst;
reg [7:0] a,b,c,d;
reg [7:0] x2k,x2k1;
wire [7:0] y2k,y2k1;
//your code here=============

//Instantiate
IIR_unfold top(
.clk(clk),
.rst(rst),      
.a(a),
.b(b),
.c(c),
.d(d),
.x2k(x2k),
.x2k1(x2k1),
.y2k(y2k),
.y2k1(y2k1)
);


initial begin
clk=0;
rst=0;
a=0.5*16;//0.5
b=256-1.5*16;//-1.5
c=2*16;//2.0
d=256-1*16;//-1
x2k=0;
x2k1=0;
#4 rst=1;

#30 rst=0;

end

always #1 begin
    clk<=~clk;
end

integer n = -5;

always@(posedge clk)begin
    if(rst)begin
            x2k <= 0;
            x2k1 <= 0;
			n <= -6;
    end
	else begin 
	       if (n < 6) begin
            	x2k <=256 + n*16;
            	x2k1 <=256 + n*16;
		n <= n + 1;
		end
        end
end

endmodule
