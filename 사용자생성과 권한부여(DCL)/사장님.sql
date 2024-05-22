-- 사장님 (전역(global)읽기 권한만 부여함) 

CREATE DATABASE abc; -- (오류) 데이터베이스 생성 권한 없음

USE shopdb;		-- 데이터베이스 접근 가능
DROP TABLE membartbl;		-- (오류) 테이블 삭제 권한 없음

INSERT INTO membartbl	
	VALUE (10, '홍길동', '부산');	-- (오류) INSERT 데이터 삽입 권한 없음
    
SELECT * FROM membartbl;		-- SELECT 권한 존재
SELECT * FROM sakila.actor;		-- 전역적인 읽기 권한 있음