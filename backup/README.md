# Backups
  
*Physical backup steps *  
```bash
$ mysql -u root -p
```
```sql
mysql> create database newstuff;
mysql> create table backup_table;
mysql> exit;
```
```bash
$ service mysql stop
$ sudo su
$ cd /var/lib/mysql/stuff
$ cp *.ibd /var/lib/mysql/newstuff
$ chown mysql:mysql backup_table.ibd
$ chmod 750 backup_table.ibd
$ service mysql restart
$ mysql -u root -p
```
```sql
mysql> use newstuff;
mysql> alter table backup_table import tablespace;
mysql> select * from backup_table;
mysql> exit;
```
```bash
$ systemctl suspend
```