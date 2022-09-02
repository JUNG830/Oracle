/* DDL */
SELECT * 
FROM EMP;

/* CREATE ��ɾ� ����Ͽ� ���� ���̺� ���� */
CREATE TABLE EMP_DDL (
            EMPNO NUMBER(4), 
            ENAME VARCHAR2(10), 
            JOB VARCHAR2(9), 
            NGR NUMBER(4), 
            HIREDATE DATE, 
            SAL NUMBER(7, 2),
            COMM NUMBER(7, 2),
            DEPTNO NUMBER(2)
        );
        
DESC EMP_DDL;        

/* ���� ���̺��� ���� ������ �ڵ����� ���� */
 CREATE TABLE DEPT_DDL
    AS SELECT *
    FROM DEPT;
    
DESC DEPT_DDL;

SELECT *
FROM DEPT;
 
 /* ���� ���̺��� �� ������ �Ϻ� �����͸� �����Ͽ� �� ���̺� ���� */
  CREATE TABLE EMP_DDL_30
        AS SELECT *
        FROM EMP
        WHERE DEPTNO = 30;
 
 SELECT *
FROM EMP_DDL_30;
 
 /* ���� ���̺��� �� ������ �����Ͽ� �� ���̺� ���� */
 CREATE TABLE EMP_DEPT_DDL
        AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, 
                            D.DEPTNO, D.DNAME, D.LOC
            FROM EMP E, DEPT D
            WHERE 1 != 1;
  SELECT *
FROM EMP_DEPT_DDL;
 
 ---------------------------------------------------------------------------------------------------------------
 /* ���̺� ���� */
  CREATE TABLE EMP_ALTER
        AS SELECT *
        FROM EMP;
        
SELECT * 
FROM EMP_ALTER;
 -- ���̺� �� �߰� : ALTER�� ADD ���
 -- ���� ���̺��� �÷�(��) �� ���ο� �÷��� �߰��ϴ� ��ɾ�
 -- ���̺��� �� �ڿ� �߰��ǰ�, ���ϴ� ��ġ�� ���� �� ����. 
 -- �����Ͱ� �����ϴ� �࿡�� �����Ͱ� �߰������� �����Ͱ� ���� ���� NULL �� �Է� ��. 
ALTER TABLE EMP_ALTER
    ADD HP VARCHAR2(20);
 
SELECT * 
FROM EMP_ALTER; 
 /* �� �̸� ���� : RENAME */
 -- ALTER ��ɾ RENAME Ű���� ��� : ���̺��� �� �̸� ���� ����
 
 ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;
    
SELECT * FROM EMP_ALTER;
 /* ���� �ڷ����� ���� : MODIFY */
 -- �ڷ��� ����� �̹� �����Ͱ� �����ϴ� ��� ũ�� �����ϴ� ���� ���� ������, ���̴� ���� ��쿡 ���� �Ұ����� �� �ִ�. 
 ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(2);  -- ���� �Ұ�
    
 ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(5); 
    
DESC EMP_ALTER;
/* ���̺� �̸��� �����ϴ� RENAME */
RENAME EMP_ALTER TO EMP_RENAME;

SELECT * 
FROM EMP_RENAME;
SELECT * 
FROM EMP_ALTER;
/* ���̺��� �����͸� ���� TRUNCATE */
--  �����Ͱ� ����Ǿ� �ִ� ������ ���� (ROLLBACK �ȵ�)
TRUNCATE TABLE EMP_RENAME;

SELECT * 
FROM EMP_RENAME;
 /* Ư�� ���� ���� : DROP */
 ALTER TABLE EMP_RENAME
    DROP COLUMN TEL;
    
SELECT * FROM EMP_RENAME;

/* ���̺��� ���� : DROP */
DROP TABLE EMP_RENAME;
 
  ---------------------------------------------------------------------------------------------------------------
 /* �������� */
-- ���� ���� ������ ������ EMP_HW ���̺��� ����� ������.

CREATE TABLE EMP_HW (
            EMPNO NUMBER(4),
            ENAME VARCHAR2(10),
            JOB VARCHAR2(9),
            MGR NUMBER(4),
            HIREDATE DATE,
            SAL NUMBER(7, 2),
            COMM NUMBER(7, 2),
            DEPTNO NUMBER(2)
    );        
 
 ALTER TABLE EMP_HW
        ADD BIGO VARCHAR2(20);
        
ALTER TABLE EMP_HW
        MODIFY BIGO VARCHAR2(30);
        
ALTER TABLE EMP_HW
        RENAME COLUMN BIGO TO REMARK;

INSERT INTO EMP_HW 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL 
    FROM EMP;
 
 DROP TABLE EMP_HW;
 
 SELECT *
FROM EMP_HW;
 
 ---------------------------------------------------------------------------------------------------------------
 /* �������� */
 -- �� ���� ������� �ʴ� NOT NULL, �ߺ� ���οʹ� ��� ����, �ݵ�� ���� ���� �����ؾ� ���� �ǹ�.
 CREATE TABLE TABLE_NOT_NULL(
        LOGIN_ID VARCHAR(20) NOT NULL,
        LOGIN_PWD VARCHAR(20) NOT NULL,
        TEL VARCHAR(20)
    );
    
INSERT INTO TABLE_NOT_NULL ( LOGIN_ID, LOGIN_PWD, TEL) -- ��й�ȣ�� ���������� �ֱ⶧���� NULL �ȵ�.
        VALUES ('HJUNG830', NULL, '010-8827-3364');
 
 INSERT INTO TABLE_NOT_NULL ( LOGIN_ID, LOGIN_PWD)  -- ��ȭ��ȣ�� ���� ������ ���� ������ NULL ����
        VALUES ('HJUNG830', '010-8827-3364');

INSERT INTO TABLE_NOT_NULL ( LOGIN_ID, LOGIN_PWD, TEL) 
        VALUES ('HJUNG830', 'QWER', '010-8345-7789');        
        
SELECT *
FROM TABLE_NOT_NULL;

 /* ���� ���� ���캸��(SCOTT ����) */
-- ���������� Ȯ���ϴ� ��ɾ�
 SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
 FROM USER_CONSTRAINTS;
-- ���������� Ȯ���ϴ� ��ɾ�
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_NOT_NULL';
 
 /* �������� �̸� ���� ����(������ ���� �ʿ� ����) */
 CREATE TABLE TABLE_NOT_NULL2 (
        LOGIN_ID VARCHAR(20) CONSTRAINT TB_LOGIN_ID_NN NOT NULL,
        LOGIN_PWD VARCHAR(20) CONSTRAINT TB_LOGIN_PWD_NN NOT NULL,
        TEL VARCHAR(20)
    );    
 
  SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
 FROM USER_CONSTRAINTS;
 
  /* �̹� ������ ���̺� ���� ���� ���� */
ALTER TABLE TABLE_NOT_NULL
MODIFY TEL NOT NULL;

SELECT *
FROM TABLE_NOT_NULL;
-- �̹� ���Ե� �����Ϳ� NULL �� �����ϱ� ������ ���� �ش� �÷��� �������� NULL �� ���� �ؾ���. 
 UPDATE TABLE_NOT_NULL
    SET TEL = '010-1234-5678'
    WHERE LOGIN_ID = 'HJUNG830';

ALTER TABLE TABLE_NOT_NULL
MODIFY TEL NOT NULL; 
 
   /* �ߺ����� �ʴ� �� UNIQUE */
 -- ���� ������ �������� �ߺ��� ������� �ʰ��� �� �� ���
 -- NULL�� ���� �������� ������ �ǹ��ϱ� ������ �ߺ� ��󿡼��� ���� = ������ ���� NULL ������ ����. 
 CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
);
 DESC TABLE_UNIQUE;
 
 INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
    VALUES ('��۸�', 'QWER1234', '010-2283-3456');

 INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
    VALUES ('�ӳĿ�', 'QWER5678', '010-3453-3689');
    
 INSERT INTO TABLE_UNIQUE (LOGIN_PWD, TEL)  -- NULL�� ���� �������� ������ �ǹ�, �ߺ� ����.
    VALUES ('QWER5678', '010-3453-3689');

SELECT * 
FROM TABLE_UNIQUE;
 
    /* �����ϰ� �ϳ��� �ִ� �� (PRIMARY KEY) */
 -- UNIQUE�� NOT NULL ���� ������ Ư���� ��� ������ ��������.
 -- ������ �ߺ��� ������� �ʰ� NULL�� ������� ����. 
 -- PRIMARY KEY ���� ������ ���̺� �ϳ��ۿ� ������ �� ����.  ex) �ֹι�ȣ, �����ȣ ���,, 
 -- �ش� ���� �ڵ����� �ε��� ����. 
 
 CREATE TABLE TABLE_PK (
        LOGIN_ID VARCHAR2(20) PRIMARY KEY, 
        LOGIN_PWD VARCHAR2(20) NOT NULL,
        TEL VARCHAR2(20)
    );
    
DESC TABLE_PK;

    /* ������ PRIMARY KEY Ȯ���ϱ� */
 SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
         FROM USER_CONSTRAINTS
         WHERE TABLE_NAME LIKE 'TABLE_PK%';
         
 /* ���̺��� �����ϸ� ���� ���� �̸� ���� �����ϱ� */
 CREATE TABLE TABLE_PK2(
         LOGIN_ID VARCHAR2(20) CONSTRAINT TB_LGN_ID_PK PRIMARY KEY,
         LOGIN_PWD VARCHAR2(20) CONSTRAINT TB_LGN_PW_NN NOT NULL,
         TEL VARCHAR2(20)
        );
 
 INSERT INTO TABLE_PK2 
 VALUES ( '����ġ', 'QWER', '010-3333-3333');

INSERT INTO TABLE_PK2 
 VALUES ( '��Ʈ', 'QWER', '010-3333-3333');

 SELECT *
 FROM TABLE_PK2;
 
 INSERT INTO TABLE_PK2 
 VALUES ( NULL , 'QWER', '010-3333-3333');  -- PRIMARY KEY �� NULL �� �ȵ�! 
 
 INSERT INTO TABLE_PK2 
 VALUES ( '����', 'QWER', '010-3333-3333');
 
 /* FOREIGN KEY �����ϱ� */
 -- ���� �ٸ� ���̺� ���� ���踦 �����ϴµ� ����ϴ� ���� ����.
 -- �����ϰ� �ִ� �⺻Ű�� ������ Ÿ�԰� ��ġ�ؾ��ϰ�, �ܷ�Ű�� �����Ǵ� �⺻Ű�� ������ �� ����. 
-- CREATE TABLE ���̺� �̸�( 
--                �� �ڷ��� CONSTRAINT ���� ���� �̸� REFERENCES ���� ���̺�(������)
--                 );

CREATE TABLE DEPT_PK (
        DEPTNO      NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
        DNAME       VARCHAR2(14),
        LOC             VARCHAR2(13)
    );    
RENAME DEPT_PK TO DEPT_FK;  -- ��Ÿ ���� ���̺� �̸� ���� ��. 
 
 DESC DEPT_FK;
 
 -- EMP_FK : EMP_EK ���̺��� DEPTNO���� DEPT_FK ���̺��� DEPTNO ���� �����ϴ� FOREIGN KEY ���� ���� �߰�.
 CREATE TABLE EMP_FK (
        EMPNO   NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
        ENAME   VARCHAR2(10),
        JOB         VARCHAR2(9),
        MGR     VARCHAR2(4),
        HIREDATE    DATE,
        SAL NUMBER(7, 2),
        COMM    NUMBER(7, 2),
        DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK (DEPTNO)
    );     
    
-- EMP_FK ���̺� ������ ���� (DEPTNO �����Ͱ� ���� DEPT_FK ���̺� ���� ��, DEPT_FK �����Ͱ� ���� ��������� ����)
INSERT INTO EMP_FK
    VALUES (9999, '������', 'IVE', NULL, '2003/01/02', 3000, 300, 10);  -- �ش� �μ��� ��� ���� ��
 
 INSERT INTO DEPT_FK 
    VALUES ( 10, '��ٿ���', '����');  -- �ش� �μ��� ���� ����� ��� ��.
 INSERT INTO EMP_FK
    VALUES (8999, '������', '������', NULL, '1989/10/02', 4000, 300, 20);
 INSERT INTO DEPT_FK 
    VALUES ( 20, '����', '���'); 
 
 SELECT *
 FROM EMP_FK;
 
 DELETE FROM DEPT_FK
    WHERE DEPTNO = 20;

 DELETE FROM EMP_FK
    WHERE ENAME = '������';
 
  SELECT *
 FROM DEPT_FK;
 --------------------------------------------------------------------------------------------
 /* �������� ���¿� ������ ���ϴ� CHECK */
 -- ���� ������ �� �ִ� ���� ���� �Ǵ� ������ ������ �� ���.
 -- ���̺� ���� �� CHECK ���� ���� �����ϱ�.
 CREATE TABLE TABLE_CHECK(
	 LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LOGINID_PK PRIMARY KEY,
	 LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOGINPW_CK CHECK (LENGTH(LOGIN_PWD) > 3),
	 TEL VARCHAR2(20)
);

DESC TABLE_CHECK;
 
 INSERT INTO TABLE_CHECK 
        VALUES ( '��Ʈ�͸�Ʈ', '1234', '010-2293-3322');
 
 SELECT * 
 FROM TABLE_CHECK;
  --------------------------------------------------------------------------------------------
 /* �⺻���� ���ϴ� DEFAULT */
 -- ���� ���ǰ��� ������ Ư�� ���� ������ ���� �������� �ʾ��� ��쿡 �⺻��(default)�� ����
 CREATE TABLE TABLE_DEFAULT(
         LOGIN_ID VARCHAR2(20) PRIMARY KEY,
         LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
         TEL VARCHAR2(20) 
    );
 
 INSERT INTO TABLE_DEFAULT
    VALUES ('��������', NULL, '010-2222-3333');  -- NULL �� ������,, NULL �� �ּҰ� �����ϱ�

 INSERT INTO TABLE_DEFAULT(LOGIN_ID, TEL)
    VALUES ('����̶�', '010-2222-3333'); 

SELECT *
FROM TABLE_DEFAULT;
-----------------------------------------------------------------------------
/* �������� 1 */
CREATE TABLE PRODUCT (
        PRODUCT_ID      NUMBER PRIMARY KEY,
        PRODUCT_NAME        VARCHAR2(20) NOT NULL,
        REG_DATE        DATE
    );
    
INSERT INTO PRODUCT 
        VALUES ('1', 'Computer', '21/01/02');
INSERT INTO PRODUCT 
        VALUES ('2', 'Smartphone', '22/02/03');
INSERT INTO PRODUCT 
        VALUES ('3', 'Television', '22/07/01');

SELECT *
FROM PRODUCT;

ALTER TABLE PRODUCT
    ADD WEIGHT NUMBER CHECK (WEIGHT >= 0);

ALTER TABLE PRODUCT
    ADD PRICE NUMBER CHECK (PRICE >= 0);

-----------------------------------------------------------------------------
/* �������� 2 */
CREATE TABLE CUSTOMER_TABLE (
        CUSTOM_ID   NUMBER PRIMARY KEY,
        USER_NAME   VARCHAR(12) NOT NULL,
        PHONE   VARCHAR(20),
        EMAIL   VARCHAR(20),
        BIRTH_DATE    DATE DEFAULT '1900/01/01'
    );    
DESC CUSTOMER_TABLE; 

ALTER TABLE CUSTOMER_TABLE
    ADD AGE   NUMBER CHECK (AGE > 0 AND AGE < 200);
    
ALTER TABLE CUSTOMER_TABLE    
    ADD SEX   VARCHAR2(1) CHECK (SEX = 'M' OR SEX = 'F');
    
ALTER TABLE CUSTOMER_TABLE
    MODIFY PHONE UNIQUE;
    
ALTER TABLE CUSTOMER_TABLE
    MODIFY EMAIL UNIQUE;
    
ALTER TABLE CUSTOMER_TABLE
    RENAME COLUMN SEX TO GENDER;
    
ALTER TABLE CUSTOMER_TABLE
    RENAME COLUMN PHONE TO MOBILE;
    
ALTER TABLE CUSTOMER_TABLE
    MODIFY USER_NAME VARCHAR2(20);
    
INSERT INTO CUSTOMER_TABLE
    VALUES ('1', '������', '010-1111-1111', 'AAAA', '03/06/03', '20', 'F');

INSERT INTO CUSTOMER_TABLE
    VALUES ('2', '�̿���', '010-2222-2222', 'BBBB', '01/10/30', '23', 'F');

INSERT INTO CUSTOMER_TABLE
    VALUES ('3', '������', '010-3333-3333', 'CCCC', '89/04/17', '28', 'F');

INSERT INTO CUSTOMER_TABLE
    VALUES ('4', '�̹�', '010-4444-4444', 'DDDD', '99/01/09', '25', 'F');

INSERT INTO CUSTOMER_TABLE ( CUSTOM_ID, USER_NAME, MOBILE, EMAIL, AGE, GENDER)
    VALUES ('5', '������', '010-5555-5555', 'FFFF', '40', 'M');

INSERT INTO CUSTOMER_TABLE
    VALUES ('6', '����ȣ', '010-7777-7777', 'GGGG', '93/09/28', '30', 'M');

INSERT INTO CUSTOMER_TABLE
    VALUES ('7', '�쿵��', '010-3456-4461', 'ASDFGW', '98/06/13', '28', 'F');

INSERT INTO CUSTOMER_TABLE
    VALUES ('8', '�ּ���', '010-3948-9234', 'DJDHWIUER', '98/05/05', '28', 'F');

INSERT INTO CUSTOMER_TABLE
    VALUES ('9', '�ǹο�', '010-4531-5555', 'DKJSXNIEIOQWUHKJ', '97/08/31', '29', 'M');

INSERT INTO CUSTOMER_TABLE
    VALUES ('10', '����', '010-7654-4478', 'SKWEIRUKLMC', '95/01/07', '38', 'M');

SELECT *
FROM CUSTOMER_TABLE;
-----------------------------------------------------------------------------
/* �������� 3(HR ����)*/
-- 1. Ŀ�̼��� �޴� ����� �̸�, ����, �μ���ȣ,�μ����� ���
SELECT CONCAT(E.FIRST_NAME, CONCAT(' ', E.LAST_NAME)) �̸�, E.JOB_ID ����, E.DEPARTMENT_ID �μ���ȣ, D.DEPARTMENT_NAME �μ���
    FROM EMPLOYEES E, DEPARTMENTS D
    WHERE  E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND COMMISSION_PCT IS NOT NULL;


-- 2. ����̸��� �μ���� ������ ����ϴµ� ������ 3000 �̻��� ����� ���
SELECT CONCAT(E.FIRST_NAME, CONCAT(' ', E.LAST_NAME)) �̸�, D.DEPARTMENT_NAME �μ���, E.SALARY
    FROM EMPLOYEES E, DEPARTMENTS D
    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND E.SALARY >= 3000;







































