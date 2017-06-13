	/*Nombre de la base de datos maraton*/
    CREATE DATABASE maraton TEMPLATE template1;

    \c maraton

    /*Esquema de la base de datos mtn*/
    CREATE SCHEMA mtn;

    /*Dominios de la base de datos*/
    CREATE DOMAIN MTN.TREINTA_CARACTERES    VARCHAR(30);    /*Nombre de Equipo NO NULLLLLLLLLLLLLLLLLLLLLL*/
    CREATE DOMAIN MTN.SESENTA_CARACTERES    VARCHAR(60);
    CREATE DOMAIN MTN.QUINCE_CARACTERES     VARCHAR(15);
    CREATE DOMAIN MTN.DIEZ_CARACTERES       VARCHAR(10);
    CREATE DOMAIN MTN.ONCE_CARACTERES       VARCHAR(11);
    CREATE DOMAIN MTN.PROF_TIPO             VARCHAR(7)
        CHECK (VALUE IN ('Coach','Tecnico'));
    CREATE DOMAIN MTN.AÑO                   INT           /*AÑO DEL ESTUDIANTE*/
        CHECK (VALUE >=1 AND VALUE <=5);
    CREATE DOMAIN MTN.FECHA                 DATE
        CHECK(VALUE > '01/01/1900');
    CREATE DOMAIN MTN.MIL_CARACTERES        VARCHAR(1000);
    CREATE DOMAIN MTN.CANT_DIAS             NUMERIC;
    CREATE DOMAIN MTN.NIVEL_COMP            VARCHAR(8)
        CHECK(VALUE IN('Local', 'Regional','Nacional', 'Mundial' ));
    CREATE DOMAIN MTN.RANKING_EQ            INT
        CHECK(VALUE >= 1);
    CREATE DOMAIN MTN.REND_EQ               VARCHAR(5)
        CHECK(VALUE IN('Bajo', 'Medio', 'Alto'));    
    CREATE DOMAIN MTN.DIFICULTAD            VARCHAR(7)
        CHECK(VALUE IN('Facil', 'Medio', 'Dificil'));
    CREATE DOMAIN MTN.LENGUAJE_P            VARCHAR(6)
        CHECK(VALUE IN('C/C++', 'Java', 'Python', 'Pascal'));
    CREATE DOMAIN MTN.AÑO_EQ                INT           /*AÑO DE CONSTITUCION DEL EQUIPO*/
        CHECK (VALUE >= 1900);    
    
    /*Tablas de la base de datos*/
    CREATE TABLE MTN.ESTUDIANTE(
        CI_ESTUDIANTE           MTN.DIEZ_CARACTERES     NOT NULL,  
        NOMBRE_ESTUDIANTE       MTN.TREINTA_CARACTERES  NOT NULL,
        APELLIDO_ESTUDIANTE     MTN.TREINTA_CARACTERES  NOT NULL,
        TELEFONO_ESTUDIANTE     MTN.ONCE_CARACTERES,
        EMAIL_ESTUDIANTE        MTN.TREINTA_CARACTERES,
        DIRECCION_ESTUDIANTE    MTN.SESENTA_CARACTERES  NOT NULL,
        AÑO_ESTUDIANTE          MTN.AÑO                 NOT NULL,
        CARRERA                 MTN.TREINTA_CARACTERES  NOT NULL,
        PRIMARY KEY(CI_ESTUDIANTE)
    );

    CREATE TABLE MTN.ACTIVIDAD(
        ID_ACTIVIDAD       MTN.DIEZ_CARACTERES     NOT NULL,
        NOMBRE_ACTIVIDAD   MTN.TREINTA_CARACTERES  NOT NULL,
        LUGAR_ACTIVIDAD    MTN.TREINTA_CARACTERES  NOT NULL,
        FECHA_ACTIVIDAD    MTN.FECHA               NOT NULL,
        PRIMARY KEY (ID_ACTIVIDAD)
    );

    CREATE TABLE MTN.VIAJA(
        CI_ESTUDIANTE   MTN.DIEZ_CARACTERES NOT NULL,
        ID_ACTIVIDAD    MTN.DIEZ_CARACTERES NOT NULL,
        DIAS            MTN.CANT_DIAS       NOT NULL,
        PRIMARY KEY (CI_ESTUDIANTE, ID_ACTIVIDAD),  
        FOREIGN KEY (CI_ESTUDIANTE) REFERENCES MTN.ESTUDIANTE   (CI_ESTUDIANTE)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY (ID_ACTIVIDAD)  REFERENCES MTN.ACTIVIDAD    (ID_ACTIVIDAD)
            ON UPDATE CASCADE
            ON DELETE CASCADE
    );

    CREATE TABLE MTN.PROFESOR(
        CI_PROFESOR            MTN.DIEZ_CARACTERES      NOT NULL,
        NOMBRE_PROFESOR        MTN.TREINTA_CARACTERES   NOT NULL,
        APELLIDO_PROFESOR      MTN.TREINTA_CARACTERES   NOT NULL,
        TELEFONO_PROFESOR      MTN.ONCE_CARACTERES,
        EMAIL_PROFESOR         MTN.TREINTA_CARACTERES,              
        DIRECCION_PROFESOR     MTN.SESENTA_CARACTERES   NOT NULL,
        TIPO_PROFESOR          MTN.PROF_TIPO            NOT NULL,
        CARGO                  MTN.TREINTA_CARACTERES,
        AREA_EXPERTICIA        MTN.TREINTA_CARACTERES,
        PRIMARY KEY (CI_PROFESOR)
    );

    CREATE TABLE MTN.PREPARA_A(
        CI_PROFESOR     MTN.DIEZ_CARACTERES    NOT NULL,
        CI_ESTUDIANTE   MTN.DIEZ_CARACTERES    NOT NULL,
        PRIMARY KEY (CI_PROFESOR, CI_ESTUDIANTE),
        FOREIGN KEY (CI_PROFESOR)    REFERENCES MTN.PROFESOR     (CI_PROFESOR)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY (CI_ESTUDIANTE)  REFERENCES MTN.ESTUDIANTE   (CI_ESTUDIANTE)
            ON UPDATE CASCADE
            ON DELETE CASCADE
    );

    CREATE TABLE MTN.EQUIPO(
        ID_EQUIPO       MTN.DIEZ_CARACTERES     NOT NULL,
        NOMBRE_EQUIPO   MTN.TREINTA_CARACTERES  NOT NULL,
        AÑO_EQUIPO      MTN.AÑO_EQ              NOT NULL,                  
        UNIVERSIDAD     MTN.TREINTA_CARACTERES  NOT NULL,
        FACULTAD        MTN.TREINTA_CARACTERES  NOT NULL,
        PRIMARY KEY (ID_EQUIPO)
    );
       
    CREATE TABLE MTN.CONSTITUYE_ESTUDIANTE(
        ID_EQUIPO       MTN.DIEZ_CARACTERES NOT NULL,
        CI_ESTUDIANTE   MTN.DIEZ_CARACTERES NOT NULL,
        PRIMARY KEY (ID_EQUIPO, CI_ESTUDIANTE),
        FOREIGN KEY (CI_ESTUDIANTE) REFERENCES MTN.ESTUDIANTE   (CI_ESTUDIANTE)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY (ID_EQUIPO)     REFERENCES MTN.EQUIPO       (ID_EQUIPO)
            ON UPDATE CASCADE
            ON DELETE CASCADE
    );

    CREATE TABLE MTN.CONSTITUYE_PROFESOR(
        ID_EQUIPO       MTN.DIEZ_CARACTERES NOT NULL,
        CI_PROFESOR     MTN.DIEZ_CARACTERES NOT NULL,
        PRIMARY KEY (ID_EQUIPO, CI_PROFESOR),
        FOREIGN KEY (CI_PROFESOR) REFERENCES MTN.PROFESOR       (CI_PROFESOR)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        FOREIGN KEY (ID_EQUIPO)   REFERENCES MTN.EQUIPO         (ID_EQUIPO)
            ON UPDATE CASCADE
            ON DELETE CASCADE
    );

     CREATE TABLE MTN.COMPETENCIA(
         ID_COMPETENCIA        MTN.DIEZ_CARACTERES    NOT NULL,
         NOMBRE_COMPETENCIA    MTN.TREINTA_CARACTERES NOT NULL,
         NIVEL                 MTN.NIVEL_COMP         NOT NULL,          
         LUGAR_COMPETENCIA     MTN.TREINTA_CARACTERES NOT NULL,
         FECHA_COMPETENCIA     MTN.TREINTA_CARACTERES NOT NULL,
         PRIMARY KEY (ID_ACTIVIDAD)
     );
    CREATE TABLE mtn.Participa(
        nombre_eq       mtn.treinta_caracteres  NOT NULL,
        año_equipo      mtn.año_eq              NOT NULL, /*agg a fase 1 y fase 2*/    
        nombre_comp     mtn.treinta_caracteres  NOT NULL,
        fecha           mtn.fecha               NOT NULL,
        incentivo       mtn.treinta_caracteres  NOT NULL,
        site            mtn.quince_caracteres   NOT NULL,
        ranking         mtn.ranking_eq          NOT NULL,
        rendimiento     mtn.rend_eq             NOT NULL,
        PRIMARY KEY(nombre_eq, año_equipo, nombre_comp, fecha),
        FOREIGN KEY(nombre_eq, año_equipo) REFERENCES mtn.Equipo(nombre_eq, año)
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
        año_equipo  mtn.año_eq                   NOT NULL, /*agg a fase 1 y fase 2*/
        titulo      mtn.treinta_caracteres       NOT NULL,
        tiempo      mtn.diez_caracteres          NOT NULL,
        lenguaje    mtn.lenguaje_p               NOT NULL,
        PRIMARY KEY (nombre_eq, año_equipo,titulo),
        FOREIGN KEY (nombre_eq, año_equipo) REFERENCES mtn.Equipo(nombre_eq, año)
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
   