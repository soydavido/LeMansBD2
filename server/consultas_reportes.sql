----------------------------------- REPORTE 1 --------------------------------------------

--Si es carrera

SELECT
--Datos Equipo
e.nombre as NombreEquipo, e.numero_equipo as NumeroEquipo, 
--Datos Vehiculo
m.nombre as NombreVehiculo, v.categoria as CategoriaVehiculo,
--v.caracteristicas as MotorVehiculo,
--Datos Ranking Carrera Falta velocidad media y vuelta mas rapida
r.posicion PosicionCarrera, r.kilometraje KilometrajeCarrera, r.vueltas VueltasCarrera
FROM equipo e, vehiculo v, modelo m, ranking r, evento ev
WHERE m.id = v.id_modelo
AND e.id = v.id_equipo
AND ev.id = r.id_evento
AND ev.tipo = 'Carrera'    --Se sustituira esto por el tipo de Evento que se pida
AND ev.ano = 2019	       --Se sustituira esto por el año que se inserte
AND v.categoria = 'LM-P1'  --Se sustituira esto por la categoria que se inserte

--Si es ensayo

SELECT
--Datos Equipo
e.nombre as NombreEquipo, e.numero_equipo as NumeroEquipo, 
--Datos Vehiculo
m.nombre as NombreVehiculo, v.categoria as CategoriaVehiculo,
--v.caracteristicas as MotorVehiculo,
--Datos Ranking Ensayo Falta velocidad media y vuelta mas rapida

FROM equipo e, vehiculo v, modelo m, ranking r, evento ev
WHERE m.id = v.id_modelo
AND e.id = v.id_equipo
AND ev.id = r.id_evento
AND ev.tipo = 'Ensayo'   
AND ev.ano = 2019	       --Se sustituira esto por el año que se inserte
AND v.categoria = 'LM-P1'  --Se sustituira esto por la categoria que se inserte



--Reporte 2

SELECT
--Datos Equipo
e.nombre as NombreEquipo, e.numero_equipo as NumeroEquipo, 
--Datos Vehiculo
m.nombre as NombreVehiculo, v.categoria as CategoriaVehiculo
--v.caracteristicas as MotorVehiculo,
--Datos Ranking Ensayo Falta velocidad media y vuelta mas rapida

FROM equipo e, vehiculo v, modelo m, ranking_por_hora r, evento ev
WHERE m.id = v.id_modelo
AND e.id = v.id_equipo
AND r.hora = 1             --Se sustituira esto por la hora que inserte el usuario
AND v.categoria = 'LM-P1'  --Se sustituira esto por la categoria que se inserte
AND ev.ano = 2020		   --Se sustituira esto por el año que se inserte 



--Reporte 3

SELECT
--Datos Equipo
e.nombre as NombreEquipo, e.numero_equipo as NumeroEquipo, 
--Datos Vehiculo
m.nombre as NombreVehiculo, v.categoria as CategoriaVehiculo,
--v.caracteristicas as MotorVehiculo,
--Datos Ranking Carrera Falta velocidad media y vuelta mas rapida
r.posicion PosicionCarrera, r.kilometraje KilometrajeCarrera, r.vueltas VueltasCarrera
FROM equipo e, vehiculo v, modelo m, ranking r, evento ev
WHERE m.id = v.id_modelo
AND r.posicion = 1
AND e.id = v.id_equipo
AND ev.id = r.id_evento
AND ev.tipo = 'Carrera'    --Se sustituira esto por el tipo de Evento que se pida
AND ev.ano = 2019	       --Se sustituira esto por el año que se inserte
AND v.categoria = 'LM-P1'  --Se sustituira esto por la categoria que se inserte