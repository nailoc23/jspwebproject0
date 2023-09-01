-- ���̺� Ȯ��
SELECT * FROM TAB;

-- ���̺� ����
CREATE TABLE WORK ( -- ������ ����
    ID VARCHAR2(20) PRIMARY KEY,
    PWD VARCHAR2(20),
    NAME VARCHAR2(40),
    PHONE VARCHAR2(20)
);

-- ���̺� ���� Ȯ��
SELECT * FROM WORK;

-- ������ �Է� (1000 admin123 �ڴ�� 123456)
INSERT INTO WORK VALUES ('1000','admin123','�ڴ��','123456');
INSERT INTO WORK VALUES ('2000','admin123','������','123456');
INSERT INTO WORK VALUES ('3000','admin123','������','123456');

-- ������ ���� ���� (2000�� ��ȭ��ȣ����, 1000�� ������ ����)
UPDATE WORK SET PHONE='010-3333' WHERE ID='2000';
DELETE FROM WORK WHERE ID ='1000';

-- �ھ��� ����� �����ڸ� ��� ����Ͻÿ�
SELECT * FROM WORK WHERE NAME LIKE '��%';
-- ������ȣ 2000, 3000�� ����� ��� ����Ͻÿ�
SELECT * FROM WORK WHERE ID IN ('2000', '3000');

-- �̸��� ���� �÷��� �߰��ϰ� �ʹ� (EMAIL VARCHAR2(40))
ALTER TABLE WORK ADD EMAIL VARCHAR2(40);
-- �̸��� �÷� Ÿ���� �����ϱ� ( EMAIL VARCHAR2(100) )
ALTER TABLE WORK MODIFY EMAIL VARCHAR2(100);
-- �̸��� �÷����� �����ϱ� (EMAIL -> MAIL )
ALTER TABLE WORK RENAME COLUMN EMAIL TO MAIL;
-- �̸��� �÷��� �����ϱ�
ALTER TABLE WORK DROP COLUMN MAIL;
-- ���̺�� ���� (WORK -> MANAGER)
ALTER TABLE WORK RENAME TO MANAGER;
DESC MANAGER;

SELECT COUNT(*) as CNT FROM MANAGER;
SELECT * FROM MANAGER;

-- ȸ�����̺� ����
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

-- ���� ������ �Է�
INSERT INTO MEMBER (id, pwd, name) VALUES ('kkws', '1234', '��ǿ�S');

-- ������ Ȯ��
SELECT * FROM MEMBER;
SELECT id, name, email, phone, useryn FROM MEMBER;
DELETE FROM MEMBER WHERE id='song';

-- �α��� ����
SELECT COUNT(*) FROM MEMBER;

-- �Խ��� ���̺� ����
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

-- ������ ������ ����Ϸ��� NEXTVAL�� �ѹ� �����ؾ� ��
SELECT BO_NOTICE_SEQ.NEXTVAL FROM DUAL;
SELECT BO_NOTICE_SEQ.CURRVAL FROM DUAL;

INSERT INTO BO_NOTICE (no, groupno, id, writer, subject, content) VALUES 
                      (1, 1, 'kkws', '������', '�������׽�Ʈ1', '�����׽�Ʈ1');
INSERT INTO BO_NOTICE (no, groupno, id, writer, subject, content) VALUES 
                      (2, 2, 'pdyd', '����', '�������׽�Ʈ2', '�����׽�Ʈ2');                      
                      
SELECT no, subject, TO_CHAR(regdate, 'yyyy-MM-DD') as regdate, hit FROM bo_notice
ORDER BY no DESC;
-- SQL DEVELOPER Ŭ���̾�Ʈ �̹Ƿ� ���� Ȯ���� ���� COMMIT

CREATE TABLE BO_ATTACH (
    no -- ÷������ ������ ��ȣ
    filename -- ÷�����ϸ�
    finesize -- ���ϻ�����
    filedesc -- ���ϼ���
    bno -- �Խ��� �Ϸù�ȣ
) 






