-- 테이블 확인
SELECT * FROM TAB;

-- 테이블 생성
CREATE TABLE WORK ( -- 관리자 정보
    ID VARCHAR2(20) PRIMARY KEY,
    PWD VARCHAR2(20),
    NAME VARCHAR2(40),
    PHONE VARCHAR2(20)
);

-- 테이블 내용 확인
SELECT * FROM WORK;

-- 데이터 입력 (1000 admin123 박대용 123456)
INSERT INTO WORK VALUES ('1000','admin123','박대용','123456');
INSERT INTO WORK VALUES ('2000','admin123','관리자','123456');
INSERT INTO WORK VALUES ('3000','admin123','지점장','123456');

-- 데이터 수정 삭제 (2000번 전화번호변경, 1000번 데이터 삭제)
UPDATE WORK SET PHONE='010-3333' WHERE ID='2000';
DELETE FROM WORK WHERE ID ='1000';

-- 박씨인 사람의 관리자를 모두 출력하시오
SELECT * FROM WORK WHERE NAME LIKE '박%';
-- 직원번호 2000, 3000인 사람을 모두 출력하시오
SELECT * FROM WORK WHERE ID IN ('2000', '3000');

-- 이메일 정보 컬럼을 추가하고 싶다 (EMAIL VARCHAR2(40))
ALTER TABLE WORK ADD EMAIL VARCHAR2(40);
-- 이메일 컬럼 타입을 변경하기 ( EMAIL VARCHAR2(100) )
ALTER TABLE WORK MODIFY EMAIL VARCHAR2(100);
-- 이메일 컬럼명을 변경하기 (EMAIL -> MAIL )
ALTER TABLE WORK RENAME COLUMN EMAIL TO MAIL;
-- 이메일 컬럼을 삭제하기
ALTER TABLE WORK DROP COLUMN MAIL;
-- 테이블명 변경 (WORK -> MANAGER)
ALTER TABLE WORK RENAME TO MANAGER;
DESC MANAGER;

SELECT COUNT(*) as CNT FROM MANAGER;
SELECT * FROM MANAGER;

-- 회원테이블 생성
CREATE TABLE member (
    id varchar2(20) PRIMARY KEY,
    pwd varchar2(20) NOT NULL, 
    name varchar2(40) NOT NULL,
    email varchar2(40),
    zip_num varchar2(7),
    address varchar2(255),
    address2 varchar2(255),
    phone varchar2(20),
    useryn char(1) DEFAULT 'y',
    indate date DEFAULT SYSDATE
);

-- 샘플 데이터 입력
INSERT INTO MEMBER (id, pwd, name) VALUES ('kkws', '1234', '김건우S');

-- 데이터 확인
SELECT * FROM MEMBER;
SELECT id, name, email, phone, useryn FROM MEMBER;
DELETE FROM MEMBER WHERE id='song';

-- 로그인 인증
SELECT COUNT(*) FROM MEMBER;

-- 게시판 테이블 생성
CREATE TABLE BO_NOTICE (
    no number(5) PRIMARY KEY,
    groupno number(5) NOT NULL,
    depth number(5) DEFAULT 0,
    orderno number(5) DEFAULT 0,
    id varchar2(20) NOT NULL,
    pw varchar2(20),
    writer varchar2(30) NOT NULL,
    hp varchar2(20),
    email varchar2(40),
    subject varchar2(255) NOT NULL,
    content clob NOT NULL,
    hit number(5) DEFAULT 0,
    regdate date DEFAULT SYSDATE
);
CREATE SEQUENCE BO_NOTICE_SEQ 
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 99999
    NOCYCLE 
    NOCACHE ;

-- 시퀀스 생성후 사용하려면 NEXTVAL을 한번 동작해야 함
SELECT BO_NOTICE_SEQ.NEXTVAL FROM DUAL;
SELECT BO_NOTICE_SEQ.CURRVAL FROM DUAL;

INSERT INTO BO_NOTICE (no, groupno, id, writer, subject, content) VALUES 
                      (1, 1, 'kkws', '관리자', '공지글테스트1', '내용테스트1');
INSERT INTO BO_NOTICE (no, groupno, id, writer, subject, content) VALUES 
                      (2, 2, 'pdyd', '팀장', '공지글테스트2', '내용테스트2');                      
                      
SELECT no, subject, TO_CHAR(regdate, 'yyyy-MM-DD') as regdate, hit FROM bo_notice
ORDER BY no DESC;
-- SQL DEVELOPER 클라이언트 이므로 변경 확정을 위해 COMMIT

CREATE TABLE BO_ATTACH (
    no -- 첨부파일 각각의 번호
    filename -- 첨부파일명
    finesize -- 파일사이즈
    filedesc -- 파일설명
    bno -- 게시판 일련번호
) 






