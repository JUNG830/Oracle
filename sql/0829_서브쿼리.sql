-----------------------------------------------------------------------------------------------
/* �������� */
-- SQL�� �ȿ��� �ۼ��ϴ� SELECT���� �ǹ� �մϴ�.
--���������� ���ΰ� ���Ҿ� ���� �����͸� �ϳ��� SQL ������ ó���ϱ� ���� ��� �մϴ�.
--���� ������ �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ���̸�, �ݵ�� ��ȣ( )�ȿ� �־� ǥ�� �մϴ�.

SELECT * 
FROM DEPT;
-- ���������� ���� ��� �� WHERE���� ���� (������������ ���� ����� 10�� ��ȯ��.)
SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'KING');
                                
SELECT DNAME
FROM DEPT
WHERE DEPTNO = 10;
                                

SELECT DEPTNO
FROM EMP
WHERE ENAME = 'KING';
-----------------------------------------------------------------------------------------------
-- ���������� JONES �� 1�޿����� ���� �޿��� �޴� ��� ���� ���
-- ���������� ���� ����� JONES�� �޿��� ������ ��.
SELECT *
    FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');  --2975 ���� ���� �޿��� �޴� ��� ���� ���

SELECT SAL 
FROM EMP 
WHERE ENAME = 'JONES';

-----------------------------------------------------------------------------------------------
-- ���������� ����Ͽ� EMP ���̺��� ��� ���� �߿��� ��� �̸��� ALLEN�� ����� �߰� ����
-- ���� ���� �߰� ������ �޴� ��� ������ ���ϵ��� �ڵ� �ۼ�
SELECT * 
FROM EMP 
WHERE COMM > (SELECT COMM                       -- ������� ������ COMM �� ���ؼ� �� ���� COMM �� �޴� ����� ������ ������ ��. 
                FROM EMP 
                WHERE ENAME = 'ALLEN');  -- EMP ���̺��� ALLEN �� COMM ������ ������ ��
-----------------------------------------------------------------------------------------------
-- ������ ���������� ��¥�� ������ 
SELECT * 
        FROM EMP
        WHERE HIREDATE < (SELECT HIREDATE 
                                             FROM EMP
                                             WHERE ENAME = 'JAMES');  -- JAMES ���� ���� �Ի��� ����� ���� ��µ�. 
                                          
-- �������ΰ� �����ؼ� ����ϱ�.
-- ���������� ���ؼ� EMP���̺��� SAL�� ��� �޿��� ���� ����. 
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
            AND E.DEPTNO = 20
            AND E.SAL > (SELECT AVG(SAL)
                                    FROM EMP);
-- ANSI
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E JOIN DEPT D
              ON E.DEPTNO = D.DEPTNO
                 AND E.DEPTNO = 20
                AND E.SAL > (SELECT AVG(SAL)
                                            FROM EMP);
                                    
SELECT AVG(SAL)
        FROM EMP;
                                                        
-----------------------------------------------------------------------------------------------
-- ���� ����� �������� ������ ��������
-- IN : ���� ������ �����Ͱ� ���� ������ ��� �� �ϳ��� ��ġ�ϸ� TRUE 
-- �� �μ����� �޿��� ���� ��� ���� ���
SELECT * 
    FROM EMP 
    WHERE SAL IN (SELECT MAX(SAL)
                                    FROM EMP
                                    GROUP BY DEPTNO); 

SELECT MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO;  -- �ְ� �޿��� �μ����� ����. /-> �� �μ��� �ְ� �޿��� �޴� ����� ���� ���

-----------------------------------------------------------------------------------------------
-- ANY : ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRUE
-- ���������� ����� ������ �����ϱ� ������ ������ ������ �ʿ�(IN, ANY, ALL, EXISTS)
SELECT EMPNO, ENAME, SAL
        FROM EMP
        WHERE SAL > ANY (SELECT SAL
                                 FROM EMP
                                WHERE JOB = 'SALESMAN');  -- ���������� ������� �������̱� ������ ������ �Ұ�. 
/* ������ �������� : ��� ���� ������ ���� */                                
SELECT SAL
FROM EMP
WHERE JOB = 'SALESMAN';                 
                                
                                
/* ������ �������� */ 
SELECT *
    FROM EMP
    WHERE SAL > ( SELECT SAL
                              FROM EMP
                              WHERE ENAME = 'JONES'); 
-- �������� ����� �Ѱ� = ������.           
SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';

-----------------------------------------------------------------------------------------------
-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ������� ���
SELECT *
FROM EMP
WHERE SAL < ANY (SELECT  SAL    -- ��� �޿��� �� ��� �ϳ����ٶ� ������ ���
                                 FROM EMP
                                 WHERE DEPTNO = 30)
ORDER BY SAL, DEPTNO;

SELECT  SAL
FROM EMP
WHERE DEPTNO = 30;

-----------------------------------------------------------------------------------------------
-- ALL : ���������� ���ǽ��� ���������� ����� ��� �����ϸ� TRUE
-- �޿��� ���������� MANAGER �� �޿��麸�� ū ��츸 ���
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL
                                FROM EMP
                                WHERE JOB = 'MANAGER'); 

SELECT SAL
FROM EMP
WHERE JOB = 'MANAGER';
-- �޿��� 30�� �μ��� �޿����� ���� ��츸 TRUE
SELECT *
FROM EMP
WHERE SAL > ALL (SELECT SAL
                                FROM EMP
                                WHERE DEPTNO = 30)
ORDER BY SAL, DEPTNO; 

-----------------------------------------------------------------------------------------------
-- EXISTS : ���������� ��� ���� �ϳ� �̻� �����ϸ� ��� TRUE/ �������� ������ FALSE.
-- ���������� ������� �Ѱ��� �����ϸ� ��� ���.
SELECT * 
    FROM EMP
    WHERE EXISTS (SELECT DNAME
                                FROM DEPT
                                WHERE DEPTNO = 10);

SELECT DNAME
FROM DEPT
WHERE DEPTNO = 10;

-----------------------------------------------------------------------------------------------
-- ���߿� �������� : ���������� ����� �ΰ� �̻��� �÷����� ��ȯ�Ǿ� ���������� �����ϴ� ����.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP 
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, SAL   -- ���������� WHERE���� 2���� ���������� 2�� ��ȯ.
                                            FROM EMP
                                            WHERE DEPTNO = 30);
-- ��������
SELECT DEPTNO, SAL
 FROM EMP
WHERE DEPTNO = 30;
-----------------------------------------------------------------------------------------------
-- GROUP BY ���� ���Ե� ���߿� ��������
SELECT *  -- �� �μ��� �ְ� �޿��� ������� ���.
    FROM EMP
    WHERE (DEPTNO, SAL ) IN (SELECT DEPTNO, MAX(SAL)
                                                    FROM EMP
                                                    GROUP BY DEPTNO);
/* �������� : �μ��� �ְ� �޿� */ 
SELECT DEPTNO, MAX(SAL)  
     FROM EMP
    GROUP BY DEPTNO;

-----------------------------------------------------------------------------------------------
/* FROM���� ����ϴ� �������� (���蹮��^^) */
-- ���� ������ FROM ���� ���� ������ �̿��ϴ� �������, �ζ��� �� ��� ��. 
--  ���̺� �� ������ �Ը� �ʹ� ū ��� �ʿ��� ��� ���� ����ϰ��� �� �� 
-- �Ǵ� ������ ���� �ʿ��� ��� � ���..
-- BUT  FROM���� �ʹ� ���� ���������� �����ϸ� �������̳� ������ ������ �� ����.

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM (SELECT * 
                    FROM EMP 
                    WHERE DEPTNO = 10) E10, -- DEPTNO�� 10���� ��� ������ ������ ��.
                (SELECT * 
                    FROM DEPT) D
    WHERE E10.DEPTNO = D.DEPTNO;   
-----------------------------------------------------------------------------------------------
-- ���� ������ �ʿ��� ��� : �޿��� ���� ��� 3�� ��� (���蹮��^^)
-- ROWNUM : ����Ŭ���� �����ϸ� ���ȣ�� �Ű��ش�. 
SELECT ROWNUM, ENAME, SAL
    FROM (SELECT * 
                FROM EMP
                ORDER BY SAL DESC)  -- ������ ���� �ϰ�
    WHERE ROWNUM <= 3;  -- ������ 3��°������ ���. 
--    ORDER BY SAL; -- �����ϸ� �� ��ȣ�� ���׹��� �� WHAY?!
-----------------------------------------------------------------------------------------------
/* SELECT ���� ����ϴ� ���� ���� */ 
-- SELECT ������ ����ϴ� ������ ���������� ��Į�� ����������� �Ѵ�. 
-- SELECT ���� ����ϴ� ���������� �ݵ�� �ϳ��� ����� ��ȯ�ϵ��� �ۼ��ؾ��Ѵ�. 
SELECT EMPNO, ENAME, JOB, SAL, 
            (SELECT GRADE
                FROM SALGRADE 
                WHERE EMP.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
            DEPTNO,
            (SELECT DNAME
                FROM DEPT D
                WHERE EMP.DEPTNO = D.DEPTNO) AS DNAME
        FROM EMP;                    
                
SELECT *
FROM SALGRADE;
SELECT *
FROM DEPT;

-----------------------------------------------------------------------------------------------
-- �� �ึ�� �μ���ȣ�� �� ���� �μ���ȣ�� ������ ������� SAL����� ���ؼ� ��ȯ. 
-- ����̸� / �μ���ȣ / �޿� / �μ��� ���
SELECT ENAME, DEPTNO, SAL, 
            (SELECT TRUNC(AVG(SAL)) 
                FROM EMP
                WHERE DEPTNO = E.DEPTNO ) AS "�μ���ձ޿�"  -- �� �μ��� �ݿ� ����� ����. 
        FROM EMP E;
        
SELECT TRUNC(AVG(SAL)) 
        FROM EMP
        WHERE DEPTNO = 30;

-----------------------------------------------------------------------------------------------
-- �μ� ��ġ�� NEW YORK �� ��� ����, �׿� �μ��� ������ ���   
SELECT EMPNO, ENAME,
        CASE WHEN DEPTNO = (SELECT DEPTNO
                                                    FROM DEPT
                                                    WHERE LOC = 'NEW YORK')
                    THEN '����'
                    ELSE '����'
        END AS �Ҽ�
FROM EMP
ORDER BY �Ҽ�;

-----------------------------------------------------------------------------------------------
/* �������� */
-- 1. ��ü ��� �� ALLEN�� ���� ��å(JOB)�� ������� ��� ����, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ�.
SELECT JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
        FROM EMP E, DEPT D
        WHERE  E.DEPTNO = D.DEPTNO
        AND JOB = (SELECT JOB
                                FROM EMP
                                WHERE ENAME = 'ALLEN');
/* �������� */
-- 2. ��ü ����� ��� �޿�(SAL)���� ���� �޿��� �޴� ������� ��� ����, �μ� ����, �޿� ��� ������ ����ϴ� SQL���� �ۼ��ϼ���
-- (�� ����� �� �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� ��� ��ȣ�� �������� ������������ �����ϼ���).
-- ������ �������� : <, >, =, <=, >=, [<>, !=, ^=  : ���� �ʴ�]
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, 
            (SELECT GRADE
                FROM SALGRADE 
                WHERE E.SAL BETWEEN LOSAL AND HISAL) AS GRADE -- ������
    FROM EMP E, DEPT D
    WHERE  E.DEPTNO = D.DEPTNO
        AND SAL > (SELECT AVG(SAL)
                                FROM EMP)
    ORDER BY SAL, EMPNO;
/* �������� */    
-- 3. 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� 
-- ��� ����, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��ϼ���.
-- ������ ���������� ���� ���� : IN, NOT IN, ANY, SOME(=ANY : �ϳ��� ����), ALL(��θ���), EXISTS(������ ����� �ϳ��� �����ϸ� �� ���)
SELECT E10.EMPNO, E10.ENAME, E10.JOB, E10.DEPTNO, D.DNAME, D.LOC
    FROM  (SELECT * 
                    FROM EMP 
                    WHERE DEPTNO = 10) E10, 
                DEPT D
    WHERE E10.DEPTNO = D.DEPTNO
        AND E10.JOB NOT IN ( SELECT JOB   -- IN : ���� ������ �����Ͱ� ���� ������ ��� �� �ϳ��� ��ġ�ϸ� TRUE
                                                    FROM EMP
                                                WHERE DEPTNO = 30);    
/* �������� */
-- 4. ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� ��� ����, �޿� ��� ������ ������ ���� ����ϴ� SQL���� �ۼ��ϼ���
--(�� ���������� Ȱ���� �� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� ��� ��ȣ�� �������� ������������ �����ϼ���).
-- // ������ ��� X  -> ������ ���// 
SELECT E.EMPNO, E.ENAME, E.SAL, 
                (SELECT GRADE
                FROM SALGRADE
                WHERE SAL BETWEEN LOSAL AND HISAL) AS GRADE
    FROM EMP E
    WHERE SAL > (SELECT MAX(SAL)
                                FROM EMP
                                WHERE JOB = 'SALESMAN')  -- JOB �� SALESMAN �� ����� �߿��� �޿��� ���� ���� ��� ��� 
    ORDER BY E.EMPNO;
    
SELECT MAX(SAL)
    FROM EMP
    WHERE JOB = 'SALESMAN';
    
-- // ������ ��� O // 
-- ALL : ���������� ���ǽ��� ���������� ����� ��� �����ϸ� TRUE
SELECT EMPNO, ENAME, SAL, 
                (SELECT GRADE
                FROM SALGRADE
                WHERE SAL BETWEEN LOSAL AND HISAL) AS GRADE
    FROM EMP
    WHERE SAL > ALL (SELECT DISTINCT SAL  -- DISTINCT : �ߺ� ����(�� �ᵵ ����� ����)
                                        FROM EMP
                                       WHERE JOB = 'SALESMAN')
    ORDER BY EMPNO;

SELECT DISTINCT SAL 
        FROM EMP
       WHERE JOB = 'SALESMAN';

