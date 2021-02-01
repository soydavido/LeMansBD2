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

--REPORTE 10
CREATE OR REPLACE FUNCTION reporte10 (anho_ins integer)
RETURNS TABLE (anho float, nombre_piloto varchar, nombre2 varchar, apellido varchar, apellido2 varchar, nacionalidad varchar)
AS $$
BEGIN
	SELECT date_part('year',fe.fecha), pi.nombre, pi.apellido,  pi.nacionalidad
	FROM dw_hec_evento ev,dw_dim_fecha fe, dw_dim_pilotos pi
	WHERE fe.id_fecha = ev.id_fecha
	AND ev.id_piloto = pi.id_piloto
	AND ev.posicion = 1 
	AND fe.fecha = (SELECT fe1.fecha
					FROM dw_hec_evento ev1,dw_dim_fecha fe1
					WHERE fe1.id_fecha = ev1.id_fecha
					AND ev1.id_piloto = ev.id_piloto
					ORDER BY 1 ASC FETCH FIRST 1 ROW ONLY); 	

	END IF;
END;
$$LANGUAGE plpgsql;

--REPORTE 11
CREATE FUNCTION reporte11(anho integer)
RETURNS TABLE (velocidad_media dw_dim_ranking.velocidad_media%TYPE, fabricante dw_dim_vehiculo.fabricante%TYPE, modelo dw_dim_vehiculo.modelo%TYPE, nombre_equipo dw_dim_equipo.nombre%TYPE, numero_equipo dw_dim_equipo.nro_equipo%TYPE, nacionalidad dw_dim_equipo.pais%TYPE, ano integer)
AS $$
BEGIN
	IF(anho is null) THEN
		RETURN QUERY
			SELECT DISTINCT ra.velocidad_media, ve.fabricante, ve.modelo, eq.nombre, eq.nro_equipo, eq.pais, 2000
			FROM dw_hec_evento ev, dw_dim_equipo eq, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_ranking ra
			WHERE ev.id_equipo = eq.id_equipo
			AND ev.nro_equipo = eq.nro_equipo
			AND ev.id_vehiculo = ve.id_vehiculo
			AND ev.id_fecha = fe.id_fecha 
			AND ev.id_ranking = ra.id_ranking 
			ORDER BY 1 DESC 
			FETCH FIRST 1 ROW ONLY;
	ELSE
		RETURN QUERY
			SELECT DISTINCT ra.velocidad_media, ve.fabricante, ve.modelo, eq.nombre, eq.nro_equipo, eq.pais, 2000
			FROM dw_hec_evento ev, dw_dim_equipo eq, dw_dim_vehiculo ve, dw_dim_fecha fe, dw_dim_ranking ra
			WHERE ev.id_equipo = eq.id_equipo
			AND ev.nro_equipo = eq.nro_equipo
			AND ev.id_vehiculo = ve.id_vehiculo
			AND ev.id_fecha = fe.id_fecha 
			AND date_part('year',fe.fecha) = anho
			AND ev.id_ranking = ra.id_ranking 
			ORDER BY 1 DESC 
			FETCH FIRST 1 ROW ONLY;
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

--REPORTE 15
CREATE FUNCTION reporte15()
RETURNS TABLE (nombre_fabricante fabricante.nombre%TYPE, victorias bigint)
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
		ORDER BY 2 DESC,1
END;
$$LANGUAGE plpgsql;	

--REPORTE 16
CREATE FUNCTION reporte16(anho_ins integer)
RETURNS TABLE (posicion ranking.posicion%TYPE, anho_actual float, id_piloto piloto.id%TYPE,nombre_piloto varchar, nombre2 varchar, apellido varchar, apellido2 varchar, nacionalidad varchar, fecha_nacimiento varchar, fecha_fallecimiento varchar, nombre_pais varchar, edad interval, nombre_equipo equipo.nombre%TYPE, id_equipo equipo.id%TYPE, numero_equipo equipo.numero_equipo%TYPE, primera_participacion float, total_participaciones bigint, pos1 bigint, pos2 bigint, pos3 bigint, companheros text,fabricante fabricante.nombre%TYPE, modelo modelo.nombre%TYPE, categoria vehiculo.categoria%TYPE)
AS $$
BEGIN
	 IF (anho_ins is NULL) THEN
	 	RETURN QUERY
			SELECT r1.posicion, date_part('year',r1.fecha),
			p1.id, (p1.informacion).nombre, (p1.informacion).nombre2, (p1.informacion).apellido, (p1.informacion).apellido2, nac1.gentilicio, (p1.informacion).fecha_nacimiento, (p1.informacion).fecha_fallecimiento, nac1.nombre_pais, AGE(to_date((p1.informacion).fecha_nacimiento,'DD-MM-YYYY')),
			eq1.nombre, eq1.id, eq1.numero_equipo, (SELECT date_part ('year',(cip1.duracion).fecha_inicial) FROM contrato cip1 WHERE cip1.id_piloto = 140 ORDER BY date_part ASC FETCH FIRST 1 ROW ONLY) as primera_participacion,
			(SELECT COUNT (rpp.posicion) FROM ranking rpp, contrato cpp, evento evpp WHERE cpp.id_equipo = rpp.id_equipo AND cpp.id_piloto = p1.id AND rpp.id_evento = evpp.id AND evpp.tipo = 'Carrera' AND date_part('year',rpp.fecha) BETWEEN date_part('year',(cpp.duracion).fecha_inicial) AND date_part('year',(cpp.duracion).fecha_final)) participaciones,
			(SELECT COUNT (rp1.posicion) FROM ranking rp1, contrato cp1, evento evp1 WHERE rp1.posicion = 1 AND cp1.id_equipo = rp1.id_equipo AND cp1.id_piloto = p1.id AND rp1.id_evento = evp1.id AND evp1.tipo = 'Carrera' AND date_part('year',rp1.fecha) BETWEEN date_part('year',(cp1.duracion).fecha_inicial) AND date_part('year',(cp1.duracion).fecha_final)) posicion1,
			(SELECT COUNT (rp2.posicion) FROM ranking rp2, contrato cp2, evento evp2 WHERE rp2.posicion = 2 AND cp2.id_equipo = rp2.id_equipo AND cp2.id_piloto = p1.id AND rp2.id_evento = evp2.id AND evp2.tipo = 'Carrera' AND date_part('year',rp2.fecha) BETWEEN date_part('year',(cp2.duracion).fecha_inicial) AND date_part('year',(cp2.duracion).fecha_final)) posicion2,
			(SELECT COUNT (rp3.posicion) FROM ranking rp3, contrato cp3, evento evp3 WHERE rp3.posicion = 3 AND cp3.id_equipo = rp3.id_equipo AND cp3.id_piloto = p1.id AND rp3.id_evento = evp3.id AND evp3.tipo = 'Carrera' AND date_part('year',rp3.fecha) BETWEEN date_part('year',(cp3.duracion).fecha_inicial) AND date_part('year',(cp3.duracion).fecha_final)) posicion3,
			((SELECT CONCAT((pa1.informacion).nombre,' ',(pa1.informacion).apellido,' - ',(pa2.informacion).nombre,' ',(pa2.informacion).apellido) FROM piloto pa1, contrato ca1, piloto pa2, contrato ca2 WHERE ca1.id_equipo = eq1.id AND ca1.id_piloto = pa1.id AND fecha_en_periodo_contrato( r1.fecha,eq1.id,ca1.id_piloto) = true AND ca2.id_equipo = eq1.id AND ca2.id_piloto = pa2.id AND fecha_en_periodo_contrato( r1.fecha,eq1.id,ca2.id_piloto) = true AND pa1.id != pa2.id AND p1.id != pa1.id AND p1.id != pa2.id FETCH FIRST 1 ROW ONLY)) corredores,
			f1.nombre, m1.nombre, v1.categoria
			FROM equipo eq1, piloto p1, ranking r1, contrato c1, evento e1, vehiculo v1, modelo m1, fabricante f1, nacionalidad nac1
			WHERE r1.id_equipo = eq1.id 
			AND eq1.id = c1.id_equipo AND p1.id = c1.id_piloto 
			AND date_part('year',r1.fecha) BETWEEN date_part('year',(c1.duracion).fecha_inicial) AND date_part('year',(c1.duracion).fecha_final)
			AND (p1.informacion).genero = 'F'
			AND r1.id_evento = e1.id AND e1.tipo = 'Carrera'
			AND r1.id_vehiculo = v1.id
			AND nac1.id = p1.id_nacionalidad
			AND v1.id_modelo = m1.id AND m1.id_fabricante = f1.id
			GROUP BY 4,5,6,7,2,1,3,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24;
	 ELSE
	 	RETURN QUERY
	 		SELECT r1.posicion, date_part('year',r1.fecha),
			p1.id, (p1.informacion).nombre, (p1.informacion).nombre2, (p1.informacion).apellido, (p1.informacion).apellido2, nac1.gentilicio, (p1.informacion).fecha_nacimiento, (p1.informacion).fecha_fallecimiento, nac1.nombre_pais, AGE(to_date((p1.informacion).fecha_nacimiento,'DD-MM-YYYY')),
			eq1.nombre, eq1.id, eq1.numero_equipo, (SELECT date_part ('year',(cip1.duracion).fecha_inicial) FROM contrato cip1 WHERE cip1.id_piloto = 140 ORDER BY date_part ASC FETCH FIRST 1 ROW ONLY) as primera_participacion,
			(SELECT COUNT (rpp.posicion) FROM ranking rpp, contrato cpp, evento evpp WHERE cpp.id_equipo = rpp.id_equipo AND cpp.id_piloto = p1.id AND rpp.id_evento = evpp.id AND evpp.tipo = 'Carrera' AND date_part('year',rpp.fecha) BETWEEN date_part('year',(cpp.duracion).fecha_inicial) AND date_part('year',(cpp.duracion).fecha_final)) participaciones,
			(SELECT COUNT (rp1.posicion) FROM ranking rp1, contrato cp1, evento evp1 WHERE rp1.posicion = 1 AND cp1.id_equipo = rp1.id_equipo AND cp1.id_piloto = p1.id AND rp1.id_evento = evp1.id AND evp1.tipo = 'Carrera' AND date_part('year',rp1.fecha) BETWEEN date_part('year',(cp1.duracion).fecha_inicial) AND date_part('year',(cp1.duracion).fecha_final)) posicion1,
			(SELECT COUNT (rp2.posicion) FROM ranking rp2, contrato cp2, evento evp2 WHERE rp2.posicion = 2 AND cp2.id_equipo = rp2.id_equipo AND cp2.id_piloto = p1.id AND rp2.id_evento = evp2.id AND evp2.tipo = 'Carrera' AND date_part('year',rp2.fecha) BETWEEN date_part('year',(cp2.duracion).fecha_inicial) AND date_part('year',(cp2.duracion).fecha_final)) posicion2,
			(SELECT COUNT (rp3.posicion) FROM ranking rp3, contrato cp3, evento evp3 WHERE rp3.posicion = 3 AND cp3.id_equipo = rp3.id_equipo AND cp3.id_piloto = p1.id AND rp3.id_evento = evp3.id AND evp3.tipo = 'Carrera' AND date_part('year',rp3.fecha) BETWEEN date_part('year',(cp3.duracion).fecha_inicial) AND date_part('year',(cp3.duracion).fecha_final)) posicion3,
			((SELECT CONCAT((pa1.informacion).nombre,' ',(pa1.informacion).apellido,' - ',(pa2.informacion).nombre,' ',(pa2.informacion).apellido) FROM piloto pa1, contrato ca1, piloto pa2, contrato ca2 WHERE ca1.id_equipo = eq1.id AND ca1.id_piloto = pa1.id AND fecha_en_periodo_contrato( r1.fecha,eq1.id,ca1.id_piloto) = true AND ca2.id_equipo = eq1.id AND ca2.id_piloto = pa2.id AND fecha_en_periodo_contrato( r1.fecha,eq1.id,ca2.id_piloto) = true AND pa1.id != pa2.id AND p1.id != pa1.id AND p1.id != pa2.id FETCH FIRST 1 ROW ONLY)) corredores,
			f1.nombre, m1.nombre, v1.categoria
			FROM equipo eq1, piloto p1, ranking r1, contrato c1, evento e1, vehiculo v1, modelo m1, fabricante f1, nacionalidad nac1
			WHERE r1.id_equipo = eq1.id 
			AND eq1.id = c1.id_equipo AND p1.id = c1.id_piloto 
			AND date_part('year',r1.fecha) BETWEEN date_part('year',(c1.duracion).fecha_inicial) AND date_part('year',(c1.duracion).fecha_final)
			AND (p1.informacion).genero = 'F'
			AND r1.id_evento = e1.id AND e1.tipo = 'Carrera'
			AND r1.id_vehiculo = v1.id
			AND nac1.id = p1.id_nacionalidad
			AND v1.id_modelo = m1.id AND m1.id_fabricante = f1.id
			AND date_part('year',r1.fecha) = anho_ins
			GROUP BY 4,5,6,7,2,1,3,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24;
	 END IF;
END;
$$LANGUAGE plpgsql;	