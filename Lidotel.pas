program Lidotel; // Gustavo Gutiérrez y Juan García

uses crt, sysutils;

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
	s, a, g: text;

function tipoReservacion: string;
var
	opc: char;
begin
	repeat
		writeln('Por favor seleccione el tipo de reservacion que desea realizar');
		writeln;
		writeln('1. Reservacion Individual');
		writeln('2. Reservacion En Pareja');
		writeln('3. Reservacion en Grupo/Familia');
		readln(opc);
		case opc of 
		'1': begin
			tipoReservacion:= 'Individual';
		end;
		'2': begin
			tipoReservacion:= 'En Pareja';
		end;
		'3': begin
			tipoReservacion:= 'Grupo/Familia';
		end
		else
		begin
			writeln('Opcion Invalida');
		end;
		end;
	until (opc = '1') or (opc = '2') or (opc = '3');
end;

BEGIN
	while True do
	begin
		repeat
			writeln('Bienvenido al Hotel Lidotel Boutique Margarita');
			writeln;
			writeln('Por favor ingrese la opcion que desee');
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

