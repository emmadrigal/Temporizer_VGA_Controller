`timescale 1ns / 1ps

module num_drawer(
    input     [3:0]  num, //Numero de 0 a 9
    input     [9:0]   x0, //Posicion Inicial en X de donde dibujar
    input     [9:0]   y0, //Posicion Inicial en Y de donde dibujar
    input     [11:0] rgb_in, //Color actual de interfaz
    output    reg [9:0]   x, //Posicion en X a dibujar
    output reg [9:0]    y, //Posicion en Y a dibujar
    output reg[11:0]  rgb_out //Color de salida
    );


integer i;
integer j;

always @(x0, y0)
begin
	//Pinta de negro todo el recuadro del color para posteriormente pintar de negro el resto
	for (i = 0; i < 80; i = i + 1) begin
       for(j = 0; j < 160; j = j + 1) begin
			x = x0 + i;
			y = y0 + i;
			rgb_out = rgb_in;
		 end
   end
	
	//Pinta el negativo en la pantalla, checkea para cada numero y realiza la pintura indicada
	if (num == 0) begin
		for (i = 10; i < 70; i = i + 1) begin
			 for(j = 10; j < 150; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
	end
	
	else if (num == 1) begin
		for (i = 0; i < 70; i = i + 1) begin
			 for(j = 0; j < 160; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
	end
	
	else if (num == 2) begin
			for (i = 0; i < 70; i = i + 1) begin
			 for(j = 10; j < 75; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
		for (i = 10; i < 80; i = i + 1) begin
			 for(j = 85; j < 150; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
	end
	
	else if (num == 3) begin
		for (i = 0; i < 70; i = i + 1) begin
			 for(j = 10; j < 75; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
		for (i = 0; i < 70; i = i + 1) begin
			 for(j = 85; j < 150; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
	end
	
	else if (num == 4) begin
		for (i = 10; i < 70; i = i + 1) begin
			 for(j = 0; j < 75; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
		for (i = 0; i < 70; i = i + 1) begin
			 for(j = 85; j < 160; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
	end
	
	else if (num == 5) begin
		for (i = 0; i < 70; i = i + 1) begin
			 for(j = 10; j < 75; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
		for (i = 0; i < 70; i = i + 1) begin
			 for(j = 85; j < 150; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
	end
	
	else if (num == 6) begin
		for (i = 0; i < 70; i = i + 1) begin
			 for(j = 0; j < 75; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
		for (i = 10; i < 70; i = i + 1) begin
			 for(j = 85; j < 150; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
	end
	
	else if (num == 7) begin
		for (i = 0; i < 70; i = i + 1) begin
			 for(j = 10; j < 160; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
	end
	
	else if (num == 8) begin
		for (i = 10; i < 70; i = i + 1) begin
			 for(j = 10; j < 75; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
		for (i = 10; i < 70; i = i + 1) begin
			 for(j = 85; j < 150; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
	end
	
	else if (num == 9) begin
		for (i = 10; i < 70; i = i + 1) begin
			 for(j = 10; j < 75; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
		for (i = 0; i < 70; i = i + 1) begin
			 for(j = 85; j < 160; j = j + 1) begin
				x = x0 + i;
				y = y0 + i;
				rgb_out = 0;
			 end
		end
	end
end
	
endmodule
