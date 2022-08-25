-- 1. EMPNO열에는 EMP테이블에서 사원 이름이 다섯글자 이상이며 여섯글자 미만인 사원 정보 출력
--      MASKING_EMPNO 열에는 사원번호 앞 두자리 외 뒷자리를 * 기호로 출력
--      MASKING_ENAME 열에는 사원 이름의 첫글자만 보여주고 나머지글자 수만큼 * 기호 출력.
-- LPAD/RPAD('문자열', 총길이, 오른쪽에 채울 문자)
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO, 1, 2), LENGTH(ENAME) - 1, '*') AS MASKING_EMPNO,
       ENAME, 
      SUBSTR(ENAME, 1, 1) || LPAD('*', LENGTH(ENAME) - 2, '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) = 5 ;


-- 2. EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일 
-- 하루 8시간 근무로 봤을 때 하루 급여 (DAY_PAY) 와 시급(TIME_PAY)를 출력
-- 단, 하루 급여는 소숫점 세번째 자리에서 버리고 시급은 두번째 자리에서 반올림

SELECT ENAME, SAL,
        TRUNC(SAL / 21.5, 2)  AS DAY_PAY,
        ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
FROM EMP;    

-- 3. EMP 테이블에서 사원들은 입사일을 기준으로 3개월이 지난 후 월요일에 정직원이 됨
-- 사원이 정직원이 되는 날짜 (R_JOB) 을 YYY-MM-DD 형식으로 출력
-- 단, 추가수당이 없는 사원의 추가수당은 N/A로 출력

SELECT EMPNO, ENAME, HIREDATE,
    TO_CAHR(NEXT_DATE(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD' ) AS R_JOB,
    NVL(TO_CHAR(COMM, 'N/A')) AS COMM
FROM EMP;


-- 4. EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원번호 MGR을 다음과 같이 변환해서 CHG_MGR 열에 출력
-- 직속상관 없으면 0000
-- 직속상관 앞 두자리 75 = 5555
-- 직속상관 앞 두자리 76 = 6666
-- 직속상관 앞 두자리 77 = 7777
-- 직속상관 앞 두자리 78 = 8888
-- 그 외는 그대로 출력

SELECT EMPNO, ENAME, MGR, 
    AS CHG_MGR

    
    
    
    
    
    
    