--Esta funcion servira para los calculos que se realizaran en el TDA MARCAS
CREATE OR REPLACE FUNCTION minutos_a_decimales(a varchar, b float)
RETURNS float as $$
BEGIN
	b := ((cast(SUBSTRING(a,1,1) as float))/60)+(cast(SUBSTRING(a,1,1) as float));
	RETURN b;
END;
$$LANGUAGE plpgsql
