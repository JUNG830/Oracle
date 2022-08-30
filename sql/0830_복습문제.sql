--1. �����ȣ�� 7499�� ����� �̸�, �Ի��� �μ���ȣ ���
SELECT EMPNO, ENAME, HIREDATE, DEPTNO
FROM EMP
WHERE EMPNO = 7499;
--2. �̸��� ALLEN�� ����� ��� ���� ���
SELECT * 
FROM EMP
WHERE ENAME = 'ALLEN';
--3. �̸��� K���� ū ���ڷ� �����ϴ� ����� ��� ���� ���
SELECT * 
FROM EMP
WHERE ENAME > 'K'
ORDER BY ENAME;
--4. �Ի����� 81�� 4��2�� ���� �ʰ�, 82�� 12��9�� ���� ���� ����� �̸�, �޿�, �μ���ȣ ���
SELECT ENAME, SAL, HIREDATE, DEPTNO
FROM EMP
WHERE HIREDATE > '81/04/02'
     AND HIREDATE < '82/12/09';
--5. �޿��� 1,600 ���� ũ��, 3000���� ���� ����� �̸�, ����, �޿��� ���
SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL > 1600
    AND SAL < 3000;
--6. �Ի����� 81�� �̿ܿ� �Ի��� ����� ��� ���� ���
SELECT * 
FROM EMP
--WHERE SUBSTR(HIREDATE, 1, 2) <> '81';
WHERE HIREDATE NOT BETWEEN '1981/01/01' AND '1981/12/31';
--7. ������ MANAGER�� SALESMAN�� ����� ��� ������ ���
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN';
--8. �μ��� 20��, 30���� ������ ��� ����� �̸�, �����ȣ, �μ���ȣ�� ���
SELECT ENAME, EMPNO, DEPTNO
FROM EMP 
WHERE DEPTNO NOT BETWEEN 20 AND 30; 
--WHERE DEPTNO NOT IN(20, 30);
--9. �̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �μ���ȣ ���
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE 'S%';
--10. ó�� ���ڴ� �������, �� ��° ���ڰ� A�� ����� ��� ������ ���
SELECT *
FROM EMP
WHERE ENAME LIKE '_A%';
--11. Ŀ�̼��� NULL�� �ƴ� ����� ��� ������ ���
SELECT * 
FROM EMP
WHERE COMM IS NOT NULL;
--12. �̸��� J�ڷ� �����ϰ� ������ ���ڰ� S�� ����� ��� ������ ���
SELECT *
FROM EMP
WHERE ENAME LIKE 'J%S';
--13. �޿��� 1500�̻��̰�, �μ���ȣ�� 30���� ��� �� ������ MANAGER�� ����� ��� ���� ���
SELECT * 
FROM EMP
WHERE SAL >= 1500
    AND DEPTNO = 30
    AND JOB = 'MANAGER';
--14. ��� ����� �̸�, �޿�, Ŀ�̼�, �Ѿ�(�޿�+Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������ ��� (��, Ŀ�̼��� null�� ����� 0���� ����)
SELECT ENAME �̸�, SAL �޿�, 
        NVL(COMM, 0) AS Ŀ�̼�,
        (SAL + NVL(COMM, 0)) AS �Ѿ�
FROM EMP 
ORDER BY �Ѿ� DESC;
--15. 10�� �μ��� ��� ������� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. 10�� �μ� ������� �̸�, �޿�, ���ʽ�, �ݾ�, �μ���ȣ ���
SELECT ENAME �̸�, SAL �޿�, SAL * 1.13 "���ʽ�", (SAL + SAL * 1.13) �ѱݾ�, DEPTNO �μ���ȣ
FROM (SELECT * 
                FROM EMP
                WHERE DEPTNO = 10);
--16. ��� ����� ���� �Ի��� ���� ���� 60���� ���� ���� �������ϡ��� ���� ��,��,�ϸ� ���Ͽ� �̸�, �Ի���, 60�� ���� �������ϡ� ��¥�� ���
SELECT ENAME, HIREDATE, 
            NEXT_DAY(HIREDATE + 60, '������') "������"
--            TO_CHAR(NEXT_DAY(HIREDATE + 60, '������'), 'YYYY/MM/DD') "������"
FROM EMP;
--17. �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� �̸��� ���
SELECT LOWER(SUBSTR(ENAME, 1, 3))
FROM EMP
WHERE LENGTH(ENAME) >= 6;
--18. ������� ��� ��ȣ�� �޿�, Ŀ�̼�, ����((comm+sal)*12)�� ������ ���� ������ ���
SELECT EMPNO, ENAME, SAL, 
        NVL(COMM, 0) COMM, 
        ((NVL(COMM, 0) + SAL)*12) ����
FROM EMP
ORDER BY ���� DESC;
--19. ��� ������� �Ի��� �⵵�� �Ի��� ���� ��� (��, 1981��5��30��)
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY"��" MM"��" DD"��"') �Ի�⵵
FROM EMP;
--20. 10�� �μ��� ���� �޿��� ��� ��, �ִ� ��, �ּ� ��, �ο� ���� ���
SELECT DEPTNO �μ���ȣ, TRUNC(AVG(SAL)) ���, MAX(SAL) �ִ밪, MIN(SAL) �ּҰ�, COUNT(*) �ο���
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 10;
--21. �����ȣ�� ¦���� ������� ��� ������ ���
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 0;
--22. �� �μ��� ���� ������ ���� ����� �ο����� ���Ͽ� �μ� ��ȣ, ����, �ο��� ���
SELECT DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;
--23. EMP�� DEPT���̺��� �����Ͽ� ��� ����� ���� �μ� ��ȣ, �μ��̸�, ����̸� �޿��� ���
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY DEPTNO;
--24. �̸��� ��ALLEN���� ����� �μ� �̸� ���
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
    AND E.ENAME = 'ALLEN';
--25. ��ALLEN���� ������ ���� ����� �̸�, �μ� �̸�, �޿�, �μ���ġ�� ���
SELECT E.ENAME, D.DNAME, SAL, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
    AND E.JOB = (SELECT JOB
                                FROM EMP
                                WHERE ENAME = 'ALLEN');
--26. ��� ������� ��� �޿� ���� ���� �޴� ������� �����ȣ�� �̸� ���
SELECT EMPNO, ENAME
FROM EMP
WHERE SAL > (SELECT AVG(SAL) 
                            FROM  EMP);
-- 27. �μ��� ��� �޿��� 2000���� ���� �μ� ������� �μ� ��ȣ ���
SELECT DEPTNO 
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) < 2000;
--28. 30�� �μ��� �ְ�޿����� �޿��� ���� ����� ��� ��ȣ, �̸�, �޿��� ���
SELECT EMPNO, ENAME, SAL
FROM EMP 
WHERE SAL > (SELECT MAX(SAL)
                            FROM EMP
                            WHERE DEPTNO = 30);
--29. ��FORD���� �μ��� ���� ������� �̸�, �μ� �̸�, ����, �޿��� ���
SELECT E.ENAME, D.DNAME, JOB, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
    AND D.DNAME = (SELECT D.DNAME
                                        FROM EMP E, DEPT D 
                                       WHERE  E.DEPTNO = D.DEPTNO
                                            AND E.ENAME = 'FORD');

--30. �μ� �̸��� ��SALES���� ������� ��� �޿� ���� ����, 
--�μ� �̸��� ��RESEARCH���� ������� ��� �޿� ���� ���� ������� �̸�, �μ���ȣ, �޿�, ���� ���
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










