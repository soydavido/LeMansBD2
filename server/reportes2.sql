--REPORTE 4
CREATE FUNCTION reporte4(anho integer, num_equipo integer)
RETURNS TABLE (id_evento dw_hec_evento.id_evento%TYPE, numero_equipo dw_hec_evento.nro_equipo%TYPE, nombre_equipo dw_dim_equipo.nombre%TYPE, pais_equipo dw_dim_equipo.pais%TYPE, fabricante dw_dim_vehiculo.fabricante%TYPE, modelo dw_dim_vehiculo.modelo%TYPE, motor text, categoria dw_dim_vehiculo.categoria%TYPE, nombre_piloto dw_dim_pilotos.nombre%TYPE, apellido_piloto dw_dim_pilotos.apellido%TYPE, nacionalidad dw_dim_pilotos.nacionalidad%TYPE, posicion dw_hec_evento.posicion%TYPE, kilometraje dw_hec_evento.kilometraje%TYPE, vueltas dw_dim_ranking.nro_vueltas%TYPE, vuelta_rapida dw_dim_ranking.vuelta_rapida%TYPE, velocidad_media dw_dim_ranking.velocidad_media%TYPE, diferencia float, cantidad_pilotos bigint )
AS $$
BEGIN
	IF(anho is null) THEN
		RETURN QUERY SELECT 
		--DATOS EQUIPO 
		ev.id_evento, ev.nro_equipo, eq.nombre, eq.pais,
		--DATOS VEHICULO 
		ve.fabricante, ve.modelo, concat(ve.motor_nombre,' ',ve.motor_cilindrada,' ',ve.motor_capacidad) motor, ve.categoria categoria,
		--DATOS PILOTO
		pi.nombre, pi.apellido, pi.nacionalidad,
		--DATOS RANKING 
		ev.posicion, ev.kilometraje, ra.nro_vueltas, ra.vuelta_rapida, ra.velocidad_media,
		CASE 
			WHEN ev.posicion = 1 THEN 0
			WHEN ev.posicion != 1 THEN (SELECT ri.kilometraje - ra.kilometraje 
										FROM dw_dim_ranking ri, dw_hec_evento ei, dw_dim_fecha fi
										WHERE ri.id_ranking = ei.id_ranking
										AND ei.id_fecha = fi.id_fecha
										AND date_part('year',fe.fecha) = date_part('year',fi.fecha)
										AND ri.posicion = ra.posicion-1 FETCH FIRST 1 ROW ONLY) 
		END diferencia,
		(SELECT COUNT (*) FROM dw_hec_evento ex WHERE ex.id_equipo=ev.id_equipo AND ex.id_ranking = ev.id_ranking) cantidad_pilotos
		FROM dw_hec_evento ev, dw_dim_equipo eq, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_pilotos pi, dw_dim_ranking ra
		WHERE ev.nro_equipo = num_equipo
		AND ev.id_vehiculo = ve.id_vehiculo 
		AND ev.id_equipo = eq.id_equipo
		AND fe.id_fecha = ev.id_fecha
		AND ev.id_piloto = pi.id_piloto
		AND ev.id_ranking = ra.id_ranking;
	ELSE
		RETURN QUERY SELECT 
		--DATOS EQUIPO 
		ev.id_evento, ev.nro_equipo, eq.nombre, eq.pais,
		--DATOS VEHICULO 
		ve.fabricante, ve.modelo, concat(ve.motor_nombre,' ',ve.motor_cilindrada,' ',ve.motor_capacidad) motor, ve.categoria categoria,
		--DATOS PILOTO
		pi.nombre, pi.apellido, pi.nacionalidad,
		--DATOS RANKING 
		ev.posicion, ev.kilometraje, ra.nro_vueltas, ra.vuelta_rapida, ra.velocidad_media,
		CASE 
			WHEN ev.posicion = 1 THEN 0
			WHEN ev.posicion != 1 THEN (SELECT ri.kilometraje - ra.kilometraje 
										FROM dw_dim_ranking ri, dw_hec_evento ei, dw_dim_fecha fi
										WHERE ri.id_ranking = ei.id_ranking
										AND ei.id_fecha = fi.id_fecha
										AND date_part('year',fe.fecha) = date_part('year',fi.fecha)
										AND ri.posicion = ra.posicion-1 FETCH FIRST 1 ROW ONLY) 
		END diferencia,
		(SELECT COUNT (*) FROM dw_hec_evento ex WHERE ex.id_equipo=ev.id_equipo AND ex.id_ranking = ev.id_ranking) cantidad_pilotos
		FROM dw_hec_evento ev, dw_dim_equipo eq, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_pilotos pi, dw_dim_ranking ra
		WHERE ev.nro_equipo = num_equipo
		AND ev.id_vehiculo = ve.id_vehiculo 
		AND ev.id_equipo = eq.id_equipo
		AND fe.id_fecha = ev.id_fecha
		AND date_part('year',fe.fecha) = anho
		AND ev.id_piloto = pi.id_piloto
		AND ev.id_ranking = ra.id_ranking;
	END IF;
END;
$$LANGUAGE plpgsql;

--REPORTE 5
CREATE FUNCTION reporte5(nombre_pil varchar, apellido_pil varchar)
RETURNS TABLE (id_piloto dw_dim_pilotos.id_piloto%TYPE, nombre_piloto dw_dim_pilotos.nombre%TYPE, apellido_piloto dw_dim_pilotos.apellido%TYPE, fecha_nacimiento dw_dim_pilotos.fecha_nacimiento%TYPE, fecha_fallecimiento dw_dim_pilotos.fecha_fallecimiento%TYPE, nacionalidad dw_dim_pilotos.nacionalidad%TYPE, edad interval, participaciones_totaltes bigint, primera_participacion date, podium1 bigint, podium2 bigint, podium3 bigint, corredores text, nombre_equipo dw_dim_equipo.nombre%TYPE, numero_equipo dw_dim_equipo.nro_equipo%TYPE, pais_equipo dw_dim_equipo.pais%TYPE, fabricante dw_dim_vehiculo.fabricante%TYPE, modelo dw_dim_vehiculo.modelo%TYPE, motor text, categoria dw_dim_vehiculo.categoria%TYPE, fecha dw_dim_fecha.fecha%TYPE)
AS $$
BEGIN
		RETURN QUERY SELECT DISTINCT 
		--DATOS PILOTO
		pi.id_piloto, pi.nombre, pi.apellido, pi.fecha_nacimiento,pi.fecha_fallecimiento, pi.nacionalidad, AGE(current_date,to_date(pi.fecha_nacimiento,'DD-MM-YYYY')) edad_actual,
		--DATOS PARTICIPACION
		(SELECT COUNT(*) FROM dw_hec_evento evv WHERE evv.id_piloto = pi.id_piloto) total_participaciones,
		(SELECT fe1.fecha FROM dw_hec_evento ev1,dw_dim_fecha fe1 WHERE fe1.id_fecha = ev1.id_fecha AND ev1.id_piloto = pi.id_piloto ORDER BY 1 ASC FETCH FIRST 1 ROW ONLY) primera_participacion,
		(SELECT COUNT(*) FROM dw_hec_evento ev1 WHERE ev1.id_piloto = pi.id_piloto AND ev1.posicion=1) podium1,
		(SELECT COUNT(*) FROM dw_hec_evento ev1 WHERE ev1.id_piloto = pi.id_piloto AND ev1.posicion=1) podium2,
		(SELECT COUNT(*) FROM dw_hec_evento ev1 WHERE ev1.id_piloto = pi.id_piloto AND ev1.posicion=1) podium3,
		--Detalles Participacion 
		(SELECT CONCAT (pi2.nombre,' ',pi2.apellido,' - ',pi3.nombre,' ',pi3.apellido)
		FROM dw_dim_pilotos pi2, dw_dim_pilotos pi3, dw_hec_evento ev2, dw_hec_evento ev3
		WHERE pi2.id_piloto = ev2.id_piloto AND pi3.id_piloto = ev3.id_piloto
		AND ev2.id_equipo = ev.id_equipo AND ev3.id_equipo = ev.id_equipo 
		AND ev2.id_fecha = ev.id_fecha AND ev3.id_fecha= ev.id_fecha
		AND pi2.id_piloto != pi.id_piloto AND pi3.id_piloto != pi.id_piloto AND pi2.id_piloto != pi3.id_piloto
		FETCH FIRST 1 ROW ONLY) corredores,
		--Datos Equipo
		 eq.nombre, eq.nro_equipo, eq.pais,
		 --DATOS VEHICULO 
		ve.fabricante, ve.modelo, concat(ve.motor_nombre,' ',ve.motor_cilindrada,' ',ve.motor_capacidad) motor, ve.categoria categoria,
		fe.fecha
		FROM dw_hec_evento ev, dw_dim_equipo eq, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_pilotos pi, dw_dim_ranking ra
		WHERE ev.id_vehiculo = ve.id_vehiculo 
		AND ev.id_equipo = eq.id_equipo
		AND fe.id_fecha = ev.id_fecha
		AND ev.id_piloto = pi.id_piloto
		AND ev.id_ranking = ra.id_ranking
		AND pi.nombre LIKE nombre_pil
		AND pi.apellido LIKE apellido_pil
		ORDER BY 21,1;
END;
$$LANGUAGE plpgsql;

--REPORTE 6
CREATE FUNCTION reporte6(nombre_fabricante varchar, nombre_modelo varchar)
RETURNS TABLE (anho_competicion float, fabricante_nombre dw_dim_vehiculo.fabricante%TYPE, modelo_nombre dw_dim_vehiculo.modelo%TYPE, motor text, categoria dw_dim_vehiculo.categoria%TYPE, tipo_auto dw_dim_vehiculo.tipo%TYPE, nombre_equipo dw_dim_equipo.nombre %TYPE, nro_equipo dw_dim_equipo.nro_equipo %TYPE, pais_equipo dw_dim_equipo.pais %TYPE, velocidad_media dw_dim_ranking.velocidad_media%TYPE, nombre_piloto dw_dim_pilotos.nombre%TYPE, apellido_piloto dw_dim_pilotos.apellido%TYPE, nacionalidad_piloto dw_dim_pilotos.nacionalidad%TYPE, cantidad_pilotos bigint)
AS $$
BEGIN
	 RETURN QUERY 
		SELECT DISTINCT date_part('year',fe.fecha), 
		ve.fabricante, ve.modelo, concat(ve.motor_nombre,' ',ve.motor_cilindrada,' ',ve.motor_capacidad) motor, ve.categoria categoria, ve.tipo,
		eq.nombre, eq.nro_equipo, eq.pais,
		ra.velocidad_media,
		pi.nombre, pi.apellido, pi.nacionalidad,
		(SELECT COUNT (*) FROM dw_hec_evento ex WHERE ex.id_equipo=ev.id_equipo AND ex.id_ranking = ev.id_ranking) cantidad_pilotos
		FROM dw_hec_evento ev, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_equipo eq, dw_dim_pilotos pi, dw_dim_ranking ra
		WHERE ev.id_vehiculo = ve.id_vehiculo
		AND fe.id_fecha = ev.id_fecha
		AND ve.fabricante LIKE (nombre_fabricante)
		AND ve.modelo LIKE (nombre_modelo)
		AND ev.id_piloto = pi.id_piloto
		AND ev.id_equipo = eq.id_equipo
		AND ev.id_ranking = ra.id_ranking
		AND ev.id_piloto = pi.id_piloto;
END;
$$LANGUAGE plpgsql;	

--REPORTE 7
CREATE FUNCTION reporte7(anho integer)
RETURNS TABLE (nombre dw_dim_pilotos.nombre%TYPE, apellido dw_dim_pilotos.apellido%TYPE, edad interval, nacionalidad dw_dim_pilotos.nacionalidad%TYPE)
AS $$
BEGIN
	IF(anho is null) THEN
		RETURN QUERY
			SELECT DISTINCT ON (date_part('year',fe.fecha))  pi.nombre, pi.apellido, AGE(current_date,to_date(pi.fecha_nacimiento,'DD-MM-YYYY')), pi.nacionalidad
			FROM dw_hec_evento ev,dw_dim_fecha fe, dw_dim_pilotos pi
			WHERE fe.id_fecha = ev.id_fecha
			AND ev.id_piloto = pi.id_piloto 
			ORDER BY (date_part('year',fe.fecha)), 3 ASC;
	ELSE
		RETURN QUERY
			SELECT DISTINCT ON (date_part('year',fe.fecha))  pi.nombre, pi.apellido, AGE(current_date,to_date(pi.fecha_nacimiento,'DD-MM-YYYY')), pi.nacionalidad
			FROM dw_hec_evento ev,dw_dim_fecha fe, dw_dim_pilotos pi
			WHERE date_part('year',fe.fecha) = anho
			AND fe.id_fecha = ev.id_fecha
			AND ev.id_piloto = pi.id_piloto 
			ORDER BY (date_part('year',fe.fecha)), 3 ASC;
	END IF;
END;
$$LANGUAGE plpgsql;

--REPORTE 8
CREATE FUNCTION reporte8(anho integer)
RETURNS TABLE (nombre dw_dim_pilotos.nombre%TYPE, apellido dw_dim_pilotos.apellido%TYPE, edad interval, nacionalidad dw_dim_pilotos.nacionalidad%TYPE)
AS $$
BEGIN
	IF(anho is null) THEN
		RETURN QUERY
			SELECT DISTINCT ON (date_part('year',fe.fecha))  pi.nombre, pi.apellido, AGE(current_date,to_date(pi.fecha_nacimiento,'DD-MM-YYYY')), pi.nacionalidad
			FROM dw_hec_evento ev,dw_dim_fecha fe, dw_dim_pilotos pi
			WHERE fe.id_fecha = ev.id_fecha
			AND ev.id_piloto = pi.id_piloto 
			ORDER BY (date_part('year',fe.fecha)), 3 DESC;
	ELSE
		RETURN QUERY
			SELECT DISTINCT ON (date_part('year',fe.fecha))  pi.nombre, pi.apellido, AGE(current_date,to_date(pi.fecha_nacimiento,'DD-MM-YYYY')), pi.nacionalidad
			FROM dw_hec_evento ev,dw_dim_fecha fe, dw_dim_pilotos pi
			WHERE date_part('year',fe.fecha) = anho
			AND fe.id_fecha = ev.id_fecha
			AND ev.id_piloto = pi.id_piloto 
			ORDER BY (date_part('year',fe.fecha)), 3 DESC;
	END IF;
END;
$$LANGUAGE plpgsql;

--REPORTE 9
CREATE FUNCTION reporte9()
RETURNS TABLE (nombre_piloto dw_dim_pilotos.nombre%TYPE, apellido_piloto dw_dim_pilotos.apellido%TYPE, nacionalidad dw_dim_pilotos.nacionalidad%TYPE, participaciones bigint)
AS $$
BEGIN
	 RETURN QUERY
		SELECT DISTINCT pi.nombre, pi.apellido, pi.nacionalidad, (SELECT COUNT (*) FROM dw_hec_evento ei WHERE ei.id_piloto = pi.id_piloto)
		FROM dw_hec_evento ev, dw_dim_pilotos pi
		WHERE ev.id_piloto = pi.id_piloto
		GROUP BY 1,2,3,4
		ORDER BY 4 DESC;
END;
$$LANGUAGE plpgsql;	


--REPORTE 10
CREATE OR REPLACE FUNCTION reporte10 (anho_ins integer)
RETURNS TABLE (anho float, nombre_piloto varchar, apellido varchar, nacionalidad varchar)
AS $$
BEGIN
	IF (anho_ins is null) THEN
		RETURN QUERY SELECT date_part('year',fe.fecha), pi.nombre, pi.apellido,  pi.nacionalidad
		FROM dw_hec_evento ev,dw_dim_fecha fe, dw_dim_pilotos pi
		WHERE fe.id_fecha = ev.id_fecha
		AND ev.id_piloto = pi.id_piloto
		AND ev.posicion = 1 
		AND fe.fecha = (SELECT fe1.fecha
						FROM dw_hec_evento ev1,dw_dim_fecha fe1
						WHERE fe1.id_fecha = ev1.id_fecha
						AND ev1.id_piloto = ev.id_piloto
						ORDER BY 1 ASC FETCH FIRST 1 ROW ONLY); 	
	ELSE
		RETURN QUERY SELECT date_part('year',fe.fecha), pi.nombre, pi.apellido,  pi.nacionalidad
		FROM dw_hec_evento ev,dw_dim_fecha fe, dw_dim_pilotos pi
		WHERE fe.id_fecha = ev.id_fecha
		AND ev.id_piloto = pi.id_piloto
		AND ev.posicion = 1 
		AND date_part('year',fe.fecha) = anho_ins
		AND fe.fecha = (SELECT fe1.fecha
						FROM dw_hec_evento ev1,dw_dim_fecha fe1
						WHERE fe1.id_fecha = ev1.id_fecha
						AND ev1.id_piloto = ev.id_piloto
						ORDER BY 1 ASC FETCH FIRST 1 ROW ONLY); 	
	END IF;	
END;
$$LANGUAGE plpgsql;

--REPORTE 11
CREATE OR REPLACE FUNCTION reporte11 (anho integer)
RETURNS TABLE (velocidad_media dw_dim_ranking.velocidad_media%TYPE, fabricante dw_dim_vehiculo.fabricante%TYPE, modelo dw_dim_vehiculo.modelo%TYPE, nombre_equipo dw_dim_equipo.nombre%TYPE, numero_equipo dw_dim_equipo.nro_equipo%TYPE, nacionalidad dw_dim_equipo.pais%TYPE, ano float)
AS $$
BEGIN
	IF(anho is null) THEN
		RETURN QUERY SELECT DISTINCT ON (date_part('year',fe.fecha)) ra.velocidad_media, ve.fabricante, ve.modelo, eq.nombre, eq.nro_equipo, eq.pais, (date_part('year',fe.fecha))
		FROM dw_hec_evento ev, dw_dim_equipo eq, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_ranking ra
		WHERE ev.id_equipo = eq.id_equipo
		AND ev.nro_equipo = eq.nro_equipo
		AND ev.id_vehiculo = ve.id_vehiculo
		AND ev.id_fecha = fe.id_fecha 
		AND ev.id_ranking = ra.id_ranking 
		ORDER BY (date_part('year',fe.fecha)) , 1 DESC;
	ELSE 
		RETURN QUERY 
		SELECT DISTINCT ON (date_part('year',fe.fecha)) ra.velocidad_media, ve.fabricante, ve.modelo, eq.nombre, eq.nro_equipo, eq.pais, (date_part('year',fe.fecha))
		FROM dw_hec_evento ev, dw_dim_equipo eq, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_ranking ra
		WHERE ev.id_equipo = eq.id_equipo
		AND ev.nro_equipo = eq.nro_equipo
		AND ev.id_vehiculo = ve.id_vehiculo
		AND ev.id_fecha = fe.id_fecha 
		AND ev.id_ranking = ra.id_ranking 
		AND date_part('year',fe.fecha) = anho
		ORDER BY (date_part('year',fe.fecha)) , 1 DESC;
	END IF;
END;
$$LANGUAGE plpgsql;

--REPORTE 12
CREATE FUNCTION reporte12(resultados integer)
RETURNS TABLE (id_evento dw_hec_evento.id_evento%TYPE, numero_equipo dw_hec_evento.nro_equipo%TYPE, nombre_equipo dw_dim_equipo.nombre%TYPE, pais_equipo dw_dim_equipo.pais%TYPE, fabricante dw_dim_vehiculo.fabricante%TYPE, modelo dw_dim_vehiculo.modelo%TYPE, motor text, categoria dw_dim_vehiculo.categoria%TYPE, nombre_piloto dw_dim_pilotos.nombre%TYPE, apellido_piloto dw_dim_pilotos.apellido%TYPE, nacionalidad dw_dim_pilotos.nacionalidad%TYPE, posicion dw_hec_evento.posicion%TYPE, kilometraje dw_hec_evento.kilometraje%TYPE, vueltas dw_dim_ranking.nro_vueltas%TYPE, vuelta_rapida dw_dim_ranking.vuelta_rapida%TYPE, velocidad_media dw_dim_ranking.velocidad_media%TYPE, diferencia float, cantidad_pilotos bigint )
AS $$
BEGIN
	resultados = resultados * 3;
		RETURN QUERY SELECT 
		--DATOS EQUIPO 
		ev.id_evento, ev.nro_equipo, eq.nombre, eq.pais,
		--DATOS VEHICULO 
		ve.fabricante, ve.modelo, concat(ve.motor_nombre,' ',ve.motor_cilindrada,' ',ve.motor_capacidad) motor, ve.categoria categoria,
		--DATOS PILOTO
		pi.nombre, pi.apellido, pi.nacionalidad,
		--DATOS RANKING 
		ev.posicion, ev.kilometraje, ra.nro_vueltas, ra.vuelta_rapida, ra.velocidad_media,
		CASE 
			WHEN ev.posicion = 1 THEN 0
			WHEN ev.posicion != 1 THEN (SELECT ri.kilometraje - ra.kilometraje 
										FROM dw_dim_ranking ri, dw_hec_evento ei, dw_dim_fecha fi
										WHERE ri.id_ranking = ei.id_ranking
										AND ei.id_fecha = fi.id_fecha
										AND date_part('year',fe.fecha) = date_part('year',fi.fecha)
										AND ri.posicion = ra.posicion-1 FETCH FIRST 1 ROW ONLY) 
		END diferencia,
		(SELECT COUNT (*) FROM dw_hec_evento ex WHERE ex.id_equipo=ev.id_equipo AND ex.id_ranking = ev.id_ranking) cantidad_pilotos
		FROM dw_hec_evento ev, dw_dim_equipo eq, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_pilotos pi, dw_dim_ranking ra
		WHERE  ev.id_vehiculo = ve.id_vehiculo 
		AND ev.id_equipo = eq.id_equipo
		AND fe.id_fecha = ev.id_fecha
		AND ev.id_piloto = pi.id_piloto
		AND ev.id_ranking = ra.id_ranking
		ORDER BY 13 DESC 
		FETCH FIRST resultados ROWS ONLY ;
END;
$$LANGUAGE plpgsql;

--REPORTE 13
CREATE FUNCTION reporte13()
RETURNS TABLE (nombre dw_dim_pilotos.nombre%TYPE, apellido dw_dim_pilotos.apellido%TYPE, nacionalidad dw_dim_pilotos.nacionalidad%TYPE, abandonos bigint)
AS $$
BEGIN
	RETURN QUERY SELECT DISTINCT pi.nombre, pi.apellido, pi.nacionalidad, (SELECT COUNT(*)
				FROM dw_hec_evento evc2
				WHERE evc2.id_piloto = pi.id_piloto and evc2.posicion > 1 AND evc2.posicion < 4 )
	FROM dw_hec_evento ev, dw_dim_pilotos pi
	WHERE (SELECT COUNT(*)
			FROM dw_hec_evento evc
			WHERE evc.id_piloto = pi.id_piloto AND evc.posicion = 1) < 1
	AND ev.id_piloto = pi.id_piloto
	AND (SELECT COUNT(*)
				FROM dw_hec_evento evc2
				WHERE evc2.id_piloto = pi.id_piloto and evc2.posicion > 1 AND evc2.posicion < 4 ) > 0
	ORDER BY 4 DESC;
END;
$$LANGUAGE plpgsql;

--REPORTE 14
CREATE FUNCTION reporte14()
RETURNS TABLE (nombre dw_dim_pilotos.nombre%TYPE, apellido dw_dim_pilotos.apellido%TYPE, nacionalidad dw_dim_pilotos.nacionalidad%TYPE, abandonos bigint)
AS $$
BEGIN
	RETURN QUERY SELECT DISTINCT pi.nombre, pi.apellido, pi.nacionalidad, (SELECT COUNT(*)
			FROM dw_hec_evento evc
			WHERE evc.kilometraje = 0 AND evc.id_piloto = pi.id_piloto) 
	FROM dw_hec_evento ev, dw_dim_pilotos pi
	WHERE (SELECT COUNT(*)
			FROM dw_hec_evento ei
			WHERE ei.kilometraje > 0 AND ei.id_piloto = pi.id_piloto) < 1
	AND ev.id_piloto = pi.id_piloto;
END;
$$LANGUAGE plpgsql;


--REPORTE 15
CREATE FUNCTION reporte15()
RETURNS TABLE (nombre_fabricante dw_dim_vehiculo.fabricante%TYPE, victorias bigint)
AS $$
BEGIN
	 RETURN QUERY
		SELECT DISTINCT ve.fabricante, ((SELECT DISTINCT COUNT(ev1.kilometraje)
								FROM dw_hec_evento ev1, dw_dim_vehiculo ve1
								WHERE ev1.posicion = 1
								AND ev1.id_vehiculo = ve1.id_vehiculo
								AND ve1.fabricante LIKE ve.fabricante) / 3)
		FROM dw_hec_evento ev, dw_dim_vehiculo ve
		WHERE ev.id_vehiculo = ve.id_vehiculo
		ORDER BY 2 DESC,1;
END;
$$LANGUAGE plpgsql;	

--REPORTE 16
CREATE FUNCTION reporte16(anho integer)
RETURNS TABLE (id_piloto dw_dim_pilotos.id_piloto%TYPE, nombre_piloto dw_dim_pilotos.nombre%TYPE, apellido_piloto dw_dim_pilotos.apellido%TYPE, fecha_nacimiento dw_dim_pilotos.fecha_nacimiento%TYPE, fecha_fallecimiento dw_dim_pilotos.fecha_fallecimiento%TYPE, nacionalidad dw_dim_pilotos.nacionalidad%TYPE, edad interval, participaciones_totaltes bigint, primera_participacion date, podium1 bigint, podium2 bigint, podium3 bigint, corredores text, nombre_equipo dw_dim_equipo.nombre%TYPE, numero_equipo dw_dim_equipo.nro_equipo%TYPE, pais_equipo dw_dim_equipo.pais%TYPE, fabricante dw_dim_vehiculo.fabricante%TYPE, modelo dw_dim_vehiculo.modelo%TYPE, motor text, categoria dw_dim_vehiculo.categoria%TYPE)
AS $$
BEGIN
	IF(anho is null)THEN
		RETURN QUERY SELECT
		--DATOS PILOTO
		pi.id_piloto, pi.nombre, pi.apellido, pi.fecha_nacimiento,pi.fecha_fallecimiento, pi.nacionalidad, AGE(current_date,to_date(pi.fecha_nacimiento,'DD-MM-YYYY')) edad_actual,
		--DATOS PARTICIPACION
		(SELECT COUNT(*) FROM dw_hec_evento evv WHERE evv.id_piloto = pi.id_piloto) total_participaciones,
		(SELECT fe1.fecha FROM dw_hec_evento ev1,dw_dim_fecha fe1 WHERE fe1.id_fecha = ev1.id_fecha AND ev1.id_piloto = pi.id_piloto ORDER BY 1 ASC FETCH FIRST 1 ROW ONLY) primera_participacion,
		(SELECT COUNT(*) FROM dw_hec_evento ev1 WHERE ev1.id_piloto = pi.id_piloto AND ev1.posicion=1) podium1,
		(SELECT COUNT(*) FROM dw_hec_evento ev1 WHERE ev1.id_piloto = pi.id_piloto AND ev1.posicion=1) podium2,
		(SELECT COUNT(*) FROM dw_hec_evento ev1 WHERE ev1.id_piloto = pi.id_piloto AND ev1.posicion=1) podium3,
		--Detalles Participacion 
		(SELECT CONCAT (pi2.nombre,' ',pi2.apellido,' - ',pi3.nombre,' ',pi3.apellido)
		FROM dw_dim_pilotos pi2, dw_dim_pilotos pi3, dw_hec_evento ev2, dw_hec_evento ev3
		WHERE pi2.id_piloto = ev2.id_piloto AND pi3.id_piloto = ev3.id_piloto
		AND ev2.id_equipo = ev.id_equipo AND ev3.id_equipo = ev.id_equipo 
		AND ev2.id_fecha = ev.id_fecha AND ev3.id_fecha=ev.id_fecha
		AND pi2.id_piloto != pi.id_piloto AND pi3.id_piloto != pi.id_piloto AND pi2.id_piloto != pi3.id_piloto 
		FETCH FIRST 1 ROW ONLY) corredores,
		--Datos Equipo
		 eq.nombre, eq.nro_equipo, eq.pais,
		 --DATOS VEHICULO 
		ve.fabricante, ve.modelo, concat(ve.motor_nombre,' ',ve.motor_cilindrada,' ',ve.motor_capacidad) motor, ve.categoria categoria
		FROM dw_hec_evento ev, dw_dim_equipo eq, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_pilotos pi, dw_dim_ranking ra
		WHERE ev.id_vehiculo = ve.id_vehiculo 
		AND ev.id_equipo = eq.id_equipo
		AND fe.id_fecha = ev.id_fecha
		AND ev.id_piloto = pi.id_piloto
		AND ev.id_ranking = ra.id_ranking
		AND pi.genero LIKE ('Femenino')
		ORDER BY 1;
	ELSE
		RETURN QUERY SELECT
		--DATOS PILOTO
		pi.id_piloto, pi.nombre, pi.apellido, pi.fecha_nacimiento,pi.fecha_fallecimiento, pi.nacionalidad, AGE(current_date,to_date(pi.fecha_nacimiento,'DD-MM-YYYY')) edad_actual,
		--DATOS PARTICIPACION
		(SELECT COUNT(*) FROM dw_hec_evento evv WHERE evv.id_piloto = pi.id_piloto) total_participaciones,
		(SELECT fe1.fecha FROM dw_hec_evento ev1,dw_dim_fecha fe1 WHERE fe1.id_fecha = ev1.id_fecha AND ev1.id_piloto = pi.id_piloto ORDER BY 1 ASC FETCH FIRST 1 ROW ONLY) primera_participacion,
		(SELECT COUNT(*) FROM dw_hec_evento ev1 WHERE ev1.id_piloto = pi.id_piloto AND ev1.posicion=1) podium1,
		(SELECT COUNT(*) FROM dw_hec_evento ev1 WHERE ev1.id_piloto = pi.id_piloto AND ev1.posicion=1) podium2,
		(SELECT COUNT(*) FROM dw_hec_evento ev1 WHERE ev1.id_piloto = pi.id_piloto AND ev1.posicion=1) podium3,
		--Detalles Participacion 
		(SELECT CONCAT (pi2.nombre,' ',pi2.apellido,' - ',pi3.nombre,' ',pi3.apellido)
		FROM dw_dim_pilotos pi2, dw_dim_pilotos pi3, dw_hec_evento ev2, dw_hec_evento ev3
		WHERE pi2.id_piloto = ev2.id_piloto AND pi3.id_piloto = ev3.id_piloto
		AND ev2.id_equipo = ev.id_equipo AND ev3.id_equipo = ev.id_equipo 
		AND ev2.id_fecha = ev.id_fecha AND ev3.id_fecha=ev.id_fecha
		AND pi2.id_piloto != pi.id_piloto AND pi3.id_piloto != pi.id_piloto AND pi2.id_piloto != pi3.id_piloto
		FETCH FIRST 1 ROW ONLY) corredores,
		--Datos Equipo
		 eq.nombre, eq.nro_equipo, eq.pais,
		 --DATOS VEHICULO 
		ve.fabricante, ve.modelo, concat(ve.motor_nombre,' ',ve.motor_cilindrada,' ',ve.motor_capacidad) motor, ve.categoria categoria
		FROM dw_hec_evento ev, dw_dim_equipo eq, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_pilotos pi, dw_dim_ranking ra
		WHERE ev.id_vehiculo = ve.id_vehiculo 
		AND ev.id_equipo = eq.id_equipo
		AND fe.id_fecha = ev.id_fecha
		AND ev.id_piloto = pi.id_piloto
		AND ev.id_ranking = ra.id_ranking
		AND pi.genero LIKE ('Femenino')
		AND date_part('year',fe.fecha) = anho
		ORDER BY 1;
	END IF;
	
END
$$LANGUAGE plpgsql;