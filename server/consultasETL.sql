--EQUIPOS
SELECT eqr.id_equipo, eqr.nombre, par.nro_equipo, 'No' as activo
FROM equipos eqr, participaciones par
WHERE eqr.id_equipo = par.id_equipo 