# Backups
  
*Physical Backup*  
```bash
$ mysql -u root -p
mysql> create database newstuff;
mysql> create table backup_table;
mysql> exit;
$ service mysql stop
$ sudo su
$ cd /var/lib/mysql/stuff
$ cp *.ibd /var/lib/mysql/newstuff
$ chown mysql:mysql backup_table.ibd
$ chmod 750 backup_table.ibd
$ service mysql restart
$ mysql -u root -p
mysql> use newstuff;
mysql> alter table backup_table import tablespace;
mysql> select * from backup_table;
mysql> exit;
$ systemctl suspend
```