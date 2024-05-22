 DROP SCHEMA IF EXISTS alter_db;
 CREATE SCHEMA alter_db;
 USe alter_db;
 
 -- 테이블 생성 (샘플 데이터베이스에서 테이블 구조를 복사)
 CREATE TABLE employee
	LIKE employees.employees;
    -- employees DB의 employees 테이블 구조와 같은 테이블을 현제 DB에 저장한다.
    
DESC employees;			 -- 테이블 구조 확인
SELECT * FROM employees; -- 테이터는 복사되지 않음

-- 1. ADD 새로운 컬럼 추가
ALTER TABLE e