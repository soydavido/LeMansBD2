CREATE OR REPLACE FUNCTION simulation (timer numeric) RETURNS void AS $$
    DECLARE 
        count numeric := 10;
        prev_event_id evento.id%TYPE;
        aux_event_id evento.id%TYPE;
        event_id evento.id%TYPE;
        position numeric := 1;
        team RECORD;
        car RECORD;
        type_event evento.tipo%TYPE;
        ranking RECORD;
        aux_time_split VARCHAR;
        aux_time REAL;
    BEGIN
        event_id = registrar_evento();  -- ASIGNAMOS EL ID PARA INCREMENTARLO EN UNA UNIDAD Y UTILIZARLO PARA CREAR EL NUEVO EVENTO
        PERFORM registrar_equipos_a_evento(event_id);
        raise notice 'EVENT: %', event_id;
        
        type_event = (SELECT tipo FROM evento WHERE id=event_id);
        -- FOR team IN (SELECT id_equipo FROM equipo_evento WHERE id_evento=event_id) LOOP
        --     INSERT INTO ranking (id,vueltas,id_equipo,id_vehiculo,id_evento,tiempo_total) values (id_ultimo_ranking()+1,0,team.id_equipo,ultimo_vehiculo(team.id_equipo),event_id,(current_date::timestamp,current_date::timestamp));
        -- END LOOP;

        FOR ranking IN SELECT * FROM ranking LOOP
            aux_time_split := split_part((ranking.desempeno).vuelta_mas_rapida, ':', 2);
            -- aux_time := aux_time_split::REAL / 60;
            raise notice 'TIME: %', aux_time_split;
        END LOOP;

        -- FOR team IN SELECT * FROM equipo_evento WHERE id_evento = event_id LOOP -- ITERAMOS SOBRE LA LISTA DE EQUIPOS REGISTRADOS PARA ESTE NUEVO EVENTO
        --     FOR car IN SELECT * FROM vehiculo WHERE id_equipo = team.id_equipo LOOP -- ITERAMOS SOBRE LA LISTA DE VEHICULOS ASOCIADOS A LOS EQUIPOS
        --         position := position + 1;
        --         raise notice 'TEAM: %', team.id_equipo;
        --         raise notice 'CAR: %', car.id;
        --     END LOOP;
        -- END LOOP;
        
        LOOP
            count := count + 1;
            EXIT WHEN count = timer;
        END LOOP;
    END;
$$ LANGUAGE plpgsql;