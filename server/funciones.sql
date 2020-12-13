-------------------------- CALCULOS DE MARCAS --------------------------------

--Esta funcion servira para los calculos que se realizaran en el TDA MARCAS
CREATE OR REPLACE FUNCTION minutos_a_decimales(a varchar, b float)
RETURNS float as $$
BEGIN
	b := ((cast(SUBSTRING(a,1,1) as float))/60)+(cast(SUBSTRING(a,1,1) as float));
	RETURN b;
END;
$$LANGUAGE plpgsql

--Esta funcion sirve para calcular la velocidad_promedio en base al tiempo
CREATE OR REPLACE FUNCTION velocidad_promedio(km float, tiempo float)
RETURNS float as $$
BEGIN
	RETURN km * tiempo;
END;
$$LANGUAGE plpgsql

--Esta funcion sirve para calcular un aproximado de kilometraje por vuelta
CREATE OR REPLACE FUNCTION kilometraje_promedio(km float, vueltas integer)
RETURNS float as $$
BEGIN
	RETURN km / vueltas;
END;
$$LANGUAGE plpgsql


