	/*Nombre de la base de datos maraton*/
    CREATE DATABASE maraton TEMPLATE template1;

    \c maraton

    /*Esquema de la base de datos mtn*/
    CREATE SCHEMA mtn;

    /*Dominios de la base de datos*/
    CREATE DOMAIN mtn.treinta_caracteres    VARCHAR(30);    /*Nombre de Equipo NO NULLLLLLLLLLLLLLLLLLLLLL*/
    CREATE DOMAIN mtn.sesenta_caracteres    VARCHAR(60);
    CREATE DOMAIN mtn.quince_caracteres     VARCHAR(15);
    CREATE DOMAIN mtn.diez_caracteres       VARCHAR(10);
    CREATE DOMAIN mtn.prof_tipo             VARCHAR(7)
        CHECK (VALUE IN ('Coach','Tecnico'));
    CREATE DOMAIN mtn.año                   INT           /*AÑO DEL ESTUDIANTE*/
        CHECK (VALUE >=1 AND VALUE <=5);
    CREATE DOMAIN mtn.fecha                 DATE
        CHECK(VALUE > '01/01/1900');
    CREATE DOMAIN mtn.mil_caracteres        VARCHAR(1000);
    CREATE DOMAIN mtn.cant_dias             NUMERIC;
    CREATE DOMAIN mtn.nivel_comp            VARCHAR(8)
        CHECK(VALUE IN('Local', 'Regional','Nacional', 'Mundial' ));
    CREATE DOMAIN mtn.ranking_eq            INT
        CHECK(VALUE >= 1);
    CREATE DOMAIN mtn.rend_eq               VARCHAR(5)
        CHECK(VALUE IN('Bajo', 'Medio', 'Alto'));    
    CREATE DOMAIN mtn.dificultad            VARCHAR(7)
        CHECK(VALUE IN('Facil', 'Medio', 'Dificil'));
    CREATE DOMAIN mtn.lenguaje_p            VARCHAR(6)
        CHECK(VALUE IN('C/C++', 'Java', 'Python', 'Pascal'));    
    
    /*Tablas de la base de datos*/
    CREATE TABLE mtn.Integrante(
        ci       mtn.diez_caracteres        NOT NULL,  
        nombre   mtn.treinta_caracteres     NOT NULL,
        PRIMARY KEY(ci)
    );

    CREATE TABLE mtn.Es_un_Profesor(
        ci_p            mtn.diez_caracteres     NOT NULL,
        nombre_p        mtn.treinta_caracteres  NOT NULL,
        tipo_profesor   mtn.prof_tipo           NOT NULL,
        materia         mtn.quince_caracteres   NOT NULL,
        cargo_p         mtn.quince_caracteres,              
        area_experticia mtn.treinta_caracteres,
        info_contacto   mtn.treinta_caracteres,
        PRIMARY KEY (ci_p),
        FOREIGN KEY (ci_p) REFERENCES mtn.Integrante (ci)
            ON UPDATE CASCADE
            ON DELETE CASCADE
    );
     CREATE TABLE mtn.Es_un_Estudiante(
        ci_e             mtn.diez_caracteres    NOT NULL,
        nombre_e         mtn.treinta_caracteres NOT NULL,
        año_e            mtn.año                NOT NULL,
        PRIMARY KEY (ci_e),
        FOREIGN KEY (ci_e) REFERENCES mtn.Integrante (ci)
            ON UPDATE CASCADE
            ON DELETE CASCADE
     );
     CREATE TABLE mtn.Prepara_a(
        ced_p            mtn.diez_caracteres    NOT NULL,
        ced_e            mtn.diez_caracteres    NOT NULL,
        PRIMARY KEY(ced_p, ced_e),
        FOREIGN KEY(ced_p) REFERENCES mtn.Es_un_Profesor(ci_p)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY(ced_e) REFERENCES mtn.Es_un_Estudiante(ci_e)
            ON UPDATE CASCADE
            ON DELETE CASCADE
     );

     CREATE TABLE mtn.Actividad(
         nombre_act    mtn.treinta_caracteres   NOT NULL,
         lugar         mtn.treinta_caracteres   NOT NULL,
         fecha         mtn.fecha                NOT NULL,
         PRIMARY KEY (nombre_act,fecha)
     );
     CREATE TABLE mtn.Viaja(
         ci_e           mtn.diez_caracteres     NOT NULL,
         nombre_act     mtn.treinta_caracteres  NOT NULL,
         fecha          mtn.fecha               NOT NULL,
         dias           mtn.cant_dias           NOT NULL,
         PRIMARY KEY (ci_e, nombre_act, fecha),  
         FOREIGN KEY (ci_e) REFERENCES mtn.Es_un_Estudiante (ci_e)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
         FOREIGN KEY (nombre_act,fecha) REFERENCES mtn.Actividad (nombre_act,fecha)
            ON UPDATE CASCADE
            ON DELETE CASCADE
     );
     CREATE TABLE mtn.Equipo(
        nombre_eq       mtn.treinta_caracteres NOT NULL,
        universidad     mtn.treinta_caracteres NOT NULL,
        PRIMARY KEY(nombre_eq)
     );
     CREATE TABLE mtn.Constituye(
        ci              mtn.diez_caracteres     NOT NULL,
        nombre_eq       mtn.treinta_caracteres  NOT NULL, 
        PRIMARY KEY(ci, nombre_eq),
        FOREIGN KEY(ci) REFERENCES mtn.Integrante (ci)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        FOREIGN KEY (nombre_eq) REFERENCES mtn.Equipo(nombre_eq)
        ON UPDATE CASCADE
        ON DELETE CASCADE
     );

     CREATE TABLE mtn.Competencia(
         fecha          mtn.fecha              NOT NULL,
         nombre_comp    mtn.treinta_caracteres NOT NULL,
         nivel          mtn.nivel_comp         NOT NULL,          
         lugar          mtn.treinta_caracteres NOT NULL,
         PRIMARY KEY (fecha,nombre_comp)
     );
    CREATE TABLE mtn.Participa(
        nombre_eq       mtn.treinta_caracteres  NOT NULL,
        nombre_comp     mtn.treinta_caracteres  NOT NULL,
        fecha           mtn.fecha               NOT NULL,
        incentivo       mtn.treinta_caracteres  NOT NULL,
        site            mtn.quince_caracteres   NOT NULL,
        ranking         mtn.ranking_eq          NOT NULL,
        rendimiento     mtn.rend_eq             NOT NULL,
        PRIMARY KEY(nombre_eq, nombre_comp, fecha),
        FOREIGN KEY(nombre_eq) REFERENCES mtn.Equipo(nombre_eq)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY(nombre_comp, fecha) REFERENCES mtn.Competencia(nombre_comp, fecha)
            ON UPDATE CASCADE
            ON DELETE CASCADE
    );
     CREATE TABLE mtn.Problema (
        titulo          mtn.treinta_caracteres  NOT NULL,
        enunciado       mtn.mil_caracteres      NOT NULL,
        dificultad_p    mtn.dificultad          NOT NULL,
        PRIMARY KEY (titulo)
     );
     CREATE TABLE mtn.Propone(
        fecha           mtn.fecha               NOT NULL,
        nombre_comp     mtn.treinta_caracteres  NOT NULL,
        titulo          mtn.treinta_caracteres  NOT NULL,
        PRIMARY KEY (fecha,nombre_comp, titulo),
        FOREIGN KEY (fecha,nombre_comp) REFERENCES mtn.Competencia(fecha, nombre_comp)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY (titulo) REFERENCES mtn.Problema(titulo)
            ON UPDATE CASCADE
            ON DELETE CASCADE
    );
     CREATE TABLE mtn.Resuelve(
        nombre_eq   mtn.treinta_caracteres       NOT NULL,
        titulo      mtn.treinta_caracteres       NOT NULL,
        tiempo      mtn.diez_caracteres          NOT NULL,
        lenguaje    mtn.lenguaje_p               NOT NULL,
        PRIMARY KEY (nombre_eq,titulo),
        FOREIGN KEY (nombre_eq) REFERENCES mtn.Equipo(nombre_eq)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY (titulo) REFERENCES mtn.Problema(titulo)
            ON UPDATE CASCADE
            ON DELETE CASCADE
     );
     CREATE TABLE mtn.Tipo_clases(
        ci_p    mtn.diez_caracteres         NOT NULL,
        ci_e    mtn.diez_caracteres         NOT NULL,
        clases  mtn.treinta_caracteres      NOT NULL,
        PRIMARY KEY(ci_p,ci_e,clases),
        FOREIGN KEY(ci_p) REFERENCES mtn.Es_un_Profesor(ci_p)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY(ci_e) REFERENCES mtn.Es_un_Estudiante(ci_e)
            ON UPDATE CASCADE
            ON DELETE CASCADE
     );
     CREATE TABLE mtn.Tipo_hospedaje(
            ci_e        mtn.diez_caracteres      NOT NULL,
            nombre_act  mtn.treinta_caracteres   NOT NULL,
            hospedaje   mtn.treinta_caracteres   NOT NULL,
            fecha       mtn.fecha                NOT NULL,
            PRIMARY KEY(ci_e,nombre_act,hospedaje,fecha),
            FOREIGN KEY (ci_e) REFERENCES mtn.Es_un_Estudiante(ci_e)
                ON UPDATE CASCADE
                ON DELETE CASCADE,
            FOREIGN KEY(nombre_act,fecha) REFERENCES mtn.Actividad(nombre_act,fecha)
                ON UPDATE CASCADE
                ON DELETE CASCADE
        );
     CREATE TABLE mtn.Tipo_financista(
            ci_e        mtn.diez_caracteres     NOT NULL,
            nombre_act  mtn.treinta_caracteres  NOT NULL,
            financista  mtn.treinta_caracteres  NOT NULL,
            fecha       mtn.fecha               NOT NULL,
            PRIMARY KEY(ci_e,nombre_act,financista,fecha),
            FOREIGN KEY (ci_e) REFERENCES mtn.Es_un_Estudiante (ci_e)
                ON UPDATE CASCADE
                ON DELETE CASCADE,
            FOREIGN KEY (nombre_act,fecha) REFERENCES mtn.Actividad (nombre_act,fecha)
                ON UPDATE CASCADE
                ON DELETE CASCADE
        );
     CREATE TABLE mtn.Tipo_incidente(
            ci_e        mtn.diez_caracteres     NOT NULL,
            nombre_act  mtn.treinta_caracteres  NOT NULL,
            incidente   mtn.sesenta_caracteres  NOT NULL,
            fecha       mtn.fecha               NOT NULL,
            PRIMARY KEY(ci_e,nombre_act,incidente,fecha),
            FOREIGN KEY (ci_e) REFERENCES mtn.Es_un_Estudiante(ci_e)
                ON UPDATE CASCADE
                ON DELETE CASCADE,
            FOREIGN KEY(nombre_act,fecha) REFERENCES mtn.Actividad(nombre_act,fecha)
                ON UPDATE CASCADE
                ON DELETE CASCADE
       );
   