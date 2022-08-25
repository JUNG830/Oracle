SELECT *
FROM EMPLOYEES;

-- 1. EMPLOYEES 테이블에서 King의 정보를 소문자로 검색하고 사원번호, 성명, 담당업무(소문자로),부서번호를 출력하라.
SELECT EMPLOYEE_ID,FIRST_NAME, LOWER(LAST_NAME), LOWER(JOB_ID), DEPARTMENT_ID
FROM  EMPLOYEES
WHERE LOWER(LAST_NAME) = 'king';
-- 2. EMPLOYEES 테이블에서 King의 정보를 대문자로 검색하고 사원번호, 성명, 담당업무(대문자로),부서번호를 출력하라.
SELECT EMPLOYEE_ID,FIRST_NAME, UPPER(LAST_NAME), UPPER(JOB_ID), DEPARTMENT_ID
FROM  EMPLOYEES
WHERE UPPER(LAST_NAME) = 'KING';

--3. DEPARTMENTS 테이블에서 (부서번호와 부서이름), 부서이름과 위치번호를 합하여 출력하도록 하라.

SELECT * FROM DEPARTMENTS;
SELECT
    DEPARTMENT_ID || DEPARTMENT_NAME || LOCATION_ID AS DEPTLOCA
FROM DEPARTMENTS;
--4. EMPLOYEES 테이블에서 이름의 첫 글자가 ‘K’ 보다 크고 ‘Y’보다 적은 사원의 정보를
---- 사원번호, 이름, 업무, 급여, 부서번호를 출력하라.
---- 단 이름순으로 정렬하여라.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SUBSTR( FIRST_NAME, 1, 1) > 'K' AND SUBSTR( FIRST_NAME, 1, 1) < 'Y'
ORDER BY FIRST_NAME;

--5. EMPLOYEES 테이블에서 20번 부서 중 이름의 길이 및 급여의 자릿수를 
---- 사원번호, 이름, 이름의 자릿수(LENGTH), 급여, 급여의 자릿수를 출력하라.
---- LENGTHB는 BYTE 혼동하지 말자!
SELECT 
    EMPLOYEE_ID, 
    FIRST_NAME, 
    LENGTH(FIRST_NAME) AS 이름길이, 
    SALARY, 
    LENGTH(SALARY) AS 급여길이
FROM EMPLOYEES;

--6. EMPLOYEES 테이블에서 이름 중 ‘e’자의 위치를 출력하라.
SELECT FIRST_NAME,
     INSTR(FIRST_NAME, 'e', 1) AS e의위치
FROM EMPLOYEES;     

--7. EMPLOYEES 테이블에서 부서번호가 80인 사람의 급여를 30으로 나눈 나머지를 구하여 출력하라.
--8. EMPLOYEES 테이블에서 현재까지 근무일 수가 몇주 몇일 인가를 출력하여라.
---- 단 근무 일수가 많은 사람 순으로 출력하여라.
--9. EMPLOYEES 테이블에서 부서 50에서 급여 앞에 $를 삽입하고 3자리마다 ,를 출력하라
--10. EMPLOYEES 테이블에서 현재까지 근무일 수가 몇주 몇일 인가를 출력하여라. 
---- 단 근무 일수가 많은 사람 순으로 출력하여라.
