/* 인덱스 */ 
SELECT ROWID  -- 오브젝스번호(6) + 파일번호(3) + BLOCK 번호(6) + ROW번호(3)
FROM EMP;

SELECT * 
FROM USER_INDEXES-- ;   -- SCOTT 계정에 인덱스 되어 있는 것들 정보 확인.
WHERE TABLE_NAME = 'EMP';
/* 인덱스 키 등록 */
-- 단일 인덱스 키 등록
CREATE INDEX IDX_EMP_SAL ON EMP(SAL);  
-- 복합 인덱스 등록 (최대 32개까지 등록 가능)
CREATE INDEX IDX_EMP_TUPLE ON EMP(JOB, DEPTNO);
-- 유니크(UNIQUE) 인덱스 : 인덱스로 지정된 컬럼은 해당 테이블의 유일한 값.
CREATE UNIQUE INDEX IDX_EMP_UK 
    ON EMP(EMPNO, MGR);
-- 인덱스 삭제 (DROP)
DROP INDEX IDX_EMP_TUPLE;

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























































































