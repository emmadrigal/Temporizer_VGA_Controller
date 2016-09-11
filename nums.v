module Chars_rom
   (
	input wire [7:0]  character,
    input wire [2:0] columnaY,
    output reg [7:0]  data
   );
      
   always @*
		//Numeros
		if(character == 0)//0
			case (columnaY)
				3'b000: data = 8'b00111000; // 
				3'b001: data = 8'b01000100; // 
				3'b010: data = 8'b01000100; // 
				3'b011: data = 8'b01000100; // 
				3'b100: data = 8'b01000100; // 
				3'b101: data = 8'b01000100; // 
				3'b110: data = 8'b00111000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == 1) //1
			case (columnaY)
				3'b000: data = 8'b00000100; // 
				3'b001: data = 8'b00001100; // 
				3'b010: data = 8'b00011100; // 
				3'b011: data = 8'b00000100; // 
				3'b100: data = 8'b00000100; // 
				3'b101: data = 8'b00000100; // 
				3'b110: data = 8'b00011110; // 
				3'b111: data = 8'b00000000; //   
			endcase
		else if(character == 2) //2
			case (columnaY)
				3'b000: data = 8'b00011000; // 
				3'b001: data = 8'b00100100; // 
				3'b010: data = 8'b00000100; // 
				3'b011: data = 8'b00001000; // 
				3'b100: data = 8'b00010000; // 
				3'b101: data = 8'b00100000; // 
				3'b110: data = 8'b00111100; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == 3) //3
			case (columnaY)
				3'b000: data = 8'b00011000; // 
				3'b001: data = 8'b00100100; // 
				3'b010: data = 8'b00000100; // 
				3'b011: data = 8'b00001000; // 
				3'b100: data = 8'b00000100; // 
				3'b101: data = 8'b00100100; // 
				3'b110: data = 8'b00011000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == 4) //4
			case (columnaY)
				3'b000: data = 8'b00000100; // 
				3'b001: data = 8'b00001100; // 
				3'b010: data = 8'b00010100; // 
				3'b011: data = 8'b00100100; // 
				3'b100: data = 8'b01111110; // 
				3'b101: data = 8'b00000100; // 
				3'b110: data = 8'b00001110; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == 5) //5
			case (columnaY)
				3'b000: data = 8'b00111100; // 
				3'b001: data = 8'b00100000; // 
				3'b010: data = 8'b00100000; // 
				3'b011: data = 8'b00111000; // 
				3'b100: data = 8'b00000100; // 
				3'b101: data = 8'b00100100; // 
				3'b110: data = 8'b00011000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == 6) //6
			case (columnaY)
				3'b000: data = 8'b00011100; // 
				3'b001: data = 8'b00100000; // 
				3'b010: data = 8'b00100000; // 
				3'b011: data = 8'b00111000; // 
				3'b100: data = 8'b00100100; // 
				3'b101: data = 8'b00100100; // 
				3'b110: data = 8'b00011000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == 7) //7
			case (columnaY)
				3'b000: data = 8'b00111110; // 
				3'b001: data = 8'b00000010; // 
				3'b010: data = 8'b00000100; // 
				3'b011: data = 8'b00001000; // 
				3'b100: data = 8'b00010000; // 
				3'b101: data = 8'b00010000; // 
				3'b110: data = 8'b00010000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == 8) //8
			case (columnaY)
				3'b000: data = 8'b00011000; // 
				3'b001: data = 8'b00100100; // 
				3'b010: data = 8'b00100100; // 
				3'b011: data = 8'b00011000; // 
				3'b100: data = 8'b00100100; // 
				3'b101: data = 8'b00100100; // 
				3'b110: data = 8'b00011000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == 9) //9
			case (columnaY)
				3'b000: data = 8'b00011000; // 
				3'b001: data = 8'b00100100; // 
				3'b010: data = 8'b00100100; // 
				3'b011: data = 8'b00011000; // 
				3'b100: data = 8'b00000100; // 
				3'b101: data = 8'b00000100; // 
				3'b110: data = 8'b00011000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		//Letras
		else if(character == "A") //A
			case (columnaY)
				3'b000: data = 8'b00001000; // 
				3'b001: data = 8'b00010100; // 
				3'b010: data = 8'b00100010; // 
				3'b011: data = 8'b00100010; // 
				3'b100: data = 8'b00111110; // 
				3'b101: data = 8'b00100010; // 
				3'b110: data = 8'b00100010; // 
				3'b111: data = 8'b00000000; //
			endcase
		else if(character == "B") //B
			case (columnaY)
				3'b000: data = 8'b01110000; // 
				3'b001: data = 8'b01001000; // 
				3'b010: data = 8'b01001000; // 
				3'b011: data = 8'b01110000; // 
				3'b100: data = 8'b01001000; // 
				3'b101: data = 8'b01001000; // 
				3'b110: data = 8'b01110000; // 
				3'b111: data = 8'b00000000; //
			endcase
		else if(character == "C") //C
			case (columnaY)
				3'b000: data = 8'b00111000; // 
				3'b001: data = 8'b01000100; // 
				3'b010: data = 8'b01000000; // 
				3'b011: data = 8'b01000000; // 
				3'b100: data = 8'b01000000; // 
				3'b101: data = 8'b01000100; // 
				3'b110: data = 8'b00111000; // 
				3'b111: data = 8'b00000000; //  
			endcase
		else if(character == "D") //D
			case (columnaY)
				3'b000: data = 8'b01110000; // 
				3'b001: data = 8'b01001000; // 
				3'b010: data = 8'b01000100; // 
				3'b011: data = 8'b01000100; // 
				3'b100: data = 8'b01000100; // 
				3'b101: data = 8'b01001000; // 
				3'b110: data = 8'b01110000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == "E") //E
			case (columnaY)
				3'b000: data = 8'b00111110; // 
				3'b001: data = 8'b00100000; // 
				3'b010: data = 8'b00100000; // 
				3'b011: data = 8'b00111000; // 
				3'b100: data = 8'b00100000; // 
				3'b101: data = 8'b00100000; // 
				3'b110: data = 8'b00111110; // 
				3'b111: data = 8'b00000000; //  
			endcase
		else if(character == "F") //F
			case (columnaY)
				3'b000: data = 8'b00111110; // 
				3'b001: data = 8'b00100000; // 
				3'b010: data = 8'b00100000; // 
				3'b011: data = 8'b00111000; // 
				3'b100: data = 8'b00100000; // 
				3'b101: data = 8'b00100000; // 
				3'b110: data = 8'b00100000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == "I") //I
			case (columnaY)
				3'b000: data = 8'b00111110; // 
				3'b001: data = 8'b00001000; // 
				3'b010: data = 8'b00001000; // 
				3'b011: data = 8'b00001000; // 
				3'b100: data = 8'b00001000; // 
				3'b101: data = 8'b00001000; // 
				3'b110: data = 8'b00111110; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == "L") //L
			case (columnaY)
				3'b000: data = 8'b01000000; // 
				3'b001: data = 8'b01000000; // 
				3'b010: data = 8'b01000000; // 
				3'b011: data = 8'b01000000; // 
				3'b100: data = 8'b01000000; // 
				3'b101: data = 8'b01000000; // 
				3'b110: data = 8'b01111100; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == "N") //N
			case (columnaY)
				3'b000: data = 8'b01000010; // 
				3'b001: data = 8'b01100010; // 
				3'b010: data = 8'b01010010; // 
				3'b011: data = 8'b01010010; // 
				3'b100: data = 8'b01001010; // 
				3'b101: data = 8'b01001010; // 
				3'b110: data = 8'b01000110; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == "O") //O
			case (columnaY)
				3'b000: data = 8'b00000000; // 
				3'b001: data = 8'b00111000; // 
				3'b010: data = 8'b01000100; // 
				3'b011: data = 8'b01000100; // 
				3'b100: data = 8'b01000100; // 
				3'b101: data = 8'b01000100; // 
				3'b110: data = 8'b00111000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == "T") //T
			case (columnaY)
				3'b000: data = 8'b00111110; // 
				3'b001: data = 8'b00001000; // 
				3'b010: data = 8'b00001000; // 
				3'b011: data = 8'b00001000; // 
				3'b100: data = 8'b00001000; // 
				3'b101: data = 8'b00001000; // 
				3'b110: data = 8'b00001000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		else if(character == "Z") //Z
			case (columnaY)
				3'b000: data = 8'b01111110; // 
				3'b001: data = 8'b00000010; // 
				3'b010: data = 8'b00000100; // 
				3'b011: data = 8'b00011000; // 
				3'b100: data = 8'b00100000; // 
				3'b101: data = 8'b01000000; // 
				3'b110: data = 8'b01111110; // 
				3'b111: data = 8'b00000000; // 
			endcase
		
			
		//Unrecoginzed Caracter
		else
			case (columnaY)
				3'b000: data = 8'b00000000; // 
				3'b001: data = 8'b00000000; // 
				3'b010: data = 8'b00000000; // 
				3'b011: data = 8'b00000000; // 
				3'b100: data = 8'b00000000; // 
				3'b101: data = 8'b00000000; // 
				3'b110: data = 8'b00000000; // 
				3'b111: data = 8'b00000000; // 
			endcase
		
endmodule