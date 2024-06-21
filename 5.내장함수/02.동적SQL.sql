-- 쿼리문(SQL문)을 문자열 형태로 저장한 다음 실행 시점에 실행
-- 반복적으로 사용하는 SQL문 성능 향상
-- SQL Injection 공격 방지

-- 1. 쿼리 문장을 준비
PREPARE 문장이름 FROM 'sql문자';
-- 2. 쿼리 문장에 필요한 값을 성정 SET, USING
SET @value = 10;
-- 3. 준비된 쿼리 문장을 실행
EXECUTE 문장이름 USING @value;
-- 4. 준비된 문장 메모리 해제
DEALLOCATE PREPARE 문장이름;

-- 쿼리 문자열 준비 : 향우 입력될 값을 ?로 바꿔 놓음
SET @query = 'SELECT * FROM emp WHERE deptno = ?';

-- 쿼리 문장준비
-- PREPARE statement FROM 'SELECT * FROM emp WHERE deptno = ?';
PREPARE statement FROM @query;

-- 2. 변수 설정
SET @deptno = 20;

-- 3. 문장 실행
EXECUTE statement USING @deptno;

-- 4. 문장 제거 (메모리 할당 해제)
DEALLOCATE PREPARE statement;

SET @query = 'SELECT * FROM emp WHERE DEPTNO = ? AND SAL > ?';
PREPARE stmt FROM @query;

SET @deptno =10;
set @sal = 2500;
-- 실행
EXECUTE stmt USING @deptno, @sal; -- ? 와 인자 개수를 맞춤.
-- 제거
DEALLOCATE PREPARE stmt;