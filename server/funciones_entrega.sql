--Compara si una fecha esta en el rango de un contrato
CREATE OR REPLACE FUNCTION fecha_en_periodo_contrato (fecha date, numero_equipo numeric, numero_piloto numeric)
RETURNS boolean as $$
DECLARE
	fecha_trans date;
BEGIN
	IF (SELECT id_piloto FROM contrato WHERE id_equipo = numero_equipo AND id_piloto = numero_piloto AND fecha BETWEEN (duracion).fecha_inicial and (duracion).fecha_final ) != 0 THEN
		RETURN true;
	ELSE
		RETURN false;
	 END IF;
END;
$$LANGUAGE plpgsql;

--Te da el nombre y apellido del piloto
CREATE OR REPLACE FUNCTION nombre_apellido_piloto (num_piloto numeric)
RETURNS varchar as $$
BEGIN
	RETURN (SELECT CONCAT((informacion).nombre,' ',(informacion).apellido) FROM piloto where id = num_piloto );
END;
$$LANGUAGE plpgsql;

--Te da los nombres de los pilotos de un equipo en una fecha
CREATE OR REPLACE FUNCTION nombre_pilotos(eq_id numeric, fecha_actual date)
RETURNS varchar as $$
BEGIN
	RETURN (SELECT CONCAT((p1.informacion).nombre,' ',(p1.informacion).apellido,' - ',(p2.informacion).nombre,' ',(p2.informacion).apellido,' - ',(p3.informacion).nombre,' ',(p3.informacion).apellido)
		FROM piloto p1, contrato c1, piloto p2, contrato c2, piloto p3, contrato c3
		WHERE c1.id_equipo = eq_id AND c1.id_piloto = p1.id AND fecha_en_periodo_contrato(fecha_actual,c1.id_equipo,c1.id_piloto) = true
		AND c2.id_equipo = c1.id_equipo AND c2.id_piloto = p2.id AND fecha_en_periodo_contrato(fecha_actual,c2.id_equipo,c2.id_piloto) = true
		AND c3.id_equipo = c2.id_equipo AND c3.id_piloto = p3.id AND fecha_en_periodo_contrato(fecha_actual,c3.id_equipo,c3.id_piloto) = true
		AND p1.id != p2.id AND p2.id != p3.id AND p1.id != p3.id
		FETCH FIRST 1 ROW ONLY);
END;
$$LANGUAGE plpgsql;

--Registra los equipos activos a un evento
CREATE OR REPLACE FUNCTION registrar_equipos_a_evento(id_eve numeric)
RETURNS void as $$
DECLARE
	team record;
BEGIN
	FOR team in (SELECT id FROM equipo WHERE activo = 'T' ) LOOP                    --Devolvera solo los equipos activos para asociarlos a la competicion
		INSERT INTO equipo_evento (id_equipo,id_evento) VALUES (team.id,id_eve);
	END LOOP;
END;
$$LANGUAGE plpgsql

---------------------------------------------------------------------------------------------------------------------------
--												Posiciones Relativas
---------------------------------------------------------------------------------------------------------------------------


--drop sequence secuenciaposicion;
create sequence secuenciaposicion
  start with 1
  increment by 1
  maxvalue 100
  minvalue 1
  cycle;

---------------------------------------------------------------------------------------------------------------------------
--												Procedimiento Reportes
---------------------------------------------------------------------------------------------------------------------------

--Reporte 1
CREATE OR REPLACE FUNCTION ranking_anho_categoria (an numeric, cat varchar, tip varchar)
RETURNS TABLE (respuesta vehiculo.categoria%TYPE, ranking bigint,definitiva ranking.posicion%TYPE, vueltas ranking.vueltas%TYPE, kilometraje ranking.kilometraje%TYPE, fecha ranking.fecha%TYPE, mejor_vuelta varchar, velocidad_promedio float, numero_equipo equipo.numero_equipo%TYPE, nombre equipo.nombre%TYPE, fabricante fabricante.nombre%TYPE, modelo modelo.nombre%TYPE, categoria vehiculo.categoria%TYPE, caracteristicas vehiculo.caracteristicas%TYPE, tipo evento.tipo%TYPE, diferencia float, pilotos varchar) AS $$
BEGIN
	drop sequence secuenciaposicion;
	create sequence secuenciaposicion
 	 start with 1
 	 increment by 1
 	 maxvalue 100
 	 minvalue 1
 	 cycle;

	IF(cat='Todos')THEN
		RETURN QUERY
			SELECT 
			--RANKING
			'General'::varchar,nextval('secuenciaposicion'),r.posicion, r.vueltas, r.kilometraje, r.fecha, (r.desempeno).vuelta_mas_rapida,(r.desempeno).velocidad_media,
			--INFORMACION EQUIPO
			e.numero_equipo, e.nombre as nombreequipo, 
			--INFORMACION VEHICULO
			f.nombre, m.nombre,v.categoria,v.caracteristicas,
			--Evento
			ev.tipo,
			(select ra.kilometraje from ranking ra where ra.posicion = r.posicion-1 and ra.id_evento= r.id_evento) - r.kilometraje as diferencia,
			--Pilotos
			(SELECT * FROM nombre_pilotos(r.id_equipo,r.fecha))
			FROM ranking r, evento ev, vehiculo v, modelo m, equipo e, fabricante f
			WHERE r.id_evento = ev.id
			AND ev.tipo = tip			    
			AND ev.ano= an						
			AND v.id = r.id_vehiculo
			AND m.id = v.id_modelo
			AND r.id_equipo = e.id
			AND f.id = m.id_fabricante
			ORDER BY posicion;
	ELSE
		RETURN QUERY
			SELECT 
			--RANKING
			v.categoria,nextval('secuenciaposicion'), r.posicion, r.vueltas, r.kilometraje, r.fecha,(r.desempeno).vuelta_mas_rapida,(r.desempeno).velocidad_media,
			--INFORMACION EQUIPO
			e.numero_equipo, e.nombre as nombreequipo, 
			--INFORMACION VEHICULO
			f.nombre, m.nombre,v.categoria,v.caracteristicas,
			--Evento
			ev.tipo,
			(select ra.kilometraje from ranking ra where ra.posicion = r.posicion-1 and ra.id_evento= r.id_evento) - r.kilometraje as diferencia,
			--Pilotos
			(SELECT * FROM nombre_pilotos(r.id_equipo,r.fecha))
			FROM ranking r, evento ev, vehiculo v, modelo m, equipo e, fabricante f
			WHERE r.id_evento = ev.id
			AND ev.tipo = tip			    
			AND ev.ano= an						
			AND v.categoria = cat				
			AND v.id = r.id_vehiculo
			AND m.id = v.id_modelo
			AND r.id_equipo = e.id
			AND f.id = m.id_fabricante
			ORDER BY posicion;
	END IF;
END;
$$LANGUAGE plpgsql;

--Reporte 2
CREATE OR REPLACE FUNCTION public.ranking_hora_categoria(an numeric, cat varchar, hor numeric)
RETURNS TABLE(respuesta character varying, hora numeric, posicionhora numeric, posiciondef numeric, vueltas numeric, kilometraje double precision, fecha date, mejor_vuelta character varying, velocidad_promedio double precision, numero_equipo numeric, nombre character varying, fabricante character varying, modelo character varying, categoria character varying, caracteristicas character varying[],pilotos varchar) AS $$
BEGIN
	IF(cat='Todos')THEN
		RETURN QUERY
		SELECT 
		--RANKING
		ev.tipo,rh.hora,rh.posicion,r.posicion, r.vueltas, r.kilometraje,r.fecha,(r.desempeno).vuelta_mas_rapida,(r.desempeno).velocidad_media, 
		--INFORMACION EQUIPO
		e.numero_equipo, e.nombre as nombreequipo, 
		--INFORMACION VEHICULO
		f.nombre, m.nombre,v.categoria,v.caracteristicas,
		--Pilotos
		(SELECT * FROM nombre_pilotos(r.id_equipo,r.fecha))
		FROM ranking r, evento ev, vehiculo v, modelo m, equipo e, fabricante f, ranking_por_hora rh
		WHERE r.id_evento = ev.id
		AND ev.tipo = 'Carrera'
		AND ev.ano= an					   --Se sustituira por el insertado por el usuario
		AND v.id = r.id_vehiculo
		AND m.id = v.id_modelo
		AND r.id_equipo = e.id
		AND f.id = m.id_fabricante
		AND rh.id_ranking = r.id
		AND rh.hora = hor					--Se sustituira por el insertado por el usuario
		ORDER BY rh.posicion;
	ELSE
		RETURN QUERY
		SELECT 
		--RANKING
		ev.tipo,rh.hora,rh.posicion,r.posicion, r.vueltas, r.kilometraje,r.fecha,(r.desempeno).vuelta_mas_rapida,(r.desempeno).velocidad_media,
		--INFORMACION EQUIPO
		e.numero_equipo, e.nombre as nombreequipo, 
		--INFORMACION VEHICULO
		f.nombre, m.nombre,v.categoria,v.caracteristicas,
		--Pilotos
		(SELECT * FROM nombre_pilotos(r.id_equipo,r.fecha))
		FROM ranking r, evento ev, vehiculo v, modelo m, equipo e, fabricante f, ranking_por_hora rh
		WHERE r.id_evento = ev.id
		AND ev.tipo = 'Carrera'
		AND ev.ano= an					   --Se sustituira por el insertado por el usuario
		AND v.categoria = cat			--Se sustituira por el insertado por el usuario
		AND v.id = r.id_vehiculo
		AND m.id = v.id_modelo
		AND r.id_equipo = e.id
		AND f.id = m.id_fabricante
		AND rh.id_ranking = r.id
		AND rh.hora = hor					--Se sustituira por el insertado por el usuario
		ORDER BY rh.posicion;
	END IF;
END;
$$LANGUAGE plpgsql;


--Reporte 3
CREATE OR REPLACE FUNCTION ganadores_categoria(cat varchar, an numeric)
RETURNS TABLE (categoriaconsulta varchar, respuesta character varying,posiciondef numeric, vueltas numeric, kilometraje double precision, fecha date, mejor_vuelta character varying, velocidad_promedio double precision, numero_equipo numeric, nombre character varying, fabricante character varying, modelo character varying, categoria character varying, caracteristicas character varying[],pilotos varchar) AS $$
BEGIN
	IF(cat='Todos') THEN
		RETURN QUERY
			SELECT 
			--RANKING
			'Todos'::varchar,ev.tipo,r.posicion, r.vueltas, r.kilometraje,r.fecha,(r.desempeno).vuelta_mas_rapida,(r.desempeno).velocidad_media, 
			--INFORMACION EQUIPO
			e.numero_equipo, e.nombre as nombreequipo, 
			--INFORMACION VEHICULO
			f.nombre, m.nombre,v.categoria,v.caracteristicas,
			--Pilotos
			(SELECT * FROM nombre_pilotos(r.id_equipo,r.fecha))
			FROM ranking r, evento ev, vehiculo v, modelo m, equipo e, fabricante f
			WHERE r.id_evento = ev.id
			AND ev.tipo = 'Carrera'
			AND ev.ano= an					--REVISAR USO DE IN CUANDO NO SE INSERTAN
			AND v.id = r.id_vehiculo
			AND m.id = v.id_modelo
			AND r.id_equipo = e.id
			AND f.id = m.id_fabricante
			FETCH FIRST 1 ROW ONLY;
	ELSE
		RETURN QUERY
			SELECT 
			--RANKING
			v.categoria,ev.tipo,r.posicion, r.vueltas, r.kilometraje,r.fecha,(r.desempeno).vuelta_mas_rapida,(r.desempeno).velocidad_media, 
			--INFORMACION EQUIPO
			e.numero_equipo, e.nombre as nombreequipo, 
			--INFORMACION VEHICULO
			f.nombre, m.nombre,v.categoria,v.caracteristicas,
			--Pilotos
			(SELECT * FROM nombre_pilotos(r.id_equipo,r.fecha))
			FROM ranking r, evento ev, vehiculo v, modelo m, equipo e, fabricante f
			WHERE r.id_evento = ev.id
			AND ev.tipo = 'Carrera'
			AND ev.ano= an					--REVISAR USO DE IN CUANDO NO SE INSERTAN
			AND v.categoria = cat
			AND v.id = r.id_vehiculo
			AND m.id = v.id_modelo
			AND r.id_equipo = e.id
			AND f.id = m.id_fabricante
			FETCH FIRST 1 ROW ONLY;
	END IF;
END;
$$LANGUAGE plpgsql;