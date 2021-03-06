-- root 계정의 비밀번호를 분실했을 때 시도
-- 기존에 등록된 다른 id로 로그인하여 수행
-- 단 다른 id는 grant all로 지정되어 있어야 한다.
-- mysql 설치 후에 새로운 사용자를 등록하고alter
-- grant를 all로 선언하여 생성해두기***
ALTER USER 'root'@'localhost'
IDENTIFIED WITH myslq_native_password BY '!aa1234';

-- UTF-8

USE emsdb;
DROP TABLE tbl_bbs;

CREATE TABLE tbl_bbs(
	BBS_ID	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	BBS_P_ID	BIGINT	DEFAULT 0,	
	BBS_WRITER	VARCHAR(10)	NOT NULL,	
	BBS_DATE	VARCHAR(10),		
	BBS_TIME	VARCHAR(10),	
	BBS_SUBJECT	VARCHAR(10),		
	BBS_CONTENT	VARCHAR(10),		
	BBS_COUNT	INT	DEFAULT 0	
);

-- mysql8에서는 기본 문자열 인코딩이 utf8mb4방식으로 설정되어
-- varchar type의 칼럼에 문자열을 저장하면
-- 영문, 숫자 등은 1개가 1byte, 기타 다국어는 1~4byte까지
-- 자동 가변형으로 저장이 된다.

-- mysql 개발자들이 문자열 type의 저장 크기를 지정할 때 다국어는 3byte로 맞춰놓았는데
-- 3byte 미만의 이모지가 등장하자 mb4를 만들어 다국어 이모지 지원을 시작함
-- 이후로도 끝없이 영어 이외의 다국어 byte문제가 등장하자
-- mysql에서는 nvarchar를 없애고 varchar만을 남겨두고 가변형으로 저장되게끔 바꿈
-- (8.x에서는 모두 4byte방식으로 변화됨)

-- mysql에서 현재 database schema가 어떤 encoding인지 확인
SHOW SESSION VARIABLES LIKE 'collation_connection';

-- mysql 5.x 이하에서는 UTF8과 latin1 방식으로 설정되어 많은 문제를 일으켰다.
-- mysql 5.x 이하의 UTF8은 3byte방식 가변 문자열로 Emoji와 같은 특수문자는 인식하지 못한다.


CREATE TABLE tbl_menu(
	MENU_ID	VARCHAR(3)	NOT NULL	PRIMARY KEY,
	MENU_P_ID	VARCHAR(3),		
	MENU_TITLE	VARCHAR(10)	NOT NULL,	
	MENU_HREF	VARCHAR(125)		
);

INSERT INTO `emsdb`.`tbl_menu`
VALUES('M01', NULL, 'Home', '/');

INSERT INTO `emsdb`.`tbl_menu`
VALUES('M02', NULL, '관리자', '#');

INSERT INTO `emsdb`.`tbl_menu`
VALUES('M03', 'M02', '로그인', '#');

INSERT INTO `emsdb`.`tbl_menu`
VALUES('M04', 'M02', '회원가입', '#');

INSERT INTO `emsdb`.`tbl_menu`
VALUES('M05', 'M02', '게시판정리', '#');

DESC tbl_menu;

SELECT * FROM tbl_bbs;
SELECT * FROM tbl_menu;

UPDATE tbl_menu
SET menu_p_id = NULL
WHERE menu_id IN ('M01', 'M02');

COMMIT;


