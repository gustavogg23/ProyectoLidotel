program Lidotel; // Gustavo Gutiérrez y Juan García

uses crt, sysutils;

const  // Constantes con los precios de las habitaciones
	FAMROOM = 200;
	SEN = 60;
	DOB = 120;
	SUT = 300;

type
	datosHuesped = record  // Tipo de registro para los datos de los adultos
		nombre: string[30];
		cedula: string[11];
		email: string[30];
		telefono: string[12];
		diasEstadia: integer;
		tipoHabitacion: string[15];
		precioNoche: real;
	end;
	
	datosNinyo = record  // Tipo de registro para los datos de niños
		nombre: string[30];
		edad: integer;
		tipoHabitacion: string[15];
		precioNoche: real;
	end;
	
var 
	huespedes: array of datosHuesped;  // Arreglos para almacenar datos de adultos y niños
	ninyos: array of datosNinyo;
	numAdultos, numNinyos, clienteActual: integer;
	precioTotal, noche: real;
	opcReservacion, habitacion, opcionEntrada, adultos, ninos, numDias, edadNinos: string;
	opcHabitacion, opcion, eleccion: char;
	s, a, g: text;  // Variables para los diferentes archivos de texto

procedure tipoReservacion; // Procedimiento que muestra los tipos de reservaciones que se pueden realizar
begin
	ClrScr;
	writeln('Por favor seleccione el tipo de reservacion que desea realizar');
	writeln;
	writeln('1. Reservacion Individual');
	writeln('2. Reservacion En Pareja');
	writeln('3. Reservacion en Grupo/Familia');
end;

procedure elegirHabitacion; // Procedimiento que muestra los tipos de habitaciones y su descripciones
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
			habitacion:= 'Family Room'; // Se asigan el tipo de habitación a la variable habitación
			noche:= FAMROOM;  // Se asigna el precio de la habitación por noche de la habitación seleccionada a la variable noche
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
	until (opcHabitacion = '1') or (opcHabitacion = '2') or (opcHabitacion = '3') or (opcHabitacion = '4'); // Se repite hasta que se elija una de las opciones permitidas
end;

procedure elegirHabitacionGrupo;  // En este procedimiento se muestran las habitaciones elegibles para las reservaciones en grupo/familia
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

function validarNombre(var nom: string): boolean; // Función para validar nombre
var
	contNom: integer;
begin
	validarNombre:= true; // Establece la variable booleana en verdadero
	for contNom:= 1 to length(nom) do // El bucle recorre cada letra de la entrada del usuario
	begin
		if not (nom[contNom] in ['A'..'Z', 'a'..'z', ' ']) then // Si alguno de los caracteres no es una letra o un espacio la varibale booleana se le asigna el valor falso
		begin
			writeln('Entrada Invalida');
			validarNombre:= false;
			readln();
			break;
		end;
	end;
end;

function validarCedula(var id: string): boolean;  // Función para validar cédula del usuario
var 
	contCedula: integer;
begin
	validarCedula:= true;
	for contCedula:= 1 to length(id) do
	begin
		if not (id[contCedula] in ['0'..'9', '.']) then // Si algún carácter no es un número o un punto se muestra mensaje de error y la vriabel se establece en false
		begin
			writeln('Entrada invalida');
			validarCedula:= false;
			readln();
			break;
		end;
	end;
end;

function validarCorreo(var correo: string): boolean;  // Función para validar correo del usuario
var
	contEmail: integer;
begin
	validarCorreo:= true;
	for contEmail:= 1 to length(correo) do
	begin
		if not (correo[contEmail] in ['A'..'Z', 'a'..'z', '0'..'9', '@', '.', '_']) then // Verifica cada carácter del correo y si alguno no es válido, se muestra mensaje de error
		begin
			writeln('Entrada Invalida');
			validarCorreo:= false;
			readln();
			break;
		end;
	end;
end;

function validarTelefono(var numTel: string): boolean;  // Función para validar número de teléfono del usuario
var
	contTel: integer;
begin
	validarTelefono:= true;
	for contTel:= 1 to length(numTel) do
	begin
		if not (numTel[contTel] in ['0'..'9', '-']) then  // Verifica que todos los carácteres de la entrada sean números o guión
		begin
			writeln('Entrada invalida');
			validarTelefono:= false;
			readln();
			break;
		end;
	end;
end;

function numeroValido(var num: integer; var ent: string): boolean;  // Función para validar alguna entrada numérica del usuario
var
	error: integer;
begin
	Val(ent, num, error);  // Intenta convertir la entrada del usuario en un número
	if (error <> 0) or (num <= 0) then // Si la entrada no es un número o es menor o igual a 0 se muestra mensaje de error
	begin
		writeln('Entrada Invalida');
		numeroValido:= false;
		readln();
	end
	else
	begin
		numeroValido:= true; // Si el número es válido la variable se establece en true
	end;
end;

procedure pedirDatos(var huesped: datosHuesped; esGrupo: boolean); // Procedimiento para pedir datos de un adulto
begin
	writeln;
	repeat  // Se repite el campo hasta que se ingrese una entrada válida
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

procedure pedirDatosNinyos(var ninio: datosNinyo); // Procedmiento para pedir los datos de un niño
begin
	writeln;
	repeat
		write('Nombre: ');
		readln(ninio.nombre);
	until validarNombre(ninio.nombre);
	repeat
		write('Edad: '); // Pide la edad del niño hasta que se ingrese una edad válida
		readln(edadNinos);
	until numeroValido(ninio.edad, edadNinos);
end;

procedure siNinyos;  // Procedimiento para verificar si hay niños en un grupo o familia
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
	until (opcionEntrada = 'S') or (opcionEntrada = 'N') or (opcionEntrada = 'SI') or (opcionEntrada = 'NO'); // Se repite hasta que la entrada sea válida
end;

procedure registrarHuesped(var archivo: text; esGrupo: boolean);  // Procedimiento dónde se registran los datos de los huéspedes 
var
	i: integer;
begin
	if eleccion = '1' then // Se establecen el número de niñoos y adultos de acuerdo al tipo de reservación elegida por el usuario
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
			write('Ingrese el numero de adultos en el grupo/familia: ');  // Se piden el número de adultos en caso de reservación en grupo/familia
			readln(adultos);
		until numeroValido(numAdultos, adultos);
		siNinyos;  // Pregunta al usuario si hay niños en el grupo
	end;
	SetLength(huespedes, numAdultos); // Establece el arreglo de datos de adulto de acuerdo al número ingresado por el usuario
	for i:= 0 to numAdultos - 1 do
	begin
		ClrScr;
		writeln('Ingrese los datos del adulto ', i + 1, ': ');  // Para cada adulto pide los datos 
		pedirDatos(huespedes[i], esGrupo);
	end;
	
	if esGrupo then  // Se muestran las opciones disponibles de tipo de habitación de acuerdo al tipo de reservación del usuario
		elegirHabitacionGrupo
	else
		elegirHabitacion;
	
	precioTotal:= 0; // Se inicializa el precio total a pagar 
	for i:= 0 to numAdultos - 1 do // Se escriben los datos de cada adulto en el archivo correspondiénte
	begin
		writeln(archivo, 'Nombre: ', huespedes[i].nombre);
		writeln(archivo, 'Cedula: ', huespedes[i].cedula);
		writeln(archivo, 'Email: ', huespedes[i].email);
		writeln(archivo, 'Telefono: ', huespedes[i].telefono);
		writeln(archivo, 'Dias de estadia: ', huespedes[i].diasEstadia);
		huespedes[i].tipoHabitacion:= habitacion; // Se asigna el tipo de habitación
		writeln(archivo, 'Tipo de Habitacion: ', huespedes[i].tipoHabitacion);
		huespedes[i].precioNoche:= noche; // Se asigna el precio por noche 
		writeln(archivo, 'Precio por noche: ', huespedes[i].precioNoche:0:2, '$');
		writeln(archivo);
	end;
	
	precioTotal:= noche * huespedes[0].diasEstadia; // Se calcula el precio total
	
	if (opcionEntrada = 'S') or (opcionEntrada = 'SI') then // En caso de que haya niños en el grupo 
	begin
		repeat
			ClrScr;
			write('Ingrese el numero de ninyos: '); // Se pide ingresar el número de niños en el grupo
			readln(ninos);
		until numeroValido(numNinyos, ninos);
		SetLength(ninyos, numNinyos);
		for i:= 0 to numNinyos - 1 do // Se piden los datos de cada niño
		begin
			ClrScr;
			writeln('Ingrese los datos del ninyo ', i + 1, ': ');
			pedirDatosNinyos(ninyos[i]);
			writeln(archivo, 'Nombre: ', ninyos[i].nombre);
			writeln(archivo, 'Edad: ', ninyos[i].edad, ' anyos');
			ninyos[i].tipoHabitacion:= habitacion;  // Se establece el mismo tipo de habitación
			writeln(archivo, 'Tipo de Habitacion: ', ninyos[i].tipoHabitacion);
			ninyos[i].precioNoche:= noche;
			writeln(archivo, 'Precio por noche: ', ninyos[i].precioNoche:0:2, '$');
			writeln(archivo);
		end;
	end;
	writeln(archivo, 'Total a pagar: ', precioTotal:0:2, '$'); // Se muestra en el archivo el total a pagar
	writeln(archivo);
end;

procedure mostrarRegistro(var arch: text); // Procedimiento para mostrar el resgistro guardado en un archivo
var
	linea: string; // variable para almacenar cada línea del archivo
begin
	while not eof(arch) do // MIentras no se llegue al final del archivo se lee cada línea y se imprime
	begin
		readln(arch, linea);
		writeln(linea);
	end;
end;

procedure mostrarCliente(var arch: text; indiceCliente: integer); // Procedimiento para mostrar un huésped específico
var
	nombre, cedula, email, telefono, diasEstadia, tipoHabitacion, precioNoche: string;
	i: integer;
begin
	reset(arch); // Se abre el archivo para lectura
	i:= 0;
	while not eof(arch) do
	begin
		readln(arch, nombre); // Se leen los datos del huésped en el archivo
		readln(arch, cedula);
		readln(arch, email);
		readln(arch, telefono);
		readln(arch, diasEstadia);
		readln(arch, tipoHabitacion);
		readln(arch, precioNoche);
		readln(arch);
		if (i = indiceCliente) then // Se imprimen los datos del cliente si el contador es igual al índice 
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
		i:= i + 1; // Aumenta el contador
	end;
	close(arch); // Cierra el archivo
end;

procedure mostrarClienteAnterior(var arch: text); // Procedimiento para mostrar el cliente anterior
begin
	if clienteActual > 0 then // Si el cliente actual no es el primero en el archivo
	begin
		clienteActual:= clienteActual - 1; // Decremente el índice de cleinte actual
		mostrarCliente(arch, clienteActual); // Muestra el cliente anterior
	end
	else
		writeln('No hay huesped anterior');
end;

procedure mostrarSiguienteCliente(var arch: text); // Procedimiento para mostrar cliente siguiente
begin
	clienteActual:= clienteActual + 1; // Incrementa el índice del clienta actual
	mostrarCliente(arch, clienteActual); // Muestra el cliente siguiente
end;

procedure buscarHuesped(var arch: text); // Procedimiento para buscar un huésped específico
var
	nombre, cedula, email, telefono, diasEstadia, tipoHabitacion, precioNoche: string;
	nombreHuesped: string;
	encontrado: boolean;
begin
	repeat
		write('Ingrese el nombre del huesped que desea buscar: '); // Se pide ingresar el nombre del huésped que se quier buscar
		readln(nombreHuesped);
	until validarNombre(nombreHuesped);
	reset(arch); // Se abre el archivo para lectura
	encontrado:= false;
	while not eof(arch) do // Se leen los datos del huésped mientras no se llegue al final del archivo
	begin
		readln(arch, nombre);
		readln(arch, cedula);
		readln(arch, email);
		readln(arch, telefono);
		readln(arch, diasEstadia);
		readln(arch, tipoHabitacion);
		readln(arch, precioNoche);
		readln(arch);
		if Pos(nombreHuesped, nombre) > 0 then // Si el nombre del huésped existe se imprimen sus datos
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
	if not encontrado then // En caso de que no exista el huésped se imprime un mensaje 
		writeln('Huesped no encontrado');
end;

procedure agregarHuesped(var arch: text; esGrupo: boolean); // Procedimiento para agregar un nuevo huésped
var
	huesped: datosHuesped;
begin
	append(arch); // Se abre el archivo para agregar datos
	ClrScr;
	writeln('Ingrese los datos del huesped:'); // Se piden los datos de acuerdo al tipo de reservación del archivo
	pedirDatos(huesped, esGrupo);
	if esGrupo then
		elegirHabitacionGrupo
	else
		elegirHabitacion;
	precioTotal:= 0;
	writeln(arch, 'Nombre: ', huesped.nombre); // Se escriben los datos del huésped en el archivo
	writeln(arch, 'Cedula: ', huesped.cedula);
	writeln(arch, 'Email: ', huesped.email);
	writeln(arch, 'Telefono: ', huesped.telefono);
	writeln(arch, 'Dias de estadia: ', huesped.diasEstadia);
	huesped.tipoHabitacion:= habitacion;
	writeln(arch, 'Tipo de Habitacion: ', huesped.tipoHabitacion);
	huesped.precioNoche:= noche;
	writeln(arch, 'Precio por noche: ', huesped.precioNoche:0:2, '$');
	precioTotal:= noche * huesped.diasEstadia;
	writeln(arch);
	writeln(arch, 'Total a pagar: ', precioTotal:0:2, '$');
	close(arch); // Se cierra el archivo
end;

procedure modificarHuesped(var arch: text; indiceCliente: integer; esGrupo: Boolean); // Procedimiento para modificar datos de un huésped
var
	huesped: datosHuesped; // Variable para almacenar los datos de un huésped
	i: integer;
	lineas: array of string; // Arreglo para las líneas del archivo
begin
	reset(arch); // Se abre el archivo para lectura
	i:= 0;
	while not eof(arch) do
	begin
		setLength(lineas, i + 1); // Se ajusta el tamaño del arreglo de acuerdo al número de líneas
		readln(arch, lineas[i]); // Se lee una línea del archivo y se incrementa el contador 
		i:= i + 1;
	end;
	close(arch); // Se cierra el archivo
	if (indiceCliente >= 0) and (indiceCliente < length(lineas)) then // Verifica que el índice del huésped es válido
	begin
		pedirDatos(huesped, esGrupo); // Pide los datos del huésped para ser modificados 
		if esGrupo then
			elegirHabitacionGrupo
		else
			elegirHabitacion;
		
		precioTotal:= 0;
		lineas[indiceCliente]:= 'Nombre: ' + huesped.nombre;
		lineas[indiceCliente + 1]:= 'Cedula: ' + huesped.cedula;
		lineas[indiceCliente + 2]:= 'Email: ' + huesped.email;
		lineas[indiceCliente + 3]:= 'Telefono: ' + huesped.telefono;
		lineas[indiceCliente + 4]:= 'Dias de estadia: ' + IntToStr(huesped.diasEstadia);
		huesped.tipoHabitacion:= habitacion;
		lineas[indiceCliente + 5]:= 'Tipo de Habitacion: ' + huesped.tipoHabitacion;
		huesped.precioNoche:= noche;
		lineas[indiceCliente + 6]:= 'Precio por noche: ' + FormatFloat('0.00', huesped.precioNoche);
		precioTotal:= noche * huesped.diasEstadia;
		lineas[indiceCliente + 7]:= 'Total a pagar: ' + FormatFloat('0.00', precioTotal);
		
		rewrite(arch); // Se abre el archivo para escribir
		for i:= 0 to length(lineas) - 1 do // Se recorre el arreglo de líneas del archivo
		begin
			writeln(arch, lineas[i]); // Se escriben las líneas en el archivo
		end;
		close(arch);
	end
	else
	begin
		writeln('Indice de cliente no valido.'); // Si el índice del cliente no es válido muestra un mensaje de error
	end;
end;

procedure seleccionarHuesped(var arch: text; esGrupo: boolean); // Procedimiento para elegir el huésped cuyos datos se quieren modificar
var
	nombreHuesped: string;
	linea: string;
	indiceCliente, i: integer;
	encontrado: boolean;
begin
	repeat
		write('Ingrese el nombre del cliente que desea modificar: '); // Se pide ingresar el nombre del huésped hasta que se ingrese una entrada válida
		readln(nombreHuesped);
	until validarNombre(nombreHuesped);
	reset(arch); // Se abre el archivo para lectura 
	i:= 0;
	encontrado:= false;
	while not eof(arch) do
	begin
		readln(arch, linea);
		if Pos(nombreHuesped, linea) > 0 then // Se lee la línea del arhivo y se verifica que está el nombre del huésped
		begin
			ClrScr;
			writeln('Cliente encontrado: ', linea); // Se imprime el nombre del cliente si se encuentra
			encontrado:= true;
			indiceCliente:= i;
			break;
		end;
		i:= i + 1;
	end;
	close(arch); // Se cierra el archivo
	if encontrado then // Si se encontró el huésped se modifican sus datos
	begin
		modificarHuesped(arch, indiceCliente, esGrupo);
		writeln('Los datos del cliente han sido modificados.');
	end
	else
	begin
		writeln('Cliente no encontrado.'); // En caso de que no se encuentre el huésped se muestra un mensaje indicándolo
	end;
end;

procedure menuOpcExtras(var archivo: text; esGrupo: boolean); // Procedimiento para mostrar al usuario las operaciones posibles luego de la reservación
var
	opc: char;
begin
	while True do 
	begin
		repeat
			ClrScr;
			writeln('Que operacion desea realizar:'); // Se imprimen las operacions posibles
			writeln('1. Mostrar huesped anterior');
			writeln('2. Mostrar huesped siguiente');
			writeln('3. Buscar huesped');
			writeln('4. Agregar huesped');
			writeln('5. Modificar datos de huesped');
			writeln('0. Volver al menu principal');
			readln(opc);
			case opc of
			'1': begin // Cada caso corresponde a una operación diferente
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
				writeln('Por favor presione enter...');
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
	while True do // El bucle se repite hasta que se decida salir del programa 
	begin
		repeat
			ClrScr;
			writeln('Bienvenido al Hotel Lidotel Boutique Margarita'); // Se imprimen las operaciones que se pueden realizar 
			writeln;
			writeln('Por favor ingrese la opcion que desee:');
			writeln('1. Nuevo Cliente');
			writeln('0. Salir');
			readln(opcion);
			case opcion of
			'1': begin
				repeat
					tipoReservacion; // Se pide el tipo de reservación que el usuario desea realizar 
					readln(eleccion);
					case eleccion of 
					'1': begin
						assign(s, 'ReservacionIndividual.txt'); // Se asigna el nombre del archivo al tipo de reservación que corresponda
						opcReservacion:= 'Individual';
						if FileExists('ReservacionIndividual.txt') then // Se verifica si ya existe el tipo de archivo según el tipo de reservación 
						begin
							writeln('Ya existe una reservacion de este tipo');
							writeln('Presione enter para ver el registro...');
							readln();
							ClrScr;
							reset(s); // Se abre el archivo para lectura 
							mostrarRegistro(s); // En caso de que el archivo ya exista, se muestra el registro 
							close(s); // Se cierra el archivo
							readln();
						end
						else
						begin
							rewrite(s); // En caso de que no exista el archivo, se abre para escritura
							registrarHuesped(s, false); // Se registran los datos de los huéspedes en el archivo correspondiente 
							close(s);
							Clrscr;
							writeln('Su reservacion se ha guardado');
							writeln('Presione enter para continuar...');
							readln();
							ClrScr;
							reset(s);
							mostrarRegistro(s); // Se muestra el registro en el archivo 
							close(s);
							readln();
						end;
						menuOpcExtras(s, false); // Se mustra el menú de operaciones extras
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
				until (eleccion = '1') or (eleccion = '2') or (eleccion = '3'); // Se repite hasta que se ingrese una opción válida
			end;
			'0': begin
				ClrScr;
				writeln('Gracias por reservar en el Hotel Lidotel'); // Imprime un mensaje de despedida 
				writeln('Por favor disfrute de su estadia');
				readln();
				exit;
			end
			else
			begin
				writeln('Opcion Invalida'); // En caso de que la opción ingresada sea inválida se muestra un mensaje de error 
				readln();
			end;
			end;
		until (opcion = '1') or (opcion = '0'); // Se repite hasta que se ingrese una opción válida
	end;
END.

