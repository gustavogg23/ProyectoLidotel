program Lidotel; // Gustavo Gutiérrez y Juan García

uses crt;

type
	datosHuesped = record
		nombre: string[30];
		cedula: string[11];
		email: string[30];
		telefono: string[12];
		diasEstadia: integer;
		tipoHabitacion: string[15]
	end;
	
var 
	huespedes: array of datosHuesped;
	i, j, numPersonas: integer;
	opcHabitacion, opcion: char;
	i, a, g: text;
	

BEGIN
	while True do
	begin
		repeat
			writeln('Bienvenido al Hotel Lidotel Boutique Margarita');
			writeln;
			writeln('Por favor selecciona la opcion que desee');
			writeln('1. Nuevo Cliente');
			writeln('0. Salir');
			readln(opcion);
			case opcion of
			'1': begin
			end;
			'0': begin
				writeln('Gracias por reservar en el Hotel Lidotel');
				writeln('Por favo disfrute de su estadia');
				readln();
				exit;
			end
			else
			begin
				writeln('Opcion Invalida');
				readln();
			end;
			end;
		until (opcion = '1') or (opcion = '0');
	end;
END.

