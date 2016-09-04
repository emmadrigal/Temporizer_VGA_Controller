`timescale 1ns / 1ps

//Los relojes deben ser usados mediante el posedge
module Clock(
    input wire clk,     //Connected to the pin clock of the FPGA
    output wire sec,    //Used for control of the temporizer, frecuency is actually 0.96Hz
    output wire VSync,  //Vertical Synchronization of the screen should be 60Hz, its actually 61.53Hz	
															//This signal will also be used for the debouncer
    output wire HSync,   //Horizontal Synchronization of the screen should be 31.5kHz, its actually 31 505 Hz
	 output wire PxCount //Pixel Count, used to know the current pixel being showed in the screen.
    );

assign HSync = HCountMax;
assign VSync = VCountMax;
assign sec       = SecCountMax;

reg [1:0] pxCounter  = 0;
reg [9:0] HCount        = 0;
reg [9:0] VCount        = 0;
reg [5:0] SecCount    = 0;

assign pxCount       = (pxCounter[1] ==     1);
wire HCountMax    = (HCount            == 794);
wire VCountMax     = (HCount           == 525);
wire SecCountMax = (SecCount       ==    60);

//Se divide la frecuencia a la mitad para obtener una frecuencia de 25Mhz que se usará para PxCount
always @(posedge clk)
		pxCounter = pxCounter + 1;

//Se divide la frecuencia de pxCounter entre 794 para obtener una frecuencia de 31.5kHz que se utilizará para HSync
always @(posedge pxCounter)
	if(HCountMax)
	  HCount <= 0;
	else
	  HCount <= HCount + 1;	

//Se divide la frecuencia de HSync entre 525 para obtener una frecuencia de 60Hz que se utilizará para VSync
always @(posedge HCountMax)
	if(VCountMax)
	  VCount <= 0;
	else
	  VCount <= VCount + 1;	

//Se divide la frecuencia de VSync entre 60 para obtener una frecuencia de 60Hz que se utilizará para VSync
always @(posedge SecCountMax)
	if(SecCountMax)
	  SecCount <= 0;
	else
	  SecCount <= SecCount + 1;	

endmodule