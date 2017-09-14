
/*(esta última sólo
para saber quiénes son sus coach y representante)*/
select ci_profesor, nombre_profesor, apellido_profesor, tipo_profesor
from 
	(	select ci_profesor as profesor
		from mtn.prepara_a
		where id_equipo in
			(select id_equipo
			from mtn.constituye_estudiante
			where ci_estudiante = '21484404')
		union
		select ci_profesor
		from mtn.profesor_representa
		where id_equipo in
			(select id_equipo
			from mtn.constituye_estudiante
			where ci_estudiante = '21484404')
	) as p 
    join mtn.profesor as pr on profesor = pr.ci_profesor