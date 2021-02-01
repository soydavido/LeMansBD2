CREATE OR REPLACE FUNCTION numeros_equipo_por_ano (anho integer)
RETURNS TABLE (numero dw_hec_evento.nro_equipo%TYPE)
AS $$
BEGIN 
RETURN QUERY SELECT DISTINCT e.nro_equipo 
			FROM dw_hec_evento e, dw_dim_fecha f
			where EXTRACT(YEAR FROM f.fecha) = anho 
			AND e.id_fecha = f.id_fecha
			GROUP BY 1 ORDER BY 1;
END;
$$LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION modelos_autos (nombre_fabricante varchar)
RETURNS TABLE (modelos dw_dim_vehiculo.modelo%TYPE)
AS $$
BEGIN 
RETURN QUERY SELECT DISTINCT v.modelo
			FROM dw_dim_vehiculo v
			where v.fabricante = nombre_fabricante
			
			GROUP BY 1 ORDER BY 1;
END;
$$LANGUAGE plpgsql;