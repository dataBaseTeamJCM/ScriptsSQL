\c maraton 

REVOKE    CONNECT
    ON    DATABASE maraton                /*revoca privilegios sobre la bd*/
    FROM  programador;

REVOKE  USAGE 
    ON  SCHEMA mtn                      /*revoca privilegios sobre el schema*/
    FROM  programador;

REVOKE   UPDATE,SELECT
    ON   TABLE mtn.integrante,
              mtn.viaja,
              mtn.tipo_hospedaje,
              mtn.tipo_financista,
              mtn.tipo_incidente
    FROM  programador;

REVOKE  SELECT
    ON  TABLE mtn.es_un_profesor,           /* revoca privivilegios sobre las tablas*/
              mtn.es_un_estudiante,
              mtn.resuelve,
              mtn.competencia,
              mtn.propone,
              mtn.problema,
              mtn.constituye,
              mtn.equipo   
    FROM  programador;
/*********roles de coordinador************************/
REVOKE    ALL PRIVILEGES 
    ON    DATABASE maraton        /*revoca privilegios sobre la base de datos*/
    FROM  coordinador;

REVOKE    ALL PRIVILEGES
    ON    SCHEMA mtn              /*revoca privilegios sobre el schema*/
    FROM  coordinador;

REVOKE   ALL PRIVILEGES
    ON  TABLE mtn.integrante,       /*revoca privilegios sobre las tablas*/
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
    FROM  coordinador;

DROP USER programador;  /*elimina el usuario*/
DROP USER coordinador;    