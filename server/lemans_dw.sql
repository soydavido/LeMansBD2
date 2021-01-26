    CREATE TABLE dw_dim_equipo(
        id_equipo numeric NOT NULL,
        nombre varchar NOT NULL,
        nro_equipo numeric NOT NULL,
        pais varchar NOT NULL,
        CONSTRAINT pk_dw_dim_equipo PRIMARY KEY (id_equipo)
    );


    CREATE TABLE dw_dim_vehiculo (
        id_vehiculo numeric NOT NULL,
        fabricante varchar NOT NULL,
        modelo varchar NOT NULL,
        motor_nombre varchar NOT NULL,
        motor_cilindrada varchar NOT NULL,
        motor_capacidad varchar NOT NULL,
        tipo varchar NOT NULL,
        categoria varchar NOT NULL,
        CONSTRAINT pk_dw_dim_vehiculo PRIMARY KEY (id_vehiculo)
    );

    CREATE TABLE dw_dim_ranking (
        id_ranking numeric NOT NULL,
        vuelta_rapida varchar NOT NULL,
        velocidad_media float NOT NULL, 
        nro_vueltas integer NOT NULL,
        kilometraje float NOT NULL,
        CONSTRAINT pk_dw_dim_ranking PRIMARY KEY (id_ranking)
    );


    CREATE TABLE dw_dim_pilotos(
        id_piloto numeric NOT NULL,
        nombre varchar NOT NULL,
        nombre2 varchar NOT NULL,
        apellido varchar NOT NULL,
        apellido2 varchar NOT NULL,
        genero varchar NOT NULL,
        peso varchar NOT NULL,
        estatura varchar NOT NULL,
        fecha_nacimiento varchar NOT NULL,
        fecha_fallecimiento varchar NOT NULL,
        nacionalidad varchar NOT NULL,
        CONSTRAINT pk_dw_dim_piloto PRIMARY KEY (id_piloto)
    );


    --Revisar si su PK puede ser SOLO la combinacion de las demas
    CREATE TABLE dw_hec_evento(
        tipo varchar NOT NULL,
        posicion numeric NOT NULL, 
        nro_equipo numeric NOT NULL,
        fecha numeric NOT NULL,
        id_piloto numeric NOT NULL,
        id_ranking numeric NOT NULL, 
        id_equipo numeric NOT NULL,
        id_vehiculo numeric NOT NULL,
        CONSTRAINT pk_dw_dim_evento PRIMARY KEY (id_piloto,id_ranking,id_equipo,id_vehiculo),
        CONSTRAINT fk_equipo_dw_equipo FOREIGN KEY (id_equipo) REFERENCES dw_dim_equipo(id_equipo),
        CONSTRAINT fk_equipo_dw_pilotos FOREIGN KEY (id_piloto) REFERENCES dw_dim_pilotos(id_piloto),
        CONSTRAINT fk_equipo_dw_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES dw_dim_vehiculo(id_vehiculo)
    );