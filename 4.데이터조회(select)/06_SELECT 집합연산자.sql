USE scott;

-- 1. UNION(합집합)
SELECT * FROM emp WHERE DEPTNO = 10;	-- 10번 부서 3 rows
SELECT * FROM emp WHERE DEPTNO = 20;	-- 20번 부서 5 rows

SELECT * FROM emp WHERE DEPTNO = 10
UNION
SELECT * FROM emp WHERE DEPTNO = 20;

-- 집합 연산자를 사용하려는 데이터 셋의 열 개수와 자료형이 다르면
-- 집합 연산자를 사용할 수 없음
SELECT ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

-- 열 개수와 자료형만 맞으면 집합 연산 가능
-- (정상적인 데이터가 들어가지 않을 수 있음)
SELECT ename, empno, sal, deptno
 FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno
 FROM emp WHERE deptno = 20;
 
 -- 10번 부서 + 20번 부서 직원 (8 rows)
SELECT *
 FROM emp WHERE deptno = 10 OR deptno = 20;

-- 20번 부서 + 30번 부서 직원 (11 rows)
SELECT *
 FROM emp WHERE deptno = 20 OR deptno = 30;


-- 10+20 번 부서(8) + 20+30번 부서(11) => 14 rows
-- 중복된 데이터(행, row)는 하나만 남는다.
SELECT *
 FROM emp WHERE deptno = 10 OR deptno = 20
UNION
SELECT *
 FROM emp WHERE deptno = 20 OR deptno = 30;
 
 -- UNION ALL : 중복 데이터도 모두 포함하여 결과 반환 
-- 쿼리1(8 rows) + 쿼리2(11 rows) = 19 rows (20번 부서 중복 포함)
SELECT *
 FROM emp WHERE deptno = 10 OR deptno = 20
UNION ALL
SELECT *
 FROM emp WHERE deptno = 20 OR deptno = 30;
 
 -- 교집합 (INTERSECT)
SELECT *
 FROM emp WHERE deptno = 10 OR deptno = 20
INTERSECT
SELECT *
 FROM emp WHERE deptno = 20 OR deptno = 30;
 
 -- 차집합 (EXPECT)
 -- 쿼리1의 결과에서 쿼리2의 결과 데이터 셋(교집합)을 제거한 결과 셋 변환
 -- Oracle DB에서는 MINUS 로 사용함
 -- MYSQL 8.x 버전부터 교집합, 차집합 사용에 관한문서
 -- https://dev.mysql.com/blog-archive/intersect-and-except-in-mysql-80/
 SELECT *
 FROM emp WHERE deptno = 10 OR deptno = 20
EXCEPT
SELECT *
 FROM emp WHERE deptno = 20 OR deptno = 30;
 
 -- FULL OUTER JOIN
 -- MySQL 에서는 FULL OUTER JOIN 을 지원하지 않음 (Orcal에서는 가능)
 -- 구현 방법 : LEFT JOIN RIGHT JOIN을 UNION 함으로 구현
SELECT e.ename, d.deptno
FROM emp e
LEFT JOIN dept d
USING (deptno)

UNION

SELECT e.ename, d.deptno
FROM emp e
RIGHT JOIN dept d
USING (deptno);