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