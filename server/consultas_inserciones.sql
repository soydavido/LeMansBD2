--Consulta para obtener el ultimo evento registrado
SELECT id,tipo FROM evento ORDER BY id DESC LIMIT 1;

--Insercion para el tipo de evento                     Se sustituira el 5 y el 'Ensayo' por dos condicionales segun los resultados
INSERT INTO evento (id,ano,tipo,id_organizacion,id_pista) VALUES (5,2020,'Ensayo',1,1);

--Seleccion de los equipos activos
select id from equipo where activo='T';

--Seleccion de los equipos que tengan contratos activos con pilotos / Falta agrupar por equipo y validar que sean 3
SELECT p.id
FROM piloto p, contrato c, equipo e
WHERE p.id = c.id_piloto AND c.id_equipo = e.id AND e.id in (select id from equipo where activo='T');

