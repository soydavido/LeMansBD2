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


------------------------------------------------------------------------------

--Esta funcion genera los tiempos de la vuelta
CREATE OR REPLACE FUNCTION tiempo_vueltas(tiempo_rapido float, tiempo_promedio float)
RETURNS float as $$
BEGIN
	RETURN random()*(tiempo_promedio-tiempo_rapido)+tiempo_rapido;
END;
$$LANGUAGE plpgsql;

--Esta funcion genera el kilometraje por vuelta
CREATE OR REPLACE FUNCTION kilometraj_vuelta(promedio_anterior float, maximo float)
RETURNS float as $$
BEGIN
	RETURN random()*(maximo-promedio_anterior)+promedio_anterior;
END;
$$LANGUAGE plpgsql;