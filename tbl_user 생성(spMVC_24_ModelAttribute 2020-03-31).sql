-- alter user 'root'@'localhost'
-- identified with mysql_native_password by ='aa1234'

create database books;
create user books;
create user 'books'@'localhost' identified by 'books';
GRANT all privileges on books.* to 'books'@'localhost';

-- books db에 table을 생성하기위해 db open
use books;
create table tbl_user(
	userId varchar(20) PRIMARY KEY,
    password varchar(125),
    userName varchar(30),
    userRole varchar(10)
	
);
