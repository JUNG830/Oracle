--1. 사원번호가 7499인 사원의 이름, 입사일 부서번호 출력
SELECT EMPNO, ENAME, HIREDATE, DEPTNO
FROM EMP
WHERE EMPNO = 7499;
--2. 이름이 ALLEN인 사원의 모든 정보 출력
SELECT * 
FROM EMP
WHERE ENAME = 'ALLEN';
--3. 이름이 K보다 큰 글자로 시작하는 사원의 모든 정보 출력
SELECT * 
FROM EMP
WHERE ENAME > 'K'
ORDER BY ENAME;
--4. 입사일이 81년 4월2일 보다 늦고, 82년 12월9일 보다 빠른 사원의 이름, 급여, 부서번호 출력
SELECT ENAME, SAL, HIREDATE, DEPTNO
FROM EMP
WHERE HIREDATE > '81/04/02'
     AND HIREDATE < '82/12/09';
--5. 급여가 1,600 보다 크고, 3000보다 작은 사원의 이름, 직무, 급여를 출력
SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL > 1600
    AND SAL < 3000;
--6. 입사일이 81년 이외에 입사한 사원의 모든 정보 출력
SELECT * 
FROM EMP
--WHERE SUBSTR(HIREDATE, 1, 2) <> '81';
WHERE HIREDATE NOT BETWEEN '1981/01/01' AND '1981/12/31';
--7. 직업이 MANAGER와 SALESMAN인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN';
--8. 부서가 20번, 30번을 제외한 모든 사원의 이름, 사원번호, 부서번호를 출력
SELECT ENAME, EMPNO, DEPTNO
FROM EMP 
WHERE DEPTNO NOT BETWEEN 20 AND 30; 
--WHERE DEPTNO NOT IN(20, 30);
--9. 이름이 S로 시작하는 사원의 사원번호, 이름, 부서번호 출력
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE 'S%';
--10. 처음 글자는 관계없고, 두 번째 글자가 A인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '_A%';
--11. 커미션이 NULL이 아닌 사원의 모든 정보를 출력
SELECT * 
FROM EMP
WHERE COMM IS NOT NULL;
--12. 이름이 J자로 시작하고 마지막 글자가 S인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE ENAME LIKE 'J%S';
--13. 급여가 1500이상이고, 부서번호가 30번인 사원 중 직무가 MANAGER인 사원의 모든 정보 출력
SELECT * 
FROM EMP
WHERE SAL >= 1500
    AND DEPTNO = 30
    AND JOB = 'MANAGER';
--14. 모든 사원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순서로 출력 (단, 커미션이 null인 사원도 0으로 포함)
SELECT ENAME 이름, SAL 급여, 
        NVL(COMM, 0) AS 커미션,
        (SAL + NVL(COMM, 0)) AS 총액
FROM EMP 
ORDER BY 총액 DESC;
--15. 10번 부서의 모든 사원에게 급여의 13%를 보너스로 지불하기로 하였다. 10번 부서 사원들의 이름, 급여, 보너스, 금액, 부서번호 출력
SELECT ENAME 이름, SAL 급여, SAL * 1.13 "보너스", (SAL + SAL * 1.13) 총금액, DEPTNO 부서번호
FROM (SELECT * 
                FROM EMP
                WHERE DEPTNO = 10);
--16. 모든 사원에 대해 입사한 날로 부터 60일이 지난 후의 ‘월요일’에 대한 년,월,일를 구하여 이름, 입사일, 60일 후의 ‘월요일’ 날짜를 출력
SELECT ENAME, HIREDATE, 
            NEXT_DAY(HIREDATE + 60, '월요일') "월요일"
--            TO_CHAR(NEXT_DAY(HIREDATE + 60, '월요일'), 'YYYY/MM/DD') "월요일"
FROM EMP;
--17. 이름의 글자수가 6자 이상인 사원의 이름을 앞에서 3자만 구하여 소문자로 이름만 출력
SELECT LOWER(SUBSTR(ENAME, 1, 3))
FROM EMP
WHERE LENGTH(ENAME) >= 6;
--18. 사원들의 사원 번호와 급여, 커미션, 연봉((comm+sal)*12)을 연봉이 많은 순서로 출력
SELECT EMPNO, ENAME, SAL, 
        NVL(COMM, 0) COMM, 
        ((NVL(COMM, 0) + SAL)*12) 연봉
FROM EMP
ORDER BY 연봉 DESC;
--19. 모든 사원들의 입사한 년도와 입사한 달을 출력 (예, 1981년5월30일)
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY"년" MM"월" DD"일"') 입사년도
FROM EMP;
--20. 10번 부서에 대해 급여의 평균 값, 최대 값, 최소 값, 인원 수를 출력
SELECT DEPTNO 부서번호, TRUNC(AVG(SAL)) 평균, MAX(SAL) 최대값, MIN(SAL) 최소값, COUNT(*) 인원수
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 10;
--21. 사원번호가 짝수인 사원들의 모든 정보를 출력
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 0;
--22. 각 부서별 같은 직무를 갖는 사원의 인원수를 구하여 부서 번호, 직무, 인원수 출력
SELECT DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;
--23. EMP와 DEPT테이블을 조인하여 모든 사원에 대해 부서 번호, 부서이름, 사원이름 급여를 출력
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY DEPTNO;
--24. 이름이 ‘ALLEN’인 사원의 부서 이름 출력
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
    AND E.ENAME = 'ALLEN';
--25. ‘ALLEN’과 직무가 같은 사원의 이름, 부서 이름, 급여, 부서위치를 출력
SELECT E.ENAME, D.DNAME, SAL, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
    AND E.JOB = (SELECT JOB
                                FROM EMP
                                WHERE ENAME = 'ALLEN');
--26. 모든 사원들의 평균 급여 보다 많이 받는 사원들의 사원번호와 이름 출력
SELECT EMPNO, ENAME
FROM EMP
WHERE SAL > (SELECT AVG(SAL) 
                            FROM  EMP);
-- 27. 부서별 평균 급여가 2000보다 적은 부서 사원들의 부서 번호 출력
SELECT DEPTNO 
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) < 2000;
--28. 30번 부서의 최고급여보가 급여가 많은 사원의 사원 번호, 이름, 급여를 출력
SELECT EMPNO, ENAME, SAL
FROM EMP 
WHERE SAL > (SELECT MAX(SAL)
                            FROM EMP
                            WHERE DEPTNO = 30);
--29. ‘FORD’와 부서가 같은 사원들의 이름, 부서 이름, 직무, 급여를 출력
SELECT E.ENAME, D.DNAME, JOB, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
    AND D.DNAME = (SELECT D.DNAME
                                        FROM EMP E, DEPT D 
                                       WHERE  E.DEPTNO = D.DEPTNO
                                            AND E.ENAME = 'FORD');

--30. 부서 이름이 ‘SALES’인 사원들의 평균 급여 보다 많고, 
--부서 이름이 ‘RESEARCH’인 사원들의 평균 급여 보다 적은 사원들의 이름, 부서번호, 급여, 직무 출력
SELECT ENAME, DEPTNO, SAL, JOB
FROM EMP E
WHERE SAL > (SELECT AVG(E.SAL) 
                                        FROM EMP E, DEPT D
                                        WHERE E.DEPTNO = D.DEPTNO
                                            AND D.DNAME = 'SALES') 
        AND SAL < (SELECT AVG(E.SAL) 
                            FROM EMP E, DEPT D
                            WHERE E.DEPTNO = D.DEPTNO
                               AND D.DNAME = 'RESEARCH');










