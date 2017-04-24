/*3. Qué profesor ha entrenado a equipos para el maratón de
programación y ha participado,en el pasado cuando era
estudiante, en alguna de las competencias.*/

SELECT  prof.ci_p  AS cid_p
FROM    mtn.es_un_profesor  AS prof
WHERE   prof.tipo_profesor = 'Tecnico' 
        AND prof.ci_p IN    (SELECT est.ci_e
                            FROM    mtn.es_un_estudiante    AS  est
                                    JOIN    (SELECT DISTINCT 
                                                    cot.ci
                                            FROM    mtn.constituye  AS cot
                                                    JOIN    (SELECT DISTINCT
                                                                    eq.nombre_eq,
                                                                    eq.año
                                                            FROM    mtn.equipo                AS eq
                                                                    INNER JOIN  mtn.participa AS pat 
                                                                                ON  eq.nombre_eq    = pat.nombre_eq 
                                                                                AND eq.año          = pat.año_equipo                                                            
                                                            ) AS a
                                                            ON a.nombre_eq  = cot.nombre_eq
                                                            AND a.año       = cot.año
                                            ) AS b
                                            ON  b.ci    =   est.ci_e 
                            );


/*SELECT  eq.nombre_eq,
        eq.año
FROM    mtn.equipo AS eq    
WHERE   eq.nombre_eq IN(SELECT  pa.nombre_eq
                        FROM    mtn.participa AS pa) 
        AND
        eq.año IN(SELECT  pa.año_equipo
                  FROM    mtn.participa AS pa);
*/

/*SELECT  est.ci_e
FROM    mtn.es_un_estudiante    AS  est
        JOIN    (SELECT DISTINCT 
                        cot.ci
                FROM    mtn.constituye  AS cot
                        JOIN    (SELECT DISTINCT
                                        eq.nombre_eq,
                                        eq.año
                                FROM    mtn.equipo                AS eq
                                        INNER JOIN  mtn.participa AS pat 
                                                    ON  eq.nombre_eq    = pat.nombre_eq 
                                                    AND eq.año          = pat.año_equipo                                                            
                                ) AS a
                                ON a.nombre_eq  = cot.nombre_eq
                                AND a.año       = cot.año
                ) AS b
                ON  b.ci    =   est.ci_e 
*/
/*optimizada*/


SELECT  prof.ci_p  AS cid_p
FROM    mtn.es_un_profesor  AS prof
WHERE   prof.tipo_profesor = 'Tecnico' 
        AND prof.ci_p IN    (SELECT est.ci_e
                            FROM    mtn.es_un_estudiante    AS  est
                                    JOIN    (SELECT DISTINCT 
                                                    cot.ci
                                            FROM    mtn.constituye       AS cot
                                                    JOIN   mtn.participa AS pat 
                                                           ON  cot.nombre_eq    = pat.nombre_eq 
                                                           AND cot.año          = pat.año_equipo                                                            
                                            ) AS a
                                            ON  a.ci    =   est.ci_e 
                            );