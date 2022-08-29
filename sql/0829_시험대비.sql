--------------------------------------------------------------------------------------------------
/* 시험대비연습 ( 테이블은 같은데 이름과 값이 다름)*/
-- 부서별 평균 월급이 1000원을 초과하면 부서를 조회 후 오름차순 정렬
-- 직계함수가 사용시 GROUP BY 로 묶고 조건문은 HAVING 절을 사용해야 함. 
-- FLOOR : 내림
SELECT DEPTNO, SUM(SAL) 합계, FLOOR(AVG(SAL)) 평균월급, COUNT(*) 인원수
    FROM EMP
    GROUP BY DEPTNO
    HAVING FLOOR(AVG(SAL)) > 1000
    ORDER BY DEPTNO ASC;
    
-- ROWNUM 을 사용하려 월급이 가장 높은 3명을 출력. 잘못된 부분 수정. 
-- FROM 절의 서브쿼리 이용 (인라인뷰)해서 해당 테이블을 정렬 후 결과를 받음. 
SELECT ROWNUM, ENAME, SAL
    FROM (SELECT * 
                    FROM EMP
                    ORDER BY SAL DESC)  -- SAL이 높은 순서대로(내림차순) 정렬한 상태로 받겠다. 
    WHERE ROWNUM <= 3;  -- 정렬해서 받은 자료의 행에 번호를 부여. 그 중 3이하의 값만 출력.
    
----------------------------------------------------------------------------------------------------
1. 데이터베이스의 특징 ( 실시간 접근성, 지속적인 변화, 동시공유, 내용에 의한 참조 -> 가 답)
- 실시간 접근성 : 다수의 사용자의 요구에 실시간 처리 및 응답 해야 한다.
- 지속적인 변화 : 저장된 데이터가 항상 최신상태를 유지 해야 한다. 
- 동시공유 : 동일한 데이터를 다양한 목적으로 동시에 사용할 수 있어야 한다. 
- 내용에 의한 참조 : 데이터는 주소나 위치에 의해 참조되는 것이 아니라 값에 따라 참조 되어야 한다.
    
2. DDL (테이블을 정의하는 문법) 
- CREATE : 테이블 생성
- DROP : 테이블 삭제 
- ALTER : 테이블 변경

3. 자료형 관련 
- NUMBER : 숫자형에 대한 처리 EX) NUMBER(3, 2) : 총길이가 3이고, 소숫점 2자리까지 표시) 
- CHAR : 
- VARCHAR2 :

4. 문자형 데이터 타입 : CHAR(100) -> 고정 문자열 자료형이며 크기가 100BYTE를 할당. 한글은 한 글자당 3BYTE 차지.

5. 데이터를 조회하는 SELECT 구문 중 INNER JOIN 에 대해 서술 
- 조인이 되는 키값을 기준으로 교집합 결과셋을 출력하는 (동등) 조인 방법으로 각 테이블의"  NULL 값을 포함하지 않음. "

6. OUTER JOIN 에 대해 서술
- 누락되는 데이터가 없도록 가져오는 방식
- 조인하는 테이블에서 한쪽에는 데이터가 있고 다른 한쪽에는 데이터가 없는 경우, 데이터가 있는 쪽 기준으로 데이블의 모든 내용을 출력한다. 

7. SUBSTR 함수 : 조회한 문자열의 일부를 추출하는 함수. 

8. DBMS 에서 사용하는 용어 중 데이터를 일종의 표 형태로 표현하는 것은 무엇이라고 하는가. 
- 테이블 이라고 한다. 

9. DBMS 에서 사용하는 용어 중 SELECT 명령어로 조회한 결과를 표 형태로 나타내는 것은?
- 결과 SET ????? 뭐꼬
    
10. 문자열 데이터 '22/08/29' 를 '2022-08-29' 로 표현될 수 있도록 SELECT 구문 작성 
- TO_CHAR : 날짜 및 숫자 데이터를 문자 데이터로 변환. TO_CHAR(날짜데이터, '출력포맷') 
- TO_DATE : 문자열로 명시된 날짜로 변환하는 함수. 
SELECT TO_CHAR(TO_DATE('22/08/29'),  'YYYY-MM-DD')  -- 주어진 날짜를 변환
--SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') -- 현재 날짜를 해당 포맷으로 출력
    FROM DUAL;
    
11. UPPER 함수에 대해서 서술
- 전체 문자를 대문자로 변환.

12. SET OPERATOR : UNION(합집합, 중복제거), UNION ALL(합집합, NOT 중복제거), MINUS(차집합, 앞에서 뒤를 뺌), INTERSECT(교집합)

13. 문자열 데이터 '190505' -> '2019년 05월 05일' 로 변환
SELECT TO_CHAR(TO_DATE('190505', 'YYMMDD'), 'YYYY"년" MM"월" DD"일"') 년월일
     FROM DUAL;
     
14. INITCAP 함수 : 첫자를 대문자로 변경해주는 함수.

15. TRIM 함수 : 조회한 컬럼의 좌우의 띄어쓰기, 빈간 등의 공백을 제거함. 

16. SET OPERATOR : INTERSET(교집합) : SELECT 문의 수행 결과에서 둘 다 포함되어 있는 부분만 추출하여 출력. 

17. UNION과 UNION ALL 차이 : 중복 포함 여부에 따라 구분

18. DECODE 문에 대해서 서술 : 주어진 데이터 값이 조건 값과 일치하면 값을 출력하고, 일치하는 값이 없으면 기본 값 출력.
SELECT EMPNO, ENAME, JOB, SAL,
        DECODE (JOB, 
                'MANAGER', SAL * 100,
                'SALESMAN', SAL * 200,
                SAL) AS "성과급"
        FROM EMP;            

19. 문자열을 이어붙이는 방법 
-  || -> CONCAT : 중첩해서 사용 가능. 
SELECT CONCAT(EMPNO, ENAME), CONCAT(EMPNO, CONCAT(' : ', ENAME))
        FROM EMP
        WHERE ENAME = 'JAMES';

20 . CONCAT : 중첩해서 사용 가능. 
SELECT CONCAT(EMPNO, CONCAT(' : ', CONCAT(ENAME, CONCAT(', ', DEPTNO)))) AS "CONCAT"
        FROM EMP
        WHERE ENAME = 'JAMES';

20. RANK() OVER 함수 : 순위 부여시 중복값이 발생하면 중복 값의 갯수만큼 건너뛰고 다음 순위 부여 EX) 2등이 2명이면 3등은 빼고 4등부터 순위 부여.
















