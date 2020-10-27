Queries for Sample Databases
  
*Load sample databases*
```bash
$ cd SampleDatabase/
$ cat *.sql | mysql -u root -p
```
*Run query*
```bash
$ mysql -u root -p
mysql> source ~/Databases/query_number.sql 
```
OR
```bash
$ cd ~/Databases/
$ mysql -u root -p < [query_number.sql]
```

