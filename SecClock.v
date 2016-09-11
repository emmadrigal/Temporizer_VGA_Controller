`timescale 1ns / 1ps

module SecClock(
    input clk,
    output Sec
    );

reg [26:0] sec_Counter;
reg sec_reg;
	 
always @(posedge clk) begin
	sec_Counter = sec_Counter + 1;
	if(sec_Counter == 100000000) begin
		sec_reg = sec_reg  + 1;
		sec_Counter = 0;
	end
end

assign Sec = sec_reg;


endmodule
