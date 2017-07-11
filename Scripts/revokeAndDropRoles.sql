\c maraton 

REVOKE    CONNECT
    ON    DATABASE maraton                /*revoca privilegios sobre la bd*/
    FROM  role1;

REVOKE  USAGE 
    ON  SCHEMA mtn                      /*revoca privilegios sobre el schema*/
    FROM  role1;

REVOKE   UPDATE,SELECT
    ON   TABLE MTN.ESTUDIANTE,
              MTN.VIAJA,
              MTN.TIPO_INCIDENTE
    FROM  role1;

REVOKE  SELECT
    ON  TABLE MTN.PROFESOR,           /* privivilegios sobre las tablas*/
              MTN.RESUELVE,
              MTN.COMPETENCIA,
              MTN.PROPONE,
              MTN.PROBLEMA,
              MTN.CONSTITUYE_ESTUDIANTE,
              MTN.PROFESOR_REPRESENTA,
              MTN.PREPARA_A,
              MTN.ACTIVIDAD,
              MTN.PARTICIPA,
              MTN.UNIVERSIDAD_EQUIPO,
              MTN.EQUIPO,
              MTN.CLASES  
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
    
