program Lidotel; // Gustavo Gutiérrez y Juan García

uses crt, sysutils;

const
	FAMROOM = 200;
	SEN = 60;
	DOB = 120;
	SUT = 300;

type
	datosHuesped = record
		nombre: string[30];
		cedula: string[11];
		email: string[30];
		telefono: string[12];
		diasEstadia: integer;
		tipoHabitacion: string[15];
		precioNoche: real;
	end;
	
	datosNinyo = record
		nombre: string[30];
		edad: integer;
		tipoHabitacion: string[15];
		precioNoche: real;
	end;
	
var 
	huespedes: array of datosHuesped;
	ninyos: array of datosNinyo;
	i, j, numAdultos, numNinyos: integer;
	precioTotal, noche: real;
	opcReservacion, habitacion, opcionEntrada, adultos, ninos, numDias, edadNinos: string;
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

procedure elegirHabitacion;
begin
	repeat
		ClrScr;
		writeln('Elija la habitacion que desea reservar:');
		writeln('1. FAMILY ROOM - 200$ por noche');
		writeln('Calida y confortable habitacion decorada con un estilo vanguardista, 100% libre de humo, ');
		writeln('cama Lidotel Royal King, con reloj despertador, TV 32'' HD Plasma con cable, ');
		writeln('banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y ');
		writeln('secador de cabello, armario adicional amplio, una habitacion separada con 2 camas full, banyo con ducha.');
		writeln('-Incluye: Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), ');
		writeln('Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y ');
		writeln('toldos en la playa, kit de vanidades y ninyos de 0 a 2 anyos sin recargos.');
		writeln;
		writeln('2. SENCILLA - 60$ por noche');
		writeln('Amplia y confortable habitacion decorada con un estilo vanguardista, cama Lidotel ');
		writeln('Royal King con sabanas de algodon egipcio, soporte para iPod con reloj despertador, ');
		writeln('TV 32'' HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja ');
		writeln('electronica de seguridad y secador de cabello.');
		writeln('-Incluye: Desayuno Buffet en Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), ');
		writeln('acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, ');
		writeln('acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 anyos sin recargos.');
		writeln;
		writeln('3. DOBLE - 120$ por noche');
		writeln('Amplia y confortable habitacion decorada con un estilo vanguardista, Dos Camas ');
		writeln('Lidotel Full con sabanas de algodon egipcio, soporte para iPod con reloj despertador, ');
		writeln('TV 32'' HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja ');
		writeln('electronica de seguridad secador de cabello.');
		writeln('-Incluye: Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), ');
		writeln('acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, ');
		writeln('acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 anyos sin recargos.');
		writeln;
		writeln('4. SUITE - 300$ por noche');
		writeln('Calida y confortable habitacióon decorada con un estilo vanguardista, 100% libre de ');
		writeln('humo, Cama Lidotel Royal King, con reloj despertador, TV 32'' HD Plasma con cable, 2 ');
		writeln('banyos con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y ');
		writeln('secador de cabello, armario adicional amplio y area separada con 2 sofa-cama individuales.');
		writeln('-Incluye: Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), ');
		writeln('Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y ');
		writeln('toldos en la playa, kit de vanidades y ninyos de 0 a 2 anyos sin recargos.');
		readln(opcHabitacion);
		case opcHabitacion of 
		'1': begin
			habitacion:= 'Family Room';
			noche:= FAMROOM;
		end;
		'2': begin
			habitacion:= 'Sencilla';
			noche:= SEN;
		end;
		'3': begin
			habitacion:= 'Doble';
			noche:= SEN;
		end;
		'4': begin
			habitacion:= 'Suite';
			noche:= SUT;
		end
		else
		begin
			writeln('Opcion invalida');
			readln();
		end;
		end;
	until (opcHabitacion = '1') or (opcHabitacion = '2') or (opcHabitacion = '3') or (opcHabitacion = '4');
end;

procedure elegirHabitacionGrupo;
begin
	repeat
		ClrScr;
		writeln('Elija la habitacion que desea reservar:');
		writeln('1. FAMILY ROOM - 200$ por noche');
		writeln('Calida y confortable habitacion decorada con un estilo vanguardista, 100% libre de humo, ');
		writeln('cama Lidotel Royal King, con reloj despertador, TV 32'' HD Plasma con cable, ');
		writeln('banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y ');
		writeln('secador de cabello, armario adicional amplio, una habitacion separada con 2 camas full, banyo con ducha.');
		writeln('-Incluye: Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), ');
		writeln('Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y ');
		writeln('toldos en la playa, kit de vanidades y ninyos de 0 a 2 anyos sin recargos.');
		writeln;
		writeln('2. DOBLE - 120$ por noche');
		writeln('Amplia y confortable habitacion decorada con un estilo vanguardista, Dos Camas ');
		writeln('Lidotel Full con sabanas de algodon egipcio, soporte para iPod con reloj despertador, ');
		writeln('TV 32'' HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja ');
		writeln('electronica de seguridad secador de cabello.');
		writeln('-Incluye: Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), ');
		writeln('acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, ');
		writeln('acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 anyos sin recargos.');
		writeln;
		writeln('3. SUITE - 300$ por noche');
		writeln('Calida y confortable habitacióon decorada con un estilo vanguardista, 100% libre de ');
		writeln('humo, Cama Lidotel Royal King, con reloj despertador, TV 32'' HD Plasma con cable, 2 ');
		writeln('banyos con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y ');
		writeln('secador de cabello, armario adicional amplio y area separada con 2 sofa-cama individuales.');
		writeln('-Incluye: Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), ');
		writeln('Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y ');
		writeln('toldos en la playa, kit de vanidades y ninyos de 0 a 2 anyos sin recargos.');
		readln(opcHabitacion);
		case opcHabitacion of 
		'1': begin
			habitacion:= 'Family Room';
			noche:= FAMROOM;
		end;
		'2': begin
			habitacion:= 'Doble';
			noche:= DOB;
		end;
		'3': begin
			habitacion:= 'Suite';
			noche:= SUT;
		end
		else
		begin
			writeln('Opcion invalida');
			readln();
		end;
		end;
	until (opcHabitacion = '1') or (opcHabitacion = '2') or (opcHabitacion = '3');
end;

function validarNombre(var nom: string): boolean;
var
	contNom: integer;
begin
	validarNombre:= true;
	for contNom:= 1 to length(nom) do
	begin
		if not (nom[contNom] in ['A'..'Z', 'a'..'z', ' ']) then
		begin
			writeln('Entrada Invalida');
			validarNombre:= false;
			readln();
			break;
		end;
	end;
end;

function validarCedula(var id: string): boolean;
var 
	contCedula: integer;
begin
	validarCedula:= true;
	for contCedula:= 1 to length(id) do
	begin
		if not (id[contCedula] in ['0'..'9', '.']) then
		begin
			writeln('Entrada invalida');
			validarCedula:= false;
			readln();
			break;
		end;
	end;
end;

function validarCorreo(var correo: string): boolean;
var
	contEmail: integer;
begin
	validarCorreo:= true;
	for contEmail:= 1 to length(correo) do
	begin
		if not (correo[contEmail] in ['A'..'Z', 'a'..'z', '0'..'9', '@', '.', '_']) then
		begin
			writeln('Entrada Invalida');
			validarCorreo:= false;
			readln();
			break;
		end;
	end;
end;

function validarTelefono(var numTel: string): boolean;
var
	contTel: integer;
begin
	validarTelefono:= true;
	for contTel:= 1 to length(numTel) do
	begin
		if not (numTel[contTel] in ['0'..'9', '-']) then
		begin
			writeln('Entrada invalida');
			validarTelefono:= false;
			readln();
			break;
		end;
	end;
end;

function numeroValido(var num: integer; var ent: string): boolean;
var
	error: integer;
begin
	Val(ent, num, error);
	if (error <> 0) or (num < 0) then
	begin
		writeln('Entrada Invalida');
		numeroValido:= false;
		readln();
	end
	else
	begin
		numeroValido:= true;
	end;
end;

procedure pedirDatos(var huesped: datosHuesped; esGrupo: boolean);
begin
	writeln;
	repeat
		write('Nombre: ');
		readln(huesped.nombre);
	until validarNombre(huesped.nombre);
	repeat
		write('Cedula: ');
		readln(huesped.cedula);
	until validarCedula(huesped.cedula);
	repeat
		write('Email: ');
		readln(huesped.email);
	until validarCorreo(huesped.email);
	repeat
		write('Telefono: ');
		readln(huesped.telefono);
	until validarTelefono(huesped.telefono);
	repeat
		write('Dias de estadia: ');
		readln(numDias);
	until numeroValido(huesped.diasEstadia, numDias);
	write('Tipo de habitacion: ');
end; 

procedure pedirDatosNinyos(var ninio: datosNinyo);
begin
	writeln;
	repeat
		write('Nombre: ');
		readln(ninio.nombre);
	until validarNombre(ninio.nombre);
	repeat
		write('Edad: ');
		readln(edadNinos);
	until numeroValido(ninio.edad, edadNinos);
end;

procedure siNinyos;
var
	i: integer;
begin
	repeat
		writeln('Hay ninyos en su grupo/familia? (s/n)');
		readln(opcionEntrada);
		for i:= 1 to length(opcionEntrada) do
		begin
			opcionEntrada[i]:= UpCase(opcionEntrada[i]); // Convierte la entrada en mayúsculas
		end;
		if (opcionEntrada <> 'S') and (opcionEntrada <> 'N') and (opcionEntrada <> 'SI') and (opcionEntrada <> 'NO') then // Se verifica si la entrada es válida
		begin
			writeln('Opcion invalida.');
			readln();
			Clrscr;
		end;
	until (opcionEntrada = 'S') or (opcionEntrada = 'N') or (opcionEntrada = 'SI') or (opcionEntrada = 'NO');
end;

procedure registrarHuesped(var archivo: text; esGrupo: boolean);
var
	i: integer;
begin
	if eleccion = '1' then
	begin
		numAdultos:= 1;
		numNinyos:= 0;
	end
	else if eleccion = '2' then
	begin
		numAdultos:= 2;
		numNinyos:= 0;
	end
	else
	begin
		repeat
			ClrScr;
			write('Ingrese el numero de adultos en el grupo/familia: ');
			readln(adultos);
		until numeroValido(numAdultos, adultos);
		siNinyos;
	end;
	SetLength(huespedes, numAdultos);
	for i:= 0 to numAdultos - 1 do
	begin
		ClrScr;
		writeln('Ingrese los datos del adulto ', i + 1, ': ');
		pedirDatos(huespedes[i], esGrupo);
	end;
	
	if esGrupo then
		elegirHabitacionGrupo
	else
		elegirHabitacion;
	
	precioTotal:= 0;
	for i:= 0 to numAdultos - 1 do
	begin
		writeln(archivo, 'Nombre: ', huespedes[i].nombre);
		writeln(archivo, 'Cedula: ', huespedes[i].cedula);
		writeln(archivo, 'Email: ', huespedes[i].email);
		writeln(archivo, 'Telefono: ', huespedes[i].telefono);
		writeln(archivo, 'Dias de estadia: ', huespedes[i].diasEstadia);
		huespedes[i].tipoHabitacion:= habitacion;
		writeln(archivo, 'Tipo de Habitacion: ', huespedes[i].tipoHabitacion);
		huespedes[i].precioNoche:= noche;
		writeln(archivo, 'Precio por noche: ', huespedes[i].precioNoche:0:2, '$');
		writeln(archivo);
	end;
	
	precioTotal:= noche * huespedes[0].diasEstadia;
	
	if (opcionEntrada = 'S') or (opcionEntrada = 'SI') then
	begin
		repeat
			ClrScr;
			write('Ingrese el numero de ninyos: ');
			readln(ninos);
		until numeroValido(numNinyos, ninos);
		SetLength(ninyos, numNinyos);
		for i:= 0 to numNinyos - 1 do
		begin
			ClrScr;
			writeln('Ingrese los datos del ninyo ', i + 1, ': ');
			pedirDatosNinyos(ninyos[i]);
			writeln(archivo, 'Nombre: ', ninyos[i].nombre);
			writeln(archivo, 'Edad: ', ninyos[i].edad, ' anyos');
			ninyos[i].tipoHabitacion:= habitacion;
			writeln(archivo, 'Tipo de Habitacion: ', ninyos[i].tipoHabitacion);
			ninyos[i].precioNoche:= noche;
			writeln(archivo, 'Precio por noche: ', ninyos[i].precioNoche:0:2, '$');
			writeln(archivo);
		end;
	end;
	writeln(archivo, 'Total a pagar: ', precioTotal:0:2, '$');
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
							close(s);
						end
						else
						begin
							rewrite(s);
							registrarHuesped(s, false);
							close(s);
						end;
					end;
					'2': begin
						assign(a, 'ReservacionPareja.txt');
						opcReservacion:= 'En Pareja';
						if FileExists('ReservacionPareja.txt') then
						begin
							append(a);
							close(a);
						end
						else
						begin
							rewrite(a);
							registrarHuesped(a, false);
							close(a);
						end;
					end;
					'3': begin
						assign(g, 'ReservacionGrupo_Familia.txt');
						opcReservacion:= 'Grupo/Familia';
						if FileExists('ReservacionGrupo_Familia.txt') then
						begin
							append(g);
							close(g);
						end
						else
						begin
							rewrite(g);
							registrarHuesped(g, true);
							close(g);
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

