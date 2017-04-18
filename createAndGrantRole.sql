\c maraton   

CREATE ROLE programador nosuperuser;
CREATE ROLE coordinador nosuperuser;
ALTER  ROLE programador password '1234'; 
ALTER  ROLE coordinador password '1234';
ALTER  ROLE programador LOGIN; 
ALTER  ROLE coordinador LOGIN;
/*********roles de programador************************/
GRANT   CONNECT 
    ON  DATABASE maraton                /*privilegios sobre la bd*/
    TO  programador;

GRANT   USAGE 
    ON  SCHEMA mtn                      /*provilegios sobre el schema*/
    TO  programador;

GRANT   UPDATE,SELECT
    ON  TABLE mtn.integrante,
              mtn.viaja,
              mtn.tipo_hospedaje,
              mtn.tipo_financista,
              mtn.tipo_incidente
    TO  programador;

GRANT   SELECT
    ON  TABLE mtn.es_un_profesor,           /* privivilegios sobre las tablas*/
              mtn.es_un_estudiante,
              mtn.resuelve,
              mtn.competencia,
              mtn.propone,
              mtn.problema,
              mtn.constituye,
              mtn.equipo   
    TO  programador;
/*********roles de coordinador************************/
GRANT   ALL PRIVILEGES 
    ON  DATABASE maraton        /*se le da privilegios sobre la base de datos*/
    TO  coordinador;

GRANT   ALL PRIVILEGES
    ON  SCHEMA mtn              /*se le da privilegios sobre el schema*/
    TO  coordinador;

GRANT   ALL PRIVILEGES
    ON  TABLE mtn.integrante,       /*se le da privilegios sobre las tablas*/
              mtn.viaja,
              mtn.tipo_hospedaje,
              mtn.tipo_financista,
              mtn.tipo_incidente,
              mtn.participa,
              mtn.competencia,
              mtn.tipo_clases,
              mtn.resuelve,
              mtn.propone,
              mtn.problema,
              mtn.constituye,
              mtn.equipo,
              mtn.actividad,
              mtn.prepara_a,
              mtn.es_un_estudiante,
              mtn.es_un_profesor
    TO  coordinador;