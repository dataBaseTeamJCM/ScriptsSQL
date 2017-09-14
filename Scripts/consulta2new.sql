/*2. Clasifique por competencia los problemas resueltos por más
equipos y diga los nombres de los integrantes.*/


/*SELECT    it.nombre       AS INTEGRANTE,
             JOIN mtn.equipo     AS eq ON re.nombre_eq = eq.nombre_eq AND re.año_equipo = eq.año
            JOIN mtn.constituye AS cot ON cot.nombre_eq = eq.nombre_eq AND cot.año = eq.año
            JOIN mtn.integrante AS it ON it.ci = cot.ci
 pr.nombre_comp  AS COMPETENCIA,

              
*/
SELECT  co.nombre_competencia as COMPETENCIA,
		pro.titulo as PROBLEMA,
        eq.nombre_equipo as EQUIPO,
        e.nombre_estudiante AS Estudiante,
        e.ci_estudiante
FROM    (SELECT ID_COMPETENCIA,
                ID_EQUIPO,
                ID_PROBLEMA
        FROM    (SELECT RANK() OVER(PARTITION BY ID_COMPETENCIA ORDER BY CUENTA DESC) AS RANK,
                        ID_COMPETENCIA,
                        ID_EQUIPO,
                        ID_PROBLEMA,
                        CUENTA
                FROM    (SELECT re.id_equipo        AS ID_EQUIPO,
                                re.id_problema      AS ID_PROBLEMA,
                                pr.id_competencia   AS ID_COMPETENCIA,
                                COUNT (re.id_problema) OVER (PARTITION BY re.id_problema) AS CUENTA
                        FROM    mtn.resuelve AS re
                                JOIN mtn.propone    AS pr ON re.id_problema = pr.id_problema
                        ORDER BY CUENTA DESC) AS A
                ) AS B        
        WHERE RANK = 1
        order by ID_COMPETENCIA
        ) AS C
        JOIN mtn.equipo AS eq ON eq.id_equipo = C.ID_EQUIPO
        JOIN mtn.problema as pro On pro.id_problema = C.ID_PROBLEMA
        JOIN mtn.competencia as co on co.id_competencia = C.ID_COMPETENCIA
        JOIN mtn.constituye_estudiante AS ce ON ce.id_equipo = eq.id_equipo
        JOIN mtn.estudiante AS e ON e.ci_estudiante = ce.ci_estudiante