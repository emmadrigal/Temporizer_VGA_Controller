`timescale 1ns / 1ps

module top(	
		input clk,
		input upButton, input downButton, input leftButton, input rightButton, input actionButton,
		output [7:0] RGB,
		output hsync,output vsync
    );

	
	// signal declaration
   wire video_on, pixel_tick;
   wire enable;
   
   //Used for the Temporizer-Controller interface
   wire [12:0] num;
   wire [1:0] state;
   
   //Screen position
   wire [9:0] pixel_x, pixel_y;
   //Buttons
   wire upButtonDB, downButtonDB, leftButtonDB, rightButtonDB, actionButtonDB;
   //1s Clock
   wire sec;
   
		
	SecClock segundos(
    .clk(clk),
    .Sec(sec)
    );
	
	debouncer db(
    .clk(clk),
    .PBa(actionButton),
    .PB_statea(actionButtonDB),
	.PBb(upButton),
    .PB_stateb(upButtonDB),
	.PBc(downButton),
    .PB_statec(downButtonDB),
	.PBd(leftButton),
    .PB_stated(leftButtonDB),
	.PBe(rightButton),
    .PB_statee(rightButtonDB)
    );
	
   //Control del VGA
   vga_sync Sincronizador (.clk(clk), 
						   .hsync(hsync), .vsync(vsync),
						   .video_on(video_on), .p_tick(pixel_tick),
						   .pixel_x(pixel_x), .pixel_y(pixel_y));
	   
	
	pixel_Gen generator(.num(num),
					.state(state),
					.pixel_tick(pixel_tick),
					.pixel_x(pixel_x), .pixel_y(pixel_y),
					.video_on(video_on),
					.enable(enable));
					
	color_dec colorer(
		.clk(clk),
		.segs(sec),
		.enable(enable),
		.state(state),
		.rgb(RGB));
	
	Temporizer temporizer(
	.clk(clk),//50MHz
	.sec(sec),//1Hz
	.Boton_incrementar(upButtonDB),
	.Boton_decrementar(downButtonDB),
	.Boton_izquierda(leftButton),
	.Boton_derecha(rightButtonDB),
	.Boton_onoff(actionButtonDB),
	._time(num),
	.Estado(state)
    );

endmodule
