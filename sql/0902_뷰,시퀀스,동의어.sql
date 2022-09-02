/* 인덱스 */ 
SELECT ROWID  -- 오브젝스번호(6) + 파일번호(3) + BLOCK 번호(6) + ROW번호(3)
FROM EMP;

SELECT * 
FROM USER_INDEXES-- ;   -- SCOTT 계정에 인덱스 되어 있는 것들 정보 확인.
WHERE TABLE_NAME = 'EMP';
/* 인덱스 키 등록 */
-- 단일 인덱스 키 등록
CREATE INDEX IDX_EMP_SAL  
    ON EMP(SAL);  
-- 복합 인덱스 등록 (최대 32개까지 등록 가능)
CREATE INDEX IDX_EMP_TUPLE 
    ON EMP(JOB, DEPTNO);
-- 유니크(UNIQUE) 인덱스 : 인덱스로 지정된 컬럼은 해당 테이블의 유일한 값.
CREATE UNIQUE INDEX IDX_EMP_UK 
    ON EMP(EMPNO, MGR);
-- 인덱스 삭제 (DROP)
DROP INDEX IDX_EMPIDX_EMPNO;

---------------------------------------------------------------------------------------------------------------
/* < 테이블 뷰 > */
-- 하나 이상의 테이블을 조회하는 SELECT 문을 저장한 객체.
-- 쿼리문 단순화 할 수 있음.
-- 보안성 목적으로 사용할 수 있음.

/* 뷰 생성 */
-- WIN + R -> CMD -> SQLPLUS -> SYSTEM -> 비번 1234 -> 아래 복붙 -> Grant succeeded. 뜨면 성공. 
GRANT CREATE VIEW TO SCOTT;

/* 뷰 생성하기 해서 되면 되는 것 */
-- 단일 뷰 생성
CREATE VIEW VW_EMP20
 AS (SELECT EMPNO, ENAME, JOB, DEPTNO
	 FROM EMP
	 WHERE DEPTNO = 20);

SELECT *
FROM EMP;

SELECT *
FROM VW_EMP20;

SELECT * 
FROM USER_VIEWS;

---------------------------------------------------------------------------------------------------------------
/* < 시퀀스 > */
-- 오라클 데이터베이스에서 특정 규칙에 맞는 연속 숫자를 생성하는 객체
CREATE SEQUENCE SEQ_EMPID
START WITH 300 -- 몇번부터 시작할래
INCREMENT BY 2  -- 몇씩 증가시킬 것인가.
MAXVALUE 320  -- 몇번까지 반복할거니?
NOCYCLE -- 반복하지 않음
NOCACHE;  -- 메모리 할당을 하지 않음. 

SELECT SEQ_EMPID.NEXTVAL 
FROM DUAL;

---------------------------------------------------------------------------------------------------------------
/* < 동의어 > */
-- 영구적인 별칭을 부여하는 방법.
-- WIN + R -> CMD -> SQLPLUS -> SYSTEM -> 비번 1234 -> 아래 복붙 -> Grant succeeded. 뜨면 성공. 
--GRANT CREATE VIEW TO SCOTT;

CREATE SYNONYM E FOR EMP;

SELECT * FROM E;
-- 동의어 삭제
DROP SYNONYM E;

---------------------------------------------------------------------------------------------------------------
/* < 연습문제 1 > */
--① EMP 테이블과 같은 구조의 데이터를 저장하는 EMPIDX 테이블을 만들어 보세요.
--② 생성한 EMPIDX 테이블의 EMPNO 열에 IDX_EMPIDX_EMPNO 인덱스를 만들어 보세요.
--③ 마지막으로 인덱스가 잘 생성되었는지 적절한 데이터 사전 뷰를 통해 확인해 보세요

CREATE TABLE EMPIDX
 AS SELECT *
    FROM EMP;

CREATE INDEX IDX_EMPIDX_EMPNO 
    ON EMPIDX(EMPNO);

SELECT *
FROM EMPIDX;

SELECT * 
FROM USER_INDEXES
WHERE INDEX_NAME = 'IDX_EMPIDX_EMPNO';

---------------------------------------------------------------------------------------------------------------
/* < 연습문제 2 > */
--문제 1번에서 생성한 EMPIDX 테이블의 데이터 중 급여(SAL)가 1500 초과인 사원들만 출력하는 EMPIDX_OVER15K 뷰를 생성해 보세요. 
--이 이름을 가진 뷰가 이미 존재할 경우에 새로운 내용으로 대체 가능해야 합니다. 
--EMPIDX_OVER15K 뷰는 사원 번호, 사원 이름, 직책, 부서 번호, 급여, 추가 수당 열을 가지고 있습니다. 
--추가 수당 열의 경우에 추가 수당이 존재하면 O, 존재하지않으면 X로 출력합니다.

CREATE VIEW EMPIDX_OVER15K
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, 
            NVL2(COMM, 'O', 'X') AS COMM 
            FROM EMPIDX
            WHERE SAL > 1500);
            
DROP VIEW EMPIDX_OVER15K;

--UPDATE EMPIDX_OVER15K
--SET COMM
--WHERE COMM IS NOT NULL;

SELECT *
FROM EMPIDX_OVER15K;

---------------------------------------------------------------------------------------------------------------
/* < 연습문제 3 > */
--① DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 작성해 보세요.
--② 생성한 DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀀스를 오른쪽 특성에 맞게 생성해 보세요.
--③ 마지막으로 생성한 DEPTSEQ를 사용하여 오른쪽과 같이 세 개 부서를 차례대로 추가해 보세요.
CREATE TABLE DEPTSEQ
    AS SELECT * 
         FROM DEPT;

CREATE SEQUENCE SEQ_DEPTSEQ 
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 99
   MINVALUE 1
   NOCYCLE 
   NOCACHE;

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'DATABASE', 'SEOUL');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'WEB', 'BUSAN');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'MOBILE', 'ILSAN');

SELECT *
FROM DEPTSEQ;


INSERT INTO MENU_INFO
    VALUES ('COFFEE','100' 'ESPRESSO', '2500', ');  

































































