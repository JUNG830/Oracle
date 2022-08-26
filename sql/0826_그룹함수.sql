---------------------------------------------------
/* 그룹 함수 */
--SELECT SUM(SAL), SAL  -- 그룹 함수는 단 한개의 결과 값만 산출하기 때문에 그룹이 여러개일 경우 오류 발생 

SELECT SUM(SAL)
FROM EMP;
------------------------------------------------------------
/* GROUP BY : 기준열에 대해 같은 데이터 값끼리 그룹으로 묶고 묶은 행의 집합에 대해 그룹 함수의 연산이 필요하다면 GROUP BY 절을 이용하여 처리 할 수 있습니다. */
SELECT SUM(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;  
------------------------------------------------------------
/* 합계구하기 */
SELECT SUM(DISTINCT SAL),  -- DISTINCT : 중복제거
    SUM(ALL SAL),
    SUM(SAL)
FROM EMP;
    
SELECT SUM(SAL), 
    SUM ( NVL ( COMM, 0 ) ),
    DEPTNO
FROM EMP
GROUP BY DEPTNO;

------------------------------------------------------------
/* 데이터 갯수를 구해주는 COUNT 함수 */
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO;

SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;
------------------------------------------------------------
/* NULL이 아닌 경우에만 수당 받는 인원 구하기 */
-- COUNT도 연산처리를 하기 때문에 자동으로 NULL을 제외함.
SELECT COUNT(COMM), COMM
FROM EMP
WHERE COMM IS NOT NULL
GROUP BY COMM;
------------------------------------------------------------
/*MAX */
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;

/* MIN */
SELECT MIN(SAL)
FROM EMP
WHERE DEPTNO = 10;

SELECT MAX(HIREDATE)  -- 제일 늦게 입사한 사람
FROM EMP
WHERE DEPTNO = 20;

SELECT MIN(HIREDATE)  -- 제일 먼저 입사한 사람
FROM EMP
WHERE DEPTNO = 20;

/* AVG : 평균 */
SELECT ROUND(AVG(SAL)), DEPTNO
FROM EMP
WHERE DEPTNO = 30
GROUP BY DEPTNO;

------------------------------------------------------------
/* GROUP BY 로 출력하는 방법 */
SELECT DEPTNO, ROUND(AVG(SAL), 2)
FROM EMP
GROUP BY DEPTNO;
------------------------------------------------------------
/* GROUP BY 없이 출력하는 방법 */
SELECT ROUND(AVG(SAL), 2) "10번 결과"
FROM EMP
WHERE DEPTNO = 10
SELECT ROUND(AVG(SAL), 2) "20번 결과"
FROM EMP
WHERE DEPTNO = 20
SELECT ROUND(AVG(SAL), 2) "30번 결과"
FROM EMP
WHERE DEPTNO = 30;

SELECT ROUND(AVG(SAL), 2) "10번 결과"
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT ROUND(AVG(SAL), 2) "20번 결과"
FROM EMP
WHERE DEPTNO = 20
UNION ALL
SELECT ROUND(AVG(SAL), 2) "30번 결과"
FROM EMP
WHERE DEPTNO = 30;

------------------------------------------------------------
/* 부서번호 및 직책별 평균 급여로 정렬 */
SELECT DEPTNO, JOB, ROUND(AVG(SAL), 2) "평균급여"
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;
------------------------------------------------------------
/* 부서 코드, 급여 합계, 부서 평균, 인원수 순으로 정렬 */
SELECT DEPTNO 부서코드, 
    SUM(SAL) 급여합계, 
    ROUND(AVG(SAL), 2) 부서급여평균, 
    COUNT(*) 인원수
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
    
------------------------------------------------------------
/* HAVING 절 */
/* GROUP BY절을 통해 그룹화된 결과 값의 범위를 제한하는데 사용 */
/* SELECT문에 GROUP BY절이 존재할 때만 사용할 수 있음 */

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
-- WHERE 절이 들어간다면 여기!!
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;    

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
--WHERE AVG(SAL) >= 2000  -- GROUP 으로 묶여있는 경우 WHERE절 사용할 수 없음. HAVING절 이용.
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;   

------------------------------------------------------------
/* HAVING 절 + WHERE 절 사용 */
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
    WHERE SAL <= 3000  -- 먼저 출력행에 대한 조건을 통해 제한을 함. 
    -- WHERE 절에선 GROUP 함수가 아닌 것만 계산
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
    -- HAVING 절에선 GROUP 으로 묶인 것만 계산.
ORDER BY DEPTNO, JOB;
------------------------------------------------------------
/* HAVING 절을 사용하여 EMP테이블의 부서별 직책의  평균 급여가 500 이상인 사원들의 
부서번호, 직책, 평균급여 출력 */
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 500
ORDER BY AVG(SAL), DEPTNO;    

------------------------------------------------------------
/* < 연습문제 > */
-- 1. EMP 테이블을 이용하여 부서번호, 평균급여, 최고급여, 최저급여, 사원수 출력
-- 단, 평균 급여를 출력할 때 소숫점은 제외하고 부서번호별로 출력
SELECT DEPTNO 부서번호, 
        ROUND(AVG(SAL), 0) 평균급여, 
        MAX(SAL) 최고급여,
        MIN(SAL) 최저급여, 
        COUNT(*) 사원수
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
------------------------------------------------------------
/* < 연습문제 > */
-- 2. 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원을 출력
SELECT JOB 직책, COUNT(*) 사원수
FROM EMP
GROUP BY JOB
    HAVING COUNT(*) >= 3;

------------------------------------------------------------
/* < 연습문제 > */
-- 3. 사원들의 입사연도를 기준으로 부서별로 몇명이 입사했는지 출력
SELECT SUBSTR(HIREDATE, 1, 2) 입사연도, JOB 직책, COUNT(*) 사원수
FROM EMP
GROUP BY SUBSTR(HIREDATE, 1, 2), JOB
ORDER BY SUBSTR(HIREDATE, 1, 2), JOB;

------------------------------------------------------------
/* < 연습문제 > */
-- 4. 추가 수당을 받는 사원 수와 받지 않는 사원수를 출력 ('O' , 'X' 출력)
SELECT NVL2(COMM, 'O', 'X') AS 수당여부, COUNT(*) 사원수
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');
-- 0 일 경우 X 처리 되어야하는데,,,,,, 
SELECT COMM
FROM EMP;
        
------------------------------------------------------------
/* < 연습문제 > */
-- 5. 각 부서의 입사연도별 사원수, 최고급여, 급여합, 평균급여를 출력하고
-- 각 부서별 총계 출력.
SELECT DEPTNO 부서번호, 
        TO_CHAR(HIREDATE, 'YYYY') 입사연도, 
        COUNT(*) 사원수,
        MAX(SAL) 최고급여, 
        SUM(SAL) 급여총합, 
        ROUND(AVG(SAL)) 평균급여
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
ORDER BY DEPTNO, TO_CHAR(HIREDATE, 'YYYY');

               
----------------------------------------------------------------------------------------------------------------------
/* 집합 */
-- UNION : SQL문에 대한 합집합을 반환(SELECT 문을 합쳐줌). 단, 중복 제거. 출력 타입은 동일해야함.
-- UNION ALL : 중복제거 하지 않음.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE  DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE  DEPTNO = 20;

/* 교집합 */
-- INTERSECT : 두 SELECT 문의 결과 값이 같은 경우 반환.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > 1000
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL < 2000;

/* 차집합 */
-- MINUS : 앞의 SELECT 문에서 뒤의 SELECT 문을 뺀 결과 값 반환.
-- SAL 전체에서 SAL > 2000을 제외한 결과 출력 됨.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > 2000;
















