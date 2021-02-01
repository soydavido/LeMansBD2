SELECT *
FROM contrato c1
WHERE (SELECT COUNT(*) 
	   FROM contrato c2 
	   WHERE date_part('year',(c1.duracion).fecha_inicial) BETWEEN date_part('year',(c2.duracion).fecha_inicial) AND date_part('year',(c2.duracion).fecha_inicial)
	   AND c2.id_piloto = c1.id_piloto) > 1
ORDER BY c1.id_piloto