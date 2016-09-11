`timescale 1ns / 1ps

module debouncer(
    input wire clk,
    input wire PBa,
    output reg PB_statea,
	input wire PBb,
    output reg PB_stateb,
	input wire PBc,
    output reg PB_statec,
	input wire PBd,
    output reg PB_stated,
	input wire PBe,
    output reg PB_statee
    );
	 
reg PB_sync_0a;
always @(posedge clk) PB_sync_0a <= PBa; 
reg PB_sync_1a;
always @(posedge clk) PB_sync_1a <= PB_sync_0a;

reg PB_sync_0b;
always @(posedge clk) PB_sync_0b <= PBb; 
reg PB_sync_1b;
always @(posedge clk) PB_sync_1b <= PB_sync_0b;

reg PB_sync_0c;
always @(posedge clk) PB_sync_0c <= PBc; 
reg PB_sync_1c;
always @(posedge clk) PB_sync_1c <= PB_sync_0c;

reg PB_sync_0d;
always @(posedge clk) PB_sync_0d <= PBd; 
reg PB_sync_1d;
always @(posedge clk) PB_sync_1d <= PB_sync_0d;

reg PB_sync_0e;
always @(posedge clk) PB_sync_0e <= PBe; 
reg PB_sync_1e;
always @(posedge clk) PB_sync_1e <= PB_sync_0e;


reg [15:0] PB_cnta;
reg [15:0] PB_cntb;
reg [15:0] PB_cntc;
reg [15:0] PB_cntd;
reg [15:0] PB_cnte;


always @(posedge clk) begin
	if(PB_statea==PB_sync_1a)
		PB_cnta <= 0;
	else begin
		PB_cnta <= PB_cnta + 1'b1;  
		if(PB_cnta == 16'hffff) PB_statea <= ~PB_statea;  
	end
	
	if(PB_stateb==PB_sync_1b)
		PB_cntb <= 0;
	else begin
		PB_cntb <= PB_cntb + 1'b1;  
		if(PB_cntb == 16'hffff) PB_stateb <= ~PB_stateb;  
	end
	
	if(PB_statec==PB_sync_1c)
		PB_cntc <= 0;
	else begin
		PB_cntc <= PB_cntc + 1'b1;  
		if(PB_cntc == 16'hffff) PB_statec <= ~PB_statec;  
	end
	
	if(PB_stated==PB_sync_1d)
		PB_cntd <= 0;
	else begin
		PB_cntd <= PB_cntd + 1'b1;  
		if(PB_cntd == 16'hffff) PB_stated <= ~PB_stated;  
	end
	
	if(PB_statee==PB_sync_1e)
		PB_cnte <= 0;
	else begin
		PB_cnte <= PB_cnte + 1'b1;  
		if(PB_cnte == 16'hffff) PB_statee <= ~PB_statee;  
	end
end
endmodule