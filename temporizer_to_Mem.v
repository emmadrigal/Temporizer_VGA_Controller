`timescale 1ns / 1ps

module temporizer_to_Mem(
    input [15:0]_time,
    input [1:0] state,
	 input clk, //Utilizado para cambiar los colores durante estado "Finalizado"
    output reg [11:0] rgb,
    output reg [8:0] x,
    output reg [8:0] y
    );

//Variables usadas para la comunicación con drawer
reg [3:0] num = 0;
reg [8:0] x0 = 0;
reg [8:0] y0 = 0;
reg [11:0] rgb_draw = 0;
integer i;
integer j;

task draw;
	input     [3:0]  num; //Numero de 0 a 9
	begin

		//Pinta de negro todo el recuadro del color para posteriormente pintar de negro el resto
		for (i = 0; i < 80; i = i + 1) begin
			 for(j = 0; j < 160; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb = rgb_draw;
			 end
		end

		//Pinta el negativo en la pantalla, checkea para cada numero y realiza la pintura indicada
		if (num == 0) begin
			for (i = 10; i < 70; i = i + 1) begin
				 for(j = 10; j < 150; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
		end

		else if (num == 1) begin
			for (i = 0; i < 70; i = i + 1) begin
				 for(j = 0; j < 160; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
		end

		else if (num == 2) begin
				for (i = 0; i < 70; i = i + 1) begin
				 for(j = 10; j < 75; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
			for (i = 10; i < 80; i = i + 1) begin
				 for(j = 85; j < 150; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
		end

		else if (num == 3) begin
			for (i = 0; i < 70; i = i + 1) begin
				 for(j = 10; j < 75; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
			for (i = 0; i < 70; i = i + 1) begin
				 for(j = 85; j < 150; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
		end

		else if (num == 4) begin
			for (i = 10; i < 70; i = i + 1) begin
				 for(j = 0; j < 75; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
			for (i = 0; i < 70; i = i + 1) begin
				 for(j = 85; j < 160; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
		end

		else if (num == 5) begin
			for (i = 0; i < 70; i = i + 1) begin
				 for(j = 10; j < 75; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
			for (i = 0; i < 70; i = i + 1) begin
				 for(j = 85; j < 150; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
		end

		else if (num == 6) begin
			for (i = 0; i < 70; i = i + 1) begin
				 for(j = 0; j < 75; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
			for (i = 10; i < 70; i = i + 1) begin
				 for(j = 85; j < 150; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
		end

		else if (num == 7) begin
			for (i = 0; i < 70; i = i + 1) begin
				 for(j = 10; j < 160; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
		end

		else if (num == 8) begin
			for (i = 10; i < 70; i = i + 1) begin
				 for(j = 10; j < 75; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
			for (i = 10; i < 70; i = i + 1) begin
				 for(j = 85; j < 150; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
		end

		else if (num == 9) begin
			for (i = 10; i < 70; i = i + 1) begin
				 for(j = 10; j < 75; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
			for (i = 0; i < 70; i = i + 1) begin
				 for(j = 85; j < 160; j = j + 1) begin
					x = x0 + i;
					y = y0 + i;
					rgb = 0;
				 end
			end
		end

	 end
 endtask
	 



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
		draw(num);
		
		end
	if (tiempo % 60 != 0)
		begin
		num = tiempo%60;
		tiempo = tiempo/60;
		x0 = 220;
		y0 = 160;
		draw(num);
		end
	if (tiempo % 10 != 0)
		begin
		num = tiempo%10;
		tiempo = tiempo/600;
		x0 = 340;
		y0 = 160;
		draw(num);
		end
	num = tiempo;
	x0 = 440;
	y0 = 160;
	draw(num);
end



endmodule
