`timescale 1ns / 1ps

module Temporizer(
    input clk,
	input sec,
    input Boton_incrementar,
    input Boton_decrementar,
    input Boton_izquierda,
    input Boton_derecha,
    input Boton_onoff,
    output wire [15:0] _time,//Contiene el valor del tiempo a mostrar
    output wire [1:0] Estado//Contiene el estado actual del temporizador
    );
	
assign Estado = estado_actual;

reg [12:0] Numero_temp = 0;

reg [1:0] Digito =  0;//Indica cual de los dígitos debe ser cambiado

localparam [2:0] FIN = 0,//estado cuando el contador llega a cero
                 STOPPED = 1,//estado detenido
                 ACTIVE = 2;//estado restando

reg [2:0] estado_actual = STOPPED;
reg [2:0] estado_siguiente = STOPPED;

				  
					 
//Usado para el control del Boton_onoff
reg cambio_SolicitadoONOFF = 0, cambio_RealizadoONOFF = 0;
wire cambio_FinalizadoONOFF;
assign cambio_FinalizadoONOFF = ((cambio_RealizadoONOFF & cambio_SolicitadoONOFF) |  ((!cambio_RealizadoONOFF) & (!cambio_SolicitadoONOFF)));

//Usado para el control del Boton_incrementar
reg cambio_SolicitadoUP = 0, cambio_RealizadoUP = 0;
wire cambio_FinalizadoUP;
assign cambio_FinalizadoUP = ((cambio_RealizadoUP & cambio_SolicitadoUP) |  ((!cambio_RealizadoUP) & (!cambio_SolicitadoUP)));

//Usado para el control del Boton_decrementar
reg cambio_SolicitadoDOWN = 0, cambio_RealizadoDOWN = 0;
wire cambio_FinalizadoDOWN;
assign cambio_FinalizadoDOWN = ((cambio_RealizadoDOWN & cambio_SolicitadoDOWN) |  ((!cambio_RealizadoDOWN) & (!cambio_SolicitadoDOWN)));

//Usado para el control del Boton_derecha
reg cambio_SolicitadoRIGHT = 0, cambio_RealizadoRIGHT = 0;
wire cambio_FinalizadoRIGHT;
assign cambio_FinalizadoRIGHT = ((cambio_RealizadoRIGHT & cambio_SolicitadoRIGHT) |  ((!cambio_RealizadoRIGHT) & (!cambio_SolicitadoRIGHT)));

//Usado para el control del Boton_Izquierda
reg cambio_SolicitadoLEFT = 0, cambio_RealizadoLEFT = 0;
wire cambio_FinalizadoLEFT;
assign cambio_FinalizadoLEFT = ((cambio_RealizadoLEFT & cambio_SolicitadoLEFT) |  ((!cambio_RealizadoLEFT) & (!cambio_SolicitadoLEFT)));

//Usado para el control del Boton_Izquierda
reg cambio_SolicitadoSEC = 0, cambio_RealizadoSEC = 0;
wire cambio_FinalizadoSEC;
assign cambio_FinalizadoSEC = ((cambio_RealizadoSEC & cambio_SolicitadoSEC) |  ((!cambio_RealizadoSEC) & (!cambio_SolicitadoSEC)));


always @(posedge Boton_onoff)
	cambio_SolicitadoONOFF = ~cambio_SolicitadoONOFF;

always @(posedge Boton_incrementar)
	cambio_SolicitadoUP = ~cambio_SolicitadoUP;
	
always @(posedge Boton_decrementar)
	cambio_SolicitadoDOWN = ~cambio_SolicitadoDOWN;
	
always @(posedge Boton_derecha)
	cambio_SolicitadoRIGHT = ~cambio_SolicitadoRIGHT;
	
always @(posedge Boton_izquierda)
	cambio_SolicitadoLEFT = ~cambio_SolicitadoLEFT;
	
always @(posedge sec)
	cambio_SolicitadoSEC = ~cambio_SolicitadoSEC;
	

always @(posedge clk) begin
	estado_actual <= estado_siguiente;
	
	//Realiza los cambios necesarios cuando un segundo ha pasado
	if(!cambio_FinalizadoSEC) begin
		if (estado_actual == ACTIVE) begin//Si se encunetra en el estado activo, disminuya 1
			if(Numero_temp == 0)//Si se alcanza 0
				estado_siguiente = FIN;//Pase al estado de finalizado
			else
				Numero_temp = Numero_temp - 1;
		end
		cambio_RealizadoSEC = cambio_SolicitadoSEC;//Marque la bandera de que se realizó el cambio
	end

		
	if(!cambio_FinalizadoONOFF) begin //Si se presiona el boton de On OFF
		case(estado_actual)//Cambie al estado correcto
			FIN     : estado_siguiente = STOPPED;
			STOPPED : estado_siguiente = ACTIVE;
			ACTIVE  : estado_siguiente = STOPPED;
		endcase
		cambio_RealizadoONOFF = cambio_SolicitadoONOFF;//Marque la bandera de que se realizó el cambio
	end
	
	//Cuando se presiona el boton de arriba
	if(!cambio_FinalizadoUP) begin
		if(estado_actual == STOPPED) begin//Si se encuentra detenido
			case(Digito)//Segun el digito incremente el dato
				2'b00 : Numero_temp = Numero_temp +   1;
				2'b01 : Numero_temp = Numero_temp +  10;
				2'b10 : Numero_temp = Numero_temp +  60;
				2'b11 : Numero_temp = Numero_temp + 600;
			endcase
			if((Numero_temp > 5999) && (Numero_temp > 13'b1111111111111))
				Numero_temp = 5999;
		end
		cambio_RealizadoUP = cambio_SolicitadoUP;//Marque la bandera de que se realizó el cambio
	end
	
	//Cuando se presiona el boton de abajo
	if(!cambio_FinalizadoDOWN) begin
		if(estado_actual == STOPPED) begin//Si se encuentra detenido
			case(Digito)//Segun el digito incremente el dato
				2'b00 : Numero_temp = Numero_temp -   1;
				2'b01 : Numero_temp = Numero_temp -  10;
				2'b10 : Numero_temp = Numero_temp -  60;
				2'b11 : Numero_temp = Numero_temp - 600;
			endcase
			if(Numero_temp < 0)
				Numero_temp = 0;
		end
		cambio_RealizadoDOWN = cambio_SolicitadoDOWN;//Marque la bandera de que se realizó el cambio
	end
	
	//Cuando se presiona el boton de izquierda
	if(!cambio_FinalizadoLEFT) begin
		if (estado_actual == STOPPED)
			case(Digito)
				2'b00 : Digito = 1;
				2'b01 : Digito = 2;
				2'b10 : Digito = 3;
				2'b11 : Digito = 0;
			endcase
		cambio_RealizadoLEFT = cambio_SolicitadoLEFT;//Marque la bandera de que se realizó el cambio
	end
	
	//Cuando se presiona el boton de derecha
	if(!cambio_FinalizadoRIGHT) begin
		if (estado_actual == STOPPED)
			case(Digito)
				2'b00 : Digito = 3;
				2'b01 : Digito = 0;
				2'b10 : Digito = 1;
				2'b11 : Digito = 2;
			endcase
		cambio_RealizadoRIGHT = cambio_SolicitadoRIGHT;//Marque la bandera de que se realizó el cambio
	end
		
end
	


assign _time = Numero_temp; 

endmodule
