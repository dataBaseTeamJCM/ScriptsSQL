select * 
from mtn.estudiante as e
    join mtn.constituye_estudiante as ce    on e.ci_estudiante  = ce.ci_estudiante
    join mtn.viaja                 as v     on v.id_equipo      = ce.id_equipo
where ci_estudiante = '21484386'