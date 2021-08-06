-- liquibase formatted sql


-- changeset daniele.scalco:1 logicalFilePath:changelog-master.mysql.sql
-- comment: create casa, persona tables
CREATE TABLE casa (id INT AUTO_INCREMENT NOT NULL, indirizzo VARCHAR(100) NULL, CONSTRAINT PK_CASA PRIMARY KEY (id));	

CREATE TABLE persona (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(45) NULL, id_casa INT DEFAULT NULL NULL, auto INT DEFAULT NULL NULL, CONSTRAINT PK_PERSONA PRIMARY KEY (id));

CREATE INDEX fk_persona_casa ON persona(id_casa);

ALTER TABLE persona ADD CONSTRAINT fk_persona_casa FOREIGN KEY (id_casa) REFERENCES casa (id) ON UPDATE RESTRICT ON DELETE RESTRICT;
-- rollback DROP TABLE persona;
-- rollback DROP TABLE casa;


-- changeset daniele.scalco:2 logicalFilePath:changelog-master.mysql.sql
-- comment: create prova table
CREATE TABLE prova (
	id INT PRIMARY KEY
);
-- rollback DROP TABLE prova;


-- changeset daniele.scalco:3 logicalFilePath:changelog-master.mysql.sql
-- comment: add prova.code
ALTER TABLE prova ADD COLUMN code INT;
-- rollback ALTER TABLE prova DROP COLUMN code;