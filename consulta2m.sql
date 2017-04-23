/*2. Clasifique por competencia los problemas resueltos por más
equipos y diga los nombres de los integrantes.*/


/*SELECT    it.nombre       AS INTEGRANTE,
             JOIN mtn.equipo     AS eq ON re.nombre_eq = eq.nombre_eq AND re.año_equipo = eq.año
            JOIN mtn.constituye AS cot ON cot.nombre_eq = eq.nombre_eq AND cot.año = eq.año
            JOIN mtn.integrante AS it ON it.ci = cot.ci
 pr.nombre_comp  AS COMPETENCIA,

              
*/
SELECT  COMPETENCIA,
        PROBLEMA_RESUELTO,
        EQUIPO,
        cot.año,
        it.nombre AS integrante,
        it.ci
FROM    (SELECT COMPETENCIA,
                EQUIPO,
                año,
                PROBLEMA_RESUELTO
        FROM    (SELECT RANK() OVER(PARTITION BY COMPETENCIA ORDER BY CUENTA DESC) AS RANK,
                        COMPETENCIA,
                        EQUIPO,
                        año,
                        PROBLEMA_RESUELTO,
                        CUENTA
                FROM    (SELECT re.nombre_eq    AS EQUIPO,
                                re.titulo       AS PROBLEMA_RESUELTO,
                                pr.nombre_comp  AS COMPETENCIA,
                                re.año_equipo   AS año,
                                COUNT (re.titulo) OVER (PARTITION BY re.titulo) AS CUENTA
                        FROM    mtn.resuelve AS re
                                JOIN mtn.propone    AS pr ON re.titulo = pr.titulo 
                        ORDER BY CUENTA DESC) AS A
                ) AS B        
        WHERE RANK = 1
        ) AS C
        JOIN mtn.equipo AS eq ON eq.nombre_eq = c.equipo AND eq.año = c.año
        JOIN mtn.constituye AS cot ON cot.nombre_eq = eq.nombre_eq AND cot.año = eq.año
        JOIN mtn.integrante AS it ON it.ci = cot.ci 
