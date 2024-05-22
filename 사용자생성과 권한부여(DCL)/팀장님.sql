-- 팀장님 권한(DBA 권한)
-- 모든 권한이 존재, 모든 명령이 수행 가능
-- 모든 데이터베이스와 모든 테이블을 제어 가능

CREATE DATABASE dcl_db;
DROP DATABASE dcl_db;

USE shopdb;
CREATE TABLE test(id int);
DROP TABLE test;