CREATE ROLE quarkus WITH LOGIN PASSWORD 'quarkus';
CREATE DATABASE bootstrap_security_jdbc;
GRANT ALL PRIVILEGES ON DATABASE bootstrap_security_jdbc TO quarkus;
\c bootstrap_security_jdbc

CREATE TABLE appuser (
    id INT CONSTRAINT PK_appuser PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    role VARCHAR(255)
);
ALTER TABLE appuser OWNER TO quarkus;
GRANT ALL PRIVILEGES ON TABLE appuser TO quarkus;
INSERT INTO appuser (id, username, password, role) VALUES (1, 'superadmin', 'superadmin', 'SUPERADMIN');