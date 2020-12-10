-- Fabricantes
INSERT INTO fabricante(id,nombre) VALUES (1,'Toyota');
INSERT INTO fabricante(id,nombre) VALUES (2,'BG Engineering Group, LLC');
INSERT INTO fabricante(id,nombre) VALUES (3,'Rebellion');
INSERT INTO fabricante(id,nombre) VALUES (4,'Alpine');
INSERT INTO fabricante(id,nombre) VALUES (5,'Oreca');
INSERT INTO fabricante(id,nombre) VALUES (6,'Ligier');
INSERT INTO fabricante(id,nombre) VALUES (7,'Aurus');
INSERT INTO fabricante(id,nombre) VALUES (8,'Dallara');
INSERT INTO fabricante(id,nombre) VALUES (9,'Ferrari');
INSERT INTO fabricante(id,nombre) VALUES (10,'Porsche');
INSERT INTO fabricante(id,nombre) VALUES (11,'Ford');
INSERT INTO fabricante(id,nombre) VALUES (12,'Chevrolet');
INSERT INTO fabricante(id,nombre) VALUES (13,'BMW');
INSERT INTO fabricante(id,nombre) VALUES (14,'Aston Martin');
INSERT INTO fabricante(id,nombre) VALUES (15,'Enso');

--Modelos
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (1,'Toyota TS050 Hybrid',1);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (2,'BR1',2);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (3,'R13',3);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (4,'A470',4);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (5,'07',5);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (6,'JSP217',6);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (7,'01',7);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (8,'P217',8);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (9,'488 GTE EVO',9);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (10,'911 RSR',10);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (11,'GT',11);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (12,'Corvette C7R',12);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (13,'M8 GTE',13);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (14,'488 GTE',9);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (15,'Vantage',14);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (16,'CLM P1/01',15);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (17,'Vantage AMR',14);
INSERT INTO modelo(id,nombre,id_fabricante) VALUES (18,'911 RSR - 19',10);

--Equipos
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (1,'TOYOTA GAZOO RACING',8,1,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (2,'TOYOTA GAZOO RACING',7,1,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (3,'SMP RACING',11,2,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (4,'REBELLION RACING',1,3,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (5,'REBELLION RACING',3,3,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (6,'SIGNATECH ALPINE MATMUT',36,4,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (7,'JACKIE CHAN DC RACING',38,5,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (8,'TDS RACING',28,5,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (9,'UNITED AUTOSPORTS',22,6,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (10,'IDEC SPORT',48,5,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (11,'G-DRIVE RACING',26,7,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (12,'DUQUEINE ENGINEERING',30,5,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (13,'PANIS BARTHEZ COMPETITION',23,6,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (14,'GRAFF',39,5,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (15,'ALGARVE PRO RACING',25,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (16,'HIGH CLASS RACING',20,5,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (17,'LARBRE COMPETITON',50,6,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (18,'CETILAR R. VILLORBA CORSE',47,8,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (19,'UNITED AUTOSPORTS',32,6,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (20,'AF CORSE',51,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (21,'PORSCHE GT TEAM',91,10,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (22,'PORSCHE GT TEAM',93,10,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (23,'FORD CHIP GANASSI TEAM UK',67,11,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (24,'FORD CHIP GANASSI TEAM USA',69,11,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (25,'FORD CHIP GANASSI TEAM UK',66,11,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (26,'RACING TEAM NEDERLAND',29,8,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (27,'PORSCHE GT TEAM',94,10,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (28,'CORVETTE RACING',63,12,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (29,'PORSCHE GT TEAM',92,10,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (30,'BMW TEAM MTEK',82,13,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (31,'TEAM PROJECT 1',56,10,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (32,'JMW MOTORSPORT',84,9,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (33,'WEATHERTECH RACING',62,9,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (34,'DEMPSEY-PROTON RACING',77,10,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (35,'CAR GUY RACING',57,9,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (36,'PROTON COMPETITION',78,10,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (37,'CLEARWATER RACING',61,9,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (38,'GULF RACING',86,10,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (39,'KESSEL RACING',83,9,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (40,'RISI COMPETIZIONE',89,9,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (41,'MR RACING',70,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (42,'TF SPORT',90,14,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (43,'SPIRIT OF RACE',54,9,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (44,'ASTON MARTIN RACING',97,14,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (45,'INTER EUROPOL COMPETITION',34,6,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (46,'KESSEL RACING',60,9,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (47,'BMW TEAM MTEK',81,13,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (48,'RLR M SPORT/TOWER EVENTS',43,5,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (49,'DRAGONSPEED',31,5,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (50,'JACKIE CHAN DC RACING',37,5,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (51,'SMP RACING',17,2,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (52,'BYKOLLES RACING TEAM',4,15,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (53,'ARC BRATISLAVA',49,6,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (54,'AF CORSE',71,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (55,'ASTON MARTIN RACING',95,15,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (56,'ASTON MARTIN RACING',98,15,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (57,'CORVETTE RACING',64,12,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (58,'DEMPSEY-PROTON RACING',88,10,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (59,'DRAGONSPEED',10,2,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (60,'FORD CHIP GANASSI TEAM USA',68,11,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (61,'KEATING MOTORSPORTS',85,11,'F');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (62,'DEMPSEY-PROTON RACING',99,10,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (63,'JOTA',38,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (64,'PANIS RACING',31,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (65,'SIGNATECH ALPINE ELF',36,4,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (66,'IDEC SPORT',28,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (67,'COOL RACING',42,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (68,'RICHARD MILLE RACING TEAM',50,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (69,'CETILAR RACING',47,8,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (70,'IDEC SPORT',17,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (71,'DRAGONSPEED USA',27,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (72,'EURASIA MOTORSPORT',35,6,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (73,'RISI COMPETIZIONE',82,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (74,'AF CORSE',83,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (75,'NIELSEN RACING',24,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (76,'JMW MOTORSPORT',66,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (77,'LUZICH RACING',61,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (78,'IRON LYNX',85,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (79,'IRON LYNX',60,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (80,'AF CORSE',54,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (81,'TEAM PROJECT 1',57,10,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (82,'RED RIVER SPORT',62,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (83,'TEAM PROJECT 1',89,10,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (84,'SO24-HAS BY GRAFF',39,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (85,'HUB AUTO RACING',72,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (87,'IRON LYNX',75,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (88,'DRAGONSPEED USA',21,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (89,'WEATHERTECH RACING',63,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (90,'G-DRIVE RACING BY ALGARVE',16,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (91,'DUQUEINE TEAM',30,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (92,'HIGH CLASS RACING',33,5,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (93,'AF CORSE',52,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (94,'SPIRIT OF RACE',55,9,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (95,'EUROINTERNATIONAL',11,6,'T');
INSERT INTO equipo(id,nombre,numero_equipo,id_fabricante,activo) VALUES (96,'JACKIE CHAN DC RACING',37,5,'T');

--Nacionalidades
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (1,'Austriaco/a','Austria');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (2,'Frances/a','Francia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (3,'Portugues/a','Portugal');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (4,'Britanico/a','Gran Bretaña');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (5,'Italiano/a','Italia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (6,'Danes/a','Dinamarca');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (7,'Mexicano/a','Mexico');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (8,'Aleman/a','Alemania');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (9,'Ruso/a','Rusia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (10,'Noruego/a','Noruega');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (11,'Brasilero/a','Brasil');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (12,'Español/a','España');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (13,'Finlandes/a','Finlandia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (14,'Argentino/a','Argentina');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (15,'Suizo/a','Suiza');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (16,'Monegasco/a','Monaco');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (17,'Eslovaco/a','Eslovaquia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (18,'Sueco/a','Suecia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (19,'Neerlandes/a','Paises Bajos');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (20,'Canadiense','Canada');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (21,'Escoces/a','Escocia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (22,'Belga','Belgica');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (23,'Japones/a','Japon');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (24,'Chino/a','China');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (25,'Australiano/a','Australia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (26,'Irlandes/a','Irlanda');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (27,'Neozelandes/a','Nueva Zelanda');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (28,'Taiwanes/a','Taiwan');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (29,'Turco/a','Turquia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (30,'Estadounidense','USA');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (31,'Venezolano/a','Venezuela');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (32,'Colombiano/a','Colombia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (33,'Polaco/a','Polonia');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (34,'Hindu','India');
INSERT INTO nacionalidad(id,gentilicio,nombre_pais) VALUES (35,'Tailandes/a','Tailandia');

--Organizacion
INSERT INTO organizacion(id,nombre) VALUES (1,'Automobile Club de l`Ouest');

--Pistas
INSERT INTO pista(id, nombre, kilometraje) VALUES (1,'Circuito de la Sarthe',13.626);

--Sectores
INSERT INTO sector(id,nombre,id_pista) VALUES (1,'Chicanas Ford',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (2,'Curvas Porsche',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (3,'Arnage',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (4,'Indianapolis',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (5,'Mulsanne',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (6,'Recta Mulsanne',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (7,'Chicana Michelin',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (8,'Chicana Playstation',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (9,'Tertre Rouge',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (10,'Eses',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (11,'Chicana Dunlop',1);
INSERT INTO sector(id,nombre,id_pista) VALUES (12,'Curva Dunlop',1);

--Eventos
INSERT INTO mytable(id,ano,tipo) VALUES (1,2019,'Ensayo');
INSERT INTO mytable(id,ano,tipo) VALUES (2,2019,'Carrera');
INSERT INTO mytable(id,ano,tipo) VALUES (3,2020,'Ensayo');
INSERT INTO mytable(id,ano,tipo) VALUES (4,2020,'Carrera');