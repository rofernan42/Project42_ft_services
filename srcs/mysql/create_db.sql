CREATE USER 'rofernan'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'rofernan'@'%' WITH GRANT OPTION;
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'rofernan'@'%' IDENTIFIED BY 'password';
UPDATE mysql.user set plugin='mysql_native_password' where user='root';
DROP DATABASE test;
FLUSH PRIVILEGES;