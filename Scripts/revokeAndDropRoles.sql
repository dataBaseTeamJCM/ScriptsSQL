\c maraton 

REVOKE    CONNECT
    ON    DATABASE maraton                /*revoca privilegios sobre la bd*/
    FROM  role1;

REVOKE  USAGE 
    ON  SCHEMA mtn                      /*revoca privilegios sobre el schema*/
    FROM  role1;

REVOKE   UPDATE,SELECT
    ON   TABLE mtn.integrante,
              mtn.viaja,
              mtn.tipo_hospedaje,
              mtn.tipo_financista,
              mtn.tipo_incidente
    FROM  role1;

REVOKE  SELECT
    ON  TABLE mtn.es_un_profesor,           /* revoca privivilegios sobre las tablas*/
              mtn.es_un_estudiante,
              mtn.resuelve,
              mtn.competencia,
              mtn.propone,
              mtn.problema,
              mtn.constituye,
              mtn.participa,
              mtn.equipo   
    FROM  role1;
/*********roles de coordinador************************/
REVOKE    ALL PRIVILEGES 
    ON    DATABASE maraton        /*revoca privilegios sobre la base de datos*/
    FROM  role2;

REVOKE    ALL PRIVILEGES
    ON    SCHEMA mtn              /*revoca privilegios sobre el schema*/
    FROM  role2;

REVOKE    ALL PRIVILEGES
    ON    ALL TABLES
    IN    SCHEMA mtn
    FROM  role2;    

DROP USER programador;  /*elimina el usuario*/
DROP USER coordinador;
DROP ROLE role1;  /*elimina el usuario*/
DROP ROLE role2;
    
