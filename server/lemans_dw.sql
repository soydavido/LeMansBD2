    CREATE TABLE dw_dim_equipo(
        id_equipo numeric NOT NULL,
        nombre varchar ,
        nro_equipo numeric ,
        pais varchar ,
        id_equipo_anterior numeric NOT NULL,
        CONSTRAINT pk_dw_dim_equipo PRIMARY KEY (id_equipo, id_equipo_anterior)
    );


    CREATE TABLE dw_dim_vehiculo (
        id_vehiculo numeric NOT NULL,
        fabricante varchar ,
        modelo varchar,
        motor_nombre varchar ,
        motor_cilindrada varchar ,
        motor_capacidad varchar ,
        tipo varchar ,
        categoria varchar ,
        id_vehiculo_anterior numeric NOT NULL,
        CONSTRAINT pk_dw_dim_vehiculo PRIMARY KEY (id_vehiculo,id_vehiculo_anterior)
    );

    CREATE TABLE dw_dim_ranking (
        id_ranking numeric NOT NULL,
        vuelta_rapida varchar ,
        velocidad_media float , 
        nro_vueltas numeric ,
        kilometraje float ,
        posicion numeric,
        id_ranking_anterior numeric NOT NULL,
        CONSTRAINT pk_dw_dim_ranking PRIMARY KEY (id_ranking,id_ranking_anterior)
    );


    CREATE TABLE dw_dim_pilotos(
        id_piloto numeric NOT NULL,
        nombre varchar ,
        nombre2 varchar ,
        apellido varchar ,
        apellido2 varchar ,
        genero varchar ,
        peso varchar ,
        estatura varchar ,
        fecha_nacimiento varchar ,
        fecha_fallecimiento varchar ,
        nacionalidad varchar ,
        id_piloto_viejo numeric NOT NULL,
        CONSTRAINT pk_dw_dim_piloto PRIMARY KEY (id_piloto,id_piloto_viejo)
    );

    CREATE TABLE dw_dim_fecha(
        id_fecha numeric,
        fecha date,
        CONSTRAINT pk_dw_dim_fecha PRIMARY KEY (id_fecha)
    );

    CREATE TABLE dw_hec_evento(
        tipo varchar ,
        posicion numeric , 
        nro_equipo numeric ,
        fabricante varchar ,
        kilometraje float ,
        categoria varchar ,
        id_piloto numeric NOT NULL,
        id_piloto_viejo numeric NOT NULL,
        id_ranking numeric NOT NULL,
        id_ranking_anterior numeric NOT NULL, 
        id_equipo numeric NOT NULL,
        id_equipo_anterior numeric NOT NULL,
        id_vehiculo numeric NOT NULL,
        id_vehiculo_anterior numeric NOT NULL,
        id_fecha numeric NOT NULL,
        id_evento numeric NOT NULL,
        CONSTRAINT pk_dw_dim_evento PRIMARY KEY (id_evento,id_piloto,id_piloto_viejo,id_ranking,id_ranking_anterior,id_equipo,id_vehiculo,id_vehiculo_anterior,id_fecha),
        CONSTRAINT fk_equipo_dw_equipo FOREIGN KEY (id_equipo,id_equipo_anterior) REFERENCES dw_dim_equipo(id_equipo,id_equipo_anterior),
        CONSTRAINT fk_equipo_dw_pilotos FOREIGN KEY (id_piloto,id_piloto_viejo) REFERENCES dw_dim_pilotos(id_piloto,id_piloto_viejo),
        CONSTRAINT fk_equipo_dw_vehiculo FOREIGN KEY (id_vehiculo,id_vehiculo_anterior) REFERENCES dw_dim_vehiculo(id_vehiculo,id_vehiculo_anterior),
        CONSTRAINT fk_equipo_dw_fecha FOREIGN KEY (id_fecha) REFERENCES dw_dim_fecha(id_fecha),
        CONSTRAINT fk_equipo_dw_ranking FOREIGN KEY (id_ranking,id_ranking_anterior) REFERENCES dw_dim_ranking(id_ranking,id_ranking_anterior)
    );

    CREATE INDEX fecha_id ON dw_hec_evento (id_fecha);

    