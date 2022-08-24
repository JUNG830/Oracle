SELECT ENAME, SAL, SAL*12+COMM AS 연봉에성과급포함, COMM
FROM EMP
WHERE COMM IS NOT NULL;
----------------------------------------------------------------------------------
/* 직속상관이 있는 사원 데이터만 출력 */
SELECT *
FROM EMP
WHERE MGR IS NOT NULL;
----------------------------------------------------------------------------------
/* 정렬을 위 ORDER BY절 : 기본은 오름차순(ASC), 내림차순은 DESC  |-> 항상 맨 마지막에 와야함.  */
-- ORDER BY 정렬은 꼭 필요한 경우만 사용 |-> 모든 데이터를 기준에 따라 정렬하는 것은 많은 자원을 소모함. 
SELECT *
FROM EMP
ORDER BY SAL ASC/*(ASC 생략가능, 기본값이니까)*/; 
----------------------------------------------------------------------------------
/* 사원 번호 기준으로 오름차순 정렬 */
SELECT *
FROM EMP
ORDER BY EMPNO;
----------------------------------------------------------------------------------
/* 여러 컬럼 시준으로 정렬 하기 */
SELECT *
FROM EMP
ORDER BY SAL, ENAME ;   -- 급여 기준으로 정렬 후 급여가 같으면 이름 순으로 정렬.
--ORDER BY SAL DESC, ENAME ; -- 급여를 내림차순으로 정렬하고 이름은 오름차순으로 정렬
----------------------------------------------------------------------------------
/* 내림차순과 오름차순 함께 사용하기. */
SELECT *
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;
----------------------------------------------------------------------------------
/* 별칭과 ORDER BY 함께 사용하기. */
SELECT EMPNO 사원번호, ENAME 이름, SAL 월급, HIREDATE 입사일
FROM EMP
ORDER BY 월급 DESC, 이름;    -- 별칭으로도 정렬 가능. 
----------------------------------------------------------------------------------
/* 연결 연산자 : || , 문자열을 이어붙임.  */
SELECT ENAME || ' S JOB IS ' || 'TEST' AS 종업원
FROM EMP;
----------------------------------------------------------------------------------
-- 1. 사원 이름이 S로 끝나는 사원 데이터를 모두 출력하기  (LIKE 사용)
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

-- 2. 30번 부서에서 근무하고 있는 사원 중 직책이 SALESMAN 인 사원의 사원번호, 이름, 직책, 급여, 부서번호를 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE  DEPTNO  =  30 AND JOB = 'SALESMAN';

-- 3. 20번, 30번 부서에 근무하고 있는 사원 중 급여(SAL)가 2000 초과인 사원을 두가지 방식의 
-- SELECT 문을 사용하여 사원번호, 이름, 급여, 부서번호 출력
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
--WHERE DEPTNO IN (20, 30) AND SAL > 2000; 
WHERE (DEPTNO =20 OR DEPTNO = 30) AND SAL > 2000;   -- 우선 비교할 거 ()로 묶어줘야 함. 

-- 4. 급여가 2000이상 3000이하 이외의 값을 가진 데이터만 출력
SELECT *
FROM EMP
--WHERE NOT (SAL >=2000 AND SAL <= 3000);
WHERE SAL NOT BETWEEN 2000 AND 3000;












