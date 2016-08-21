`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:31:27 08/21/2016 
// Design Name: 
// Module Name:    Clock 
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
module Clock(
    input wire clk,
    output wire sec, //Used for control of the temporizer, frecuency is actually 0.96Hz
    output wire VSync, //Vertical Synchronization of the screen should be 60Hz, its actually 61.53Hz
    output wire HSync //Horizontal Synchronization of the screen should be 31.5kHz, its actually 31 505 Hz
    );

reg [5:0]  secCount;
reg [8:0]  VCount;
reg [14:0] HCount;
wire CounterHmax = (HCount == 3174);
wire CounterVmax = (VCount == 512);


assign VSync = VCount[8];
assign HSync = CounterHmax;

always @(posedge clk)
	if(CounterHmax)
	  HCount <= 0;
	else
	  HCount <= HCount + 1;

always @(posedge clk)
	if(CounterHmax)
		 VCount <= VCount + 1;
		 
always @(posedge clk)
	if(CounterVmax)
		 secCount <= secCount + 1;
	


endmodule