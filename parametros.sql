CREATE OR REPLACE FUNCTION numeros_equipo ()
RETURNS TABLE (numero dw_hec_evento.nro_equipo%TYPE)
AS $$
BEGIN 
RETURN QUERY SELECT DISTINCT nro_equipo 
			FROM dw_hec_evento GROUP BY 1 ORDER BY 1;
END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION anhos_disponibles ()
RETURNS TABLE (anho float)
AS $$
BEGIN 
RETURN QUERY SELECT DISTINCT date_part('year',fecha)
			FROM dw_dim_fecha GROUP BY 1 ORDER BY 1;
END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fabricantes ()
RETURNS TABLE (fabricantes varchar)
AS $$
BEGIN 
RETURN QUERY SELECT DISTINCT fabricante
			FROM dw_dim_vehiculo GROUP BY 1 ORDER BY 1;
END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION nombres_pilotos ()
RETURNS TABLE (nombres varchar)
AS $$
BEGIN 
RETURN QUERY SELECT DISTINCT nombre
			FROM dw_dim_pilotos GROUP BY 1 ORDER BY 1;
END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION apellidos_pilotos (nombre_ins varchar)
RETURNS TABLE (apellidos varchar)
AS $$
BEGIN 
RETURN QUERY SELECT DISTINCT apellido
			FROM dw_dim_pilotos 
			WHERE nombre like (nombre_ins) 
			GROUP BY 1 ORDER BY 1;
END;
$$LANGUAGE plpgsql;