-- 지원 2개의 스마만ㅝㄴ한 부여
-- shopdb : INSERT, UPDATE, DELETE, SELECT
-- employees : SELECT

SHOW DATABASES;		-- 권한이 있는 데이터베이스 외에는 보이지 않음

USE employees;		-- 권한이 있는 데이터베이스 접근 가능

SELECT * FROM employees;	-- 권한이 있는 명령(읽기) 사용 가능

DELETE FROM employees;		-- (오류) 권한이 없는 명령 불가

SELECT * FROM sakila.actor;	-- (오류) 권한이 없는 스키마는 조회 불가

USE shopdb; -- 권한이 있는 데이터베이스 접근

SELECT * FROM membartbl;

INSERT INTO membartbl VALUES ('ABC', '에비시','부산 남구');		-- INSERT 가능

DELETE FROM membartbl WHERE memberID = 'ABC';	-- DELETE 가능

CREATE TABLE abc (id INT);	-- (오류) DDL 권한 없음
DROP TABLE membartbl;	-- (오류) DDL 권한 없음