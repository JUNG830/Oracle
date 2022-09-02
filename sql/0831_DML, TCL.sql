/* 임시 테이블 생성(DDL) */ 
CREATE TABLE DEPT_TEMP
AS SELECT * 
FROM DEPT;  -- DEPT 를 DEPT_TEMP 로 고대로 복제

SELECT *
FROM DEPT_TEMP;

DROP TABLE DEPT_TEMP;  -- 생성된 테이블을 삭제하고 싶을 때 사용

/* 테이블에 데이터를 추가하는 INSERT문 */
-- INSERT 사용 방법
-- INSERT INTO 테이블 이름 (테이블 열 , 로 연속해서 입력)
-- VALUES (각 열에 해당하는 데이터 입력,    ,     ,     , ,,,,,,)  |-> 각 열의 순서와 갯수가 일치해야 함. 

DESC DEPT_TEMP;  -- 데이터 타입을 볼 수 있음. 

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
VALUES (50, 'DATABASE', 'SEOUL');
-- 순서를 테이블의 순서대로 입력 해야 함. 값을 생략할 수 없음. 명시적으로 넣어주어야 함 0 OR NULL 등...
INSERT INTO DEPT_TEMP -- () 생략 가능 단, 입력할 데이터의 순서는 지켜주어야함.
VALUES (60, 'NETWORK', 'BUSAN');

INSERT INTO DEPT_TEMP 
VALUES(70, 'WEB', NULL);

INSERT INTO DEPT_TEMP
VALUES(80, 'MPBILE', '');  -- 공백도 NULL 로 인식
-- 포함된 열에 값을 넣지 않고 싶을 때 생략 가능. 값을 입력하는 순서를 정할 수 있음. 생략하면 NULL 
INSERT INTO DEPT_TEMP (DEPTNO, LOC)
VALUES(90, 'INCHEON');

CREATE TABLE EMP_TEMP
AS SELECT *
FROM EMP
WHERE 1 != 1; -- 테이블을 복사할 때 데이터는 복사하지 않음. 

SELECT *
FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9001, '나영석', 'PRESIDENT', NULL, '2001/01/31', 9999, 100, 10);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9002, '이은지', 'MANAGER', 9001, '2002-08-31', 6000, 800, 20);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9003, '미미', 'MANAGER', 9001, TO_DATE('2010/07/01', 'YYYY/MM/DD'), 5000, 700, 20);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9004, '이영지', 'MANAGER', 9001, TO_DATE('2020/07/01', 'YYYY/MM/DD'), 4500, 900, 20);
    
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9005, '안유진', 'MANAGER', 9001, SYSDATE, 4400, 1500, 20);

/* 서브 쿼리를 이용한 INSERT */ 
-- VALUES 절을 사용하지 않음. 
-- 데이터가 추가되는 테이블의 " 열 갯수와 자료형 " 서브쿼리의 " 열 갯수와 자료형 " 이 일치해야 한다. 
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE = 1;   -- WHERE 조건이 성립하는 데이터만 복제
---------------------------------------------------------------------------------------------------------
/* 케이블에 있는 데이터 수정하기 (UPDATE) */ 
-- 회원정보 변경, 결제 계좌 변경, 내가 쓴 글 수정 등,,,, 수정 사항이 발생하는 경우에 해당. 
-- 테이블에 저장된 데이터의 내용을 변경하고자 하는 경우 사용
-- UPDATE 변경할 테이블 이름 
-- SET 변경할 열 이름 = 입력할 데이터, 변경할 열 = 데이터,,,,,,,,,
-- WHERE 데이터를 변경할 대상 행을 선별하기 위한 조건 (필수) 
UPDATE DEPT_TEMP
    SET LOC = 'SEOUL';
    
SELECT * 
FROM DEPT_TEMP;

ROLLBACK;  -- TCL 명령어, 롤백 ★아주 소중한 기능★ 되돌리기!!!! BUT, 이전에 작업한 것도 다 지워짐,, 좋은겨 안 좋은겨?!

UPDATE DEPT_TEMP 
    SET DNAME = 'DATEBASE', 
            LOC = 'SEOUL'
    WHERE DEPTNO = 40;        

UPDATE DEPT_TEMP
    SET DNAME = 'FRONTEND',
            LOC = 'SUWON'
    WHERE DEPTNO = 90;        

UPDATE DEPT_TEMP 
    SET LOC = 'JEJU'
    WHERE LOC IS NULL;

---------------------------------------------------------------------------------------------------------
/* 연습문제 */
SELECT * 
FROM EMP_TEMP;
-- 사원들의 급여가 5000이하인 사원들에게 COMM 2000으로 수정하는 쿼리 작성
UPDATE EMP_TEMP
    SET COMM = 2000
    WHERE SAL <= 5000;
    -- 서브 쿼리를 사용하여 데이터 수정하기
UPDATE DEPT_TEMP
    SET (DNAME, LOC) = (SELECT DNAME, LOC
                                            FROM DEPT
                                            WHERE DEPTNO = 40)
    WHERE DEPTNO = 40;                                        

SELECT * 
FROM DEPT_TEMP;

---------------------------------------------------------------------------------------------------------
/* 데이터 삭제하기 (DELETE) */
SELECT * 
FROM EMP_TEMP;

DELETE FROM EMP_TEMP
    WHERE JOB = 'PRESIDENT';

DELETE FROM EMP_TEMP
    WHERE EMPNO IN (SELECT E.EMPNO  
                        FROM EMP_TEMP E, SALGRADE S
                        WHERE E.SAL BETWEEN S.LOSAL AND HISAL
                        AND S.GRADE = 1
                        AND DEPTNO = 30);

DELETE FROM EMP_TEMP
    WHERE SAL < 1000;

DELETE FROM EMP_TEMP;  -- 데이블 전체 내용 삭제

---------------------------------------------------------------------------------------------------------
/* 연습문제 */
-- 문제 풀기 전 테이블 복사
CREATE TABLE EX_EMP 
AS SELECT * 
FROM EMP;

CREATE TABLE EX_DEPT
AS SELECT * 
FROM DEPT;

CREATE TABLE EX_SALGRADE
AS SELECT * 
FROM SALGRADE;

-- 1. EX_DEPT 에 50, 60, 70, 80 부서를 등록하세요 (부서이름과 지역은 마음대로~)
INSERT INTO EX_DEPT (DEPTNO, DNAME, LOC)
    VALUES (50, 'KH', 'ANDONG');
INSERT INTO EX_DEPT (DEPTNO, DNAME, LOC)
    VALUES (60, 'INTERIOR', 'MOKDONG');
INSERT INTO EX_DEPT (DEPTNO, DNAME, LOC)
    VALUES (70, 'MOLAMOLA', 'DAEJEON');
INSERT INTO EX_DEPT (DEPTNO, DNAME, LOC)
    VALUES (80, 'YOURAMC', 'SUWON');    
    
SELECT * 
FROM EX_DEPT;
    
-- 2.  EX_EMP에 8명의 사원 정보를 등록하세요 ( 세부데이터 마음대로 등록) DEPTNO = 50, 60, 70, 80  중 선택
INSERT INTO EX_EMP
    VALUES (8001, '우영우', 'LOWYER', 7839, '20/05/30', 4000, 500, 60);   
INSERT INTO EX_EMP
    VALUES (8002, '최수연', 'LOWYER', 7839, '20/02/28', 4500, 300, 60);   
INSERT INTO EX_EMP
    VALUES (8003, '안유진', 'IVE', 7902, '03/09/01', 5000, 800, 70);
INSERT INTO EX_EMP
    VALUES (8004, '장원영', 'IVE', 7902, '04/08/31',2800, 500, 70);
INSERT INTO EX_EMP
    VALUES (8005, '리즈', 'IVE', 7902, '04/11/21', 4000, 800, 80);
INSERT INTO EX_EMP
    VALUES (8006, '가을', 'IVE', 7902, '02/09/24', 3600, 500, 50);
INSERT INTO EX_EMP
    VALUES (8007, '이서', 'IVE', 7902, '07/02/21', 2500, 400, 80);
INSERT INTO EX_EMP
    VALUES (8008, '레이', 'IVE', 7902, '04/02/03', 1800, 800, 50);
SELECT * 
FROM EX_EMP;
DELETE FROM EX_EMP
    WHERE ENAME = '이서';
    DELETE FROM EX_EMP
    WHERE ENAME = '레이';

-- 3. EX_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다 
-- 많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 SQL문을 작성 하세요.
UPDATE EX_EMP
    SET DEPTNO = 70
    WHERE  SAL >  ( SELECT AVG(SAL) 
                               FROM EX_EMP
                               WHERE DEPTNO = 50);
-- 4. EX_EMP에 속한 사원 중, 70번 부서의 사원 중에 
-- 입사일이 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 옮기는 SQL문을 작성하세요.
UPDATE EX_EMP
    SET DEPTNO = 80,
            SAL = SAL * 1.1
    WHERE HIREDATE > ( SELECT MIN(HIREDATE)
                                            FROM EX_EMP
                                            WHERE DEPTNO = 70);
                                          
SELECT * 
FROM EX_EMP;                             
-- 5. 2. **EX_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하세요.**
--- 등급 정보 확인을 위해 **SELECT * FROM SALGRADE;** 먼저 확인 하세요.
SELECT * FROM SALGRADE;

DELETE FROM EX_EMP
    WHERE EMPNO IN (SELECT E.EMPNO
                                        FROM EX_EMP E, SALGRADE S
                                        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                                            AND S.GRADE = 5);
SELECT * 
FROM EX_EMP;

ROLLBACK;
---------------------------------------------------------------------------------------------------------
/* 트랜잭션(TCL)의 4가지 특성 */
--1. **원자성(Automicity)**
--  트랜잭션에서 정의된 연산들은 모두 성공적으로 실행되던지 아니면 전혀 실행되지 않은 상태로 남아 있어야 한다. (All or Nothing)
--2. **일관성(Consistency)**    
--  트랜잭션이 실행 되기 전의 데이터베이스 내용이 잘못되어 있지 않다면 
--  트랜잭션이 실행된 이후에도 데이터베이스의 내용에 잘못이 있으면 안된다. 
--3. **고립성(Isolation)**
--  트랜잭션이 실행되는 도중에 다른 트랜잭션의 영향을 받아 잘못된 결과를 만들어서는 안된다.  
--4. **영속성(Durability)**
--  트랜잭션이 성공적으로 수행되면 그 트랜잭션이 갱신한 데이터베이스의 내용은 영구적으로 저장된다.

CREATE TABLE DEPT_TCL
    AS SELECT *
    FROM DEPT;
    
SELECT *
FROM DEPT_TCL;

INSERT INTO DEPT_TCL
    VALUES (50, 'DATABASE', 'SEOUL');
    
UPDATE DEPT_TCL
    SET LOC = 'BUSAN';
--    WHERE DEPTNO = 40;

DELETE FROM DEPT_TCL
    WHERE DNAME = 'RESEARCH';
    
/* ROLLBACK : 트랜잭션(변경사항)을 데이터베이스에 반영하지 않음 */
-- INSERT, UPDATE, DELETE 만 가능!!
ROLLBACK;   -- 지금까지 변경했던 사항을 다 초기화.

SELECT *
FROM DEPT_TCL;

/* COMMIT : 명령어를 사용하면 지금까지 트랜잭션이 모두 반영 됩니다. (되돌릴 수 없음) */
COMMIT;

/* 세션(session)은 어떤 활동을 위한 시간이나 기간을 뜻함.  */
-- 오라클 데이터베이스에서 세션은 데이터베이스 접속을 시작으로 
-- 여러 데이터베이스에서 관련 작업을 수행한 후 접속을 종료하기까지 전체 기간을 의미


/* LOCK : 특정 세션에서 조작중인 데이터는 트랜잭이 완료(COMMIT, ROLLBACK)되기 전까지 다른 세션에서 조작할 수 없는 상태가 됩니다. 
  즉 데이터가 잠기는(LOCK) 것 */


---------------------------------------------------------------------------------------------------------
/* 연습문제  노션 참고,, */
CREATE TABLE DEPT_HW
    AS SELECT *
    FROM DEPT;
    
UPDATE DEPT_HW
    SET DNAME = 'DATABASE',
            LOC = 'SEOUL'
    WHERE DEPTNO = 30;    

SELECT *
FROM DEPT_HW;







































