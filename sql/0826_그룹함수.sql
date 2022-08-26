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

----------------------------------------------------------------------------------------------------------------------
/* 조인 */
-- SELECT 
-- FROM 테이블1, 테이블2, ........테이블 N
-- 조인은 한개 이상의 테이블과 테이블을 서로 연결하여 사용하는 기법
-- 일반적으로 테이블의 식별 값인 Primary Key와 테이블 간 공통 값인 Foreign Key 값을 사용하여 조인 
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO;
----------------------------------------------------------------------------------------------------------------------
/* 등가조인(EQUI JOIN) : 1:1 맞교환 */
-- 테이블을 연결한 후에 출력 행을 각 테이블의 특정 열에 " 일치한 데이터 "를 기준으로 선정하는 방식
-- 내부 조인 또는 단순 조인이라도 부름.
-- 일반적으로 가장 많이 사용되는 조인 방식.

SELECT E.EMPNO 사원번호, E.ENAME 사원이름, D.DEPTNO 부서번호, D.DNAME 부서이름, D.LOC 부서위치
FROM EMP E, DEPT D    -- EMP 를 E로 별칭 DEPT를 D로 별칭
WHERE E.DEPTNO = D.DEPTNO  -- 이 조건이 JOIN 임.
ORDER BY D.DEPTNO, E.EMPNO;
----------------------------------------------------------------------------------------------------------------------
/* ANSI 방식 : 미국 규격  */
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.DEPTNO;
----------------------------------------------------------------------------------------------------------------------
/* WHERE 절에 조건식을 추가하여 출력 범위 설정  */
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;
-- ANSI 방식
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO AND SAL >= 3000;
----------------------------------------------------------------------------------------------------------------------
/* 연습문제 */
-- EMP테이블의 별칭을 E로 하고, DEPT의 별칭을 D로 하여 다음과 같이 등가조인을 했을 때 
-- 급여가 2500이하이고, 사원번호가 9999이하인 사원의 정보를 출력
SELECT E.EMPNO 사원번호, E.ENAME 사원이름, E.SAL 급여, D.DEPTNO 부서번호, D.DNAME 부서이름
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
E.SAL <= 2500 AND E.EMPNO <= 9999
ORDER BY 사원번호;

SELECT E.EMPNO 사원번호, E.ENAME 사원이름, E.SAL 급여, D.DEPTNO 부서번호, D.DNAME 부서이름
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
        AND E.SAL <= 2500 
        AND E.EMPNO <= 9999
ORDER BY 사원번호;
----------------------------------------------------------------------------------------------------------------------
/* 비등가 조인 : 동일 컬럼이 없이 다른 조건을 사용하여 조인 할 때 사용 */
-- 자주 사용되는 방식은 아님. 
SELECT E.ENAME, E.SAL, S.GRADE, S.LOSAL, S.HISAL
FROM EMP E JOIN SALGRADE S  -- 두개의 테이블을 조인 함. 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL; -- EMP 테이블을 기준으로 S.LOSAL 과 S.HISAL 의 사이 값을 가지고 옴. 

SELECT E.ENAME, E.SAL, S.GRADE, S.LOSAL, S.HISAL
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

----------------------------------------------------------------------------------------------------------------------
/* 자체 조인 : 자기 자신과 자신이 조인을 하는 것 */
-- EX) 사원 정보과 해당 사원의 직속 상관의 정보를 나란히 출력하고자 할 때 사용.
SELECT E1.EMPNO 사원번호, 
        E1.ENAME 사원이름, 
        E1.MGR , 
        E2.EMPNO 상관의상관번호, 
        E2.ENAME 상관이름
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;
/* ANSI */
SELECT E1.EMPNO 사원번호, 
        E1.ENAME 사원이름, 
        E1.MGR , 
        E2.EMPNO 상관의상관번호, 
        E2.ENAME 상관이름
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;
----------------------------------------------------------------------------------------------------------------------
/* 외부조인 */
-- 동등 조인(INNER JOIN)의 경우 한쪽 컬럼에 대한 값이 없다면 해당 행이 조회되지 않음. 
-- 외부 조인(OUTER JOIN)은 내부 조인과 다르게 공통되지 않은 ROW도 유지
-- 외부 조인을 사용하는 이유는 기준 테이블의 데이터가 모두 조회되고(누락없이), 
--      대상 테이블에 데이터가 있을 경우 해당 컬럼의 값을 가져오기 위해서 사용.
--      (+) 기호를 사용, 데이터값이 부족한 테이블의 열 이름 뒤에 기술

SELECT E1.EMPNO 사원번호, E1.ENAME 사원이름, E1.MGR,
              E2.EMPNO 상사번호, E2.ENAME 상사이름
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)  -- (+) MGR 의 NULL 값도 다 나옴. (모든 자료가 다 나옴) / 왼쪽을 기준으로 조인. / 왼쪽 데이터가 더 많은 경우 사용.
ORDER BY E1.EMPNO;
/* (ANSI) LEFT OUTER JOIN : 합치기에 사용한 두 테이블 중 " 왼쪽 " 에 기술된 테이블의 컬럼 수를 기준으로 JOIN */
SELECT E1.EMPNO 사원번호, E1.ENAME 사원이름, E1.MGR,
              E2.EMPNO 상사번호, E2.ENAME 상사이름
FROM EMP E1 LEFT OUTER JOIN EMP E2
ON E1.MGR = E2.EMPNO
ORDER BY E1.EMPNO;
/* RIGHT OUTER JOIN : 합치기에 사용한 두 테이블 중 " 오른쪽 " 에 기술된 테이블의 컬럼 수를 기준으로 JOIN */
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO  -- E.DEPTNO 의 빈 값까지도 모두 출력. / 오른쪽을 기준으로 조인 / 오른쪽 데이터가 더 많은 경우 사용
ORDER BY E.EMPNO;
/* (ANSI) */
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO(+) = D.DEPTNO  -- E.DEPTNO 의 빈 값까지도 모두 출력. / 오른쪽을 기준으로 조인 / 오른쪽 데이터가 더 많은 경우 사용
ORDER BY E.EMPNO;

----------------------------------------------------------------------------------------------------------------------
/* NATURAL JOIN : 두 테이블의 동일한 이름(컬럼명)을 갖는 컬럼은 모두 조인 */
-- 동등조인과 비슷하지만 WHERE 조건절이 없이 조인, 자주 사용 안됨.
-- 내부적으로 DEPTNO 열을 기준으로 등가 조인 됨.
SELECT EMPNO, ENAME, DNAME
FROM EMP NATURAL JOIN DEPT;

SELECT E.EMPNO, E.ENAME, E.JOB, E. HIREDATE, E.SAL, E.COMM, D.DNAME, D.LOC
            /* E.DEPTNOF 를 넣을 경우 동등조인의 기본 조건인 같은 이름을 기준으로 조인하기 때문에 오류/ 그냥 DEPTNO 는 가능 */
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

----------------------------------------------------------------------------------------------------------------------
/* ANSI / JOIN ~ USING */
-- 동등조인(INNER JOIN)과 유사하며, 동등조인을 대신하여 사용 가능.
-- NATURAL JOIN 이 자동으로 조인의 기준 열을 지정하는 것과 달리 USING 키워드에 조인 기준으로 사용할 열을 명시해줘야 함.
-- FROM 테이블1 JOIN 테이블2 USING ( 조인에 사용할 기준열 )
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, 
             D.DNAME, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING (DEPTNO)
WHERE SAL >= 3000
ORDER BY DEPTNO, E.EMPNO;
----------------------------------------------------------------------------------------------------------------------
/* FULL OUTER JOIN : 양쪽 테이블 모두 OUTER JOIN 대상에 포함 */
-- 어느쪽이든  NULL 을 포함하더라도 모두 출력. (LEFT + RIGHT 라고 보면 됨.)
SELECT E.ENAME, E.DEPTNO, D.DEPTNO, D.DNAME
FROM EMP E FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO;

----------------------------------------------------------------------------------------------------------------------
/* 연습문제 */
-- 1. 급여가 2000 초과인 사원들의 부서 정보, 사원정보를 출력.
-- 오라클 문법과 ANSI 문법
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO AND E.SAL > 2000
ORDER BY E.DEPTNO;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL > 2000
ORDER BY E.DEPTNO;

SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E NATURAL JOIN DEPT D
WHERE  E.SAL > 2000
ORDER BY DEPTNO;

-- 2. 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수 출력
-- 오라클 문법과 ANSI 문법
SELECT E.DEPTNO, D.DNAME, ROUND(AVG(E.SAL)), MAX(E.SAL), MIN(E.SAL), COUNT(*)
FROM DEPT D JOIN EMP E
ON E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME
ORDER BY DEPTNO;

SELECT E.DEPTNO, D.DNAME, ROUND(AVG(E.SAL)), MAX(E.SAL), MIN(E.SAL), COUNT(*)
FROM DEPT D, EMP E
WHERE E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME
ORDER BY DEPTNO;

-- 3. 모든 부서정보와 사원정보를 부서번호, 사원이름 순으로 정렬하여 출력
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO, E.ENAME;

-- 4. 모든 부서번호, 부서 이름, 사원번호,  사원 이름, 사원급여, 직속상관의사원번호 출력
-- 3개의 테이블 (EMP, DEPT, SALGRADE)
SELECT D.DEPTNO 부서번호, 
              D.DNAME 부서이름, 
              E.EMPNO 사원번호,
              E.ENAME 사원이름,
              E.MGR 직속상관, 
              E.SAL 급여,
              E.DEPTNO 부서번호2, 
              S.LOSAL,
              S.HISAL, 
              S.GRADE 등급,
              E2.EMPNO 상관번호,
              E2.ENAME 상관이름
FROM 
    EMP E RIGHT OUTER JOIN DEPT D
        ON (E.DEPTNO = D.DEPTNO)
     LEFT OUTER JOIN SALGRADE S 
        ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
     LEFT OUTER JOIN EMP E2
        ON (E.MGR = E2.ENAME)
ORDER BY D.DEPTNO;

SELECT * 
FROM SALGRADE;






