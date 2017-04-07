	CREATE DATABASE maraton TEMPLATE template1;

	\c maraton

	CREATE SCHEMA mtn;

    CREATE DOMAIN mtn.trinta_caracteres VARCHAR(30);/*MATERIA*/
    CREATE DOMAIN mtn.veinte_caracteres VARCHAR(20);/*CEDULA NO NULLLLLLLLLLL*/
    CREATE DOMAIN mtn.treinta_caracteres VARCHAR (20);/*Nombre de Equipo NO NULLLLLLLLLLLLLLLLLLLLLL*/
    CREATE DOMAIN mtn.sesenta_caracteres VARCHAR (60);
    CREATE DOMAIN mtn.tipoprofesor VARCHAR(7)
        CHECK (VALUE IN ('Coach','Tecnico'));
    CREATE DOMAIN mtn.cargo VARCHAR(20);    
    CREATE DOMAIN mtn.area_e VARCHAR (30);/*area experticia*/
    CREATE DOMAIN mtn.año INT;/*AÑO DEL ESTUDIANTE*/
    CREATE DOMAIN mtn.carrera VARCHAR (30);/*NO NULLLLLL*/
    CREATE DOMAIN mtn.lugar VARCHAR (60); /*NO NULLL*/
    CREATE DOMAIN mtn.fecha DATE;
    CREATE DOMAIN mtn.site_c VARCHAR (60);
    CREATE DOMAIN mtn.enunciado VARCHAR (300);
    CREATE DOMAIN mtn.datos VARCHAR (100);
    CREATE DOMAIN mtn.dificultad INT;
    CREATE DOMAIN mtn.tiempo VARCHAR (60);
 
    CREATE TABLE mtn.Profesor(
        ci_p mtn.veinte_caracteres PRIMARY KEY,
        nombre_p mtn.sesenta_caracteres,
        nombre_eq mtn.treinta_caracteres NOT NULL,
        tipo_profesor mtn.tipoprofesor NOT NULL,
        cargo_p mtn.cargo,
        area_experticia mtn.area_e,
        info_contacto mtn.sesenta_caracteres
    );
     CREATE TABLE mtn.Estudiante(
       ci_e mtn.veinte_caracteres PRIMARY KEY,
       nombre_eq mtn.treinta_caracteres NOT NULL,
       ci_p mtn.veinte_caracteres,
       nombre_e mtn.sesenta_caracteres,
       carrera mtn.treinta_caracteres,
       año_e mtn.año
     );
     CREATE TABLE mtn.Actividad(
         ci_e mtn.veinte_caracteres,
         lugar_a mtn.lugar,
         fecha_a mtn.fecha,
         PRIMARY KEY (ci_e,lugar_a),
         FOREIGN KEY (ci_e) REFERENCES mtn.Estudiante
        	ON UPDATE CASCADE
	    	ON DELETE CASCADE
     );
     CREATE TABLE mtn.Viaja(
         ci_e mtn.veinte_caracteres,
         lugar_a mtn.lugar,
         PRIMARY KEY (ci_e,lugar_a),
         FOREIGN KEY (ci_e,lugar_a) REFERENCES mtn.Actividad
        	ON UPDATE CASCADE
	    	ON DELETE CASCADE,
         FOREIGN KEY (ci_e) REFERENCES mtn.Estudiante
        	ON UPDATE CASCADE
	    	ON DELETE CASCADE
     );
     CREATE TABLE mtn.Equipo(
        nombre_eq mtn.treinta_caracteres PRIMARY KEY,
        universidad mtn.sesenta_caracteres NOT NULL,
        fecha_comp mtn.fecha,
        nombre_comp mtn.sesenta_caracteres,
        incentivo mtn.sesenta_caracteres,
        rendimiento mtn.sesenta_caracteres
     );
     CREATE TABLE mtn.Competencia(
         fecha_comp mtn.fecha,
         nombre_comp mtn.sesenta_caracteres,
         site mtn.site_c,
         campeon mtn.sesenta_caracteres,
         PRIMARY KEY (fecha_comp,nombre_comp)
     );
    
     CREATE TABLE mtn.Problema (
        enunciado_p mtn.enunciado,
        datos_p mtn.datos,
        dificultad_p mtn.dificultad,
        PRIMARY KEY (enunciado_p,datos_p)
     );

     CREATE TABLE mtn.Propone(
           datos_p mtn.datos,
           enunciado_p mtn.enunciado,
           fecha_p mtn.fecha,
           nombre mtn.sesenta_caracteres,
           PRIMARY KEY (datos_p ,enunciado_p,fecha_p,nombre),
           FOREIGN KEY (datos_p,enunciado_p) REFERENCES mtn.Problema
        	ON UPDATE CASCADE
	    	ON DELETE CASCADE,
            FOREIGN KEY (fecha_p,nombre) REFERENCES mtn.Competencia
        	ON UPDATE CASCADE
	    	ON DELETE CASCADE
           );
     CREATE TABLE mtn.Resuelve(
          enunciado_p mtn.enunciado,
          datos_p mtn.datos,
          nombre mtn.sesenta_caracteres,
          tiempo_r mtn.tiempo,
          lenguaje_r mtn.sesenta_caracteres,
          fecha_r mtn.fecha,
           PRIMARY KEY (enunciado_p,datos_p,nombre),
            FOREIGN KEY (enunciado_p,datos_p) REFERENCES mtn.Problema
        	ON UPDATE CASCADE
	    	ON DELETE CASCADE,
           FOREIGN KEY (nombre) REFERENCES mtn.Equipo
           ON UPDATE CASCADE
            ON DELETE CASCADE
     );
     CREATE TABLE mtn.Materia_prof(
         materia mtn.treinta_caracteres,
         ci_p   mtn.veinte_caracteres,
         PRIMARY KEY (materia,ci_p),
         FOREIGN KEY (ci_p) REFERENCES mtn.Profesor
           ON UPDATE CASCADE
           ON DELETE CASCADE
     );
     CREATE TABLE mtn.Nivel_comp(
         nivel mtn.sesenta_caracteres,
         nombre_comp mtn.sesenta_caracteres,
         fecha_comp mtn.fecha,
         PRIMARY KEY (nivel,nombre_comp,fecha_comp),
         FOREIGN KEY (fecha_comp,nombre_comp) REFERENCES mtn.Competencia
           ON UPDATE CASCADE
           ON DELETE CASCADE
     );
   CREATE TABLE mtn.Incidente_act(
    incidente mtn.sesenta_caracteres,
    ci_e mtn.veinte_caracteres,
    lugar_i mtn.sesenta_caracteres,
    PRIMARY KEY (incidente,ci_e,lugar_i),
    FOREIGN KEY (ci_e,lugar_i) REFERENCES mtn.Actividad
           ON UPDATE CASCADE
           ON DELETE CASCADE
   );
   CREATE TABLE mtn.Hospedaje_act(
    hospedaje mtn.sesenta_caracteres,
    ci_e mtn.veinte_caracteres,
    lugar_h mtn.sesenta_caracteres,
    PRIMARY KEY (hospedaje,ci_e,lugar_h),
    FOREIGN KEY (ci_e,lugar_h) REFERENCES mtn.Actividad
           ON UPDATE CASCADE
           ON DELETE CASCADE
   );
    CREATE TABLE mtn.Financista_act(
     financista mtn.sesenta_caracteres,
     ci_e mtn.veinte_caracteres,
     lugar_a mtn.lugar,
     PRIMARY KEY (financista,ci_e,lugar_a),
     FOREIGN KEY (ci_e,lugar_a) REFERENCES mtn.Actividad
           ON UPDATE CASCADE
           ON DELETE CASCADE
   );
    CREATE TABLE mtn.Preparacion(
      ci_e mtn.veinte_caracteres,
      clases mtn.sesenta_caracteres,
      PRIMARY KEY (ci_e,clases),
     FOREIGN KEY (ci_e) REFERENCES mtn.Estudiante
           ON UPDATE CASCADE
           ON DELETE CASCADE
   );
    CREATE TABLE mtn.Act_comp(
     actividad_c mtn.sesenta_caracteres,
     nombre_comp mtn.sesenta_caracteres,
     fecha_comp mtn.fecha,
     PRIMARY KEY(actividad_c,nombre_comp,fecha_comp),
     FOREIGN KEY (fecha_comp,nombre_comp) REFERENCES mtn.Competencia
           ON UPDATE CASCADE
           ON DELETE CASCADE
   );
     CREATE TABLE mtn.Raking_participa(
      raking mtn.sesenta_caracteres,
      nombre_e mtn.sesenta_caracteres,
      PRIMARY KEY (raking,nombre_e),
     FOREIGN KEY (nombre_e) REFERENCES mtn.Equipo
           ON UPDATE CASCADE
           ON DELETE CASCADE
   );
   /* FALTA LOS NOT NULL Y CHECdasdasdsasK dasdsdasds            d sda  */