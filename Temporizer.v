`timescale 1ns / 1ps

module Temporizer(
    input clk,
    input upBottom,
    input downButton,
    input leftButton,
    input rightButton,
    input actionButton,
    output [15:0] _time,//Contiene el valor del tiempo a mostrar
    output state
    );

reg [1:0] CurrentState = 2'b00;
/*
00:Contando
01:Detenido
10:xxxxxx
11:Finalizado
*/

//Controla los estados cuando se está contando
always @(posedge clk)
	begin
	if (CurrentState == 0)
		begin
		if(_time == 0)
			begin
			CurrentState = 3;
			end
		end
	end
		
//Controla los estados al presionar el boton central
always @(actionButton)
	begin
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
		CurrentState = 1;
		end
	end

always @(upBotton, downButton, leftButton, rightButton)
		begin
		end


endmodule
