show variables like 'datadir';
-- C:\ProgramData\MySQL\MySQL Server 8.0\Data\

-- mysql에서는 사용자 등록을 할 대 접속경로를 설정
-- iouser는 localhost에서만 접속할 수 있다.
-- 본인의 컴퓨터, 현재 접속하는 서버에서만 접근 가능
CREATE USER 'iouser'@'localhost' IDENTIFIED BY '1234';
GRANT ALL privileges ON *.* TO 'iouser'@'localhost';

-- iouser는 모든 곳에서 원격, 로컬로 접속할 수 있다.
CREATE USER 'iouser'@'%' IDENTIFIED BY '1234';
GRANT ALL privileges ON *.* TO 'iouser'@'%';


-- 2020-01-21
-- 새로운 사용자를 등록하고 권한 부여
CREATE USER 'ems'@'localhost' IDENTIFIED BY 'ems'; 
GRANT ALL privileges ON *.* TO 'ems'@'localhost';

-- iouser는 모든 곳에서 원격, 로컬로 접속할 수 있다(@/%).
-- ems는 모든 곳에서 원격, 로컬로 접속할 수 있다.S
CREATE USER 'ems'@'%' IDENTIFIED BY 'ems';
GRANT ALL privileges ON *.* TO 'ems'@'%';

-- schema 생성
CREATE DATABASE emsDB;

USE emsDB;
SHOW TABLES;

-- IP 대역이 192.168.*.*에서만 접속 허가
create user 'ikouser'@'192.168.%' identified by '1234';
GRANT ALL privileges ON *.* TO 'iouser'@'195.168.%';

SELECT * FROM tbl_ems;
SELECT * FROM tbl_bbs;


commit;

desc tbl_bbs;

drop table tbl_bbs;