	   CREATE DATABASE maraton TEMPLATE template1;

    \c maraton

    CREATE SCHEMA mtn;

    CREATE DOMAIN mtn.trinta_caracteres VARCHAR(30);/*MATERIA*/
    CREATE DOMAIN mtn.veinte_caracteres VARCHAR(20);/*CEDULA NO NULLLLLLLLLLL*/
    CREATE DOMAIN mtn.treinta_caracteres VARCHAR (30);/*Nombre de Equipo NO NULLLLLLLLLLLLLLLLLLLLLL*/
    CREATE DOMAIN mtn.sesenta_caracteres VARCHAR (60);
    CREATE DOMAIN mtn.quince_caracteres VARCHAR (15);
    CREATE DOMAIN mtn.diez_caracteres VARCHAR(10);
    CREATE DOMAIN mtn.tipoprofesor VARCHAR(7)
        CHECK (VALUE IN ('Coach','Tecnico'));
    CREATE DOMAIN mtn.cargo VARCHAR(20);    
    CREATE DOMAIN mtn.area_e VARCHAR (30);/*area experticia*/
    CREATE DOMAIN mtn.año INT;/*AÑO DEL ESTUDIANTE*/
    CREATE DOMAIN mtn.carrera VARCHAR (30);/*NO NULLLLLL*/
    CREATE DOMAIN mtn.lugar VARCHAR (60); /*NO NULLL*/
    CREATE DOMAIN mtn.fecha DATE;
    CREATE DOMAIN mtn.site_c VARCHAR (60);
    CREATE DOMAIN mtn.enunciado VARCHAR (1000);
    CREATE DOMAIN mtn.datos VARCHAR (100);
    CREATE DOMAIN mtn.dificultad VARCHAR (8);
    CREATE DOMAIN mtn.tiempo VARCHAR (60);
 
    CREATE TABLE mtn.Integrante(
        ci mtn.diez_caracteres PRIMARY KEY,
        nombre mtn.treinta_caracteres
    );

    CREATE TABLE mtn.Es_un_profesor(
        ci_p mtn.diez_caracteres PRIMARY KEY,
        nombre_p mtn.sesenta_caracteres NOT NULL,
        tipo_profesor mtn.tipoprofesor NOT NULL,
        cargo_p mtn.cargo,
        area_experticia mtn.area_e,
        info_contacto mtn.sesenta_caracteres,
        FOREIGN KEY (ci_p) REFERENCES mtn.Integrante
            ON UPDATE CASCADE
            ON DELETE CASCADE
    );
     CREATE TABLE mtn.Es_un_Estudiante(
       ci_e mtn.diez_caracteres PRIMARY KEY,
       nombre_e mtn.sesenta_caracteres,
       año_e mtn.año,
       FOREIGN KEY (ci_e) REFERENCES mtn.Integrante
            ON UPDATE CASCADE
            ON DELETE CASCADE
     );
     CREATE TABLE mtn.Prepara_a(
        ci_p mtn.diez_caracteres,
        ci_e mtn.diez_caracteres,
        FOREIGN KEY (ci_p) REFERENCES mtn.Es_un_profesor
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        FOREIGN KEY (Ci_e) REFERENCES mtn.Es_un_Estudiante
        ON UPDATE CASCADE
        ON DELETE CASCADE
     );
     CREATE TABLE mtn.Actividad(
         nombre_act mtn.treinta_caracteres,
         lugar mtn.quince_caracteres,
         fecha mtn.fecha,
         PRIMARY KEY (nombre_act,fecha)
     );
     CREATE TABLE mtn.Viaja(
         ci_e mtn.diez_caracteres,
         nombre_act mtn.treinta_caracteres,
         fecha mtn.fecha,
         dias NUMERIC,
         FOREIGN KEY (ci_e) REFERENCES mtn.Es_un_Estudiante
            ON UPDATE CASCADE
            ON DELETE CASCADE,
         FOREIGN KEY (nombre_act,fecha) REFERENCES mtn.Actividad
            ON UPDATE CASCADE
            ON DELETE CASCADE
     );
     CREATE TABLE mtn.Equipo(
        nombre_eq mtn.treinta_caracteres PRIMARY KEY,
        universidad mtn.sesenta_caracteres NOT NULL
     );
     CREATE TABLE mtn.Constituye(
        ci mtn.diez_caracteres,
        nombre_eq mtn.treinta_caracteres,
        FOREIGN KEY (ci) REFERENCES mtn.Integrante
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        FOREIGN KEY (nombre_eq) REFERENCES mtn.Equipo
        ON UPDATE CASCADE
        ON DELETE CASCADE
     );

     CREATE TABLE mtn.Competencia(
         fecha mtn.fecha,
         nombre_comp mtn.sesenta_caracteres,
         PRIMARY KEY (fecha,nombre_comp)
     );
    
     CREATE TABLE mtn.Problema (
        Titulo mtn.treinta_caracteres,
        enunciado mtn.enunciado,
        dificultad_p mtn.dificultad,
        PRIMARY KEY (Titulo)
     );
     CREATE TABLE mtn.Propone(
           fecha mtn.fecha,
           nombre_comp mtn.sesenta_caracteres,
           Titulo mtn.treinta_caracteres,
           PRIMARY KEY (fecha,nombre_comp, Titulo),
           FOREIGN KEY (fecha,nombre_comp) REFERENCES mtn.Competencia
            ON UPDATE CASCADE
            ON DELETE CASCADE,
            FOREIGN KEY (Titulo) REFERENCES mtn.Problema
            ON UPDATE CASCADE
            ON DELETE CASCADE
           );
     CREATE TABLE mtn.Resuelve(
          nombre_eq mtn.treinta_caracteres,
          Titulo mtn.treinta_caracteres,
          tiempo mtn.diez_caracteres,
          lenguaje mtn.diez_caracteres,
           PRIMARY KEY (nombre_eq,Titulo),
            FOREIGN KEY (nombre_eq) REFERENCES mtn.Equipo
            ON UPDATE CASCADE
            ON DELETE CASCADE,
           FOREIGN KEY (Titulo) REFERENCES mtn.Problema
           ON UPDATE CASCADE
            ON DELETE CASCADE
     );
     CREATE TABLE mtn.Tipo_clases(
        ci_p mtn.diez_caracteres,
        ci_e mtn.diez_caracteres,
        clases mtn.treinta_caracteres,
        PRIMARY KEY(ci_p,ci_e,clases),
        FOREIGN KEY(ci_p) REFERENCES mtn.Es_un_profesor
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY(ci_e) REFERENCES mtn.Es_un_Estudiante
            ON UPDATE CASCADE
            ON DELETE CASCADE
     );
     CREATE TABLE mtn.Tipo_hospedaje(
            ci_e mtn.diez_caracteres,
            nombre_act mtn.treinta_caracteres,
            hospedaje mtn.treinta_caracteres,
            fecha mtn.fecha,
            PRIMARY KEY(ci_e,nombre_act,hospedaje,fecha),
            FOREIGN KEY (ci_e) REFERENCES mtn.Es_un_Estudiante
                ON UPDATE CASCADE
                ON DELETE CASCADE,
            FOREIGN KEY(nombre_act,fecha) REFERENCES mtn.Actividad
                ON UPDATE CASCADE
                ON DELETE CASCADE
        );
     CREATE TABLE mtn.Tipo_financista(
            ci_e mtn.diez_caracteres,
            nombre_act mtn.treinta_caracteres,
            financista mtn.treinta_caracteres,
            fecha mtn.fecha,
            PRIMARY KEY(ci_e,nombre_act,financista,fecha),
            FOREIGN KEY (ci_e) REFERENCES mtn.Es_un_Estudiante
            ON UPDATE CASCADE
            ON DELETE CASCADE,
            FOREIGN KEY (nombre_act,fecha) REFERENCES mtn.Actividad
            ON UPDATE CASCADE
            ON DELETE CASCADE
        );
     CREATE TABLE mtn.Tipo_incidente(
            ci_e mtn.diez_caracteres,
            nombre_act mtn.treinta_caracteres,
            incidente mtn.sesenta_caracteres,
            fecha mtn.fecha,
            PRIMARY KEY(ci_e,nombre_act,incidente,fecha),
            FOREIGN KEY (ci_e) REFERENCES mtn.Es_un_Estudiante
                ON UPDATE CASCADE
                ON DELETE CASCADE,
            FOREIGN KEY(nombre_act,fecha) REFERENCES mtn.Actividad
                ON UPDATE CASCADE
                ON DELETE CASCADE
       );
   /* FALTA LOS NOT NULL Y CHECdasdasdsasK dasdsdasds            d sda  */