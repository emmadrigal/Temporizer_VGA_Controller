`timescale 1ns / 1ps

module Temporizer(
    input clk,
    input upButton,
    input downButton,
    input leftButton,
    input rightButton,
    input actionButton,
    output reg [15:0] _time,//Contiene el valor del tiempo a mostrar
    output reg [1:0] CurrentState
    );

reg [2:0] currentDigit  = 0;

initial begin
	CurrentState = 1;
	_time = 0;
	currentDigit  = 3'b000;
end
/*
00:Contando
01:Detenido
10:xxxxxx
11:Finalizado
*/

//Controla los estados cuando se está contando
always @(posedge clk)
	if (CurrentState == 0)
		begin
		if(_time == 0)
			CurrentState = 3;//Pasa al estado de Finalizado
		else
			_time = _time - 1; //Disminuye el temporizador en 1
		end
		
//Controla los estados al presionar el boton central
always @(posedge actionButton)
	begin
	if (CurrentState == 0)
		begin
		currentDigit = 0;   //Restablece el digito siendo cambiado a ninguno
		CurrentState = 1; //Cambia el estado a detenido
		end
	else if (CurrentState == 1)
		CurrentState = 0; //Cambia el estado a detenido
	else if (CurrentState == 3)
		CurrentState = 1; //Cambia el estado a Detenido
	end
	

//Controla el setup de los botones cuando 
always @(posedge leftButton)
	begin
	if(CurrentState == 2'b01)
		currentDigit = currentDigit - 1;//Mueve el digito siendo cambiado hacia la izquierda
	if(currentDigit == 7)
		currentDigit = 3;
	end
		
//Controla el setup de los botones cuando 
always @(posedge rightButton)
	begin
	if(CurrentState == 1)
			currentDigit = currentDigit + 1;//Mueve el digito siendo cambiado hacia la derecha
	if(currentDigit == 5)
		currentDigit = 0;
	end
		
//Controla el setup de los botones cuando 
always @(posedge upButton)
	if(CurrentState == 1)
			case(currentDigit)//Checkea cual digito esta siendo cambiado y ajusta el valor de acuerdo a lo indicado
				3'b001  : _time = _time + 1;
				3'b010  : _time = _time + 10;
				3'b010  : _time = _time + 60;
				3'b010  : _time = _time + 600;
				default : _time = _time;
			endcase;
		
//Controla el setup de los botones cuando 
always @(posedge downButton)
	if(CurrentState == 1)
			case(currentDigit)//Checkea cual digito esta siendo cambiado y ajusta el valor de acuerdo a lo indicado
				3'b001  : _time = _time - 1;
				3'b010  : _time = _time - 10;
				3'b010  : _time = _time - 60;
				3'b010  : _time = _time - 600;
				default : _time = _time;
			endcase;


endmodule
