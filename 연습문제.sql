-- < 연습문제 > 
-- 1. **EMP테이블에서 COMM 의 값이 NULL이 아닌 정보 조회**
SELECT * 
FROM EMP
WHERE COMM IS NOT NULL;
-- 2. **EMP테이블에서 커미션을 받지 못하는 직원 조회(NULL or 0)**
SELECT * 
FROM EMP 
WHERE COMM IS NULL OR COMM = 0;
-- 3. **EMP테이블에서 관리자가 없는 직원 정보 조회**
SELECT * 
FROM EMP
WHERE MGR IS NULL;
-- 4. **EMP테이블에서 급여를 많이 받는 직원 순으로 조회**
SELECT * 
FROM EMP
ORDER BY SAL DESC;
-- 5. **EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회**
SELECT * 
FROM EMP
ORDER BY SAL ASC, COMM DESC;
-- 6. **EMP테이블에서 사원번호, 사원명,직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)**
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE;
-- 7. **EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)**
SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO DESC;
-- 8. **EMP테이블에서 사번, 입사일, 사원명, 급여 조회  (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)**
SELECT EMPNO, HIREDATE, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY DEPTNO ASC, HIREDATE DESC;
-- 9. **오늘 날짜에 대한 정보 조회**
SELECT SYSDATE
FROM DUAL;
-- 10. **EMP테이블에서 사번, 사원명, 급여 조회  (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)**
SELECT EMPNO, ENAME, SAL
FROM EMP
ORDER BY SAL DESC;
-- 11. **EMP테이블에서 사원번호가 홀수인 사원들을 조회**
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 1; 
-- 12. **EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)**
SELECT ENAME, EXTRACT(YEAR FROM HIREDATE) AS YEAR, EXTRACT(MONTH FROM HIREDATE) AS MONTH
FROM EMP;
-- 13. **EMP테이블에서 9월에 입사한 직원의 정보 조회**
SELECT * 
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 9;
-- 14. **EMP테이블에서 81년도에 입사한 직원 조회**
SELECT * 
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;
-- WHERE HIREDATE BETWEEN '81/01/01' AND '81/12/31';
-- 15. **EMP테이블에서 이름이 'E'로 끝나는 직원 조회**
SELECT *
FROM EMP
WHERE ENAME LIKE '%E';
-- 17. **EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회**
-- ADD_MONTH() : 날짜에서 숫자(달) 만큼 이동 시킴.
SELECT EMPNO, ENAME, HIREDATE, TO_CHAR(HIREDATE + 14610, 'YYYY/MM/DD') AS "입사 40년후"
--SELECT EMPNO, ENAME, HIREDATE, ADD_MONTH(HIREDATE, 12*40) AS "입사 40년후"
FROM EMP;
-- 18. **EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회** (38년은 13870일)
--  MONTH_BETWEEN(날짜1 - 날짜2) 
SELECT * 
FROM EMP 
WHERE TO_CHAR(SYSDATE - HIREDATE) >= 13870 ;
--WHERE MONTH_BETWEEN(SYSDATE, HIREDATE)/12 >= 38;
-- 3. **오늘 날짜에서 년도만 추출**
SELECT EXTRACT(YEAR FROM SYSDATE) 연도
FROM DUAL;

-- 19. 이름이 S자로 시작하고, 마지막 글자가H인 사원의 모든 정보 출력
SELECT * 
FROM EMP
WHERE ENAME LIKE 'S%' AND ENAME LIKE '%H' ;
-- 20. 처음의 글자는 관계없고 두번째 글자가 A인 사원 모든 정보 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '_A%' ; 
-- 21. 급여가 1600 이상이고 부서가 30번인 사원 중 직책이 MANAGER 인 사원의 모든 정보 출력
SELECT *
FROM EMP
WHERE (SAL >= 1600 AND DEPTNO = 30) AND JOB = 'MANAGER' ;
-- 22. 사원의 모든 정보를 부서번호에 대한 내림차순, 이름에 대한 오름차순, 급여에 대한 내림차순 정렬
SELECT *
FROM EMP
ORDER BY DEPTNO DESC, ENAME, SAL DESC;
-- 23. 사원번호가 7654와 7782 사이 이외의 모든 정보 출력
SELECT *
FROM EMP
WHERE EMPNO NOT BETWEEN 7654 AND 7782;
-- 24. 사원의 모든 정보를 부서 번호에 대해 오름차순 정렬 후 급여가 많은 사원부터 출력
SELECT *
FROM EMP
ORDER BY DEPTNO, SAL DESC ;
-- 25. 직책이 MANAGER 가 아니고, 부서가 20이 아닌 사원의 모든 정보 출력
SELECT *
FROM EMP
WHERE JOB != 'MANAGER' AND DEPTNO != 20;
-- 26. 1981/04/01 이후 입사하고, 부서가 30인 사원 정보 
SELECT *
FROM EMP
WHERE HIREDATE > '81/04/01' AND DEPTNO = 30
ORDER BY SAL DESC;
-- 27. 10번 부서에 모든 사원에게 급여의 13%를 보너스로 지급, 10번 부서의 사원 이름, 급여, 보너스 총 금액, 부서번호 출력
SELECT  ENAME, SAL, FLOOR(SAL*1.13) 보너스포함, DEPTNO 
FROM EMP
WHERE DEPTNO = 10; 
-- 28. 모든 사원에 대해서 입사일부터 90일이 지난 후의 날짜 계산, 이름, 입사일, 입사 후 90일, 급여(90일치 급여??) 
SELECT ENAME, HIREDATE, HIREDATE + 90 "90일후" , SAL*3 "총급여"
FROM EMP
ORDER BY 총급여 DESC;

