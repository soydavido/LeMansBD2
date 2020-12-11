create type Persona as
(
    nombre varchar(15),
    nombre2 varchar(15),
    apellido varchar(15),
    apellido2 varchar(15),
    fecha_nacimiento date,
    estatura float, 
    peso float,
    fecha_fallecimiento date, 
    genero varchar(1)
);

create type Tiempo as
(
    fecha_inicial date,
    fecha_final date
);

create type Marcas as
(
    vuelta_mas_rapida date,
    vuelta_promedio date,
    kilometraje_promedio_vuelta float,
    velocidad_media float
);

--------------------------------------------------------------------------------

create table public.fabricante
(
    id numeric(3) NOT NULL,
    nombre varchar NOT NULL,
    logo BYTEA,
    CONSTRAINT pk_fabricante PRIMARY KEY (id)
);

create table public.modelo
(
    id numeric(10) NOT NULL,
    nombre varchar NOT NULL,
    id_fabricante numeric NOT NULL,
    CONSTRAINT pk_modelo PRIMARY KEY (id),
    CONSTRAINT fk_modelo FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

create table public.equipo
(
    id numeric(4) NOT NULL,
    nombre varchar NOT NULL,
    numero_equipo numeric (3) NOT NULL,
    activo boolean NOT NULL,
    id_fabricante numeric NOT NULL,
    CONSTRAINT pk_equipo PRIMARY KEY (id),
    CONSTRAINT fk_fabricante FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

create table public.nacionalidad
(
    id numeric(3) NOT NULL,
    gentilicio varchar(15) NOT NULL,
    nombre_pais varchar NOT NULL,
    foto_bandera BYTEA,
    CONSTRAINT pk_nacionalidad PRIMARY KEY (id)
);

create table public.organizacion
(
    id numeric(2) NOT NULL,
    nombre varchar NOT NULL,
    CONSTRAINT pk_organizacion PRIMARY KEY (id)
);

create table public.pista 
(
    id numeric NOT NULL,
    nombre varchar NOT NULL,
    kilometraje float NOT NULL,
    CONSTRAINT pk_pista PRIMARY KEY (id)
);

create table public.sector
(
    id numeric(2) NOT NULL,
    nombre varchar NOT NULL,
    descripcion varchar(55),
    id_pista numeric NOT NULL,
    CONSTRAINT pk_sector PRIMARY KEY (id),
    CONSTRAINT fk_pista FOREIGN KEY (id_pista) REFERENCES pista(id)
);

create table public.evento
(
    id numeric(2) NOT NULL,
    ano numeric NOT NULL,
    tipo varchar(7),
    id_organizacion numeric NOT NULL,
    id_pista numeric NOT NULL,
    CONSTRAINT pk_evento PRIMARY KEY (id),
    CONSTRAINT chk_tipo CHECK(tipo in('Ensayo','Carrera')),
    CONSTRAINT fk_organizacion FOREIGN KEY (id_organizacion) REFERENCES organizacion(id),
    CONSTRAINT fk_pista FOREIGN KEY (id_pista) REFERENCES pista(id)
);

create table public.piloto
(
    id numeric(5) NOT NULL,
    informacion Persona NOT NULL,
    idiomas varchar[5] NOT NULL,
    foto BYTEA,
    id_nacionalidad numeric NOT NULL,
    CONSTRAINT pk_piloto PRIMARY KEY (id),
    CONSTRAINT fk_nacionalidad FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad(id)
);

create table public.vehiculo
(
    id numeric(10) NOT NULL,
    numero numeric(3) NOT NULL,
    categoria varchar NOT NULL,
    tipo varchar NOT NULL,
    caracteristicas varchar[5] NOT NULL,
    --piezas 
    foto BYTEA,
    id_equipo numeric NOT NULL,
    id_modelo numeric NOT NULL,
    CONSTRAINT pk_vehiculo PRIMARY KEY (id),
    CONSTRAINT fk_equipo FOREIGN KEY (id_equipo) REFERENCES equipo(id),
    CONSTRAINT fk_modelo FOREIGN KEY (id_modelo) REFERENCES modelo(id)
);

create table public.contrato
(
    id numeric NOT NULL,
    duracion Tiempo,
    id_piloto numeric NOT NULL,
    id_equipo numeric NOT NULL,
    CONSTRAINT pk_contrato PRIMARY KEY (id,id_equipo,id_piloto),
    CONSTRAINT fk_piloto FOREIGN KEY (id_piloto) REFERENCES piloto(id),
    CONSTRAINT fk_equipo FOREIGN KEY (id_equipo) REFERENCES equipo(id)
);

create table public.ranking
(
    id numeric NOT NULL,
    posicion numeric,
    kilometraje float NOT NULL,
    tiempo_total Tiempo,
    vueltas Marcas,
    fecha date,
    id_equipo numeric NOT NULL,
    id_vehiculo numeric NOT NULL,
    id_evento numeric NOT NULL,
    CONSTRAINT pk_ranking PRIMARY KEY (id),
    CONSTRAINT fk_equipo FOREIGN KEY (id_equipo) REFERENCES equipo(id),
    CONSTRAINT fk_evento FOREIGN KEY (id_evento) REFERENCES evento(id),
    CONSTRAINT fk_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id)
);

create table public.vuelta
(
    id numeric NOT NULL,
    distancia float NOT NULL,           --Aqui va la distancia, sacada con distancia promedio del año anterior
    tiempo date NOT NULL,               --Aqui va el tiempo de las vueltas
    velocidad_media float NOT NULL,     --Aqui va la velocidad media, calculada con la velocidad_media del año anterior
    temperatura_cockpit float NOT NULL,
    id_equipo numeric NOT NULL,
    id_evento numeric NOT NULL,
    id_ranking numeric NOT NULL,
    CONSTRAINT pk_vuelta PRIMARY KEY (id),
    CONSTRAINT fk_equipo FOREIGN KEY (id_equipo) REFERENCES equipo(id),
    CONSTRAINT fk_evento FOREIGN KEY (id_evento) REFERENCES evento(id),
    CONSTRAINT fk_ranking FOREIGN KEY (id_ranking) REFERENCES ranking(id)
);