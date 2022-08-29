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

SELECT SAL FROM EMP WHERE ENAME = 'JONES';

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








