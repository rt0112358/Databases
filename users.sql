USE test;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    U_Id INT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserId VARCHAR(255) NOT NULL,
    UserPword VARCHAR(255) NOT NULL
);

INSERT INTO users(UserId, UserPword) VALUES ('Bill', sha1('password'));
INSERT INTO users(UserId, UserPword) VALUES ('Bob', sha1('password'));