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
	opcReservacion: string;
	opcHabitacion, opcion, eleccion: char;
	s, a, g: text;

procedure tipoReservacion;
begin
	ClrScr;
	writeln('Por favor seleccione el tipo de reservacion que desea realizar');
	writeln;
	writeln('1. Reservacion Individual');
	writeln('2. Reservacion En Pareja');
	writeln('3. Reservacion en Grupo/Familia');
end;

BEGIN
	while True do
	begin
		repeat
			ClrScr;
			writeln('Bienvenido al Hotel Lidotel Boutique Margarita');
			writeln;
			writeln('Por favor ingrese la opcion que desee');
			writeln('1. Nuevo Cliente');
			writeln('0. Salir');
			readln(opcion);
			case opcion of
			'1': begin
				repeat
					tipoReservacion;
					readln(eleccion);
					case eleccion of 
					'1': begin
						opcReservacion:= 'Individual';
					end;
					'2': begin
						opcReservacion:= 'En Pareja';
					end;
					'3': begin
						opcReservacion:= 'Grupo/Familia';
					end
					else
					begin
						writeln('Opcion Invalida');
						readln();
					end;
					end;
				until (eleccion = '1') or (eleccion = '2') or (eleccion = '3');
			end;
			'0': begin
				ClrScr;
				writeln('Gracias por reservar en el Hotel Lidotel');
				writeln('Por favor disfrute de su estadia');
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

