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

procedure pedirDatos(var huesped: datosHuesped);
begin
	writeln('Por favor ingrese los siguientes datos:');
	writeln;
	write('Nombre: ');
	readln(huesped.nombre);
	write('Cedula: ');
	readln(huesped.cedula);
	write('Email: ');
	readln(huesped.email);
	write('Telefono: ');
	readln(huesped.telefono);
	write('Dias de estadia: ');
	readln(huesped.diasEstadia);
	write('Tipo de habitacion: ');
	readln(huesped.tipoHabitacion);
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
						assign(s, 'ReservacionIndividual.txt');
						opcReservacion:= 'Individual';
						if FileExists('ReservacionIndividual.txt') then
						begin
							append(s);
						end
						else
						begin
							rewrite(s);
						end;
					end;
					'2': begin
						assign(a, 'ReservacionPareja.txt');
						opcReservacion:= 'En Pareja';
						if FileExists('ReservacionPareja.txt') then
						begin
							append(a);
						end
						else
						begin
							rewrite(a);
						end;
					end;
					'3': begin
						assign(g, 'ReservacionGrupo/Familia.txt');
						opcReservacion:= 'Grupo/Familia';
						if FileExists('ReservacionGrupo/Familia.txt') then
						begin
							append(g);
						end
						else
						begin
							rewrite(g);
						end;
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

