INSERT INTO mtn.Integrante
VALUES('243275454','Tchaikovsky Perez','Urb Los Mangos'),
	  ('568921454','Stravinsky Sanchez','Urb Los Naranjos'),
	  ('879554574','Anna Mozart','Urb Los Manzanos'),
	  ('243333454','Donald Chamberlin','Urb Las Guayabas'), 
	  ('243275455','Edgar Frank Codd', 'Sector los Melones'), 
	  ('243275584','Helena Tesla','Urb Las Fresas Frescas'), 
	  ('243587454','Vill Gates','Residencia las Sandias'),      	  
	  ('343275454','Emma Watson','Sector Cerezas Frescas'), 
	  ('563225454','Zoraya Montenegro','Urb Los Nisperos'),  
	  ('25475454','Mister Sayaman','Urb Agua de Coco'),
	  ('698275454','Krilin Feinaiquel','Residencias los Tomates Rojos'), 
	  ('221457545','Son Goku','Sector Platanos Maduros'), 
	  ('235478965','Jhonny Bravo','Urb Las Guanabanas'), 
	  ('227895465','Jackie Chan','Kiwi York'), 
	  ('343275459','Astronema Hernandez','Residencia Limon Verde'),
	  ('1','Maestro Yoda','Kiwi York'),
	  ('33325488','Bill Gates','Residencias los Tomates Rojos'),
	  ('87456214','Maestro Miyagi','Kiwi York'),
	  ('85858745','Gordom Ramsay','Urb Los Nisperos'),
	  ('25412568','Avril Lavigne','Urb Los Mangos');

INSERT INTO mtn.Es_un_Estudiante
VALUES('243275454','Tchaikovsky Perez',2),
	  ('568921454','Stravinsky Sanchez',2),
	  ('879554574','Anna Mozart',3),
	  ('243333454','Donald Chamberlin',1),
	  ('243275455','Edgar Frank Codd',2),
	  ('243275584','Helena Tesla',3),
	  ('243587454','Vill Gates',5),
	  ('343275454','Emma Watson',4),
	  ('563225454','Zoraya Montenegro',2),
	  ('25475454','Mister Sayaman',3),
	  ('698275454','Krilin Feinaiquel',1),
	  ('221457545','Son Goku',1),
	  ('235478965','Jhonny Bravo',3),
	  ('227895465','Jackie Chan',3),
	  ('343275459','Astronema Hernandez',4);

INSERT INTO mtn.Es_un_Profesor
VALUES('1','Maestro Yoda','Coach','Programacion','Decano'),
	  ('33325488','Bill Gates','Coach','Algoritmos','Profesor'),
	  ('87456214','Maestro Miyagi','Coach','Programacion','Profesor'),
	  ('85858745','Gordom Ramsay','Coach','Cocina','Profesor'),
	  ('25412568','Avril Lavigne','Coach','Programacion','Contratado');
	  /*Darth Vader, Steve Jobs, Bruce Lee,Kaiosama, Dr Strange*/

INSERT INTO mtn.Equipo
VALUES('Los Rompe Codigos','Universidad de Carabobo'),
	  ('La Faccion EseCuEle','Universidad de Carabobo'),
	  ('La Legion Vtelca','Universidad de Carabobo'),
	  ('El Escuadron Suicida','Universidad de Carabobo'),
	  ('El Cartel de la Noche','Universidad de Carabobo');
INSERT INTO mtn.Constituye
VALUES('243275454','Los Rompe Codigos'),
	  ('568921454','Los Rompe Codigos'),
	  ('879554574','Los Rompe Codigos'),
	  ('1','Los Rompe Codigos'),
	  ('243333454','La Faccion EseCuEle'),
	  ('243275455','La Faccion EseCuEle'),
	  ('243275584','La Faccion EseCuEle'),
	  ('33325488','La Faccion EseCuEle'),
	  ('243587454','La Legion Vtelca'),
	  ('343275454','La Legion Vtelca'),
	  ('563225454','La Legion Vtelca'),
	  ('87456214','La Legion Vtelca'),
	  ('25475454','El Escuadron Suicida'),
	  ('698275454','El Escuadron Suicida'),
	  ('221457545','El Escuadron Suicida'),
	  ('85858745','El Escuadron Suicida'),
	  ('235478965','El Cartel de la Noche'),
	  ('227895465','El Cartel de la Noche'),
	  ('343275459','El Cartel de la Noche'),
	  ('25412568','El Cartel de la Noche');
INSERT INTO mtn.Actividad
VALUES('Taller de C','El lado oscuro','08-04-2017'),
	  ('Taller de C++','Central Apple','06-05-2017'),
	  ('Taller Cool','China','05-06-2017'),
	  ('Taller Saijan','Japon','09-09-2017'),
	  ('Taller Python','Ragnarok','02-07-2017');
INSERT INTO mtn.Viaja
VALUES('243275454','Taller de C','08-04-2017','5'),
	  ('568921454','Taller de C','08-04-2017','5'),
	  ('879554574','Taller de C','08-04-2017','5'),
	  ('243333454','Taller de C++','06-05-2017','3'),
	  ('243275455','Taller de C++','06-05-2017','3'),
	  ('243587454','Taller Cool','05-06-2017','6'),
	  ('343275454','Taller Cool','05-06-2017','6'),
	  ('563225454','Taller Cool','05-06-2017','6'),
	  ('25475454','Taller Saijan','09-09-2017','12'),
	  ('221457545','Taller Saijan','09-09-2017','12'),
	  ('227895465','Taller Python','02-07-2017','10'),
	  ('343275459','Taller Python','02-07-2017','10');
INSERT INTO mtn.Competencia
VALUES('04-09-2017','El Maraton Legendario','Mundial','Canada'),
	  ('05-06-2017','Programaton Pepon','Regional','Carabobo'),
	  ('04-09-2017','Coders Tournament 7','Nacional','Venezuela'),
	  ('01-01-2018','Trote de Programacion','Local','Universidad de Carabobo');
INSERT INTO mtn.Participa
VALUES('Los Rompe Codigos','El Maraton Legendario','04-09-2017','Beca + 1 Autografo de Yoda','Toronto','1','Alto'),
	  ('La Faccion EseCuEle','El Maraton Legendario','04-09-2017','Beca + Life Coaching','Toronto','2','Alto'),
	  ('La Legion Vtelca','El Maraton Legendario','04-09-2017','Beca + Empanadas de Queso','Toronto','3','Medio'),
	  ('La Faccion EseCuEle','Programaton Pepon','05-06-2017','Beca + Desayuno con jugo','Carabobo','4','Bajo'),
	  ('La Legion Vtelca','Programaton Pepon','05-06-2017','Autografo de Yoda','Carabobo','2','Medio'),
	  ('Los Rompe Codigos','Programaton Pepon','05-06-2017','Una VIT nueva generación','Carabobo','1','Alto'),
	  ('El Escuadron Suicida','Programaton Pepon','05-06-2017','Clases de Superación Personal','Carabobo','3','Medio'),
	  ('Los Rompe Codigos','Coders Tournament 7','04-09-2017','Salario Minimo ','Tucupita','2','Medio'),
	  ('La Faccion EseCuEle','Coders Tournament 7','04-09-2017','Parrilla + Beca','Tucupita','1','Alto'),
	  ('La Legion Vtelca','Coders Tournament 7','04-09-2017','Clases de Java + Beca','Tucupita','3','Medio'),
	  ('El Cartel de la Noche','Coders Tournament 7','04-09-2017','Boletos para el Programaton','Tucupita','4','Bajo'),
	  ('El Escuadron Suicida','Coders Tournament 7','04-09-2017','Clases de Superación Personal','Tucupita','5','Bajo'),
	  ('El Escuadron Suicida','Trote de Programacion','01-01-2018','Clases de Superacion Personal','Mañonguito','5','Bajo'),
	  ('Los Rompe Codigos','Trote de Programacion','01-01-2018','Empanadas de Queso con Salsa','Mañonguito','2','Medio'),
	  ('La Faccion EseCuEle','Trote de Programacion','01-01-2018','Beca + Bono Alimenticio','Mañonguito','1','Alto'),
	  ('La Legion Vtelca','Trote de Programacion','01-01-2018','Pago de Transporte','Mañonguito','3','Medio'),
	  ('El Cartel de la Noche','Trote de Programacion','01-01-2018','Beca + Bono Alimenticio','Mañonguito','4','Bajo');


