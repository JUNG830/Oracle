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

SELECT SAL 
FROM EMP 
WHERE ENAME = 'JONES';

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

-----------------------------------------------------------------------------------------------
-- ANY : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE
-- 서브쿼리의 결과가 여러개 존재하기 때문에 다주행 연산자 필요(IN, ANY, ALL, EXISTS)
SELECT EMPNO, ENAME, SAL
        FROM EMP
        WHERE SAL > ANY (SELECT SAL
                                 FROM EMP
                                WHERE JOB = 'SALESMAN');  -- 서브쿼리의 결과값이 여러개이기 때문에 단일행 불가. 
/* 다중행 서브쿼리 : 결과 값이 여러개 존재 */                                
SELECT SAL
FROM EMP
WHERE JOB = 'SALESMAN';                 
                                
                                
/* 단일행 서브쿼리 */ 
SELECT *
    FROM EMP
    WHERE SAL > ( SELECT SAL
                              FROM EMP
                              WHERE ENAME = 'JONES'); 
-- 서브쿼리 결과가 한개 = 단일행.           
SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';

-----------------------------------------------------------------------------------------------
-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원정보 출력
SELECT *
FROM EMP
WHERE SAL < ANY (SELECT  SAL    -- 모든 급여들 중 어느 하나보다라도 작으면 출력
                                 FROM EMP
                                 WHERE DEPTNO = 30)
ORDER BY SAL, DEPTNO;

SELECT  SAL
FROM EMP
WHERE DEPTNO = 30;

-----------------------------------------------------------------------------------------------
-- ALL : 메인쿼리의 조건식을 서브쿼리의 결과가 모두 만족하면 TRUE
-- 급여가 서버쿼리의 MANAGER 의 급여들보다 큰 경우만 출력
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL
                                FROM EMP
                                WHERE JOB = 'MANAGER'); 

SELECT SAL
FROM EMP
WHERE JOB = 'MANAGER';
-- 급여가 30번 부서의 급여보다 적은 경우만 TRUE
SELECT *
FROM EMP
WHERE SAL > ALL (SELECT SAL
                                FROM EMP
                                WHERE DEPTNO = 30)
ORDER BY SAL, DEPTNO; 

-----------------------------------------------------------------------------------------------
-- EXISTS : 서브쿼리의 결과 값이 하나 이상 존재하면 모두 TRUE/ 존재하지 않으면 FALSE.
-- 서브쿼리의 결과값이 한개라도 존재하면 모두 출력.
SELECT * 
    FROM EMP
    WHERE EXISTS (SELECT DNAME
                                FROM DEPT
                                WHERE DEPTNO = 10);

SELECT DNAME
FROM DEPT
WHERE DEPTNO = 10;

-----------------------------------------------------------------------------------------------
-- 다중열 서브쿼리 : 서브쿼리의 결과가 두개 이상의 컬럼으로 반환되어 메인쿼리에 전달하는 쿼리.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP 
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, SAL   -- 메인쿼리에 WHERE절이 2개면 서브쿼리도 2개 반환.
                                            FROM EMP
                                            WHERE DEPTNO = 30);
-- 서브쿼리
SELECT DEPTNO, SAL
 FROM EMP
WHERE DEPTNO = 30;
-----------------------------------------------------------------------------------------------
-- GROUP BY 절이 포함된 다중열 서브쿼리
SELECT *  -- 각 부서의 최고 급여인 사원정보 출력.
    FROM EMP
    WHERE (DEPTNO, SAL ) IN (SELECT DEPTNO, MAX(SAL)
                                                    FROM EMP
                                                    GROUP BY DEPTNO);
/* 서브쿼리 : 부서별 최고 급여 */ 
SELECT DEPTNO, MAX(SAL)  
     FROM EMP
    GROUP BY DEPTNO;

-----------------------------------------------------------------------------------------------
/* FROM절에 사용하는 서브쿼리 (시험문제^^) */
-- 메인 쿼리의 FROM 절을 서브 쿼리로 이용하는 방법으로, 인라인 뷰 라고 함. 
--  테이블 내 데이터 규모가 너무 큰 경우 필요한 행과 열만 사용하고자 할 때 
-- 또는 정렬이 먼저 필요한 경우 등에 사용..
-- BUT  FROM절에 너무 많은 서브쿼리를 지정하면 가독성이나 성능이 떨어질 수 있음.

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM (SELECT * 
                    FROM EMP 
                    WHERE DEPTNO = 10) E10, -- DEPTNO가 10번인 사원 정보만 가지로 옴.
                (SELECT * 
                    FROM DEPT) D
    WHERE E10.DEPTNO = D.DEPTNO;   
-----------------------------------------------------------------------------------------------
-- 먼저 정렬이 필요한 경우 : 급여가 높은 사람 3명 출력 (시험문제^^)
-- ROWNUM : 오라클에서 제공하며 행번호를 매겨준다. 
SELECT ROWNUM, ENAME, SAL
    FROM (SELECT * 
                FROM EMP
                ORDER BY SAL DESC)  -- 정렬을 먼저 하고
    WHERE ROWNUM <= 3;  -- 위에서 3번째까지만 출력. 
--    ORDER BY SAL; -- 정렬하면 행 번호가 뒤죽박죽 됨 WHAY?!
-----------------------------------------------------------------------------------------------
/* SELECT 절에 사용하는 서브 쿼리 */ 
-- SELECT 문에서 사용하는 단일행 서브쿼리를 스칼라 서브쿼리라고 한다. 
-- SELECT 절에 명시하는 서브쿼리는 반드시 하나의 결과만 반환하도록 작성해야한다. 
SELECT EMPNO, ENAME, JOB, SAL, 
            (SELECT GRADE
                FROM SALGRADE 
                WHERE EMP.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
            DEPTNO,
            (SELECT DNAME
                FROM DEPT D
                WHERE EMP.DEPTNO = D.DEPTNO) AS DNAME
        FROM EMP;                    
                
SELECT *
FROM SALGRADE;
SELECT *
FROM DEPT;

-----------------------------------------------------------------------------------------------
-- 매 행마다 부서번호가 각 행의 부서번호와 동일한 사원들의 SAL평균을 구해서 반환. 
-- 사원이름 / 부서번호 / 급여 / 부서의 평균
SELECT ENAME, DEPTNO, SAL, 
            (SELECT TRUNC(AVG(SAL)) 
                FROM EMP
                WHERE DEPTNO = E.DEPTNO ) AS "부서평균급여"  -- 각 부서의 금여 평균을 구함. 
        FROM EMP E;
        
SELECT TRUNC(AVG(SAL)) 
        FROM EMP
        WHERE DEPTNO = 30;

-----------------------------------------------------------------------------------------------
-- 부서 위치가 NEW YORK 인 경우 본사, 그외 부서는 분점을 출력   
SELECT EMPNO, ENAME,
        CASE WHEN DEPTNO = (SELECT DEPTNO
                                                    FROM DEPT
                                                    WHERE LOC = 'NEW YORK')
                    THEN '본사'
                    ELSE '분점'
        END AS 소속
FROM EMP
ORDER BY 소속;

-----------------------------------------------------------------------------------------------
/* 연습문제 */
-- 1. 전체 사원 중 ALLEN과 같은 직책(JOB)인 사원들의 사원 정보, 부서 정보를 다음과 같이 출력하는 SQL문을 작성.
SELECT JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
        FROM EMP E, DEPT D
        WHERE  E.DEPTNO = D.DEPTNO
        AND JOB = (SELECT JOB
                                FROM EMP
                                WHERE ENAME = 'ALLEN');
/* 연습문제 */
-- 2. 전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사원들의 사원 정보, 부서 정보, 급여 등급 정보를 출력하는 SQL문을 작성하세요
-- (단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 사원 번호를 기준으로 오름차순으로 정렬하세요).
-- 단일행 서븤쿼리 : <, >, =, <=, >=, [<>, !=, ^=  : 같지 않다]
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, 
            (SELECT GRADE
                FROM SALGRADE 
                WHERE E.SAL BETWEEN LOSAL AND HISAL) AS GRADE -- 비등가조인
    FROM EMP E, DEPT D
    WHERE  E.DEPTNO = D.DEPTNO
        AND SAL > (SELECT AVG(SAL)
                                FROM EMP)
    ORDER BY SAL, EMPNO;
/* 연습문제 */    
-- 3. 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 
-- 사원 정보, 부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
-- 다중행 서브쿼리를 묻는 문제 : IN, NOT IN, ANY, SOME(=ANY : 하나만 만족), ALL(모두만족), EXISTS(쿼리의 결과가 하나라도 만족하면 다 출력)
SELECT E10.EMPNO, E10.ENAME, E10.JOB, E10.DEPTNO, D.DNAME, D.LOC
    FROM  (SELECT * 
                    FROM EMP 
                    WHERE DEPTNO = 10) E10, 
                DEPT D
    WHERE E10.DEPTNO = D.DEPTNO
        AND E10.JOB NOT IN ( SELECT JOB   -- IN : 메인 쿼리의 데이터가 서브 쿼리의 결과 중 하나라도 일치하면 TRUE
                                                    FROM EMP
                                                WHERE DEPTNO = 30);    
/* 연습문제 */
-- 4. 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원 정보, 급여 등급 정보를 다음과 같이 출력하는 SQL문을 작성하세요
--(단 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원 번호를 기준으로 오름차순으로 정렬하세요).
-- // 다중행 사용 X  -> 단일행 사용// 
SELECT E.EMPNO, E.ENAME, E.SAL, 
                (SELECT GRADE
                FROM SALGRADE
                WHERE SAL BETWEEN LOSAL AND HISAL) AS GRADE
    FROM EMP E
    WHERE SAL > (SELECT MAX(SAL)
                                FROM EMP
                                WHERE JOB = 'SALESMAN')  -- JOB 이 SALESMAN 인 사람들 중에서 급여가 가장 높은 사람 출력 
    ORDER BY E.EMPNO;
    
SELECT MAX(SAL)
    FROM EMP
    WHERE JOB = 'SALESMAN';
    
-- // 다중행 사용 O // 
-- ALL : 메인쿼리의 조건식을 서브쿼리의 결과가 모두 만족하면 TRUE
SELECT EMPNO, ENAME, SAL, 
                (SELECT GRADE
                FROM SALGRADE
                WHERE SAL BETWEEN LOSAL AND HISAL) AS GRADE
    FROM EMP
    WHERE SAL > ALL (SELECT DISTINCT SAL  -- DISTINCT : 중복 제거(안 써도 결과는 같음)
                                        FROM EMP
                                       WHERE JOB = 'SALESMAN')
    ORDER BY EMPNO;

SELECT DISTINCT SAL 
        FROM EMP
       WHERE JOB = 'SALESMAN';

