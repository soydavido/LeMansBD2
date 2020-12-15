----------------------------------- REPORTE 1 --------------------------------------------

--Si es carrera

SELECT 
--RANKING
r.posicion, r.vueltas, r.kilometraje, 
--INFORMACION EQUIPO
e.numero_equipo, e.nombre as nombreequipo, 
--INFORMACION VEHICULO
f.nombre, m.nombre,v.categoria
FROM ranking r, evento ev, vehiculo v, modelo m, equipo e, fabricante f
WHERE r.id_evento = ev.id
AND ev.tipo = 'Carrera'			    --Se sustituira por el insertado por el usuario
AND ev.ano=2019						--Se sustituira por el insertado por el usuario
AND v.categoria = 'LM-P1'			--Se sustituira por el insertado por el usuario
AND v.id = r.id_vehiculo
AND m.id = v.id_modelo
AND r.id_equipo = e.id
AND f.id = m.id_fabricante

--Si es ensayo

SELECT 
--RANKING
r.posicion, r.vueltas, r.kilometraje, 
--INFORMACION EQUIPO
e.numero_equipo, e.nombre as nombreequipo, 
--INFORMACION VEHICULO
f.nombre, m.nombre,v.categoria
FROM ranking r, evento ev, vehiculo v, modelo m, equipo e, fabricante f
WHERE r.id_evento = ev.id
AND ev.tipo = 'Ensayo'			    --Se sustituira por el insertado por el usuario
AND ev.ano=2019						--Se sustituira por el insertado por el usuario
AND v.categoria = 'LM-P1'			--Se sustituira por el insertado por el usuario
AND v.id = r.id_vehiculo
AND m.id = v.id_modelo
AND r.id_equipo = e.id
AND f.id = m.id_fabricante


--Reporte 2

SELECT 
--RANKING
r.posicion, r.vueltas, r.kilometraje, 
--INFORMACION EQUIPO
e.numero_equipo, e.nombre as nombreequipo, 
--INFORMACION VEHICULO
f.nombre, m.nombre,v.categoria
FROM ranking r, evento ev, vehiculo v, modelo m, equipo e, fabricante f, ranking_por_hora rh
WHERE r.id_evento = ev.id
AND ev.tipo = 'Ensayo'			   --Se sustituira por el insertado por el usuario
AND ev.ano=2019					   --Se sustituira por el insertado por el usuario
AND v.categoria = 'LM-P1'			--Se sustituira por el insertado por el usuario
AND v.id = r.id_vehiculo
AND m.id = v.id_modelo
AND r.id_equipo = e.id
AND f.id = m.id_fabricante
AND rh.id_ranking = r.id
AND rh.hora = 1 					--Se sustituira por el insertado por el usuario


--Reporte 3

SELECT 
--RANKING
r.posicion, r.vueltas, r.kilometraje, 
--INFORMACION EQUIPO
e.numero_equipo, e.nombre as nombreequipo, 
--INFORMACION VEHICULO
f.nombre, m.nombre,v.categoria
FROM ranking r, evento ev, vehiculo v, modelo m, equipo e, fabricante f
WHERE r.id_evento = ev.id
AND ev.tipo = 'Carrera'
AND ev.ano=2019
AND v.id = r.id_vehiculo
AND m.id = v.id_modelo
AND r.id_equipo = e.id
AND f.id = m.id_fabricante
AND r.posicion =1