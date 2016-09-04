`timescale 1ns / 1ps

module temporizer_to_Mem(
    input [15:0]_time,
    input [1:0] state,
	 input clk, //Utilizado para cambiar los colores durante estado "Finalizado"
    output reg [11:0] rgb,
    output [8:0] x,
    output [8:0] y
    );
	 
	 
//Variables usadas para la comunicación con drawer
reg [3:0] num = 0;
reg [8:0] x0 = 0;
reg [8:0] y0 = 0;
reg [11:0] rgb_draw = 0;

num_drawer drawer(.num(num), .x0(x0), .y0(y0), .rgb_in(rgb_draw), .x(x), .y(y), .rgb_out(rgb));

reg [15:0] tiempo;
/*
00:Contando
01:Detenido
10:xxxxxx
11:Finalizado
*/
always @(clk)
begin
	//Se cambia el color de salida
	if(state == 0)//Si se está contando, el color de salida es verde
		rgb_draw = 12'h0F0;
	else if (state == 1)//Si se está detenido, el color de salida es rofo
		rgb_draw = 12'hF00;
	else if (state == 3)//Si está finalizado, el color debe cambiar 
	begin
		if (rgb_draw == 12'h0FF)//Si el color es Cyan
			rgb_draw = 12'hF0F;//Pasar a magenta
		else if (rgb_draw == 12'hF0F)//Si el color es magenta
			rgb_draw = 12'hFF0;//Pasar a amarillo
		else
			rgb_draw = 12'h0FF;//Pasar a Cyan
	end
	
	tiempo = _time;
	if((tiempo % 600) != 0)
		begin
		num = tiempo%600;
		tiempo = tiempo/600;
		x0 = 120;
		y0 = 160;
		end
	else if (tiempo % 60 != 0)
		begin
		num = tiempo%60;
		tiempo = tiempo/60;
		x0 = 220;
		y0 = 160;
		end
	else if (tiempo % 10 != 0)
		begin
		num = tiempo%10;
		tiempo = tiempo/600;
		x0 = 340;
		y0 = 160;
		end
	else
		num = tiempo;
		x0 = 440;
		y0 = 160;
end



endmodule
