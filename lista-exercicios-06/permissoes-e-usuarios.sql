/*
### Criando todos os usuarios
*/
-- senha default 123456

CREATE USER 'Bob' IDENTIFIED BY '123456';
CREATE USER 'Betelgeuse' IDENTIFIED BY '123456';
CREATE USER 'Pitty' IDENTIFIED BY '123456';
CREATE USER 'Kelly' IDENTIFIED BY '123456';
CREATE USER 'Alice' IDENTIFIED BY '123456';
CREATE USER 'Thiago' IDENTIFIED BY '123456';
CREATE USER 'Benedita' IDENTIFIED BY '123456';
CREATE USER 'Nina' IDENTIFIED BY '123456';
CREATE USER 'Kyara' IDENTIFIED BY '123456';
CREATE USER 'Ganimedes' IDENTIFIED BY '123456';
CREATE USER 'Folo' IDENTIFIED BY '123456';


-- listando usuarios existentes
SELECT User, Host FROM mysql.user;



-- acessos de BOB

REVOKE CREATE ON *.* FROM 'Bob';
GRANT ALL ON pessoas.* TO 'Bob' WITH GRANT OPTION;
GRANT SELECT ON endereco.* TO 'Bob' WITH GRANT OPTION;



-- acessos de Alice

REVOKE CREATE ON *.* FROM 'Alice';
GRANT SELECT ON int_ensino.* TO 'Alice' WITH GRANT OPTION;
GRANT SELECT ON endereco.* TO 'Alice' WITH GRANT OPTION;



-- acessos de NINA

GRANT CREATE ON *.* TO 'Nina';
GRANT ALL ON int_ensino.* TO 'Nina' WITH GRANT OPTION;
GRANT ALL ON pessoas.* TO 'Nina';
GRANT SELECT ON pessoas.* TO 'Nina' WITH GRANT OPTION;



-- acessos de Betelgeuse

GRANT SELECT ON endereco.* TO 'Betelgeuse';
GRANT SELECT ON pessoas.* TO 'Betelgeuse';



-- acessos de Pitty

GRANT SELECT, INSERT ON pessoas.usuario TO 'Pitty';



-- acessos de Kelly

GRANT ALL ON pessoas.* TO 'Kelly';
GRANT ALL ON endereco.* TO 'Kelly';
GRANT ALL ON int_ensino.* TO 'Kelly';
GRANT CREATE VIEW ON *.* TO 'Kelly';



-- acessos de Thiago

GRANT SELECT ON endereco.* TO 'Thiago';
GRANT SELECT ON pessoas.usuario TO 'Thiago';
GRANT SELECT ON pessoas.contato TO 'Thiago';




-- acessos de Benedita

GRANT SELECT ON pessoas.usuario TO 'Benedita';
GRANT SELECT ON pessoas.contato TO 'Benedita';




-- acessos de Kyara

GRANT ALL ON int_ensino.* TO 'Kyara' WITH GRANT OPTION;
GRANT ALL ON pessoas.* TO 'Kyara' WITH GRANT OPTION;
GRANT ALL ON endereco.* TO 'Kyara' WITH GRANT OPTION;



-- acessos de Ganimedes

GRANT SELECT, INSERT, ALTER ON int_ensino.* TO 'Ganimedes';
GRANT SELECT, INSERT, ALTER ON pessoas.pessoas TO 'Ganimedes';




-- acessos de Foló

GRANT SELECT ON pessoas.pessoas TO 'Folo';
GRANT SELECT ON int_ensino.curso TO 'Folo';



SELECT *
FROM mysql.user;