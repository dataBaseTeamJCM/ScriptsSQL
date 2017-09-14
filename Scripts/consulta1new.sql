/*1. Diga el nombre, cédula y dirección del estudiante de FaCyT 
que ha participado en más maratones de programación a lo largo 
de la historia.*/

SELECT  distinct
        PARTICIPACIONES,
        NOMBRE,
        CI,
        DIRECCION
FROM    (SELECT RANK() OVER( ORDER BY PARTICIPACIONES DESC) AS RANKING,
                PARTICIPACIONES,
                NOMBRE,
                CI,
                DIRECCION
        FROM    (SELECT e.nombre_estudiante     AS NOMBRE,
                        e.ci_estudiante         AS CI,
                        e.direccion_estudiante  AS DIRECCION, 
                        COUNT (e.ci_estudiante) OVER (PARTITION BY e.ci_estudiante) AS PARTICIPACIONES
                FROM    mtn.estudiante                  AS e 
                        JOIN mtn.constituye_estudiante  AS ce   ON e.ci_estudiante  = ce.ci_estudiante
                        JOIN mtn.equipo                 AS eq   ON eq.id_equipo     = ce.id_equipo
                        JOIN mtn.participa              AS p    ON p.id_equipo      = eq.id_equipo
                WHERE  eq.facultad IN ('FACYT-EC-UC') 
                ORDER BY PARTICIPACIONES DESC        
                )FINAL
        )FINAL2
WHERE RANKING = 1;