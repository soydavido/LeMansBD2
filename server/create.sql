create table public.fabricante
(
    id numeric(3) NOT NULL,
    nombre varchar NOT NULL,
    logo BYTEA,
    CONSTRAINT pk_fabricante PRIMARY KEY (id)
);

create table public.modelo
(
    id numeric NOT NULL,
    nombre varchar NOT NULL,
    id_fabricante numeric NOT NULL
    CONSTRAINT pk_modelo PRIMARY KEY (id),
    CONSTRAINT fk_modelo FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
;)

