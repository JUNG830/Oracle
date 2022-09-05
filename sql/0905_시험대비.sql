/* 5차 데이터베이스 시험 대비 */
-- 1. 사용자 계정 만드는 방법은 SYSTEM 이나 SYS계정으로 계정을 만들 수 있음. 
--    CREATE USER TEST IDENTIFIED BY 1234; // 계정 만드는 방법
--    GRANT RESOURCE //테이블 생성 권한
--    GRANT CONNECT // 사용자에 대한 DB 접속 권한
-- 2. 부서 코드(10 또는 20이고)에 대한 조건이 일치하고, 급여가 3000이상이고, 보너스 있고, 
--    직책 이름이 _앞에 3글자가 있는 사원의 ENAME, EMPNO, DEPTNO, SAL 조회
SELECT ENAME, EMPNO, DEPTNO, SAL
FROM EMP 
WHERE ( DEPTNO = 10 OR DEPTNO = 20 ) -- OR조건을 괄호로 묶음
    AND SAL >= 3000  -- 3000'이상' 
    AND COMM IS NOT NULL -- 보노스 있는 사원 대한 조건
    AND JOB LIKE '___\_%' ESCAPE'\' ; -- \ 이 문자를 ESCAPE 문자로 쓰겠다! 
    
-- 3. NULL 에 대한 비교
SELECT *  -- NULL 에 대한 비교는 비교연산자 사용 안됨. IS NULL / IS NOT NULL 사용
FROM EMP
WHERE COMM IS NULL
    AND MGR IS NOT NULL;
    
------서술형 문제 해결 -------------------------------------------------------------
-- 1. NUMBER(3,2) 최대 3자리 중 소숫점 2자리 -> 정수는 1자리
-- 2. DDL(DATA DEFINITION LANGUAGE) : 테이블을 생성(CREATE), 변경(ALTER), 제거(DROP) 등의 일을 수행하는 언어.
-- 3. DML(DATA MANIPULATION LANGUAGE) : 데이터를 삽입(INSERT), 변경(UPDATE), 삭제(DELETE) 등의 데이터를 조작하는 언어.
-- 4. DML 중에 INSERT : 데이터베이스에 데이터를 추가하기 위해 사용하는 언어.
-- 5. CHAR(100) : 고정 문자열 자료형을 의미하며, 100 BYTE 의 고정된 문자열을 할당한다. 
-- 6. SELECT 메서 OUTER JOIN : 조인하는 테이블에서 한쪽에는 데이터가 있고, 다른 한쪽에는 데이터가 없는 경우 모두 출력하는 방법
-- 7. NVL 함수 : 컬럼에 NULL이 포함되어 있을 때 두번째 매개변수의 값으로 변경 후 출력. 
--    SELECT ENAME, NVL(COMM, 0) COMM
--    FROM EMP;
-- 8. SELECT 문에 대해 설명 : 데이터 베이스의 데이터를 조회하기 위해 사용. 
-- 9. DML 중 DELETE 에 대해 설명 : 데이터를 삭제하기 위한 언어.
-- 10. DDL 중 CREATE : 데이터베이스의 테이블(객체)를 생성하는 언어. 
-- 11. 데이터 타입 중 NVARCHAR : 유니코드 문자를 지원하기 위한 자료형이며, 한글이 2BYTE 크기로 할당 된다. 
-- 12. 문자열 데이터를 '210505' -> '2021년 5월 5일' 로 표기하는 방법 
SELECT TO_CHAR(TO_DATE('210505'/*, 'YY/MM/DD' 생략해도 됨.*/), 'YYYY"년" MM"일" DD"일"') 년원일
FROM DUAL;
-- 13. FOREIGN KEY 제약 조건 : 서로 다른 테이블간의 관계를 정의하는데 사용하는 제약 조건. 
        -- 참조하고 있는 기본키의 데이터 타입과 일치해야하며, 외래키로 참조되어 있는 기본키는 삭제할 수 없다. 
-- 14. NOT NULL 제약 조건 : 데이터에 NULL 을 허용하지 않는 제약조건. 
-- 15. 오라클에서 제공하는 데이터 사전에 대한 설명
        -- 데이터베이스의 데이터를 제외한 모든 정봐가 저장되어 있음. 내용을 변경하기 위한 권한은 시스템이 가지고 있음. 
        -- 사용자는 읽기 전용 테이블을 제공
-- 16. CHAR 와 VARCHAR2 의 차이 : 
        -- CHAR : 고정 길이 문자형이며 최대 2000BYTE 까지 사용 가능.
        -- VARCHAR2 : 가변 길이 문자형이며, 최대 4000BYTE 까지 사용 가능. 
-- 17. INNER JOIN :조인이 되는 키값을 기준으로 교집합 결과를 출력하는 조인 방법. NULL 값을 포함하지 않음. 
-- 18. PRIMARY KEY : NULL을 허용하지 않고, 중복을 허용하지 않는 제약 조건. 
-- 19. 근무개월수를 조회하는 SELECT문을 작성 
SELECT ENAME 이름, HIREDATE 입사일,  
        TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))근무개월수
FROM EMP;
-- 20. 이미 생성된 EMP 테이블에서 ENAME컬럼에 UNIQUE 제약조건 추가하기
ALTER TABLE EMP
    MODIFY ENAME UNIQUE; 

DESC EMP;











