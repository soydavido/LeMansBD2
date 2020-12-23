-------------------------------COMENTARIOS------------------------------------
--	1.- Como haremos para ordenar por hora? se sumaran los minutos hasta obtener 1 hora por competidor o los guardamos en algun lado?
--	2.- Evaluar si se colocan ambas posiciones, por categoria y global
--	
--	
--
--
--
--
---------------------------------------------------------------------------------------------------------------------------
--												Calculo Marcas
---------------------------------------------------------------------------------------------------------------------------

 
--Esta funcion servira para los calculos que se realizaran en el TDA MARCAS
CREATE OR REPLACE FUNCTION minutos_a_decimales(a varchar, b float)
RETURNS float as $$
BEGIN
	b := ((cast(SUBSTRING(a,1,1) as float))/60)+(cast(SUBSTRING(a,1,1) as float));
	RETURN b;
END;
$$LANGUAGE plpgsql

--Esta funcion sirve para calcular la velocidad_promedio en base al tiempo
CREATE OR REPLACE FUNCTION velocidad_promedio(km float, tiempo float)
RETURNS float as $$
BEGIN
	RETURN km * tiempo;
END;
$$LANGUAGE plpgsql

--Esta funcion sirve para calcular un aproximado de kilometraje por vuelta
CREATE OR REPLACE FUNCTION kilometraje_promedio(km float, vueltas integer)
RETURNS float as $$
BEGIN
	RETURN km / vueltas;
END;
$$LANGUAGE plpgsql


---------------------------------------------------------------------------------------------------------------------------
--												Carreras
---------------------------------------------------------------------------------------------------------------------------


--Esta funcion genera los tiempos de la vuelta
CREATE OR REPLACE FUNCTION tiempo_vueltas(tiempo_rapido float, tiempo_promedio float)
RETURNS float as $$
BEGIN
	RETURN random()*(tiempo_promedio-tiempo_rapido)+tiempo_rapido;
END;
$$LANGUAGE plpgsql;

--Esta funcion genera el kilometraje por vuelta
CREATE OR REPLACE FUNCTION kilometraje_vuelta(promedio_anterior float, maximo float)
RETURNS float as $$
BEGIN
	RETURN random()*(maximo-promedio_anterior)+promedio_anterior;
END;
$$LANGUAGE plpgsql;

--Esta funcion genera la velocidad promedio de una vuelta
CREATE OR REPLACE FUNCTION velocidad_vuelta(promedio float)
RETURNS float as $$
DECLARE
	maximo float;
	minimo float;
BEGIN
	maximo := promedio + 20;
	minimo := promedio - 20;
	RETURN random()*(maximo-minimo)+minimo;
END;
$$LANGUAGE plpgsql;

--Esta funcion genera el kilometraje de una vuelta
CREATE OR REPLACE FUNCTION kilometraje_vuelta(promedio float)
RETURNS float as $$
DECLARE
	maximo float;
	minimo float;
BEGIN
	maximo := 13.626;
	minimo := promedio;
	RETURN random()*(maximo-minimo)+minimo+0.02;
END;
$$LANGUAGE plpgsql;

--Esta funcion va a registrar las vueltas
CREATE OR REPLACE FUNCTION insertar_vuelta(id_eq numeric,id_eve numeric, id_rank numeric, id numeric, km_prom float, t_prom varchar, vel_med float, mas_rapida float)
RETURNS TABLE as $$
DECLARE 
	km_vuelta float;
	vel_vuelta float;
	tiempo_vuelta float;
BEGIN
	km_vuelta := kilometraje_vuelta(km_prom);
	vel_vuelta := velocidad_vuelta(vel_med);
	t_prom := tiempo_vueltas(mas_rapida,t_prom);
	RETURN QUERY
	INSERT INTO public.vuelta (id,distancia,tiempo,velocidad_media,id_equipo,id_evento,id_ranking)
	VALUES (id,km_vuelta,t_prom,vel_vuelta,id_eq,id_eve,id_rank);
END;
$$LANGUAJE plpgsql;

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
$$LANGUAGE plpgsql

--Te da el nombre y apellido del piloto
CREATE OR REPLACE FUNCTION nombre_apellido_piloto (num_piloto numeric)
RETURNS varchar as $$
BEGIN
	RETURN (SELECT CONCAT((informacion).nombre,' ',(informacion).apellido) FROM piloto where id = num_piloto );
END;
$$LANGUAGE plpgsql

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


---------------------------------------------------------------------------------------------------------------------------
--												Posiciones Relativas
---------------------------------------------------------------------------------------------------------------------------


drop sequence secuenciaposicion;
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