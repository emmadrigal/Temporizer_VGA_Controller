`timescale 1ns / 1ps
 
module color_dec(
	input clk,
	input segs,
	input enable,
	input [1:0] state,
	output [7:0] rgb
   );

reg [7:0] rgb_next;
reg [7:0] rgb_finished = 0;


//Checks that for a given pixel in the screen if it should be written
always @(posedge clk)
	if(enable)
		case(state)
			2'b10   : rgb_next = 8'b00111000;//Color verde para contando
			2'b01   : rgb_next = 8'b00000111;//Color rojo para detenido
			2'b00   : rgb_next = rgb_finished; 
			default : rgb_next = 8'b00000000;
		endcase
	else
		rgb_next = 7'b0000000;
		
		
always @(posedge segs) begin
	case(rgb_finished)
		8'b11111111 : rgb_finished = 8'b01000111;
		8'b01000111 : rgb_finished = 8'b11010000;
		8'b11010000 : rgb_finished = 8'b00111010;
		8'b00111010 : rgb_finished = 8'b11001010;
		8'b11001010 : rgb_finished = 8'b01010111;
		8'b01111010 : rgb_finished = 8'b00010000;
		default     : rgb_finished = 8'b11111111;
	endcase
end
	
	
assign rgb = rgb_next;

endmodule

