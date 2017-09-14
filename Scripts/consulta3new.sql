/*3. Qué profesor ha entrenado a equipos para el maratón de
programación y ha participado,en el pasado cuando era
estudiante, en alguna de las competencias.*/

SELECT  prof.ci_profesor	  	as CEDULA,
		prof.nombre_profesor  	AS Nombre,
		prof.apellido_profesor	as Apellido
FROM    mtn.profesor  	  		AS prof
WHERE   prof.tipo_profesor = 'Tecnico' 
    AND prof.ci_profesor 
    IN (select ci
        from mtn.constituye_estudiante as ce
        join  (SELECT e.ci_estudiante as ci
        		FROM  mtn.estudiante AS  e
            	JOIN  (SELECT DISTINCT 
                        		pra.ci_profesor
                    	FROM    mtn.prepara_a  AS pra
                        JOIN  (SELECT DISTINCT
                                       eq.id_equipo
                                FROM    mtn.equipo  AS eq
                                JOIN  mtn.participa AS pat ON  eq.id_equipo  = pat.id_equipo                                                         
                               ) AS a
                         ON a.id_equipo = pra.id_equipo
                       ) AS b
                 ON  b.ci_profesor = e.ci_estudiante 
                ) as c
         on c.ci = ce.ci_estudiante
        );