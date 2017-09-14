
/*problemas resueltos por un programador*/ 
select p.id_problema, pr.titulo, lenguaje, tiempo, dificultad
from 
	(	select id_problema,lenguaje, tiempo
		from mtn.resuelve
		where id_equipo in
			(select id_equipo
			from mtn.constituye_estudiante
			where ci_estudiante = '343275459')
	) as p
    join mtn.problema as pr on pr.id_problema = p.id_problema