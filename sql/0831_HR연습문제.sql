--1. EMPLOYEES 테이블에서 King의 정보를 소문자로 검색하고 사원번호, 성명, 담당업무(소문자로),부서번호를 출력하라.
SELECT EMPLOYEE_ID, UPPER(LAST_NAME), UPPER(JOB_ID), DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE UPPER(LAST_NAME) = 'KING';
    
--1-2. EMPLOYEES 테이블에서 King의 정보를 대문자로 검색하고 사원번호, 성명, 담당업무(대문자로),부서번호를 출력하라.
SELECT EMPLOYEE_ID, LOWER(LAST_NAME), LOWER(JOB_ID), DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE LOWER(LAST_NAME) = 'king';

SELECT * 
    FROM EMPLOYEES;

--2. DEPARTMENTS 테이블에서 (부서번호와 부서이름), 부서이름과 위치번호를 합하여 출력하도록 하라.
SELECT (DEPARTMENT_ID || ' : ' || DEPARTMENT_NAME) "부서+이름",
            (DEPARTMENT_NAME || ' : ' || LOCATION_ID) "부서+위치"
FROM DEPARTMENTS;

SELECT * 
    FROM DEPARTMENTS;

--3. EMPLOYEES 테이블에서 이름의 첫 글자가 ‘K’ 보다 크고 ‘Y’보다 적은 사원의 정보를
---- 사원번호, 이름, 업무, 급여, 부서번호를 출력하라.
---- 단 이름순으로 정렬하여라.
SELECT * 
    FROM EMPLOYEES;

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE LAST_NAME > 'K'
        AND  LAST_NAME < 'Y'
    ORDER BY LAST_NAME;

--4. EMPLOYEES 테이블에서 20번 부서 중 이름의 길이 및 급여의 자릿수를 
---- 사원번호, 이름, 이름의 자릿수(LENGTH), 급여, 급여의 자릿수를 출력하라.
---- LENGTHB는 BYTE 혼동하지 말자!
SELECT  EMPLOYEE_ID, LENGTH(LAST_NAME) 이름글자수, SALARY, LENGTH(SALARY) 급여자리수
FROM EMPLOYEES;

--5. EMPLOYEES 테이블에서 이름 중 ‘e’자의 위치를 출력하라.
SELECT LAST_NAME, INSTR(LAST_NAME, 'e') AS 위치
    FROM EMPLOYEES;
    
--6. EMPLOYEES 테이블에서 부서번호가 80인 사람의 급여를 30으로 나눈 나머지를 구하여 출력하라.
SELECT SALARY, MOD(SALARY, 30) 나머지
    FROM (SELECT *
                 FROM EMPLOYEES
                 WHERE DEPARTMENT_ID = 80);
--7. EMPLOYEES 테이블에서 현재까지 근무일 수가 몇주 몇일 인가를 출력하여라.
---- 단 근무 일수가 많은 사람 순으로 출력하여라.
SELECT HIRE_DATE, 
            TRUNC((SYSDATE - HIRE_DATE) / 7 ) || ', ' || 
            TRUNC(SYSDATE - HIRE_DATE)  "근무일수(주, 일)"
FROM EMPLOYEES
ORDER BY TRUNC(SYSDATE - HIRE_DATE) DESC;

--8. EMPLOYEES 테이블에서 부서 50에서 급여 앞에 $를 삽입하고 3자리마다 ,를 출력하라
SELECT TO_CHAR(SALARY, '$999,999,999') 급여
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

--9. EMPLOYEES 테이블에서 부서별로 인원수, 평균 급여, 최저급여, 최고 급여, 급여의 합을 구하여 출력
SELECT DEPARTMENT_ID 부서번호, COUNT(*) 부서별인원수, TRUNC(AVG(SALARY)) 평균, MIN(SALARY)최소, MAX(SALARY)최고, SUM(SALARY) 합
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

--10. EMPLOYEES 테이블에서 30번 부서 중 이름과 담당 업무를 연결하여 출력
SELECT CONCAT(LAST_NAME, JOB_ID) 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

--11. EMPLOYEES 테이블에서 업무별 급여의 평균이 10000 이상인 업무에 대해서 업무명,평균 급여, 급여의 합을 구하여 출력
SELECT JOB_ID 업무이름, 
            TRUNC(AVG(SALARY)) 평균급여, 
            SUM(SALARY) 급여합
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) >= 10000;

-- 12. EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 구하여 출력
SELECT DEPARTMENT_ID 부서번호, 
            COUNT(*) 인원수, 
            SUM(SALARY) 급여합
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 4;







