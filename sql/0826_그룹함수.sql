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

----------------------------------------------------------------------------------------------------------------------
/* ���� */
-- SELECT 
-- FROM ���̺�1, ���̺�2, ........���̺� N
-- ������ �Ѱ� �̻��� ���̺�� ���̺��� ���� �����Ͽ� ����ϴ� ���
-- �Ϲ������� ���̺��� �ĺ� ���� Primary Key�� ���̺� �� ���� ���� Foreign Key ���� ����Ͽ� ���� 
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO;
----------------------------------------------------------------------------------------------------------------------
/* �����(EQUI JOIN) : 1:1 �±�ȯ */
-- ���̺��� ������ �Ŀ� ��� ���� �� ���̺��� Ư�� ���� " ��ġ�� ������ "�� �������� �����ϴ� ���
-- ���� ���� �Ǵ� �ܼ� �����̶� �θ�.
-- �Ϲ������� ���� ���� ���Ǵ� ���� ���.

SELECT E.EMPNO �����ȣ, E.ENAME ����̸�, D.DEPTNO �μ���ȣ, D.DNAME �μ��̸�, D.LOC �μ���ġ
FROM EMP E, DEPT D    -- EMP �� E�� ��Ī DEPT�� D�� ��Ī
WHERE E.DEPTNO = D.DEPTNO  -- �� ������ JOIN ��.
ORDER BY D.DEPTNO, E.EMPNO;
----------------------------------------------------------------------------------------------------------------------
/* ANSI ��� : �̱� �԰�  */
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.DEPTNO;
----------------------------------------------------------------------------------------------------------------------
/* WHERE ���� ���ǽ��� �߰��Ͽ� ��� ���� ����  */
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;
-- ANSI ���
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO AND SAL >= 3000;
----------------------------------------------------------------------------------------------------------------------
/* �������� */
-- EMP���̺��� ��Ī�� E�� �ϰ�, DEPT�� ��Ī�� D�� �Ͽ� ������ ���� ������� ���� �� 
-- �޿��� 2500�����̰�, �����ȣ�� 9999������ ����� ������ ���
SELECT E.EMPNO �����ȣ, E.ENAME ����̸�, E.SAL �޿�, D.DEPTNO �μ���ȣ, D.DNAME �μ��̸�
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
E.SAL <= 2500 AND E.EMPNO <= 9999
ORDER BY �����ȣ;

SELECT E.EMPNO �����ȣ, E.ENAME ����̸�, E.SAL �޿�, D.DEPTNO �μ���ȣ, D.DNAME �μ��̸�
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
        AND E.SAL <= 2500 
        AND E.EMPNO <= 9999
ORDER BY �����ȣ;
----------------------------------------------------------------------------------------------------------------------
/* �� ���� : ���� �÷��� ���� �ٸ� ������ ����Ͽ� ���� �� �� ��� */
-- ���� ���Ǵ� ����� �ƴ�. 
SELECT E.ENAME, E.SAL, S.GRADE, S.LOSAL, S.HISAL
FROM EMP E JOIN SALGRADE S  -- �ΰ��� ���̺��� ���� ��. 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL; -- EMP ���̺��� �������� S.LOSAL �� S.HISAL �� ���� ���� ������ ��. 

SELECT E.ENAME, E.SAL, S.GRADE, S.LOSAL, S.HISAL
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

----------------------------------------------------------------------------------------------------------------------
/* ��ü ���� : �ڱ� �ڽŰ� �ڽ��� ������ �ϴ� �� */
-- EX) ��� ������ �ش� ����� ���� ����� ������ ������ ����ϰ��� �� �� ���.
SELECT E1.EMPNO �����ȣ, 
        E1.ENAME ����̸�, 
        E1.MGR , 
        E2.EMPNO ����ǻ����ȣ, 
        E2.ENAME ����̸�
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;
/* ANSI */
SELECT E1.EMPNO �����ȣ, 
        E1.ENAME ����̸�, 
        E1.MGR , 
        E2.EMPNO ����ǻ����ȣ, 
        E2.ENAME ����̸�
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;
----------------------------------------------------------------------------------------------------------------------
/* �ܺ����� */
-- ���� ����(INNER JOIN)�� ��� ���� �÷��� ���� ���� ���ٸ� �ش� ���� ��ȸ���� ����. 
-- �ܺ� ����(OUTER JOIN)�� ���� ���ΰ� �ٸ��� ������� ���� ROW�� ����
-- �ܺ� ������ ����ϴ� ������ ���� ���̺��� �����Ͱ� ��� ��ȸ�ǰ�(��������), 
--      ��� ���̺� �����Ͱ� ���� ��� �ش� �÷��� ���� �������� ���ؼ� ���.
--      (+) ��ȣ�� ���, �����Ͱ��� ������ ���̺��� �� �̸� �ڿ� ���

SELECT E1.EMPNO �����ȣ, E1.ENAME ����̸�, E1.MGR,
              E2.EMPNO ����ȣ, E2.ENAME ����̸�
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)  -- (+) MGR �� NULL ���� �� ����. (��� �ڷᰡ �� ����) / ������ �������� ����. / ���� �����Ͱ� �� ���� ��� ���.
ORDER BY E1.EMPNO;
/* (ANSI) LEFT OUTER JOIN : ��ġ�⿡ ����� �� ���̺� �� " ���� " �� ����� ���̺��� �÷� ���� �������� JOIN */
SELECT E1.EMPNO �����ȣ, E1.ENAME ����̸�, E1.MGR,
              E2.EMPNO ����ȣ, E2.ENAME ����̸�
FROM EMP E1 LEFT OUTER JOIN EMP E2
ON E1.MGR = E2.EMPNO
ORDER BY E1.EMPNO;
/* RIGHT OUTER JOIN : ��ġ�⿡ ����� �� ���̺� �� " ������ " �� ����� ���̺��� �÷� ���� �������� JOIN */
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO  -- E.DEPTNO �� �� �������� ��� ���. / �������� �������� ���� / ������ �����Ͱ� �� ���� ��� ���
ORDER BY E.EMPNO;
/* (ANSI) */
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO(+) = D.DEPTNO  -- E.DEPTNO �� �� �������� ��� ���. / �������� �������� ���� / ������ �����Ͱ� �� ���� ��� ���
ORDER BY E.EMPNO;

----------------------------------------------------------------------------------------------------------------------
/* NATURAL JOIN : �� ���̺��� ������ �̸�(�÷���)�� ���� �÷��� ��� ���� */
-- �������ΰ� ��������� WHERE �������� ���� ����, ���� ��� �ȵ�.
-- ���������� DEPTNO ���� �������� � ���� ��.
SELECT EMPNO, ENAME, DNAME
FROM EMP NATURAL JOIN DEPT;

SELECT E.EMPNO, E.ENAME, E.JOB, E. HIREDATE, E.SAL, E.COMM, D.DNAME, D.LOC
            /* E.DEPTNOF �� ���� ��� ���������� �⺻ ������ ���� �̸��� �������� �����ϱ� ������ ����/ �׳� DEPTNO �� ���� */
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

----------------------------------------------------------------------------------------------------------------------
/* ANSI / JOIN ~ USING */
-- ��������(INNER JOIN)�� �����ϸ�, ���������� ����Ͽ� ��� ����.
-- NATURAL JOIN �� �ڵ����� ������ ���� ���� �����ϴ� �Ͱ� �޸� USING Ű���忡 ���� �������� ����� ���� �������� ��.
-- FROM ���̺�1 JOIN ���̺�2 USING ( ���ο� ����� ���ؿ� )
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, 
             D.DNAME, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING (DEPTNO)
WHERE SAL >= 3000
ORDER BY DEPTNO, E.EMPNO;
----------------------------------------------------------------------------------------------------------------------
/* FULL OUTER JOIN : ���� ���̺� ��� OUTER JOIN ��� ���� */
-- ������̵�  NULL �� �����ϴ��� ��� ���. (LEFT + RIGHT ��� ���� ��.)
SELECT E.ENAME, E.DEPTNO, D.DEPTNO, D.DNAME
FROM EMP E FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO;

----------------------------------------------------------------------------------------------------------------------
/* �������� */
-- 1. �޿��� 2000 �ʰ��� ������� �μ� ����, ��������� ���.
-- ����Ŭ ������ ANSI ����
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO AND E.SAL > 2000
ORDER BY E.DEPTNO;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL > 2000
ORDER BY E.DEPTNO;

SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E NATURAL JOIN DEPT D
WHERE  E.SAL > 2000
ORDER BY DEPTNO;

-- 2. �� �μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, ����� ���
-- ����Ŭ ������ ANSI ����
SELECT E.DEPTNO, D.DNAME, ROUND(AVG(E.SAL)), MAX(E.SAL), MIN(E.SAL), COUNT(*)
FROM DEPT D JOIN EMP E
ON E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME
ORDER BY DEPTNO;

SELECT E.DEPTNO, D.DNAME, ROUND(AVG(E.SAL)), MAX(E.SAL), MIN(E.SAL), COUNT(*)
FROM DEPT D, EMP E
WHERE E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME
ORDER BY DEPTNO;

-- 3. ��� �μ������� ��������� �μ���ȣ, ����̸� ������ �����Ͽ� ���
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO, E.ENAME;

-- 4. ��� �μ���ȣ, �μ� �̸�, �����ȣ,  ��� �̸�, ����޿�, ���ӻ���ǻ����ȣ ���
-- 3���� ���̺� (EMP, DEPT, SALGRADE)
SELECT D.DEPTNO �μ���ȣ, 
              D.DNAME �μ��̸�, 
              E.EMPNO �����ȣ,
              E.ENAME ����̸�,
              E.MGR ���ӻ��, 
              E.SAL �޿�,
              E.DEPTNO �μ���ȣ2, 
              S.LOSAL,
              S.HISAL, 
              S.GRADE ���,
              E2.EMPNO �����ȣ,
              E2.ENAME ����̸�
FROM 
    EMP E RIGHT OUTER JOIN DEPT D
        ON (E.DEPTNO = D.DEPTNO)
     LEFT OUTER JOIN SALGRADE S 
        ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
     LEFT OUTER JOIN EMP E2
        ON (E.MGR = E2.ENAME)
ORDER BY D.DEPTNO;

SELECT * 
FROM SALGRADE;






