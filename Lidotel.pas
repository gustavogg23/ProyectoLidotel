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
	i, j, numAdultos, numNinyos, clienteActual: integer;
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
	writeln(archivo);
end;

procedure mostrarRegistro(var arch: text);
var
	linea: string;
begin
	while not eof(arch) do
	begin
		readln(arch, linea);
		writeln(linea);
	end;
end;

procedure mostrarCliente(var arch: text; indiceCliente: integer);
var
	nombre, cedula, email, telefono, diasEstadia, tipoHabitacion, precioNoche: string;
	i: integer;
begin
	reset(arch);
	i:= 0;
	while not eof(arch) do
	begin
		readln(arch, nombre);
		readln(arch, cedula);
		readln(arch, email);
		readln(arch, telefono);
		readln(arch, diasEstadia);
		readln(arch, tipoHabitacion);
		readln(arch, precioNoche);
		if (i = indiceCliente) then
		begin
			writeln(nombre);
			writeln(cedula);
			writeln(email);
			writeln(telefono);
			writeln(diasEstadia);
			writeln(tipoHabitacion);
			writeln(precioNoche);
			break;
		end;
		i:= i + 1;
	end;
	close(arch);
end;

procedure mostrarClienteAnterior(var arch: text);
begin
	if clienteActual > 0 then
	begin
		clienteActual:= clienteActual - 1;
		mostrarCliente(arch, clienteActual);
	end
	else
		writeln('No hay huesped anterior');
end;

procedure mostrarSiguienteCliente(var arch: text);
begin
	clienteActual:= clienteActual + 1;
	mostrarCliente(arch, clienteActual);
end;

procedure buscarHuesped(var arch: text);
var
	nombre, cedula, email, telefono, diasEstadia, tipoHabitacion, precioNoche: string;
	nombreHuesped: string;
	encontrado: boolean;
begin
	repeat
		write('Ingrese el nombre del huesped que desea buscar: ');
		readln(nombreHuesped);
	until validarNombre(nombreHuesped);
	reset(arch);
	encontrado:= false;
	while not eof(arch) do
	begin
		readln(arch, nombre);
		readln(arch, cedula);
		readln(arch, email);
		readln(arch, telefono);
		readln(arch, diasEstadia);
		readln(arch, tipoHabitacion);
		readln(arch, precioNoche);
		if Pos(nombreHuesped, nombre) > 0 then
		begin
			ClrScr;
			writeln(nombre);
			writeln(cedula);
			writeln(email);
			writeln(telefono);
			writeln(diasEstadia);
			writeln(tipoHabitacion);
			writeln(precioNoche);
			encontrado:= true;
		end;
	end;
	close(arch);
	if not encontrado then
		writeln('Huesped no encontrado');
end;

procedure agregarHuesped(var arch: text; esGrupo: boolean);
var
	huesped: datosHuesped;
begin
	append(arch);
	ClrScr;
	writeln('Ingrese los datos del huesped:');
	pedirDatos(huesped, esGrupo);
	if esGrupo then
		elegirHabitacionGrupo
	else
		elegirHabitacion;
	writeln(arch, 'Nombre: ', huesped.nombre);
	writeln(arch, 'Cedula: ', huesped.cedula);
	writeln(arch, 'Email: ', huesped.email);
	writeln(arch, 'Telefono: ', huesped.telefono);
	writeln(arch, 'Dias de estadia: ', huesped.diasEstadia);
	huesped.tipoHabitacion:= habitacion;
	writeln(arch, 'Tipo de Habitacion: ', huesped.tipoHabitacion);
	huesped.precioNoche:= noche;
	writeln(arch, 'Precio por noche: ', huesped.precioNoche:0:2, '$');
	writeln(arch);
	close(arch);
end;

procedure modificarHuesped(var arch: text; indiceCliente: integer; esGrupo: Boolean);
var
	huesped: datosHuesped;
	i: integer;
	lineas: array of string;
	linea: string;
begin
	reset(arch);
	i := 0;
	while not eof(arch) do
	begin
		setLength(lineas, i + 1);
		readln(arch, lineas[i]);
		i := i + 1;
	end;
	close(arch);
	if (indiceCliente >= 0) and (indiceCliente < length(lineas)) then
	begin
		pedirDatos(huesped, esGrupo);
		linea := 'Nombre: ' + huesped.nombre + ', Cedula: ' + huesped.cedula + ', Email: ' + huesped.email + ', Telefono: ' + huesped.telefono + ', Dias de estadia: ' + IntToStr(huesped.diasEstadia);
		lineas[indiceCliente] := linea;
		rewrite(arch);
		for i := 0 to length(lineas) - 1 do
		begin
			writeln(arch, lineas[i]);
		end;
		close(arch);
	end
	else
	begin
		writeln('Indice de cliente no valido.');
	end;
end;

procedure seleccionarHuesped(var arch: text; esGrupo: boolean);
var
	nombreHuesped: string;
	linea: string;
	indiceCliente, i: integer;
	encontrado: boolean;
begin
	repeat
		write('Ingrese el nombre del cliente que desea modificar: ');
		readln(nombreHuesped);
	until validarNombre(nombreHuesped);
	reset(arch);
	i := 0;
	encontrado := false;
	while not eof(arch) do
	begin
		readln(arch, linea);
		if Pos(nombreHuesped, linea) > 0 then
		begin
			writeln('Cliente encontrado: ', linea);
			encontrado := true;
			indiceCliente := i;
			break;
		end;
		i := i + 1;
	end;
	close(arch);
	if encontrado then
	begin
		modificarHuesped(arch, indiceCliente, esGrupo);
		writeln('Los datos del cliente han sido modificados.');
	end
	else
	begin
		writeln('Cliente no encontrado.');
	end;
end;

procedure menuOpcExtras(var archivo: text; esGrupo: boolean);
var
	opc: char;
begin
	while True do
	begin
		repeat
			ClrScr;
			writeln('Que operacion desea realizar:');
			writeln('1. Mostrar huesped anterior');
			writeln('2. Mostrar huesped siguiente');
			writeln('3. Buscar huesped');
			writeln('4. Agregar huesped');
			writeln('5. Modificar datos de huesped');
			writeln('0. Volver al menu principal');
			readln(opc);
			case opc of
			'1': begin
				ClrScr;
				mostrarClienteAnterior(archivo);
				readln();
			end;
			'2': begin
				ClrScr;
				mostrarSiguienteCliente(archivo);
				readln();
			end;
			'3': begin
				ClrScr;
				buscarHuesped(archivo);
				readln();
			end;
			'4': begin
				ClrScr;
				agregarHuesped(archivo, esGrupo);
				readln();
			end;
			'5': begin
				ClrScr;
				seleccionarHuesped(archivo, esGrupo);
				readln();
			end;
			'0': begin
				ClrScr;
				writeln('Volviendo al menu principal');
				writeln('Por favor presione enter');
				readln();
				exit;
			end
			else
			begin
				writeln('Opcion Invalida');
				readln();
			end;
			end;
		until (opc = '1') or (opc = '2') or (opc = '3') or (opc = '4') or (opc = '5') or (opc = '0');
	end;
end;

BEGIN
	while True do
	begin
		repeat
			ClrScr;
			writeln('Bienvenido al Hotel Lidotel Boutique Margarita');
			writeln;
			writeln('Por favor ingrese la opcion que desee:');
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
							writeln('Ya existe una reservacion de este tipo');
							writeln('Presione enter para ver el registro...');
							readln();
							ClrScr;
							reset(s);
							mostrarRegistro(s);
							close(s);
							readln();
						end
						else
						begin
							rewrite(s);
							registrarHuesped(s, false);
							close(s);
							Clrscr;
							writeln('Su reservacion se ha guardado');
							writeln('Presione enter para continuar...');
							readln();
							ClrScr;
							reset(s);
							mostrarRegistro(s);
							close(s);
							readln();
						end;
						menuOpcExtras(s, false);
					end;
					'2': begin
						assign(a, 'ReservacionPareja.txt');
						opcReservacion:= 'En Pareja';
						if FileExists('ReservacionPareja.txt') then
						begin
							writeln('Ya existe una reservacion de este tipo');
							writeln('Presione enter para ver el registro...');
							readln();
							ClrScr;
							reset(a);
							mostrarRegistro(a);
							close(a);
							readln();
						end
						else
						begin
							rewrite(a);
							registrarHuesped(a, false);
							close(a);
							ClrScr;
							writeln('Su reservacion se ha guardado');
							writeln('Presione enter para continuar...');
							readln();
							ClrScr;
							reset(a);
							mostrarRegistro(a);
							close(a);
							readln();
						end;
						menuOpcExtras(a, false);
					end;
					'3': begin
						assign(g, 'ReservacionGrupo_Familia.txt');
						opcReservacion:= 'Grupo/Familia';
						if FileExists('ReservacionGrupo_Familia.txt') then
						begin
							writeln('Ya existe una reservacion de este tipo');
							writeln('Presione enter para ver el registro...');
							readln();
							ClrScr;
							reset(g);
							mostrarRegistro(g);
							close(g);
							readln();
						end
						else
						begin
							rewrite(g);
							registrarHuesped(g, true);
							close(g);
							ClrScr;
							writeln('Su reservacion se ha guardado');
							writeln('Presione enter para continuar...');
							readln();
							ClrScr;
							reset(g);
							mostrarRegistro(g);
							close(g);
							readln();
						end;
						menuOpcExtras(g, true);
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

