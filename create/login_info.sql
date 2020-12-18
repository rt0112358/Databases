USE saveme;

DROP TABLE IF EXISTS login_info;

CREATE TABLE login_info (
    U_Id INT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserId VARCHAR(255) NOT NULL,
    UserPword VARCHAR(255) NOT NULL
);

INSERT INTO login_info(UserId, UserPword) VALUES ('Bill', 'password');
INSERT INTO login_info(UserId, UserPword) VALUES ('Bob', 'ujhba58vgn');
INSERT INTO login_info(UserId, UserPword) VALUES ('Carol', 'nm478fnwn');
INSERT INTO login_info(UserId, UserPword) VALUES ('Frank', 'bighair1985');
INSERT INTO login_info(UserId, UserPword) VALUES ('Jolynne', 'sn47vcn3bv@vc');
INSERT INTO login_info(UserId, UserPword) VALUES ('cupcake', 'nopassword');

-- -- Compare encrypted and raw string 
-- SELECT STRCMP('cupcake', '1e4ade52b3e99d52ed298b37f26b09915a302a17');
