\c maraton   

CREATE ROLE role1 nosuperuser;
CREATE ROLE role2 nosuperuser;
/*********roles de programador************************/
GRANT   CONNECT 
    ON  DATABASE maraton                /*privilegios sobre la bd*/
    TO  role1;

GRANT   USAGE 
    ON  SCHEMA mtn                      /*provilegios sobre el schema*/
    TO  role1;

GRANT   UPDATE,SELECT
    ON  TABLE mtn.integrante,
              mtn.viaja,
              mtn.tipo_hospedaje,
              mtn.tipo_financista,
              mtn.tipo_incidente
    TO  role1;

GRANT   SELECT
    ON  TABLE mtn.es_un_profesor,           /* privivilegios sobre las tablas*/
              mtn.es_un_estudiante,
              mtn.resuelve,
              mtn.competencia,
              mtn.propone,
              mtn.problema,
              mtn.constituye,
              mtn.participa,
              mtn.equipo   
    TO  role1;
/*********roles de coordinador************************/
GRANT   ALL PRIVILEGES 
    ON  DATABASE maraton        /*se le da privilegios sobre la base de datos*/
    TO  role2;

GRANT   ALL PRIVILEGES
    ON  SCHEMA mtn              /*se le da privilegios sobre el schema*/
    TO  role2;

GRANT   ALL PRIVILEGES
    ON  ALL TABLES
    IN  SCHEMA
        mtn
    TO  role2;

CREATE USER programador NOSUPERUSER IN ROLE role1 PASSWORD '1234';
CREATE USER coordinador NOSUPERUSER IN ROLE role2 PASSWORD '1234';