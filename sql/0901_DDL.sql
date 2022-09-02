/* DDL */
SELECT * 
FROM EMP;

/* CREATE 명령어 사용하여 직접 테이블 생성 */
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

/* 기존 케이블의 열과 데이터 자동으로 복제 */
 CREATE TABLE DEPT_DDL
    AS SELECT *
    FROM DEPT;
    
DESC DEPT_DDL;

SELECT *
FROM DEPT;
 
 /* 기존 테이블의 열 구조와 일부 데이터만 복사하여 새 테이블 구성 */
  CREATE TABLE EMP_DDL_30
        AS SELECT *
        FROM EMP
        WHERE DEPTNO = 30;
 
 SELECT *
FROM EMP_DDL_30;
 
 /* 기존 테이블의 열 구조만 복사하여 새 테이블 구성 */
 CREATE TABLE EMP_DEPT_DDL
        AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, 
                            D.DEPTNO, D.DNAME, D.LOC
            FROM EMP E, DEPT D
            WHERE 1 != 1;
  SELECT *
FROM EMP_DEPT_DDL;
 
 ---------------------------------------------------------------------------------------------------------------
 /* 테이블 변경 */
  CREATE TABLE EMP_ALTER
        AS SELECT *
        FROM EMP;
        
SELECT * 
FROM EMP_ALTER;
 -- 테이블에 열 추가 : ALTER에 ADD 사용
 -- 기존 테이블의 컬럼(열) 에 새로운 컬럼을 추가하는 명령어
 -- 테이블의 맨 뒤에 추가되고, 원하는 위치에 넣을 수 없음. 
 -- 데이터가 존재하는 행에는 데이터가 추가되지만 데이터가 없는 행은 NULL 로 입력 됨. 
ALTER TABLE EMP_ALTER
    ADD HP VARCHAR2(20);
 
SELECT * 
FROM EMP_ALTER; 
 /* 열 이름 변경 : RENAME */
 -- ALTER 명령어에 RENAME 키워드 사용 : 테이블의 열 이름 변경 가능
 
 ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;
    
SELECT * FROM EMP_ALTER;
 /* 열의 자료형을 변경 : MODIFY */
 -- 자료형 변경시 이미 데이터가 존재하는 경우 크게 변경하는 것은 문제 없지만, 줄이는 것은 경우에 따라 불가능할 수 있다. 
 ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(2);  -- 변경 불가
    
 ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(5); 
    
DESC EMP_ALTER;
/* 테이블 이름을 변경하는 RENAME */
RENAME EMP_ALTER TO EMP_RENAME;

SELECT * 
FROM EMP_RENAME;
SELECT * 
FROM EMP_ALTER;
/* 네이블의 데이터를 삭제 TRUNCATE */
--  데이터가 저장되어 있던 공간을 지움 (ROLLBACK 안됨)
TRUNCATE TABLE EMP_RENAME;

SELECT * 
FROM EMP_RENAME;
 /* 특정 열을 삭제 : DROP */
 ALTER TABLE EMP_RENAME
    DROP COLUMN TEL;
    
SELECT * FROM EMP_RENAME;

/* 테이블을 삭제 : DROP */
DROP TABLE EMP_RENAME;
 
  ---------------------------------------------------------------------------------------------------------------
 /* 연습문제 */
-- 다음 열의 구조를 가지는 EMP_HW 테이블을 만들어 보세요.

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
 /* 제약조건 */
 -- 빈 값을 허용하지 않는 NOT NULL, 중복 여부와는 상관 없음, 반드시 열에 값이 존재해야 함을 의미.
 CREATE TABLE TABLE_NOT_NULL(
        LOGIN_ID VARCHAR(20) NOT NULL,
        LOGIN_PWD VARCHAR(20) NOT NULL,
        TEL VARCHAR(20)
    );
    
INSERT INTO TABLE_NOT_NULL ( LOGIN_ID, LOGIN_PWD, TEL) -- 비밀번호에 제약조건이 있기때문에 NULL 안됨.
        VALUES ('HJUNG830', NULL, '010-8827-3364');
 
 INSERT INTO TABLE_NOT_NULL ( LOGIN_ID, LOGIN_PWD)  -- 전화번호는 제약 조건이 없기 때문에 NULL 가능
        VALUES ('HJUNG830', '010-8827-3364');

INSERT INTO TABLE_NOT_NULL ( LOGIN_ID, LOGIN_PWD, TEL) 
        VALUES ('HJUNG830', 'QWER', '010-8345-7789');        
        
SELECT *
FROM TABLE_NOT_NULL;

 /* 제약 조건 살펴보기(SCOTT 계정) */
-- 제약조건을 확인하는 명령어
 SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
 FROM USER_CONSTRAINTS;
-- 제약조건을 확인하는 명령어
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_NOT_NULL';
 
 /* 제약조건 이름 직접 지정(실제로 별로 필요 없음) */
 CREATE TABLE TABLE_NOT_NULL2 (
        LOGIN_ID VARCHAR(20) CONSTRAINT TB_LOGIN_ID_NN NOT NULL,
        LOGIN_PWD VARCHAR(20) CONSTRAINT TB_LOGIN_PWD_NN NOT NULL,
        TEL VARCHAR(20)
    );    
 
  SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
 FROM USER_CONSTRAINTS;
 
  /* 이미 생성한 테이블에 제약 조건 지정 */
ALTER TABLE TABLE_NOT_NULL
MODIFY TEL NOT NULL;

SELECT *
FROM TABLE_NOT_NULL;
-- 이미 포함된 데이터에 NULL 이 존재하기 때문에 먼저 해당 컬럼의 데이터의 NULL 을 제거 해야함. 
 UPDATE TABLE_NOT_NULL
    SET TEL = '010-1234-5678'
    WHERE LOGIN_ID = 'HJUNG830';

ALTER TABLE TABLE_NOT_NULL
MODIFY TEL NOT NULL; 
 
   /* 중복되지 않는 값 UNIQUE */
 -- 열에 저장할 데이터의 중복을 허용하지 않고자 할 때 사용
 -- NULL은 값이 존재하지 않음을 의미하기 때문에 중복 대상에서는 제외 = 지정한 열에 NULL 여러개 가능. 
 CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
);
 DESC TABLE_UNIQUE;
 
 INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
    VALUES ('김멍멍', 'QWER1234', '010-2283-3456');

 INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
    VALUES ('임냐옹', 'QWER5678', '010-3453-3689');
    
 INSERT INTO TABLE_UNIQUE (LOGIN_PWD, TEL)  -- NULL은 값이 존재하지 않음을 의미, 중복 가능.
    VALUES ('QWER5678', '010-3453-3689');

SELECT * 
FROM TABLE_UNIQUE;
 
    /* 유일하게 하나만 있는 값 (PRIMARY KEY) */
 -- UNIQUE와 NOT NULL 제약 조건의 특성을 모두 가지는 제약조건.
 -- 데이터 중복을 허용하지 않고 NULL도 허용하지 않음. 
 -- PRIMARY KEY 제약 조건은 테이블에 하나밖에 지정할 수 없음.  ex) 주민번호, 사원번호 등등,, 
 -- 해당 열에 자동으로 인덱스 생성. 
 
 CREATE TABLE TABLE_PK (
        LOGIN_ID VARCHAR2(20) PRIMARY KEY, 
        LOGIN_PWD VARCHAR2(20) NOT NULL,
        TEL VARCHAR2(20)
    );
    
DESC TABLE_PK;

    /* 생성한 PRIMARY KEY 확인하기 */
 SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
         FROM USER_CONSTRAINTS
         WHERE TABLE_NAME LIKE 'TABLE_PK%';
         
 /* 테이블을 생성하며 제약 조건 이름 직접 지정하기 */
 CREATE TABLE TABLE_PK2(
         LOGIN_ID VARCHAR2(20) CONSTRAINT TB_LGN_ID_PK PRIMARY KEY,
         LOGIN_PWD VARCHAR2(20) CONSTRAINT TB_LGN_PW_NN NOT NULL,
         TEL VARCHAR2(20)
        );
 
 INSERT INTO TABLE_PK2 
 VALUES ( '고슴도치', 'QWER', '010-3333-3333');

INSERT INTO TABLE_PK2 
 VALUES ( '패트', 'QWER', '010-3333-3333');

 SELECT *
 FROM TABLE_PK2;
 
 INSERT INTO TABLE_PK2 
 VALUES ( NULL , 'QWER', '010-3333-3333');  -- PRIMARY KEY 는 NULL 도 안됨! 
 
 INSERT INTO TABLE_PK2 
 VALUES ( '가을', 'QWER', '010-3333-3333');
 
 /* FOREIGN KEY 지정하기 */
 -- 서로 다른 테이블 간에 관계를 정의하는데 사용하는 제약 조건.
 -- 참조하고 있는 기본키의 데이터 타입과 일치해야하고, 외래키에 참조되는 기본키는 삭제할 수 없음. 
-- CREATE TABLE 테이블 이름( 
--                열 자료형 CONSTRAINT 제약 조건 이름 REFERENCES 참조 테이블(참조열)
--                 );

CREATE TABLE DEPT_PK (
        DEPTNO      NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
        DNAME       VARCHAR2(14),
        LOC             VARCHAR2(13)
    );    
RENAME DEPT_PK TO DEPT_FK;  -- 오타 나서 테이블 이름 수정 함. 
 
 DESC DEPT_FK;
 
 -- EMP_FK : EMP_EK 테이블의 DEPTNO열은 DEPT_FK 테이블의 DEPTNO 열을 참조하는 FOREIGN KEY 제약 조건 추가.
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
    
-- EMP_FK 테이블에 데이터 삽입 (DEPTNO 데이터가 아직 DEPT_FK 테이블에 없을 때, DEPT_FK 데이터가 아직 만들어지지 않음)
INSERT INTO EMP_FK
    VALUES (9999, '안유진', 'IVE', NULL, '2003/01/02', 3000, 300, 10);  -- 해당 부서가 없어서 오류 남
 
 INSERT INTO DEPT_FK 
    VALUES ( 10, '퇴근요정', '서울');  -- 해당 부서를 먼저 만들어 줘야 함.
 INSERT INTO EMP_FK
    VALUES (8999, '이은지', '오락실', NULL, '1989/10/02', 4000, 300, 20);
 INSERT INTO DEPT_FK 
    VALUES ( 20, '폭소', '상암'); 
 
 SELECT *
 FROM EMP_FK;
 
 DELETE FROM DEPT_FK
    WHERE DEPTNO = 20;

 DELETE FROM EMP_FK
    WHERE ENAME = '이은지';
 
  SELECT *
 FROM DEPT_FK;
 --------------------------------------------------------------------------------------------
 /* 데이터의 형태와 범위를 정하는 CHECK */
 -- 열에 저장할 수 있는 값의 범위 또는 패턴을 정의할 때 사용.
 -- 테이블 생성 시 CHECK 제약 조건 설정하기.
 CREATE TABLE TABLE_CHECK(
	 LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LOGINID_PK PRIMARY KEY,
	 LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOGINPW_CK CHECK (LENGTH(LOGIN_PWD) > 3),
	 TEL VARCHAR2(20)
);

DESC TABLE_CHECK;
 
 INSERT INTO TABLE_CHECK 
        VALUES ( '패트와매트', '1234', '010-2293-3322');
 
 SELECT * 
 FROM TABLE_CHECK;
  --------------------------------------------------------------------------------------------
 /* 기본값을 정하는 DEFAULT */
 -- 제약 조건과는 별개로 특정 열에 저장할 값이 지정되지 않았을 경우에 기본값(default)을 지정
 CREATE TABLE TABLE_DEFAULT(
         LOGIN_ID VARCHAR2(20) PRIMARY KEY,
         LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
         TEL VARCHAR2(20) 
    );
 
 INSERT INTO TABLE_DEFAULT
    VALUES ('강아지똥', NULL, '010-2222-3333');  -- NULL 이 들어가버림,, NULL 도 주소가 있으니까

 INSERT INTO TABLE_DEFAULT(LOGIN_ID, TEL)
    VALUES ('고양이똥', '010-2222-3333'); 

SELECT *
FROM TABLE_DEFAULT;
-----------------------------------------------------------------------------
/* 연습문제 1 */
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
/* 연습문제 2 */
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
    VALUES ('1', '안유진', '010-1111-1111', 'AAAA', '03/06/03', '20', 'F');

INSERT INTO CUSTOMER_TABLE
    VALUES ('2', '이영지', '010-2222-2222', 'BBBB', '01/10/30', '23', 'F');

INSERT INTO CUSTOMER_TABLE
    VALUES ('3', '이은지', '010-3333-3333', 'CCCC', '89/04/17', '28', 'F');

INSERT INTO CUSTOMER_TABLE
    VALUES ('4', '미미', '010-4444-4444', 'DDDD', '99/01/09', '25', 'F');

INSERT INTO CUSTOMER_TABLE ( CUSTOM_ID, USER_NAME, MOBILE, EMAIL, AGE, GENDER)
    VALUES ('5', '나영석', '010-5555-5555', 'FFFF', '40', 'M');

INSERT INTO CUSTOMER_TABLE
    VALUES ('6', '이준호', '010-7777-7777', 'GGGG', '93/09/28', '30', 'M');

INSERT INTO CUSTOMER_TABLE
    VALUES ('7', '우영우', '010-3456-4461', 'ASDFGW', '98/06/13', '28', 'F');

INSERT INTO CUSTOMER_TABLE
    VALUES ('8', '최수연', '010-3948-9234', 'DJDHWIUER', '98/05/05', '28', 'F');

INSERT INTO CUSTOMER_TABLE
    VALUES ('9', '권민우', '010-4531-5555', 'DKJSXNIEIOQWUHKJ', '97/08/31', '29', 'M');

INSERT INTO CUSTOMER_TABLE
    VALUES ('10', '정명석', '010-7654-4478', 'SKWEIRUKLMC', '95/01/07', '38', 'M');

SELECT *
FROM CUSTOMER_TABLE;
-----------------------------------------------------------------------------
/* 연습문제 3(HR 계정)*/
-- 1. 커미션을 받는 사원의 이름, 직업, 부서번호,부서명을 출력
SELECT CONCAT(E.FIRST_NAME, CONCAT(' ', E.LAST_NAME)) 이름, E.JOB_ID 직업, E.DEPARTMENT_ID 부서번호, D.DEPARTMENT_NAME 부서명
    FROM EMPLOYEES E, DEPARTMENTS D
    WHERE  E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND COMMISSION_PCT IS NOT NULL;


-- 2. 사원이름과 부서명과 월급을 출력하는데 월급이 3000 이상인 사원을 출력
SELECT CONCAT(E.FIRST_NAME, CONCAT(' ', E.LAST_NAME)) 이름, D.DEPARTMENT_NAME 부서명, E.SALARY
    FROM EMPLOYEES E, DEPARTMENTS D
    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND E.SALARY >= 3000;







































