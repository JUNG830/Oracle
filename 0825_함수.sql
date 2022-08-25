---------------------------------------------------------------------------------------------
-- < 단일행 함수 : 데이터가 한 행씩 입력되고 입력된 한 행당 결과가 하나씩 나옴 >
SELECT ENAME, UPPER(ENAME) 대문자, LOWER(ENAME) 소문자, INITCAP(ENAME) 첫자만대문자
FROM EMP;

SELECT  *
FROM EMP
--WHERE UPPER(ENAME) = 'JAMES';
WHERE UPPER(ENAME) = LOWER('JAMES');  -- 안나옴.

SELECT  *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER ('%jam%');

---------------------------------------------------------------------------------------------
/* 문자열 길이를 구하는 함수 */
-- LENGTH() : 문자열의 길이를 반환. (모든 테이터형에 사용 가능) 
 -- LENGTHB () :  문자열의 BYTE 수를 반환. (모든 테이터형에 사용 가능) 
 -- DUAL : SYS 계정에서 제공하는 테이블로 함수나 계산식을 테이블 참조 없이 실행해보기 위한 더미(DUMMY)테이블
SELECT ENAME, LENGTH(ENAME) 이름의길이 
FROM EMP; 

SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 5;

SELECT LENGTH('안유진'), LENGTHB('안유진')  -- 방이 세개, 그 안에 한글자당 3BYTE씩 차지하고 있음. 
FROM DUAL;

SELECT LENGTH(50), LENGTHB(50)
FROM DUAL;

SELECT 20 * 30 
FROM DUAL;   -- DUAL : 임시테이블
---------------------------------------------------------------------------------------------
-- MOD(NUM1, NUM2) : NUM1 나누기 NUM2 의 나머지는 얼마인가
SELECT MOD(5, 4)  -- 나머지 연산자 5를 4로 나누면 나머지가 얼마냐~
FROM DUAL;

SELECT MOD(21, 5)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  ABS() : 절대값을 구하는 함수 */
SELECT -10, ABS(-10)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  ROUND() : 반올림한 결과를 반환 (반올림할 위치 지정 가능, 지정하지 않으면 소숫점 첫번째자리에서 반올림, 음수 지정 가능(정수 구간) */
SELECT 12.3456, ROUND(12.3456), ROUND(12.3456, 2), ROUND(12.3456, -1), ROUND(12.3456, -2)
FROM DUAL;
---------------------------------------------------------------------------------------------
/* TRUNC() : 버림하는 함수(버림할 위치 지정 가능, 지정하지 않으면 소숫점 첫번째자리 버림, 음수 지정 가능(정수 구간) */
SELECT 12.3456, TRUNC(12.3456), TRUNC(12.3456, 1), TRUNC(12.3456, 2), TRUNC(12.3456, -1), TRUNC(12.3456, -2)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  CEIL() : 소숫점 이하 올림하는 함수 */
SELECT 12.3456, CEIL(12.3456)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  FLOOR() :소숫점 이하 내림하는 함수 */
SELECT 12.3456, FLOOR(12.3456)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  POWER(A, B) :  A를 B만큼 제곱하는 함수(실수도 가능) */
SELECT  POWER(3, 4.3)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  SUBSTR(문자열데이터, 시작위치) : 문자열을 시작위치부터 끝까지 반환.  */
/*  SUBSTR(문자열데이터, 시작위치, 길이) : 문자열을 시작위치부터 길이만큼 반환.  */
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;
/* -LENGTH(JOB) = - 를 가지면 앞에서부터 -5 -4 -3 -2 -1 역으로 반환한다.  */
SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)), 
        SUBSTR(JOB,  -LENGTH(JOB), 3), 
        SUBSTR(JOB,  -LENGTH(JOB), 1),
        SUBSTR(JOB,  -3)
FROM EMP;
---------------------------------------------------------------------------------------------
/* INSTR(대상문자열, 찾으려는 문자/문자열, 위치(값이 없으면 처음부터), 몇번째에로 나오는 해당문자) : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지 위치 확인 */
SELECT INSTR('HELLO, ORACLE!', 'L') AS "INSTR기본",
        INSTR('HELLO, ORACLE!', 'L', 5) AS "INSTR위치지정",
        INSTR('HELLO, ORACLE!', 'L', 2, 2) AS "INSTR 2번째 L의 위치"
FROM DUAL;
---------------------------------------------------------------------------------------------
/* 특정문자가 포함된 행 찾기(LIKE말고 다른 방법) */
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') > 0;
--WHERE ENAME LIKE '%S%';  
---------------------------------------------------------------------------------------------
/* REPLACE(문자열, 찾는문자열, 수정할 문자열(선택)) : 특정 문자열 데이터에 포함된 문자/문자열를 다른 문자/문자열로 대체, 대체할 문자를 지정하지 않으면 해당 문자/문자열 삭제 */
SELECT '010-2283-3333' AS 변경전, 
        REPLACE('010-2283-3333', '-', '*') AS 문자열변경, 
        REPLACE('010-2283-3333', '-') AS 문자열삭제
FROM DUAL;
---------------------------------------------------------------------------------------------
/* LPAD, RPAD : 기준 공간 칸수를 지정하고 빈칸 만큼 특정 문자로 채우는 함수(LPAD 왼쪽에 채운다/ RPAD 오른쪽에 채운다) */
-- 채울 문자를 안 주면 공백으로 채움
SELECT LPAD('ORACLE', 10, '+'),
              RPAD('ORACLE', 10, '+'),
              LPAD('ORACLE', 10)
FROM DUAL;

SELECT RPAD('220830-3827462', 18, '*') 주민등록번호,
            LPAD('010-5584-3245', 13, '*') 전화번호
FROM DUAL;
---------------------------------------------------------------------------------------------
/* CONCAT() :두문자열을 합치는 함수 */
SELECT CONCAT(EMPNO, ENAME), 
              CONCAT( EMPNO, CONCAT (' : ', ENAME))
FROM EMP
WHERE ENAME = 'JAMES';
---------------------------------------------------------------------------------------------
/* TRIM / LTRIM / RTRIM : 문자열 내에서 특정 문자열 지움( 앞, 뒤만 가능) / 앞, 뒤 공백을 지울 때 사용하는 것을 추천 */
 -- || 은 문자열 이어붙이기
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,  -- 양쪽 끝 지움
         '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,   -- 왼쪽 끝 지움
         '[' || LTRIM('<_Oracle_>', '< _') || ']' AS LTRIM_2,   -- 왼쪽 끝 특정 문자열 지움
         '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,  -- 오른쪽 끝 지움
         '[' || RTRIM('<_Oracle_>', '> _ ') || ']' AS RTRIM_2   -- 오른쪽 끝 특정 문자열 지움
 FROM DUAL;
---------------------------------------------------------------------------------------------
/* 날짜 데이터를 다루는 함수 */
-- 날짜 데이터 + 숫자 : 해당 날짜에서 숫자만큼 경과일 계산.
-- 날짜 데이터 - 숫자 :  해당 날짜에서 숫자만큼 이전일 계산.
-- 날짜데이터 - 날짜데이터 : 두 날짜의 일수를 보여줌
-- 날짜데이터 + 날짜데이터 : 오류! 
 /* SYSDATE() : 별다른 입력 데이터 없이, 오라클 데이터베이스 서버가 설치된 운영체제의 현재 날짜와 시간을 보여 줌 */
 SELECT SYSDATE AS NOW,
        SYSDATE -1 AS YESTERDAY,
        SYSDATE +1 AS TOMORROW
FROM DUAL;
---------------------------------------------------------------------------------------------
/* ADD_MONTHS(날짜데이터, 더할 개월수) */
SELECT SYSDATE, 
        ADD_MONTHS(SYSDATE, 4)
FROM DUAL;

SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS (HIREDATE, 120) 입사10주년
    FROM EMP;
---------------------------------------------------------------------------------------------
/* MONTHS_BETWEEN(날짜데이터, 날짜데이터) : 두 날짜간의 개월수 차이 구하는 함수 */
-- TRUNC 와 조합해서 개월수 얻어냄 (TRUNC 안 쓰면 소숫점 나옴)
SELECT EMPNO, ENAME, HIREDATE,
    TRUNC (MONTHS_BETWEEN(HIREDATE, SYSDATE)) 입사개월수,
    TRUNC (MONTHS_BETWEEN(SYSDATE, HIREDATE)) 입사개월수2
FROM EMP;
---------------------------------------------------------------------------------------------
/* NEXT_DAY(날짜테이터, 요일문자) : 특정 날짜 기준으로 돌아오는 요일의 날짜를 출력하는 함수 */
/* LAST_DAY(날짜데이터) : 특정 날짜가 속한 달의 마지막 날짜를 출력하는 함수 */
SELECT SYSDATE, 
    NEXT_DAY(SYSDATE, '화요일'),
    LAST_DAY ('1970/01/01')
FROM DUAL;
---------------------------------------------------------------------------------------------
/* 오라클에서 날짜 데이터를 사용할 때 기준 포맷 */
-- CC, SCC : 년도를 끝 2자리만 사용
-- SYYYY, YYYY, YEAR, SYEAR, YYY, YY, Y : 연도를 표시하는 포맷
-- Q : 각 분기의 두번째 달의 16일 기준 표시
-- MONTH, MON, MM, RM : 월을 표시하는 포맷 
-- WW : 해당 연도의 몇번째 주인가
-- W : 해당 월의 몇번째 주인가
-- DDD, DD, J : 일을 표시하는 포맷(12시 정오 기준)
-- DAY, DY, D : 한주가 시작되는 날짜
--HH12, HH24 : 시간제 표시 
SELECT SYSDATE, 
    TO_CHAR(SYSDATE, 'CC') FORMAT_CC, 
    TO_CHAR(SYSDATE, 'YY') FORMAT_YY,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS') "년/월/일 시:분:초",
    TO_CHAR(SYSDATE, 'Q') FORMAT_Q,
    TO_CHAR(SYSDATE, 'DD') FORMAT_DD,
    TO_CHAR(SYSDATE, 'DDD') FORMAT_DDD,
    TO_CHAR(SYSDATE, 'HH') FORMAT_HH,
    TO_CHAR(SYSDATE, 'HH12') FORMAT_HH12,
    TO_CHAR(SYSDATE, 'HH24') FORMAT_HH24,
    TO_CHAR(SYSDATE, 'WW') FORMAT_WW,
    TO_CHAR(SYSDATE, 'W') FORMAT_W
FROM DUAL;    
---------------------------------------------------------------------------------------------
/* 숫자와 문자열을 더하여 출력하기(자동형변환) */
SELECT EMPNO, ENAME, EMPNO + '500'
    FROM EMP
    WHERE ENAME = 'FORD';

-- 이건 오류 
SELECT EMPNO, ENAME, EMPNO + 'ABCD'
    FROM EMP
    WHERE ENAME = 'FORD';
---------------------------------------------------------------------------------------------
/* 수동 형변환 */
-- 날짜 또는 숫자를 문자로 변환하기 : TO_CHAR 함수 
-- TO_CHAR(날짜데이터, '출력되기를 원하는 문자형태')
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS') 현재날짜및시간
FROM DUAL;

SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS 세기,
    TO_CHAR(SYSDATE, 'YY') AS "2자리 연도",
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS') AS "년/월/일 시:분:초",
    TO_CHAR(SYSDATE, 'Q') AS 분기,
    TO_CHAR(SYSDATE, 'DD') AS 날짜,
    TO_CHAR(SYSDATE, 'DDD') AS "1년중 며칠",
    TO_CHAR(SYSDATE, 'PM HH') AS "오후 + 시",
    TO_CHAR(SYSDATE, 'HH') AS "시간12시간",
    TO_CHAR(SYSDATE, 'HH12') AS "시간12시간_2",
    TO_CHAR(SYSDATE, 'HH24') AS "시간24시간",
    TO_CHAR(SYSDATE, 'WW') AS "해당월중 몇번째주",
    TO_CHAR(SYSDATE, 'W') AS "1년중 몇번째"
FROM DUAL;

---------------------------------------------------------------------------------------------
/* 특정 언어에 맞춰서 날짜 출력하기 */
-- TO_CHAR(날짜 데이터, '출력 포맷', 'NLS_DATE_LANGUAGE=KOREA') : 언어 설정
SELECT SYSDATE, 
    TO_CHAR(SYSDATE, 'MM') MM,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE=KOREAN') MON_KOR,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE=JAPANESE') MON_JAPANESE,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE=ENGLISH') MON_ENGLISH,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=KOREAN') MON_KOR,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=JAPANESE') MON_JAPANESE,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=ENGLISH') MON_ENGLISH,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=KOREAN') MON_KOR,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=JAPANESE') MON_JAPANESE,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') MON_ENGLISH,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE=KOREAN') MON_KOR,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE=JAPANESE') MON_JAPANESE,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE=ENGLISH') MON_ENGLISH
FROM DUAL;
---------------------------------------------------------------------------------------------
/* 숫자데이터 형식 출력하기 */
-- 9 : 숫자의 한자리 의미 (반자리는 채우지 않음.)
-- 0 : 빈자리를 0으로 채움.
-- $ : 달러 표시를 붙임
-- L : 지역 화폐단위 기호를 붙임
-- . : 소숫점을 표시
-- , : 천 반위를 구분
SELECT SAL,
    TO_CHAR(SAL, '$999.999') AS SAL_$,
    TO_CHAR(SAL, 'L999,999') AS SAL_L,
    TO_CHAR(SAL, '999,999.00') AS SAL_0,
    TO_CHAR(SAL, '000,999,999.00') AS SAL_1,
    TO_CHAR(SAL, '000999999.99') AS SAL_2,
    TO_CHAR(SAL, '999,999,00') AS SAL_3
FROM EMP;
---------------------------------------------------------------------------------------------
/*  문자열을를 명시된 날짜로 변환하는 함수 */
SELECT
    TO_DATE('220825', 'YY/MM/DD')
FROM DUAL;    







