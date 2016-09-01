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
		currentDigit = 0;
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
	
reg [2:0] currentDigit = 3'b00; 
//Controla el setup de los botones cuando 
always @(leftButton)
	begin
	if(CurrentState == 1)
		begin
			currentDigit = currentDigit - 1;
		end
	end
		
//Controla el setup de los botones cuando 
always @(rightButton)
	begin
	if(CurrentState == 1)
		begin
			currentDigit = currentDigit + 1;
		end
	end
		
//Controla el setup de los botones cuando 
always @(upButton)
	begin
	if(CurrentState == 1)
		begin
			case(currentDigit)
				3'b000  : _time = _time;
				3'b001  : _time = _time + 1;
				3'b010  : _time = _time + 10;
				3'b010  : _time = _time + 60;
				3'b010  : _time = _time + 600;
				default : _time = _time;
			endcase;
		end
	end
		
//Controla el setup de los botones cuando 
always @(downButton)
	begin
	if(CurrentState == 1)
		begin
			case(currentDigit)
				3'b000  : _time = _time;
				3'b001  : _time = _time - 1;
				3'b010  : _time = _time - 10;
				3'b010  : _time = _time - 60;
				3'b010  : _time = _time - 600;
				default : _time = _time;
			endcase;
		end
	end
	


endmodule
