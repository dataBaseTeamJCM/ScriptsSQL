
/*obtiena la informacion de las competencias del programador
*/
select c.id_competencia, nombre_competencia, nivel, lugar_competencia, fecha_competencia
from 
	(	select id_competencia, incentivo, rendimiento
		from mtn.participa
		where id_equipo in
			(select id_equipo
			from mtn.constituye_estudiante
			where ci_estudiante = '343275459')
	) as p
  join mtn.competencia as c on p.id_competencia = c.id_competencia