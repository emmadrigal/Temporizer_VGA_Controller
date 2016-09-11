`timescale 1ns / 1ps
 
module pixel_Gen(
	input [12:0] num,
	input [1:0] state,
    input pixel_tick,
	input wire [9:0] pixel_x, pixel_y,
	input wire video_on,
    output enable
   );

// constant declaration
   localparam LeftMost  = 50;//X Coordinate of the top left corner of digits
   localparam TopMost   = 100 ;//Y Coordinate of the top left corner of the digits
   localparam DigitSize = 32 ; //Lenght of the side of the digit
   localparam expansion =  2;//Denotes log2(DigitSize/8) it denotes how much bigger does the digit is on screen compared with the template, 1 is 1:1, 2 is 1:4, 3 is 1:16. From Verilog 2005 and on this can implemented as a function
   localparam Space     = 10 ;//Horizontal space betwwen digits
   localparam CharSize = 8;
   localparam YCharDisplacement = 25;
   
//signal declaration
reg enable_reg;
reg [3:0] Minutos_MSB, minutos_LSB, Seconds_MSB, seconds_LSB;
reg [12:0] num_tmp;
reg [7:0] Character;
wire [2:0] columnYNums;
wire [2:0] columnYChars;
wire [7:0] rowchars;
wire [7:0] row;

assign columnYNums = ((pixel_y - TopMost) >> expansion);
assign columnYChars = pixel_y - YCharDisplacement;

//Module instatiation
Chars_rom rom(.character(Character), .columnaY(columnYNums), .data(row));
Chars_rom romChars(.character(Character), .columnaY(columnYChars), .data(rowchars));

//Asigna los digitos correctos a cada numero basado en el numero de entrada
always @(num) begin
	Minutos_MSB = (num / 600);
	num_tmp = num % 600;
	
	minutos_LSB = (num_tmp / 60);
	num_tmp = num_tmp % 60;
	
	Seconds_MSB = (num_tmp / 10);
	
	seconds_LSB = (num_tmp % 10);
end


//Checks that for a given pixel in the screen if it should be written
always @(posedge pixel_tick) begin 
	if (video_on) begin
			if ((pixel_x<=CharSize) && (pixel_y<=(CharSize + YCharDisplacement)) && (pixel_y>=YCharDisplacement)) begin
				case(state)
					2'b10	: Character = "C";
					2'b01	: Character = "D";
					2'b00	: Character = "F";
					default : Character = 0;
				endcase
				enable_reg = rowchars[7 -(pixel_x)];
			end
			else if ((CharSize<=pixel_x) && (pixel_x<2*CharSize) && (pixel_y<(CharSize + YCharDisplacement)) && (pixel_y>=YCharDisplacement)) begin
				case(state)
					2'b10	: Character = "O";
					2'b01	: Character = "E";
					2'b00	: Character = "I";
					default : Character = 0;
				endcase
				enable_reg = rowchars[7 -(pixel_x - CharSize)];
			end
			else if ((2*CharSize<=pixel_x) && (pixel_x<3*CharSize) && (pixel_y<(CharSize + YCharDisplacement)) && (pixel_y>=YCharDisplacement)) begin
				case(state)
					2'b10	: Character = "N";
					2'b01	: Character = "T";
					2'b00	: Character = "N";
					default : Character = 0;
				endcase
				enable_reg = rowchars[7 -(pixel_x - 2*CharSize)];
			end
			else if ((3*CharSize<=pixel_x) && (pixel_x<4*CharSize) && (pixel_y<(CharSize + YCharDisplacement)) && (pixel_y>=YCharDisplacement)) begin
				case(state)
					2'b10   : Character = "T";
					2'b01	: Character = "E";
					2'b00	: Character = "A";
					default : Character = 0;
				endcase
				enable_reg = rowchars[7 -(pixel_x - 3*CharSize)];
			end
			else if ((4*CharSize<=pixel_x) && (pixel_x<5*CharSize) && (pixel_y<(CharSize + YCharDisplacement)) && (pixel_y>=YCharDisplacement)) begin
				case(state)
					2'b10	: Character = "A";
					2'b01	: Character = "N";
					2'b00	: Character = "L";
					default : Character = 0;
				endcase
				enable_reg = rowchars[7 -(pixel_x - 4*CharSize)];
			end
			else if ((5*CharSize<=pixel_x) && (pixel_x<6*CharSize) && (pixel_y<(CharSize + YCharDisplacement)) && (pixel_y>=YCharDisplacement)) begin
				case(state)
					2'b10	: Character = "N";
					2'b01	: Character = "I";
					2'b00	: Character = "I";
					default : Character = 0;
				endcase
				enable_reg = rowchars[7 -(pixel_x - 5*CharSize)];
			end
			else if ((6*CharSize<=pixel_x) && (pixel_x<7*CharSize) && (pixel_y<(CharSize + YCharDisplacement)) && (pixel_y>=YCharDisplacement)) begin
				case(state)
					2'b10	: Character = "D";
					2'b01	: Character = "D";
					2'b00	: Character = "Z";
					default : Character = 0;
				endcase
				enable_reg = rowchars[7 -(pixel_x - 6*CharSize)];
			end
			else if ((7*CharSize<=pixel_x) && (pixel_x<8*CharSize) && (pixel_y<(CharSize + YCharDisplacement)) && (pixel_y>=YCharDisplacement)) begin
				case(state)
					2'b10	: Character = "O";
					2'b01	: Character = "O";
					2'b00	: Character = "A";
					default : Character = 0;
				endcase
				enable_reg = rowchars[7 -(pixel_x - 7*CharSize)];
			end
				
			else if ((8*CharSize<=pixel_x) && (pixel_x<9*CharSize) && (pixel_y<=(CharSize + YCharDisplacement)) && (pixel_y>=YCharDisplacement)) begin
				if(state == 0) begin
					Character = "D";
					enable_reg = rowchars[7 -(pixel_x - 9*CharSize)];
				end
				else
					enable_reg = 0;
			end
			else if ((9*CharSize<=pixel_x) && (pixel_x<10*CharSize) && (pixel_y<=(CharSize + YCharDisplacement)) && (pixel_y>=YCharDisplacement)) begin
				if(state == 0) begin
					Character = "O";
					enable_reg = rowchars[7 -(pixel_x - 10*CharSize)];
				end
				else
					enable_reg = 0;
			end
			//Posición del Dígito más significativo de los MSB_Minuts
			else if     ((LeftMost<= pixel_x) &&  (pixel_x<(LeftMost + DigitSize))   && (TopMost <= pixel_y) && (pixel_y< (TopMost+ DigitSize))  ) begin
				Character = Minutos_MSB;
				enable_reg = row[7 -((pixel_x - LeftMost) >> expansion)];
				end
			//Posición del Dígito menos significativo de los MSB_Minuts
			else if     (((LeftMost + Space + DigitSize)<= pixel_x) &&  (pixel_x<(LeftMost + Space + 2*DigitSize))   &&  (TopMost <= pixel_y) && (pixel_y< (TopMost+ DigitSize)) ) begin
				Character = minutos_LSB;//El 48 es utilizado para alinear con la tabla ASCII
				enable_reg = row[7- ((pixel_x - (LeftMost + Space + DigitSize)) >> expansion) ];
				end
			
			//Posición del Dígito más significativo de los Segundos
			else if(((LeftMost + 4*Space + 2*DigitSize)<= pixel_x) &&  (pixel_x<(LeftMost + 4*Space + 3*DigitSize)) && (TopMost <= pixel_y) && (pixel_y< (TopMost+ DigitSize))) begin
				Character = Seconds_MSB;//El 48 es utilizado para alinear con la tabla ASCII
				enable_reg = row[7 - ((pixel_x - (LeftMost + 4*Space + 2*DigitSize)) >> expansion)];
				end
			//Posición del Dígito menos significativo de los Segundos
			else if(((LeftMost + 5*Space + 3*DigitSize)<= pixel_x) &&  (pixel_x<(LeftMost + 5*Space + 4*DigitSize)) && (TopMost <= pixel_y) && (pixel_y< (TopMost+ DigitSize))) begin
				Character = seconds_LSB;//El 48 es utilizado para alinear con la tabla ASCII
				enable_reg = row[7 - ((pixel_x - (LeftMost + 5*Space + 3*DigitSize)) >> expansion)];
				end
			else
				enable_reg = 0;
			
	end
	else
		enable_reg = 0;
	end 

//output

assign enable = enable_reg;

endmodule

