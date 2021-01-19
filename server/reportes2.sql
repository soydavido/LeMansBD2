--REPORTE 4
CREATE FUNCTION reporte4(anho integer, num_equipo integer)
RETURNS TABLE (id_evento evento.id%TYPE, posicioncarrera ranking.posicion%TYPE, kmcarrera ranking.kilometraje%TYPE, vueltascarrera ranking.vueltas%TYPE, vuelta_rapida_carrera varchar, diferencia float, posicionensayo ranking.posicion%TYPE, vuelta_rapida_ensayo varchar, numero_equipo equipo.numero_equipo%TYPE, nombre_equipo equipo.nombre%TYPE, fabricante fabricante.nombre%TYPE, modelo modelo.nombre%TYPE, caracteristicas_vehiculo vehiculo.caracteristicas%TYPE, categoria_vehiculo vehiculo.categoria%TYPE, nombre_piloto varchar, nombre2 varchar, apellido varchar, apellido2 varchar, nacionalidad varchar )
AS $$
BEGIN
	IF(anho is null) THEN
		RETURN QUERY SELECT 
		DISTINCT rc.id_evento, 
		--Carrera
		rc.posicion poscarrera, rc.kilometraje kmcarrera, rc.vueltas vueltascarrera, (rc.desempeno).vuelta_mas_rapida vueltacarrera,
		(SELECT ri.kilometraje - rc.kilometraje FROM ranking ri WHERE ri.posicion = rc.posicion-1 AND ri.id_evento = rc.id_evento) diferencia,
		--Ensayo
		re.posicion posensayo, (re.desempeno).vuelta_mas_rapida vueltaensayo,
		--Equipo
		e1.numero_equipo, e1.nombre nombreequipo,
		--Vehiculo
		f1.nombre fabricante, m1.nombre modelo, v1.caracteristicas, v1.categoria,
		--Piloto
		(p1.informacion).nombre, (p1.informacion).nombre2, (p1.informacion).apellido, (p1.informacion).apellido2, nac1.gentilicio  
		FROM equipo e1, ranking rc, evento ec, ranking re, evento ee,
		piloto p1, contrato c1, nacionalidad nac1, vehiculo v1, modelo m1, fabricante f1
		WHERE e1.numero_equipo = num_equipo
		AND rc.id_equipo = e1.id AND re.id_equipo = e1.id
		AND ec.id = rc.id_evento AND ee.id = re.id_evento
		AND ec.tipo = 'Carrera' AND ee.tipo = 'Ensayo'
		AND ee.ano = ec.ano
		AND c1.id_equipo = e1.id AND c1.id_piloto = p1.id
		AND ec.ano BETWEEN date_part('year',(c1.duracion).fecha_inicial) AND date_part('year',(c1.duracion).fecha_final)
		AND nac1.id = p1.id_nacionalidad
		AND v1.id = rc.id_vehiculo AND v1.id_modelo = m1.id AND m1.id_fabricante = f1.id;
	ELSE
		RETURN QUERY SELECT 
		DISTINCT rc.id_evento, 
		--Carrera
		rc.posicion poscarrera, rc.kilometraje kmcarrera, rc.vueltas vueltascarrera, (rc.desempeno).vuelta_mas_rapida vueltacarrera,
		(SELECT ri.kilometraje - rc.kilometraje FROM ranking ri WHERE ri.posicion = rc.posicion-1 AND ri.id_evento = rc.id_evento) diferencia,
		--Ensayo
		re.posicion posensayo, (re.desempeno).vuelta_mas_rapida vueltaensayo,
		--Equipo
		e1.numero_equipo, e1.nombre nombreequipo,
		--Vehiculo
		f1.nombre fabricante, m1.nombre modelo, v1.caracteristicas, v1.categoria,
		--Piloto
		(p1.informacion).nombre, (p1.informacion).nombre2, (p1.informacion).apellido, (p1.informacion).apellido2, nac1.gentilicio  
		FROM equipo e1, ranking rc, evento ec, ranking re, evento ee,
		piloto p1, contrato c1, nacionalidad nac1, vehiculo v1, modelo m1, fabricante f1
		WHERE e1.numero_equipo = num_equipo
		AND rc.id_equipo = e1.id AND re.id_equipo = e1.id
		AND ec.id = rc.id_evento AND ee.id = re.id_evento
		AND ec.tipo = 'Carrera' AND ee.tipo = 'Ensayo'
		AND ee.ano = anho AND ee.ano = ec.ano
		AND c1.id_equipo = e1.id AND c1.id_piloto = p1.id
		AND ec.ano BETWEEN date_part('year',(c1.duracion).fecha_inicial) AND date_part('year',(c1.duracion).fecha_final)
		AND nac1.id = p1.id_nacionalidad
		AND v1.id = rc.id_vehiculo AND v1.id_modelo = m1.id AND m1.id_fabricante = f1.id;
	END IF;
END;
$$LANGUAGE plpgsql;

--REPORTE 7
CREATE FUNCTION reporte7(anho integer)
RETURNS TABLE (id_evento evento.id%TYPE, nombre_equipo equipo.nombre%TYPE, numero_equipo equipo.numero_equipo%TYPE, nombre_piloto varchar, nombre2 varchar, apellido varchar, apellido2 varchar, nacionalidad varchar, edad interval)
AS $$
BEGIN
	IF(anho is null) THEN
		RETURN QUERY
		SELECT DISTINCT r1.id_evento, e1.nombre nombreequipo, e1.numero_equipo numeroequipo , 
		(p1.informacion).nombre, (p1.informacion).nombre2, (p1.informacion).apellido, (p1.informacion).apellido2, nac1.gentilicio,
		AGE(current_date,to_date((p1.informacion).fecha_nacimiento,'DD-MM-YYYY'))
		FROM ranking r1, piloto p1, equipo e1, contrato c1, nacionalidad nac1, evento ev1
		WHERE p1.id = c1.id_piloto AND e1.id = c1.id_equipo
		AND r1.id_equipo = e1.id
		AND nac1.id = p1.id_nacionalidad
		AND r1.id_evento = ev1.id AND ev1.tipo = 'Carrera'
		AND ev1.ano BETWEEN date_part('year',(c1.duracion).fecha_inicial) AND date_part('year',(c1.duracion).fecha_final)
		GROUP BY 1,2,3,4,5,6,7,8,9
		ORDER BY 9,8,2,1,3,4,5,6,7
		FETCH FIRST 1 ROW ONLY;
	ELSE
		RETURN QUERY
		SELECT DISTINCT r1.id_evento, e1.nombre nombreequipo, e1.numero_equipo numeroequipo , 
		(p1.informacion).nombre, (p1.informacion).nombre2, (p1.informacion).apellido, (p1.informacion).apellido2, nac1.gentilicio,
		AGE(current_date,to_date((p1.informacion).fecha_nacimiento,'DD-MM-YYYY'))
		FROM ranking r1, piloto p1, equipo e1, contrato c1, nacionalidad nac1, evento ev1
		WHERE p1.id = c1.id_piloto AND e1.id = c1.id_equipo
		AND r1.id_equipo = e1.id
		AND nac1.id = p1.id_nacionalidad
		AND r1.id_evento = ev1.id AND ev1.ano = anho AND ev1.tipo = 'Carrera'
		AND ev1.ano BETWEEN date_part('year',(c1.duracion).fecha_inicial) AND date_part('year',(c1.duracion).fecha_final)
		GROUP BY 1,2,3,4,5,6,7,8,9
		ORDER BY 9,8,2,1,3,4,5,6,7
		FETCH FIRST 1 ROW ONLY;
	END IF;
END;
$$LANGUAGE plpgsql;

--REPORTE 8
CREATE FUNCTION reporte8(anho integer)
RETURNS TABLE (id_evento evento.id%TYPE, nombre_equipo equipo.nombre%TYPE, numero_equipo equipo.numero_equipo%TYPE, nombre_piloto varchar, nombre2 varchar, apellido varchar, apellido2 varchar, nacionalidad varchar, edad interval)
AS $$
BEGIN
	IF(anho is null) THEN
		RETURN QUERY
		SELECT DISTINCT r1.id_evento, e1.nombre nombreequipo, e1.numero_equipo numeroequipo , 
		(p1.informacion).nombre, (p1.informacion).nombre2, (p1.informacion).apellido, (p1.informacion).apellido2, nac1.gentilicio,
		AGE(current_date,to_date((p1.informacion).fecha_nacimiento,'DD-MM-YYYY'))
		FROM ranking r1, piloto p1, equipo e1, contrato c1, nacionalidad nac1, evento ev1
		WHERE p1.id = c1.id_piloto AND e1.id = c1.id_equipo
		AND r1.id_equipo = e1.id
		AND nac1.id = p1.id_nacionalidad
		AND r1.id_evento = ev1.id AND ev1.tipo = 'Carrera'
		AND ev1.ano BETWEEN date_part('year',(c1.duracion).fecha_inicial) AND date_part('year',(c1.duracion).fecha_final)
		GROUP BY 1,2,3,4,5,6,7,8,9
		ORDER BY 9 DESC,8,2,1,3,4,5,6,7
		FETCH FIRST 1 ROW ONLY;
	ELSE
		RETURN QUERY
		SELECT DISTINCT r1.id_evento, e1.nombre nombreequipo, e1.numero_equipo numeroequipo , 
		(p1.informacion).nombre, (p1.informacion).nombre2, (p1.informacion).apellido, (p1.informacion).apellido2, nac1.gentilicio,
		AGE(current_date,to_date((p1.informacion).fecha_nacimiento,'DD-MM-YYYY'))
		FROM ranking r1, piloto p1, equipo e1, contrato c1, nacionalidad nac1, evento ev1
		WHERE p1.id = c1.id_piloto AND e1.id = c1.id_equipo
		AND r1.id_equipo = e1.id
		AND nac1.id = p1.id_nacionalidad
		AND r1.id_evento = ev1.id AND ev1.ano = anho AND ev1.tipo = 'Carrera'
		AND ev1.ano BETWEEN date_part('year',(c1.duracion).fecha_inicial) AND date_part('year',(c1.duracion).fecha_final)
		GROUP BY 1,2,3,4,5,6,7,8,9
		ORDER BY 9 DESC,8,2,1,3,4,5,6,7
		FETCH FIRST 1 ROW ONLY;
	END IF;
END;
$$LANGUAGE plpgsql;

--REPORTE 11
CREATE FUNCTION reporte11(fecha_usr integer, tipo_evento varchar)
RETURNS TABLE (nombre_equipo equipo.nombre%TYPE, numero_equipo equipo.numero_equipo%TYPE, anho float, fabricante fabricante.nombre%TYPE, modelo modelo.nombre%TYPE, velocidad float)
AS $$
BEGIN
	IF (fecha_usr is NULL) THEN
		RETURN QUERY 
		SELECT
		eq1.nombre, eq1.numero_equipo, date_part('year',r1.fecha),
		--Vehiculo
		f1.nombre, m1.nombre,
		--Ranking
		(r1.desempeno).velocidad_media
		FROM ranking r1, evento ev1, equipo eq1, vehiculo v1, modelo m1, fabricante f1
		WHERE ev1.id = r1.id_evento
		AND ev1.tipo = tipo_evento
		AND r1.id_equipo = eq1.id
		AND r1.id_vehiculo = v1.id AND v1.id_modelo = m1.id AND f1.id = m1.id_fabricante
		ORDER BY 6 DESC
		FETCH FIRST 33 ROWS ONLY; --PARAMETRIZAR AQUI
	ELSE
		RETURN QUERY 
		SELECT
		eq1.nombre, eq1.numero_equipo, date_part('year',r1.fecha),
		--Vehiculo
		f1.nombre, m1.nombre,
		--Ranking
		(r1.desempeno).velocidad_media
		FROM ranking r1, evento ev1, equipo eq1, vehiculo v1, modelo m1, fabricante f1
		WHERE ev1.id = r1.id_evento
		AND ev1.ano = fecha_usr
		AND ev1.tipo = tipo_evento
		AND r1.id_equipo = eq1.id
		AND r1.id_vehiculo = v1.id AND v1.id_modelo = m1.id AND f1.id = m1.id_fabricante
		ORDER BY 6 DESC
		FETCH FIRST 33 ROWS ONLY; --PARAMETRIZAR AQUI
	END IF;
END;
$$LANGUAGE plpgsql;

--REPORTE 12
CREATE FUNCTION reporte12(cantidad integer)
RETURNS TABLE (nombre_equipo equipo.nombre%TYPE, numero_equipo equipo.numero_equipo%TYPE, anho float, marca fabricante.nombre%TYPE, modelo modelo.nombre%TYPE, motor vehiculo.caracteristicas%TYPE, categoria vehiculo.categoria%TYPE, kilometraje ranking.kilometraje%TYPE, vueltas ranking.vueltas%TYPE, velocidad_media float, vuelta_rapida varchar, diferencia float,nombre_piloto varchar, nombre2 varchar, apellido varchar, apellido2 varchar, nacionalidad varchar )
AS $$
DECLARE
	qty integer;
BEGIN
	qty := cantidad*3;
	RETURN QUERY
	SELECT
	eq1.nombre, eq1.numero_equipo, date_part('year',r1.fecha),
	--Vehiculo
	f1.nombre, m1.nombre, v1.caracteristicas, v1.categoria,
	--Ranking
	r1.kilometraje, r1.vueltas, (r1.desempeno).velocidad_media, (r1.desempeno).vuelta_mas_rapida,
	(SELECT ri.kilometraje - r1.kilometraje FROM ranking ri WHERE ri.posicion = r1.posicion-1 AND ri.id_evento = r1.id_evento) diferencia,
	--Piloto
	(p1.informacion).nombre, (p1.informacion).nombre2, (p1.informacion).apellido, (p1.informacion).apellido2, nac1.gentilicio  
	FROM ranking r1, evento ev1, equipo eq1, vehiculo v1, modelo m1, fabricante f1,
	piloto p1, contrato c1, nacionalidad nac1
	WHERE ev1.id = r1.id_evento
	AND ev1.tipo = 'Carrera'
	AND r1.id_equipo = eq1.id
	AND r1.id_vehiculo = v1.id AND v1.id_modelo = m1.id AND f1.id = m1.id_fabricante
	AND c1.id_equipo = eq1.id AND c1.id_piloto = p1.id
	AND date_part('year',r1.fecha) BETWEEN date_part('year',(c1.duracion).fecha_inicial) AND date_part('year',(c1.duracion).fecha_final)
	AND nac1.id = p1.id_nacionalidad
	ORDER BY 8 DESC
	FETCH FIRST qty ROWS ONLY; --PARAMETRIZAR AQUI		
END;
$$LANGUAGE plpgsql;	

--REPORTE 15
CREATE FUNCTION reporte15()
RETURNS TABLE (nombre_fabricante fabricante.nombre%TYPE, victorias bigint)
AS $$
BEGIN
	 RETURN QUERY
		SELECT DISTINCT f1.nombre, (SELECT count (m1.nombre)
			FROM ranking r1, vehiculo v1,modelo m1, evento e1
			WHERE r1.id_vehiculo = v1.id 
			AND r1.posicion = 1 AND v1.id_modelo = m1.id AND m1.id_fabricante = f1.id 
			AND e1.id = r1.id_evento AND e1.tipo = 'Carrera')
		FROM fabricante f1, modelo m1, vehiculo v1
		ORDER BY 2 DESC ,1;
END;
$$LANGUAGE plpgsql;	