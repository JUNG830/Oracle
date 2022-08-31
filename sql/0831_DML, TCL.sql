/* �ӽ� ���̺� ����(DDL) */ 
CREATE TABLE DEPT_TEMP
AS SELECT * 
FROM DEPT;  -- DEPT �� DEPT_TEMP �� ���� ����

SELECT *
FROM DEPT_TEMP;

DROP TABLE DEPT_TEMP;  -- ������ ���̺��� �����ϰ� ���� �� ���

/* ���̺� �����͸� �߰��ϴ� INSERT�� */
-- INSERT ��� ���
-- INSERT INTO ���̺� �̸� (���̺� �� , �� �����ؼ� �Է�)
-- VALUES (�� ���� �ش��ϴ� ������ �Է�,    ,     ,     , ,,,,,,)  |-> �� ���� ������ ������ ��ġ�ؾ� ��. 

DESC DEPT_TEMP;  -- ������ Ÿ���� �� �� ����. 

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
VALUES (50, 'DATABASE', 'SEOUL');
-- ������ ���̺��� ������� �Է� �ؾ� ��. ���� ������ �� ����. ��������� �־��־�� �� 0 OR NULL ��...
INSERT INTO DEPT_TEMP -- () ���� ���� ��, �Է��� �������� ������ �����־����.
VALUES (60, 'NETWORK', 'BUSAN');

INSERT INTO DEPT_TEMP 
VALUES(70, 'WEB', NULL);

INSERT INTO DEPT_TEMP
VALUES(80, 'MPBILE', '');  -- ���鵵 NULL �� �ν�
-- ���Ե� ���� ���� ���� �ʰ� ���� �� ���� ����. ���� �Է��ϴ� ������ ���� �� ����. �����ϸ� NULL 
INSERT INTO DEPT_TEMP (DEPTNO, LOC)
VALUES(90, 'INCHEON');

CREATE TABLE EMP_TEMP
AS SELECT *
FROM EMP
WHERE 1 != 1; -- ���̺��� ������ �� �����ʹ� �������� ����. 

SELECT *
FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9001, '������', 'PRESIDENT', NULL, '2001/01/31', 9999, 100, 10);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9002, '������', 'MANAGER', 9001, '2002-08-31', 6000, 800, 20);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9003, '�̹�', 'MANAGER', 9001, TO_DATE('2010/07/01', 'YYYY/MM/DD'), 5000, 700, 20);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9004, '�̿���', 'MANAGER', 9001, TO_DATE('2020/07/01', 'YYYY/MM/DD'), 4500, 900, 20);
    
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9005, '������', 'MANAGER', 9001, SYSDATE, 4400, 1500, 20);

/* ���� ������ �̿��� INSERT */ 
-- VALUES ���� ������� ����. 
-- �����Ͱ� �߰��Ǵ� ���̺��� " �� ������ �ڷ��� " ���������� " �� ������ �ڷ��� " �� ��ġ�ؾ� �Ѵ�. 
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE = 1;   -- WHERE ������ �����ϴ� �����͸� ����
---------------------------------------------------------------------------------------------------------
/* ���̺� �ִ� ������ �����ϱ� (UPDATE) */ 
-- ȸ������ ����, ���� ���� ����, ���� �� �� ���� ��,,,, ���� ������ �߻��ϴ� ��쿡 �ش�. 
-- ���̺� ����� �������� ������ �����ϰ��� �ϴ� ��� ���
-- UPDATE ������ ���̺� �̸� 
-- SET ������ �� �̸� = �Է��� ������, ������ �� = ������,,,,,,,,,
-- WHERE �����͸� ������ ��� ���� �����ϱ� ���� ���� (�ʼ�) 
UPDATE DEPT_TEMP
    SET LOC = 'SEOUL';
    
SELECT * 
FROM DEPT_TEMP;

ROLLBACK;  -- TCL ��ɾ�, �ѹ� �ھ��� ������ ��ɡ� �ǵ�����!!!! BUT, ������ �۾��� �͵� �� ������,, ������ �� ������?!

UPDATE DEPT_TEMP 
    SET DNAME = 'DATEBASE', 
            LOC = 'SEOUL'
    WHERE DEPTNO = 40;        

UPDATE DEPT_TEMP
    SET DNAME = 'FRONTEND',
            LOC = 'SUWON'
    WHERE DEPTNO = 90;        

UPDATE DEPT_TEMP 
    SET LOC = 'JEJU'
    WHERE LOC IS NULL;

---------------------------------------------------------------------------------------------------------
/* �������� */
SELECT * 
FROM EMP_TEMP;
-- ������� �޿��� 5000������ ����鿡�� COMM 2000���� �����ϴ� ���� �ۼ�
UPDATE EMP_TEMP
    SET COMM = 2000
    WHERE SAL <= 5000;
    -- ���� ������ ����Ͽ� ������ �����ϱ�
UPDATE DEPT_TEMP
    SET (DNAME, LOC) = (SELECT DNAME, LOC
                                            FROM DEPT
                                            WHERE DEPTNO = 40)
    WHERE DEPTNO = 40;                                        

SELECT * 
FROM DEPT_TEMP;

---------------------------------------------------------------------------------------------------------
/* ������ �����ϱ� (DELETE) */
SELECT * 
FROM EMP_TEMP;

DELETE FROM EMP_TEMP
    WHERE JOB = 'PRESIDENT';

DELETE FROM EMP_TEMP
    WHERE EMPNO IN (SELECT E.EMPNO  
                                        FROM EMP_TEMP E, SALGRADE S
                                        WHERE E.SAL BETWEEN S.LOSAL AND HISAL
                                        AND S.GRADE = 1
                                        AND DEPTNO = 30);

DELETE FROM EMP_TEMP
    WHERE SAL < 1000;

DELETE FROM EMP_TEMP;  -- ���̺� ��ü ���� ����

---------------------------------------------------------------------------------------------------------
/* �������� */
-- ���� Ǯ�� �� ���̺� ����
CREATE TABLE EX_EMP 
AS SELECT * 
FROM EMP;

CREATE TABLE EX_DEPT
AS SELECT * 
FROM DEPT;

CREATE TABLE EX_SALGRADE
AS SELECT * 
FROM SALGRADE;

-- 1. EX_DEPT �� 50, 60, 70, 80 �μ��� ����ϼ��� (�μ��̸��� ������ �������~)
INSERT INTO EX_DEPT (DEPTNO, DNAME, LOC)
    VALUES (50, 'KH', 'ANDONG');
INSERT INTO EX_DEPT (DEPTNO, DNAME, LOC)
    VALUES (60, 'INTERIOR', 'MOKDONG');
INSERT INTO EX_DEPT (DEPTNO, DNAME, LOC)
    VALUES (70, 'MOLAMOLA', 'DAEJEON');
INSERT INTO EX_DEPT (DEPTNO, DNAME, LOC)
    VALUES (80, 'YOURAMC', 'SUWON');    
    
SELECT * 
FROM EX_DEPT;
    
-- 2.  EX_EMP�� 8���� ��� ������ ����ϼ��� ( ���ε����� ������� ���) DEPTNO = 50, 60, 70, 80  �� ����
INSERT INTO EX_EMP
    VALUES (8001, '�쿵��', 'LOWYER', 7839, '20/05/30', 4000, 500, 60);   
INSERT INTO EX_EMP
    VALUES (8002, '�ּ���', 'LOWYER', 7839, '20/02/28', 4500, 300, 60);   
INSERT INTO EX_EMP
    VALUES (8003, '������', 'IVE', 7902, '03/09/01', 5000, 800, 70);
INSERT INTO EX_EMP
    VALUES (8004, '�����', 'IVE', 7902, '04/08/31',2800, 500, 70);
INSERT INTO EX_EMP
    VALUES (8005, '����', 'IVE', 7902, '04/11/21', 4000, 800, 80);
INSERT INTO EX_EMP
    VALUES (8006, '����', 'IVE', 7902, '02/09/24', 3600, 500, 50);
INSERT INTO EX_EMP
    VALUES (8007, '�̼�', 'IVE', 7902, '07/02/21', 2500, 400, 80);
INSERT INTO EX_EMP
    VALUES (8008, '����', 'IVE', 7902, '04/02/03', 1800, 800, 50);
SELECT * 
FROM EX_EMP;
DELETE FROM EX_EMP
    WHERE ENAME = '�̼�';
    DELETE FROM EX_EMP
    WHERE ENAME = '����';

-- 3. EX_EMP�� ���� ��� �� 50�� �μ����� �ٹ��ϴ� ������� ��� �޿����� 
-- ���� �޿��� �ް� �ִ� ������� 70�� �μ��� �ű�� SQL���� �ۼ� �ϼ���.
UPDATE EX_EMP
    SET DEPTNO = 70
    WHERE  SAL >  ( SELECT AVG(SAL) 
                               FROM EX_EMP
                               WHERE DEPTNO = 50);
-- 4. EX_EMP�� ���� ��� ��, 70�� �μ��� ��� �߿� 
-- �Ի����� ���� ���� ������� �ʰ� �Ի��� ����� �޿��� 10% �λ��ϰ� 80�� �μ��� �ű�� SQL���� �ۼ��ϼ���.
UPDATE EX_EMP
    SET DEPTNO = 80,
            SAL = SAL * 1.1
    WHERE HIREDATE > ( SELECT MIN(HIREDATE)
                                            FROM EX_EMP
                                            WHERE DEPTNO = 70);
                                          
SELECT * 
FROM EX_EMP;                             
-- 5. 2. **EX_EMP�� ���� ��� ��, �޿� ����� 5�� ����� �����ϴ� SQL���� �ۼ��ϼ���.**
--- ��� ���� Ȯ���� ���� **SELECT * FROM SALGRADE;** ���� Ȯ�� �ϼ���.
SELECT * FROM SALGRADE;

DELETE FROM EX_EMP
    WHERE EMPNO IN (SELECT E.EMPNO
                                        FROM EX_EMP E, SALGRADE S
                                        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                                            AND S.GRADE = 5);
SELECT * 
FROM EX_EMP;

ROLLBACK;







