`timescale 1ns / 1ps

module Debouncer(
    input wire clk,
    input wire Button,
    output reg Out
    );
	 
reg [1:0] States = 2'b00;
	 
always @(posedge clk)
begin
	if (Button == 1'b1)
		States = States + 1;
	else 
	begin
		if(States != 2'b00)
			States = States - 1;
	end
	if(States == 2'b11)
		Out = 1'b1;
	else
		Out = 1'b0;
end

endmodule
