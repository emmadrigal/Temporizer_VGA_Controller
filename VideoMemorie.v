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
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module VideoMemorie(
    input [11:0] Bitscolores,
    input Cordenadax,
	 input Cordenaday,
	 input Enable,
    input Pxcount,
	 input VerSin,
    output Vr,
    output Vb,
    output Vg
    );

reg [9:0] contadorx;
reg [9:0] contadory;

always @(Enable)
	begin
	

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
