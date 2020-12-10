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
    id_fabricante numeric NOT NULL
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
    gentilicio varchar(12) NOT NULL,
    nombre_pais varchar NOT NULL,
    foto_bandera BYTEA,
    CONSTRAINT pk_nacionalidad PRIMARY KEY (id)
);

create table public.organizacion
(
    id numeric(2) NOT NULL,
    nombre varchar(20) NOT NULL,
    CONSTRAINT pk_organizacion PRIMARY KEY (id)
);

create table public.pista 
(
    id numeric NOT NULL,
    nombre varchar NOT NULL,
    kilometraje numeric(2,3) NOT NULL,
    CONSTRAINT pk_pista PRIMARY KEY (id)
);

create table public.sector
(
    id numeric(2) NOT NULL,
    nombre varchar NOT NULL,
    descripcion varchar(55) NOT NULL,
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