USE test;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    U_Id INT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserId VARCHAR(255) NOT NULL,
    UserPword VARCHAR(255) NOT NULL
);

INSERT INTO users(UserId, UserPword) VALUES ('Bill', sha1('password'));
INSERT INTO users(UserId, UserPword) VALUES ('Bob', sha1('hdf52Dn5KQOWeB'));
INSERT INTO users(UserId, UserPword) VALUES ('Carol', sha1('hdf52Dn5KQOWeB'));
INSERT INTO users(UserId, UserPword) VALUES ('Frank', sha1('h'));
INSERT INTO users(UserId, UserPword) VALUES ('Jolynne', sha1('hdf52Dn5KQOWe'));