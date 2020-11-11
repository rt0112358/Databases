create user 'bob'@'localhost' identified by 'password';
grant ALL PRIVILEGES on * . * to 'bob'@'localhost';
flush privileges;
select User from user;