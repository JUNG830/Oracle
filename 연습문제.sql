-- < �������� > 
-- 1. **EMP���̺��� COMM �� ���� NULL�� �ƴ� ���� ��ȸ**
SELECT * 
FROM EMP
WHERE COMM IS NOT NULL;
-- 2. **EMP���̺��� Ŀ�̼��� ���� ���ϴ� ���� ��ȸ(NULL or 0)**
SELECT * 
FROM EMP 
WHERE COMM IS NULL OR COMM = 0;
-- 3. **EMP���̺��� �����ڰ� ���� ���� ���� ��ȸ**
SELECT * 
FROM EMP
WHERE MGR IS NULL;
-- 4. **EMP���̺��� �޿��� ���� �޴� ���� ������ ��ȸ**
SELECT * 
FROM EMP
ORDER BY SAL DESC;
-- 5. **EMP���̺��� �޿��� ���� ��� Ŀ�̼��� �������� ���� ��ȸ**
SELECT * 
FROM EMP
ORDER BY SAL ASC, COMM DESC;
-- 6. **EMP���̺��� �����ȣ, �����,����, �Ի��� ��ȸ (��, �Ի����� �������� ���� ó��)**
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE;
-- 7. **EMP���̺��� �����ȣ, ����� ��ȸ (�����ȣ ���� �������� ����)**
SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO DESC;
-- 8. **EMP���̺��� ���, �Ի���, �����, �޿� ��ȸ  (�μ���ȣ�� ���� ������, ���� �μ���ȣ�� ���� �ֱ� �Ի��� ������ ó��)**
SELECT EMPNO, HIREDATE, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY DEPTNO ASC, HIREDATE DESC;
-- 9. **���� ��¥�� ���� ���� ��ȸ**
SELECT SYSDATE
FROM DUAL;
-- 10. **EMP���̺��� ���, �����, �޿� ��ȸ  (��, �޿��� 100���������� ���� ��� ó���ϰ� �޿� ���� �������� ����)**
SELECT EMPNO, ENAME, SAL
FROM EMP
ORDER BY SAL DESC;
-- 11. **EMP���̺��� �����ȣ�� Ȧ���� ������� ��ȸ**
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 1; 
-- 12. **EMP���̺��� �����, �Ի��� ��ȸ (��, �Ի����� �⵵�� ���� �и� �����ؼ� ���)**
SELECT ENAME, EXTRACT(YEAR FROM HIREDATE) AS YEAR, EXTRACT(MONTH FROM HIREDATE) AS MONTH
FROM EMP;
-- 13. **EMP���̺��� 9���� �Ի��� ������ ���� ��ȸ**
SELECT * 
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 9;
-- 14. **EMP���̺��� 81�⵵�� �Ի��� ���� ��ȸ**
SELECT * 
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;
-- WHERE HIREDATE BETWEEN '81/01/01' AND '81/12/31';
-- 15. **EMP���̺��� �̸��� 'E'�� ������ ���� ��ȸ**
SELECT *
FROM EMP
WHERE ENAME LIKE '%E';
-- 17. **EMP���̺��� ���, �����, �Ի���, �Ի��Ϸκ��� 40�� �Ǵ� ��¥ ��ȸ**
-- ADD_MONTH() : ��¥���� ����(��) ��ŭ �̵� ��Ŵ.
SELECT EMPNO, ENAME, HIREDATE, TO_CHAR(HIREDATE + 14610, 'YYYY/MM/DD') AS "�Ի� 40����"
--SELECT EMPNO, ENAME, HIREDATE, ADD_MONTH(HIREDATE, 12*40) AS "�Ի� 40����"
FROM EMP;
-- 18. **EMP���̺��� �Ի��Ϸκ��� 38�� �̻� �ٹ��� ������ ���� ��ȸ** (38���� 13870��)
--  MONTH_BETWEEN(��¥1 - ��¥2) 
SELECT * 
FROM EMP 
WHERE TO_CHAR(SYSDATE - HIREDATE) >= 13870 ;
--WHERE MONTH_BETWEEN(SYSDATE, HIREDATE)/12 >= 38;
-- 3. **���� ��¥���� �⵵�� ����**
SELECT EXTRACT(YEAR FROM SYSDATE) ����
FROM DUAL;

-- 19. �̸��� S�ڷ� �����ϰ�, ������ ���ڰ�H�� ����� ��� ���� ���
SELECT * 
FROM EMP
WHERE ENAME LIKE 'S%' AND ENAME LIKE '%H' ;
-- 20. ó���� ���ڴ� ������� �ι�° ���ڰ� A�� ��� ��� ���� ���
SELECT *
FROM EMP
WHERE ENAME LIKE '_A%' ; 
-- 21. �޿��� 1600 �̻��̰� �μ��� 30���� ��� �� ��å�� MANAGER �� ����� ��� ���� ���
SELECT *
FROM EMP
WHERE (SAL >= 1600 AND DEPTNO = 30) AND JOB = 'MANAGER' ;
-- 22. ����� ��� ������ �μ���ȣ�� ���� ��������, �̸��� ���� ��������, �޿��� ���� �������� ����
SELECT *
FROM EMP
ORDER BY DEPTNO DESC, ENAME, SAL DESC;
-- 23. �����ȣ�� 7654�� 7782 ���� �̿��� ��� ���� ���
SELECT *
FROM EMP
WHERE EMPNO NOT BETWEEN 7654 AND 7782;
-- 24. ����� ��� ������ �μ� ��ȣ�� ���� �������� ���� �� �޿��� ���� ������� ���
SELECT *
FROM EMP
ORDER BY DEPTNO, SAL DESC ;
-- 25. ��å�� MANAGER �� �ƴϰ�, �μ��� 20�� �ƴ� ����� ��� ���� ���
SELECT *
FROM EMP
WHERE JOB != 'MANAGER' AND DEPTNO != 20;
-- 26. 1981/04/01 ���� �Ի��ϰ�, �μ��� 30�� ��� ���� 
SELECT *
FROM EMP
WHERE HIREDATE > '81/04/01' AND DEPTNO = 30
ORDER BY SAL DESC;
-- 27. 10�� �μ��� ��� ������� �޿��� 13%�� ���ʽ��� ����, 10�� �μ��� ��� �̸�, �޿�, ���ʽ� �� �ݾ�, �μ���ȣ ���
SELECT  ENAME, SAL, FLOOR(SAL*1.13) ���ʽ�����, DEPTNO 
FROM EMP
WHERE DEPTNO = 10; 
-- 28. ��� ����� ���ؼ� �Ի��Ϻ��� 90���� ���� ���� ��¥ ���, �̸�, �Ի���, �Ի� �� 90��, �޿�(90��ġ �޿�??) 
SELECT ENAME, HIREDATE, HIREDATE + 90 "90����" , SAL*3 "�ѱ޿�"
FROM EMP
ORDER BY �ѱ޿� DESC;

