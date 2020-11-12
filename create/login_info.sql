USE stuff;

DROP TABLE IF EXISTS login_info;

CREATE TABLE login_info (
    U_Id INT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserId VARCHAR(255) NOT NULL,
    UserPword VARCHAR(255) NOT NULL
);

INSERT INTO login_info(UserId, UserPword) VALUES ('Bill', sha1('password'));
INSERT INTO login_info(UserId, UserPword) VALUES ('Bob', sha1('hdf52Dn5KQOWeB'));
INSERT INTO login_info(UserId, UserPword) VALUES ('Carol', sha1('hdf52Dn5KQOWeB'));
INSERT INTO login_info(UserId, UserPword) VALUES ('Frank', sha1('h'));
INSERT INTO login_info(UserId, UserPword) VALUES ('Jolynne', sha1('hdf52Dn5KQOWe'));
INSERT INTO login_info(UserId, UserPword) VALUES (sha1('cupcake'), sha1('password'));

-- Compare encrypted and raw string 
SELECT STRCMP('cupcake', '1e4ade52b3e99d52ed298b37f26b09915a302a17');
