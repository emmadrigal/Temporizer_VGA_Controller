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
   output Vr,
   output Vb,
   output Vg
    );

reg [9:0] contadorx=10'd0;
reg [9:0] contadory=10'd0;
reg [11:0] matriz [0:525][0:800];
reg [9:0] i;
reg [9:0] j;

for (i=0;i<526;i=i+1)
begin
	
end

always@(posicionx or posiciony)
	begin
	matriz[posiciony][posicionx]=Coloresrgb;
	end 


always @(Pxcount)
	begin
	contadorx<= contadorx + 1;
	if(contadorx==800)
		begin
		contadorx <= 0;
		contadory <= contadory + 1;
		end	
	end 

endmodule
