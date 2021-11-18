`timescale 1ns / 1ps

module IIR_fold(
clk,
rst,
a,b,c,d,
x,
y
);

parameter width = 8;

input clk,rst;
input[7:0] a,b,c,d;
input[7:0] x;
output[7:0] y;

//your code here=============
reg [7:0] xm1;
reg [7:0] ym1;
reg [7:0] ym2;

reg [7:0] stage0_out;
reg [7:0] stage1_out;
reg [7:0] stage2_out;
reg [7:0] stage3_out;

reg [1:0] stage;
reg [7:0] x_temp;

function [7:0] multiply;
	input signed [width-1:0] a,b;
	parameter width=8;
	parameter decimal=4;

	reg signed[width*2-1:0] mul0; // double-width of a.
	reg signed[width*2-1:0] mul1; // double-width of b.
	reg[width*2-1:0] ab; // intermediate result of a * b.
	
//your code here=============
	begin
	mul0 = {{8{a[width-1]}},a[width-1:0]};
	mul1 = {{8{b[width-1]}},b[width-1:0]};
//your code here=============
	ab = mul0*mul1;
	multiply=ab[width-1+decimal:decimal];
	end
endfunction

assign y = stage3_out;

//your code here=============
always @(posedge clk or negedge rst) begin
	if (!rst) begin
		stage0_out <= 0;
		stage1_out <= 0;
		stage2_out <= 0;
		stage3_out <= 0;
		stage <= 0;
	end
	else begin
		//resource sharing 
		case (stage)
			2'b00: begin
				stage <= 2'b01;
				stage0_out <= multiply(a,x);					
			end
			2'b01: begin
				stage <= 2'b10;
				stage1_out <= stage0_out + multiply(b,xm1);
			end
			2'b10: begin
				stage <= 2'b11;
				stage2_out <= stage1_out + multiply(d,ym2);
			end
			2'b11: begin
				stage <= 2'b00;
				stage3_out <= stage2_out + multiply(c,ym1);
			end
		endcase
	end
end


//Store prvious values
always @(posedge clk or negedge rst) begin
	if (!rst) begin
		xm1 <= 0;
		ym1 <= 0;	
		ym2 <= 0;
	end
	else begin
		case (stage)
			2'b00: begin
				ym1 <= y;
				ym2 <= ym1;
				x_temp <= x;
				end
			2'b11: begin
				xm1 <= x_temp;
				end
			default: begin
				ym1 <=ym1;
				ym2 <=ym2;
				x_temp <=x_temp;
				xm1 <=xm1;
			end
		endcase
	end
end

endmodule
