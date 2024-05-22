USE alter_db;
-- 테이블 삭제(DROP)
-- DDL의 일부, DB 객체를 삭제
-- 테이블의 구조와 테이블에 포함되어있는 데이터가 영구적으로 삭제

SHOW TABLES; -- 현제 테이블 확인

-- 테이블에 참조관계가 생성되어 있는 경우 참조하는 테이블을 먼저 삭제해야
-- 참조 받는 테이블을 삭제할 수 있습니다. (참조 무결성 제약조건)
DROP TABLE employees;				-- 테이블 삭제
DROP TABLE IF EXISTS department;	-- 테이블이 존재하는 경우에만 삭제

-- 데이터베이스명.테이블명으로 선택되지 않은 테이블 삭제 가능
-- 컴마(,)를 통해 여러 테이블 동시 삭제 가능
DROP TABLE excercise.book , employees.borrowrecords;

-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS drop_db;
USE drop_db;
-- employees 샘플 데이터베이스의 구조를 복사하여 테이블 생성
CREATE TABLE employees LIKE employees.employees;
-- employees 샘플 데이터베이스의 데이터를 복사하여 삽입
INSERT INTO employees
	SELECT * FROM employees.employees;
SELECT * FROM employees;

-- TRUNCATE
-- 테이블의 모든 데이터를 삭제하지만, 테이블 구조는 유지
-- 테이블의 데이터를 빠르게 초기화할 때 사용
TRUNCATE TABLE employees;

SELECT * FROM employees;

DROP DATABASE drop_db;