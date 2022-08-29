-----------------------------------------------------------------------------------------------
/* 서브쿼리 */
-- SQL문 안에서 작성하는 SELECT문을 의미 합니다.
--서브쿼리는 조인과 더불어 여러 데이터를 하나의 SQL 문에서 처리하기 위해 사용 합니다.
--서브 쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓이며, 반드시 괄호( )안에 넣어 표현 합니다.

SELECT * 
FROM DEPT;
-- 서브퀴리문 수행 결과 와 WHERE절을 비교함 (서브쿼리문의 수행 경과가 10을 반환함.)
SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                                FROM EMP
                                WHERE ENAME = 'KING');
                                
SELECT DNAME
FROM DEPT
WHERE DEPTNO = 10;
                                

SELECT DEPTNO
FROM EMP
WHERE ENAME = 'KING';
-----------------------------------------------------------------------------------------------
-- 서브쿼리로 JONES 의 1급여보다 높은 급여를 받는 사원 정보 출력
-- 서브쿼리문 수행 결과로 JONES의 급여를 가지고 옴.
SELECT *
    FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');  --2975 보다 높은 급여를 받는 사람 정보 출력

SELECT SAL FROM EMP WHERE ENAME = 'JONES';

-----------------------------------------------------------------------------------------------
-- 서브쿼리를 사용하여 EMP 테이블의 사원 정보 중에서 사원 이름이 ALLEN인 사원의 추가 수당
-- 보다 많은 추가 수당을 받는 사원 정보를 구하도록 코드 작성
SELECT * 
FROM EMP 
WHERE COMM > (SELECT COMM                       -- 가지고온 정보를 COMM 과 비교해서 더 많은 COMM 을 받는 사람의 정보를 가지고 옴. 
                                FROM EMP 
                                WHERE ENAME = 'ALLEN');  -- EMP 테이블에서 ALLEN 의 COMM 정보를 가지고 옴
-----------------------------------------------------------------------------------------------
-- 단일행 서브쿼리와 날짜형 데이터 
SELECT * 
        FROM EMP
        WHERE HIREDATE < (SELECT HIREDATE 
                                             FROM EMP
                                             WHERE ENAME = 'JAMES');  -- JAMES 보다 빨리 입사한 사람들 정보 출력됨. 
                                          
-- 동등조인과 결합해서 사용하기.
-- 서브쿼리를 통해서 EMP테이블의 SAL의 평균 급여를 먼저 구함. 
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
            AND E.DEPTNO = 20
            AND E.SAL > (SELECT AVG(SAL)
                                    FROM EMP);
-- ANSI
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E JOIN DEPT D
              ON E.DEPTNO = D.DEPTNO
                 AND E.DEPTNO = 20
                AND E.SAL > (SELECT AVG(SAL)
                                            FROM EMP);
                                    
SELECT AVG(SAL)
        FROM EMP;
                                                        
-----------------------------------------------------------------------------------------------
-- 실행 결과가 여러개인 다중행 서브쿼리
-- IN : 메인 쿼리의 데이터가 서브 쿼리의 결과 중 하나라도 일치하면 TRUE 
-- 각 부서에서 급여가 높은 사람 정보 출력
SELECT * 
    FROM EMP 
    WHERE SAL IN (SELECT MAX(SAL)
                                    FROM EMP
                                    GROUP BY DEPTNO); 

SELECT MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO;  -- 최고 급여를 부서별로 묶음. /-> 각 부서별 최고 급여를 받는 사원의 정보 출력








