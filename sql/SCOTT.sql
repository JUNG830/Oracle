SELECT  EMPNO, ENAME "NAME"
FROM EMP;
SELECT  empno �����ȣ, ename 
FROM EMP;
SHOW USER ;  -- ���� Ȯ��
DESC EMP;
show user;

SELECT ENAME, SAL, SAL*12
FROM EMP;

SELECT ENAME, SAL �޿�, SAL*12 "����"
FROM EMP;

SELECT /* AS ����*/  EMPNO �μ���ȣ, ENAME �̸�, JOB ��å, HIREDATE �Ի���  -- ��ȸ�� " ���� �̸� " �� �����ϸ� ��. ( ' , ' ����)
FROM EMP;

SELECT ENAME AS "�� ��", SAL "�� ��"  -- ��Ī�� ���� �� AS�� ���� ����, ��Ī�� ����, Ư�����ڸ� ���Խ� " " �� �����־�� ��.   
FROM EMP;

SELECT ENAME, DEPTNO, HIREDATE, JOB
FROM EMP
WHERE JOB = 'MANAGER';

SELECT ENAME, DEPTNO, HIREDATE, JOB, EMPNO
FROM EMP
WHERE EMPNO = 7566;

SELECT ENAME, DEPTNO, HIREDATE, JOB, EMPNO
FROM EMP
WHERE SAL * 12 = 36000;

SELECT ENAME, DEPTNO, HIREDATE, JOB, EMPNO, SAL
FROM EMP
WHERE SAL * 12 = 36000;

SELECT *   -- * �� ��� ���� ���.
FROM EMP
WHERE COMM > 100;

SELECT  *
FROM EMP
WHERE DEPTNO <>30;

SELECT * 
FROM EMP
WHERE SAL >= 3000 AND DEPTNO = 20 AND HIREDATE < '82/01/01';

SELECT *
FROM EMP
WHERE DEPTNO IN(20,30);

SELECT *
FROM EMP
WHERE JOB NOT IN('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
FROM EMP
--WHERE SAL >=2000 AND SAL <= 3000;
WHERE SAL BETWEEN 2000 AND 3000;

SELECT *
FROM EMP
WHERE EMPNO BETWEEN 7689 AND 9702;

SELECT * 
FROM EMP
WHERE HIREDATE NOT BETWEEN  '81/01/01' AND '81/12/31';

SELECT *
FROM EMP
WHERE ENAME LIKE '%K%';

SELECT *
FROM EMP
WHERE ENAME LIKE 'K%';

SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

SELECT  *
FROM EMP
WHERE ENAME LIKE '__L%';

SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%'

SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

SELECT *
FROM EMP
--WHERE ENAME LIKE '%AM%';
WHERE ENAME NOT LIKE '%AM%';

SELECT *
FROM EMP
WHERE ENAME LIKE '%"_"%';

SELECT ENAME, SAL, SAL*12+COMM AS ����������������, COMM
FROM EMP
WHERE COMM IS NOT NULL;
----------------------------------------------------------------------------------
/* ���ӻ���� �ִ� ��� �����͸� ��� */
SELECT *
FROM EMP
WHERE MGR IS NOT NULL;
----------------------------------------------------------------------------------
/* ������ �� ORDER BY�� : �⺻�� ��������(ASC), ���������� DESC  |-> �׻� �� �������� �;���.  */
-- ORDER BY ������ �� �ʿ��� ��츸 ��� |-> ��� �����͸� ���ؿ� ���� �����ϴ� ���� ���� �ڿ��� �Ҹ���. 
SELECT *
FROM EMP
ORDER BY SAL ASC/*(ASC ��������, �⺻���̴ϱ�)*/; 
----------------------------------------------------------------------------------
/* ��� ��ȣ �������� �������� ���� */
SELECT *
FROM EMP
ORDER BY EMPNO;
----------------------------------------------------------------------------------
/* ���� �÷� �������� ���� �ϱ� */
SELECT *
FROM EMP
ORDER BY SAL, ENAME ;   -- �޿� �������� ���� �� �޿��� ������ �̸� ������ ����.
--ORDER BY SAL DESC, ENAME ; -- �޿��� ������������ �����ϰ� �̸��� ������������ ����
----------------------------------------------------------------------------------
/* ���������� �������� �Բ� ����ϱ�. */
SELECT *
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;
----------------------------------------------------------------------------------
/* ��Ī�� ORDER BY �Բ� ����ϱ�. */
SELECT EMPNO �����ȣ, ENAME �̸�, SAL ����, HIREDATE �Ի���
FROM EMP
ORDER BY ���� DESC, �̸�;    -- ��Ī���ε� ���� ����. 
----------------------------------------------------------------------------------
/* ���� ������ : || , ���ڿ��� �̾����.  */
SELECT ENAME || ' S JOB IS ' || 'TEST' AS ������
FROM EMP;
----------------------------------------------------------------------------------
-- 1. ��� �̸��� S�� ������ ��� �����͸� ��� ����ϱ�  (LIKE ���)
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

-- 2. 30�� �μ����� �ٹ��ϰ� �ִ� ��� �� ��å�� SALESMAN �� ����� �����ȣ, �̸�, ��å, �޿�, �μ���ȣ�� ���
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE  DEPTNO  =  30 AND JOB = 'SALESMAN';

-- 3. 20��, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿�(SAL)�� 2000 �ʰ��� ����� �ΰ��� ����� 
-- SELECT ���� ����Ͽ� �����ȣ, �̸�, �޿�, �μ���ȣ ���
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
--WHERE DEPTNO IN (20, 30) AND SAL > 2000; 
WHERE (DEPTNO =20 OR DEPTNO = 30) AND SAL > 2000;   -- �켱 ���� �� ()�� ������� ��. 

-- 4. �޿��� 2000�̻� 3000���� �̿��� ���� ���� �����͸� ���
SELECT *
FROM EMP
--WHERE NOT (SAL >=2000 AND SAL <= 3000);
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- 5. ��� �̸��� E�� ���ԵǾ� �ִ� 30�� �μ��� ��� �� 1000~2000 ���̰� �ƴ� ��� �̸�, �����ȣ, �޿�, �μ���ȣ ���
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' 
    AND DEPTNO = 30 
    AND SAL NOT BETWEEN 2000 AND 2000;

-- 6. �߰� ������ �������� �ʰ� ����ڰ� �ְ�, ��å�� MANAGER, CLERK �� ��� �� ����̸��� �ι�° ���ڰ� L�� �ƴ� ��� ���� ���
SELECT *
FROM EMP 
WHERE COMM IS NULL
    AND MGR IS NOT NULL
    AND JOB IN('MANAGER', 'CLERK')
    AND ENAME NOT LIKE '_L%';
---------------------------------------------------------------------












































