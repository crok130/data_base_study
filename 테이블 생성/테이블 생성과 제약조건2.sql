-- 체크 제약조건
-- 해당 속성(컬럼, 열)에서 입력될 수 있는 데이터 범위를 제한
-- 조건에 만족하는 데이터만 입력 가능
USE test_db;
CREATE TABLE abults(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    CHECK (age >= 19)
    -- age 속성에 값이 들어올 때 19세 이상인지 확인
);

DESC abults;
SELECT * FROM abults;

-- 속성 값 해당 조건(19세 이상)이 아닌 경우 체크 제약 조건 위배
INSERT INTO `test_db`.`abults` (`id`, `name`, `age`) VALUES ('2', '미성년', '15');

-- Default 제약조건
-- 해당 속성에 대한 기본 값을 설정
-- 만약 값이 명시 되지 않았으면(Null), 지정된 기본 값이 자동으로 입력
CREATE TABLE member (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    status VARCHAR(50) DEFAULT '활동중',	-- 회원의 활동여부 기본값 "활동중"
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 가입일 기본값
);
DESC member;
SELECT * FROM member;

-- 값을 지정하지 않아도 설정된 기본값 입력ALTER
INSERT INTO `test_db`.`member` (`id`, `name`) VALUES ('2', '김철수');

-- Auto Increment
-- Mysql에서 사용되는 제약조건
-- 기본 키에 주로 사용되는 , 새로운 행이 추가될 때마다 자동으로 숫자가 증가되는 제약조건
CREATE TABLE persons(
 preson_id INT AUTO_INCREMENT PRIMARY KEY, -- 자동 증가하는 기본키 
 person_name VARCHAR(50)
);
DESC persons;
SELECT * FROM persons;

-- AI의 해당 컬럼을 생략해도 자동으로 값이 1씩 증가하묘 채워진다.
INSERT INTO person_name VALUES ('김철수');
INSERT INTO person_name VALUES ('김영희');
INSERT INTO person_name VALUES ('홍길동');

-- 외래 키 제약조건
USE test_db;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- 부서 테이블, 직원 테이블
CREATE TABLE departments(
	departments_id INT PRIMARY KEY,
    departments_name VARCHAR(255) NOT NULL
);

CREATE TABLE employees(
	employees_id INT PRIMARY KEY,
    employees_name VARCHAR(255) NOT NULL,
    departments_id INT,
    -- 직원 테이블의 부서ID는 부서 테이블의 부서ID를 참조
    -- 외래키 제약조건 생성
    FOREIGN KEY (departments_id) REFERENCES departments(departments_id)
);
DESC departments;
DESC employees;

SELECT * FROM departments;
SELECT * FROM employees;

-- 부서 테이블 생성
INSERT INTO `test_db`.`departments` (`department_id`, `department_name`) VALUES ('1', '인사팀');
INSERT INTO `test_db`.`departments` (`department_id`, `department_name`) VALUES ('2', '기획팀');

-- 참조하는 테이블의 속성에 없는 값을 외래 키에 입력할 경우 외래키 참조 재약조건 위배
INSERT INTO `test_db`.`employees` (`employees_id`, `employees_name`, `departments_id`) VALUES ('2', '김철수', '3');

-- 외래 키를 통해 데이터의 '관계'의 '일관성', '무결성'을 보장한다.
