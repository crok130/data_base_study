DROP SCHEMA IF EXISTS LibraryManagement;
CREATE SCHEMA LibraryManagement;
use LibraryManagement;
/*
1. Books 테이블: 도서 정보를 저장합니다.
    - `BookID` (정수형, 기본 키, 자동 증가): 도서의 고유 번호입니다.
    - `Title` (문자열, 필수): 도서의 제목입니다.
    - `Author` (문자열, 필수): 도서의 저자입니다.
    - `PublishedYear` (정수형): 도서의 출판 연도입니다.
    - `Genre` (문자열): 도서의 장르입니다.
2. Members 테이블: 도서관 회원 정보를 저장합니다.
    - `MemberID` (정수형, 기본 키, 자동 증가): 회원의 고유 번호입니다.
    - `FirstName` (문자열, 필수): 회원의 이름입니다.
    - `LastName` (문자열, 필수): 회원의 성입니다.
    - `Email` (문자열, 필수, 고유): 회원의 이메일 주소입니다.
    - `MembershipDate` (날짜, 기본값 현재 날짜): 회원가입 날짜입니다.
3. BorrowRecords 테이블: 도서 대출 기록을 저장합니다.
    - `RecordID` (정수형, 기본 키, 자동 증가): 대출 기록의 고유 번호입니다.
    - `MemberID` (정수형, 외래 키): 대출한 회원의 ID입니다.
    - `BookID` (정수형, 외래 키): 대출된 도서의 ID입니다.
    - `BorrowDate` (날짜): 도서 대출 날짜입니다.
    - `ReturnDate` (날짜): 도서 반납 예정 날짜입니다.
    */
    
CREATE TABLE Books(
	BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(20) NOT NULL,
    Author VARCHAR(20) NOT NULL,
    PublishedYear INT,
    Genre VARCHAR(20)
);

CREATE TABLE Members(
	MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    MembershipDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    CHECK (FirstName != '')
    CHECK (LasttName != '')
);

CREATE TABLE BorrowRecords(
	RecordID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM borrowrecords;
