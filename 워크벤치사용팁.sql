-- 워크벤치 사용 팁
USE shopdb;

-- Ctrl + D : 한 줄 복제
-- 예약어 대문자, 소문자로 변경
-- Edit -FORMAT - Upcase keyword : 대문자
-- Edit -FORMAT - low ercase Keyword : 소문자
-- Edit -FORMAT -Beautify Query : 표준형태 재배열
SELECT * FROM membartbl;

-- 자동완성 시 대문자로 완성되도록 변경하기
-- Edit - Preferences
-- SQL Editor > Query Editor
-- USE UPPERCASE keywords on completion 체크
SELECT * FROM membartbl;

-- 데이터의 수정과 삭제를 가능하도록 설정 변경
-- Edit - Preferences
-- SQL Editor
-- Safe Update 체크 해제

-- 실행 Ctrl + Enter
-- 커서가 위치한 세미클론과 다음 세미클론 사이 위치한 문자을 실행
