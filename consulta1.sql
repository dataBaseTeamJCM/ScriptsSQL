/*1. Diga el nombre, cédula y dirección del estudiante de FaCyT 
que ha participado en más maratones de programación a lo largo 
de la historia.*/

SELECT  it.nombre,
        it.ci,
        it.direccion,
        cot.nombre_eq
FROM    mtn.integrante AS it 
        JOIN mtn.es_un_estudiante   AS et   ON it.ci = et.ci_e
        JOIN mtn.constituye         AS cot  ON cot.ci = et.ci_e
        JOIN mtn.equipo             AS eq   ON eq.nombre_eq = cot.nombre_eq
WHERE   eq.universidad IN ('Universidad de Carabobo');

/*2. Clasifique por competencia los problemas resueltos por más
equipos y diga los nombres de los integrantes.*/

/*3. Qué profesor ha entrenado a equipos para el maratón de
programación y ha participado,en el pasado cuando era
estudiante, en alguna de las competencias.*/