#!/bin/bash
mysql -uroot -p123456 -e "use mysql;
update user set host='%' where user='root';
flush privileges;
grant all privileges on *.* to 'root'@'%';
flush privileges;"

