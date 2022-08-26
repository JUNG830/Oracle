---------------------------------------------------
/* �׷� �Լ� */
--SELECT SUM(SAL), SAL  -- �׷� �Լ��� �� �Ѱ��� ��� ���� �����ϱ� ������ �׷��� �������� ��� ���� �߻� 

SELECT SUM(SAL)
FROM EMP;
------------------------------------------------------------
/* GROUP BY : ���ؿ��� ���� ���� ������ ������ �׷����� ���� ���� ���� ���տ� ���� �׷� �Լ��� ������ �ʿ��ϴٸ� GROUP BY ���� �̿��Ͽ� ó�� �� �� �ֽ��ϴ�. */
SELECT SUM(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;  
------------------------------------------------------------
/* �հ豸�ϱ� */
SELECT SUM(DISTINCT SAL),  -- DISTINCT : �ߺ�����
    SUM(ALL SAL),
    SUM(SAL)
FROM EMP;
    
SELECT SUM(SAL), 
    SUM ( NVL ( COMM, 0 ) ),
    DEPTNO
FROM EMP
GROUP BY DEPTNO;

------------------------------------------------------------
/* ������ ������ �����ִ� COUNT �Լ� */
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO;

SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;
------------------------------------------------------------
/* NULL�� �ƴ� ��쿡�� ���� �޴� �ο� ���ϱ� */
-- COUNT�� ����ó���� �ϱ� ������ �ڵ����� NULL�� ������.
SELECT COUNT(COMM), COMM
FROM EMP
WHERE COMM IS NOT NULL
GROUP BY COMM;
------------------------------------------------------------
/*MAX */
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;

/* MIN */
SELECT MIN(SAL)
FROM EMP
WHERE DEPTNO = 10;

SELECT MAX(HIREDATE)  -- ���� �ʰ� �Ի��� ���
FROM EMP
WHERE DEPTNO = 20;

SELECT MIN(HIREDATE)  -- ���� ���� �Ի��� ���
FROM EMP
WHERE DEPTNO = 20;

/* AVG : ��� */
SELECT ROUND(AVG(SAL)), DEPTNO
FROM EMP
WHERE DEPTNO = 30
GROUP BY DEPTNO;

------------------------------------------------------------
/* GROUP BY �� ����ϴ� ��� */
SELECT DEPTNO, ROUND(AVG(SAL), 2)
FROM EMP
GROUP BY DEPTNO;
------------------------------------------------------------
/* GROUP BY ���� ����ϴ� ��� */
SELECT ROUND(AVG(SAL), 2) "10�� ���"
FROM EMP
WHERE DEPTNO = 10
SELECT ROUND(AVG(SAL), 2) "20�� ���"
FROM EMP
WHERE DEPTNO = 20
SELECT ROUND(AVG(SAL), 2) "30�� ���"
FROM EMP
WHERE DEPTNO = 30;

SELECT ROUND(AVG(SAL), 2) "10�� ���"
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT ROUND(AVG(SAL), 2) "20�� ���"
FROM EMP
WHERE DEPTNO = 20
UNION ALL
SELECT ROUND(AVG(SAL), 2) "30�� ���"
FROM EMP
WHERE DEPTNO = 30;

------------------------------------------------------------
/* �μ���ȣ �� ��å�� ��� �޿��� ���� */
SELECT DEPTNO, JOB, ROUND(AVG(SAL), 2) "��ձ޿�"
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;
------------------------------------------------------------
/* �μ� �ڵ�, �޿� �հ�, �μ� ���, �ο��� ������ ���� */
SELECT DEPTNO �μ��ڵ�, 
    SUM(SAL) �޿��հ�, 
    ROUND(AVG(SAL), 2) �μ��޿����, 
    COUNT(*) �ο���
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
    
------------------------------------------------------------
/* HAVING �� */
/* GROUP BY���� ���� �׷�ȭ�� ��� ���� ������ �����ϴµ� ��� */
/* SELECT���� GROUP BY���� ������ ���� ����� �� ���� */

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
-- WHERE ���� ���ٸ� ����!!
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;    

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
--WHERE AVG(SAL) >= 2000  -- GROUP ���� �����ִ� ��� WHERE�� ����� �� ����. HAVING�� �̿�.
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;   

------------------------------------------------------------
/* HAVING �� + WHERE �� ��� */
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
    WHERE SAL <= 3000  -- ���� ����࿡ ���� ������ ���� ������ ��. 
    -- WHERE ������ GROUP �Լ��� �ƴ� �͸� ���
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
    -- HAVING ������ GROUP ���� ���� �͸� ���.
ORDER BY DEPTNO, JOB;
------------------------------------------------------------
/* HAVING ���� ����Ͽ� EMP���̺��� �μ��� ��å��  ��� �޿��� 500 �̻��� ������� 
�μ���ȣ, ��å, ��ձ޿� ��� */
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 500
ORDER BY AVG(SAL), DEPTNO;    

------------------------------------------------------------
/* < �������� > */
-- 1. EMP ���̺��� �̿��Ͽ� �μ���ȣ, ��ձ޿�, �ְ�޿�, �����޿�, ����� ���
-- ��, ��� �޿��� ����� �� �Ҽ����� �����ϰ� �μ���ȣ���� ���
SELECT DEPTNO �μ���ȣ, 
        ROUND(AVG(SAL), 0) ��ձ޿�, 
        MAX(SAL) �ְ�޿�,
        MIN(SAL) �����޿�, 
        COUNT(*) �����
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
------------------------------------------------------------
/* < �������� > */
-- 2. ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο��� ���
SELECT JOB ��å, COUNT(*) �����
FROM EMP
GROUP BY JOB
    HAVING COUNT(*) >= 3;

------------------------------------------------------------
/* < �������� > */
-- 3. ������� �Ի翬���� �������� �μ����� ����� �Ի��ߴ��� ���
SELECT SUBSTR(HIREDATE, 1, 2) �Ի翬��, JOB ��å, COUNT(*) �����
FROM EMP
GROUP BY SUBSTR(HIREDATE, 1, 2), JOB
ORDER BY SUBSTR(HIREDATE, 1, 2), JOB;

------------------------------------------------------------
/* < �������� > */
-- 4. �߰� ������ �޴� ��� ���� ���� �ʴ� ������� ��� ('O' , 'X' ���)
SELECT NVL2(COMM, 'O', 'X') AS ���翩��, COUNT(*) �����
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');
-- 0 �� ��� X ó�� �Ǿ���ϴµ�,,,,,, 
SELECT COMM
FROM EMP;
        
------------------------------------------------------------
/* < �������� > */
-- 5. �� �μ��� �Ի翬���� �����, �ְ�޿�, �޿���, ��ձ޿��� ����ϰ�
-- �� �μ��� �Ѱ� ���.
SELECT DEPTNO �μ���ȣ, 
        TO_CHAR(HIREDATE, 'YYYY') �Ի翬��, 
        COUNT(*) �����,
        MAX(SAL) �ְ�޿�, 
        SUM(SAL) �޿�����, 
        ROUND(AVG(SAL)) ��ձ޿�
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
ORDER BY DEPTNO, TO_CHAR(HIREDATE, 'YYYY');

               
----------------------------------------------------------------------------------------------------------------------
/* ���� */
-- UNION : SQL���� ���� �������� ��ȯ(SELECT ���� ������). ��, �ߺ� ����. ��� Ÿ���� �����ؾ���.
-- UNION ALL : �ߺ����� ���� ����.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE  DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE  DEPTNO = 20;

/* ������ */
-- INTERSECT : �� SELECT ���� ��� ���� ���� ��� ��ȯ.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > 1000
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL < 2000;

/* ������ */
-- MINUS : ���� SELECT ������ ���� SELECT ���� �� ��� �� ��ȯ.
-- SAL ��ü���� SAL > 2000�� ������ ��� ��� ��.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > 2000;
















