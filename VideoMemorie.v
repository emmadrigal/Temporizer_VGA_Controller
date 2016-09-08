`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:28:42 09/01/2016 
// Design Name: 
// Module Name:    VideoMemorie 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments
//
//////////////////////////////////////////////////////////////////////////////////
module VideoMemorie(
	input [11:0] Coloresrgb,
   input Pxcount,
	input VerSin,
	input posicionx,
	input posiciony,
   output reg Vr,
   output reg Vb,
   output reg Vg
    );

reg [9:0] contadorx=10'd0;
reg [9:0] contadory=10'd0;
reg [11:0] matriz [0:525][0:800];
reg star=1'b0;
reg [9:0] i;
reg [9:0] j;

	


always@(posicionx or posiciony)
	begin
	matriz[posiciony+45][posicionx+160]=Coloresrgb;
	end 


always @(Pxcount)
	begin
	Vr= matriz[contadory][contadorx][3:0];
	Vb= matriz[contadory][contadorx][7:4];
	Vg= matriz[contadory][contadorx][11:8];
	if(!star)begin
	star = 1;
	for(i=0;i<526;i=i+1)
		for(j=0;j<801;j=j+1)
			matriz[i][j]=0;
	end
	if(contadorx==800)
		begin
		contadorx = 0;
		contadory = contadory + 1;
		end else if(contadory==525)
			begin
				contadory = 0;
				contadorx = 0;
			end else
				begin
				contadorx= contadorx + 1;
				end
	end 

endmodule
