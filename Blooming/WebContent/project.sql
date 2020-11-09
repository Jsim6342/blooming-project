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

예약 테이블 생성
CREATE TABLE RESERVATION (
RES_NUM NUMBER(30) NOT NULL PRIMARY KEY,
NICKNAME VARCHAR2(50) NOT NULL,
CONSTRAINT FK_RESERVATION FOREIGN KEY (NICKNAME) REFERENCES MEMBER (NICKNAME),
RES_DATE VARCHAR2(50) NOT NULL,
CONSULTANT VARCHAR2(50) NOT NULL,
PRO_EMAIL VARCHAR2(50) NOT NULL
)

후기 테이블 생성
CREATE TABLE REVIEW (
REV_NUM NUMBER(30) NOT NULL PRIMARY KEY,
NICKNAME VARCHAR2(50) NOT NULL,
CONSTRAINT FK_REVIEW FOREIGN KEY (NICKNAME) REFERENCES MEMBER (NICKNAME),
REV_TITLE VARCHAR2(50) NOT NULL,
REV_CONTENTS VARCHAR2(1000) NOT NULL
)

일기 테이블 생성
CREATE TABLE DIARY (
DI_NUM NUMBER(30) NOT NULL PRIMARY KEY,
NICKNAME VARCHAR2(50) NOT NULL,
CONSTRAINT FK_DIARY FOREIGN KEY (NICKNAME) REFERENCES MEMBER (NICKNAME),
DI_DATE DATE NOT NULL,
DI_TITLE VARCHAR2(50) NOT NULL,
DI_CONTENTS VARCHAR2(1000) NOT NULL,
DI_SCORE BINARY_DOUBLE
)


상담사 프로필 테이블 생성
CREATE TABLE C_PROFILE (
PRO_EMAIL VARCHAR2(50) NOT NULL PRIMARY KEY,
PRO_NAME VARCHAR2(50) NOT NULL,
PRO_DATE VARCHAR2(50) NOT NULL,
BACKGROUND VARCHAR2(500) NOT NULL,
INTRODUCE VARCHAR2(1000) NOT NULL,
MAX_PEOPLE NUMBER(10) NOT NULL
)


시퀀스 생성(예약현황)
CREATE SEQUENCE RES_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
CYCLE

시퀀스 생성(후기)
CREATE SEQUENCE REV_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
CYCLE

시퀀스 생성(일기)
CREATE SEQUENCE DI_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
CYCLE

모든 테이블 확인
SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE'

테이블 제거
drop table RESERVATION

테이블 확인
select * from MEMBER
select * from CONSULTANT
select * from REVIEW
select * from C_PROFILE
select * from RESERVATION

테이블 값 삽입
INSERT INTO C_PROFILE values('consultant@naver.com','상담사','매주 수요일 6시','서울대 심리학과 졸업','상담 잘해요',20)

테이블 값 제거
delete from reservation where pro_email='consultant@naver.com'