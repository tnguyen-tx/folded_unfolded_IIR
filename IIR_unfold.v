`timescale 1ns / 1ps
`include "multiply.v"

module IIR_unfold(
clk,
rst,
a,b,c,d,
x2k,x2k1,
y2k,y2k1
);

input clk,rst;
input[7:0] a,b,c,d;
input[7:0] x2k,x2k1; // x[2k], x[2k+1]
output[7:0] y2k,y2k1; // y[2k], y[2k+1]

wire [7:0] mul_ax2k_out;
wire [7:0] mul_bx2km1_out;
wire [7:0] mul_cy2km1_out;
wire [7:0] mul_dy2km2_out;
wire [7:0] mul_a2k1_out;
wire [7:0] mul_bx2k_out;
wire [7:0] mul_cy2k_out;
wire [7:0] mul_dy2km1_out; 

reg [7:0] x2km1;
reg [7:0] y2km2;
reg [7:0] y2km1;

multiply mul_ax2k(x2k,a,mul_ax2k_out);
multiply mul_bx2km1(b,x2km1,mul_bx2km1_out);
multiply mul_cy2km1(c,y2km1,mul_cy2km1_out);
multiply mul_dy2km2(d, y2km2, mul_dy2km2_out);
multiply mul_a2k1(a, x2k1, mul_a2k1_out);
multiply mul_bx2k(b,x2k,mul_bx2k_out);
multiply mul_cy2k(c,y2k, mul_cy2k_out);
multiply mul_dy2km1(d,y2km1,mul_dy2km1_out);

	
//Comb
assign y2k = mul_ax2k_out + mul_bx2km1_out + mul_cy2km1_out + mul_dy2km2_out;
assign y2k1 = mul_a2k1_out + mul_bx2k_out + mul_cy2k_out + mul_dy2km1_out;
//Sequential
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			y2km2 <= 0;
			y2km1 <= 0;
			x2km1 <= 0;
		end
		else begin
			y2km2 <= y2k;
			y2km1 <= y2k1;
			x2km1 <= x2k1;
		end
	end
endmodule
