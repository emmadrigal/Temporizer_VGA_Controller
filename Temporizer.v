`timescale 1ns / 1ps

module Temporizer(
    input clk,
    input upBottom,
    input downButton,
    input LeftButton,
    input RightButton,
    input actionButton,
    output [15:0] _time,//Contiene el valor del tiempo a mostrar
    output state
    );

reg [1:0] CurrentState = 2'b00;
/*
00:Contando
01:Detenido
10:Set up
11:Finalizado
*/

//Controla los estados cuando se está contando
always @(posedge clk)
	if (CurrentState == 0)
		begin
		if(_time == 0)
			begin
			CurrentState = 3;
			end
		end
		
//Controla los estados al presionar el boton central
always @(actionButton)
	if (CurrentState == 0)
		begin
		CurrentState = 1;
		end
	else if (CurrentState == 1)
		begin
		CurrentState = 0;
		end
	else if (CurrentState == 3)
		begin
		end
		


endmodule
