상담사 테이블 생성
CREATE TABLE CONSULTANT (
CON_EMAIL VARCHAR2(50) NOT NULL PRIMARY KEY,
CON_PW VARCHAR2(50) NOT NULL,
CON_NAME VARCHAR2(50) NOT NULL,
CON_TEL VARCHAR2(50) NOT NULL,
LICENSE VARCHAR2(50) NOT NULL,
LOCATION VARCHAR2(50) NOT NULL
)

회원 테이블 생성
CREATE TABLE MEMBER (
EMAIL VARCHAR2(50) NOT NULL,
PW VARCHAR2(50) NOT NULL,
TEL VARCHAR2(50) NOT NULL,
NICKNAME VARCHAR2(50) NOT NULL PRIMARY KEY
)

모든 테이블 확인
SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE'
