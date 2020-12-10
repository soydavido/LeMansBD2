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