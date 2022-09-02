/* �ε��� */ 
SELECT ROWID  -- ����������ȣ(6) + ���Ϲ�ȣ(3) + BLOCK ��ȣ(6) + ROW��ȣ(3)
FROM EMP;

SELECT * 
FROM USER_INDEXES-- ;   -- SCOTT ������ �ε��� �Ǿ� �ִ� �͵� ���� Ȯ��.
WHERE TABLE_NAME = 'EMP';
/* �ε��� Ű ��� */
-- ���� �ε��� Ű ���
CREATE INDEX IDX_EMP_SAL  
    ON EMP(SAL);  
-- ���� �ε��� ��� (�ִ� 32������ ��� ����)
CREATE INDEX IDX_EMP_TUPLE 
    ON EMP(JOB, DEPTNO);
-- ����ũ(UNIQUE) �ε��� : �ε����� ������ �÷��� �ش� ���̺��� ������ ��.
CREATE UNIQUE INDEX IDX_EMP_UK 
    ON EMP(EMPNO, MGR);
-- �ε��� ���� (DROP)
DROP INDEX IDX_EMPIDX_EMPNO;

---------------------------------------------------------------------------------------------------------------
/* < ���̺� �� > */
-- �ϳ� �̻��� ���̺��� ��ȸ�ϴ� SELECT ���� ������ ��ü.
-- ������ �ܼ�ȭ �� �� ����.
-- ���ȼ� �������� ����� �� ����.

/* �� ���� */
-- WIN + R -> CMD -> SQLPLUS -> SYSTEM -> ��� 1234 -> �Ʒ� ���� -> Grant succeeded. �߸� ����. 
GRANT CREATE VIEW TO SCOTT;

/* �� �����ϱ� �ؼ� �Ǹ� �Ǵ� �� */
-- ���� �� ����
CREATE VIEW VW_EMP20
 AS (SELECT EMPNO, ENAME, JOB, DEPTNO
	 FROM EMP
	 WHERE DEPTNO = 20);

SELECT *
FROM EMP;

SELECT *
FROM VW_EMP20;

SELECT * 
FROM USER_VIEWS;

---------------------------------------------------------------------------------------------------------------
/* < ������ > */
-- ����Ŭ �����ͺ��̽����� Ư�� ��Ģ�� �´� ���� ���ڸ� �����ϴ� ��ü
CREATE SEQUENCE SEQ_EMPID
START WITH 300 -- ������� �����ҷ�
INCREMENT BY 2  -- � ������ų ���ΰ�.
MAXVALUE 320  -- ������� �ݺ��ҰŴ�?
NOCYCLE -- �ݺ����� ����
NOCACHE;  -- �޸� �Ҵ��� ���� ����. 

SELECT SEQ_EMPID.NEXTVAL 
FROM DUAL;

---------------------------------------------------------------------------------------------------------------
/* < ���Ǿ� > */
-- �������� ��Ī�� �ο��ϴ� ���.
-- WIN + R -> CMD -> SQLPLUS -> SYSTEM -> ��� 1234 -> �Ʒ� ���� -> Grant succeeded. �߸� ����. 
--GRANT CREATE VIEW TO SCOTT;

CREATE SYNONYM E FOR EMP;

SELECT * FROM E;
-- ���Ǿ� ����
DROP SYNONYM E;

---------------------------------------------------------------------------------------------------------------
/* < �������� 1 > */
--�� EMP ���̺�� ���� ������ �����͸� �����ϴ� EMPIDX ���̺��� ����� ������.
--�� ������ EMPIDX ���̺��� EMPNO ���� IDX_EMPIDX_EMPNO �ε����� ����� ������.
--�� ���������� �ε����� �� �����Ǿ����� ������ ������ ���� �並 ���� Ȯ���� ������

CREATE TABLE EMPIDX
 AS SELECT *
    FROM EMP;

CREATE INDEX IDX_EMPIDX_EMPNO 
    ON EMPIDX(EMPNO);

SELECT *
FROM EMPIDX;

SELECT * 
FROM USER_INDEXES
WHERE INDEX_NAME = 'IDX_EMPIDX_EMPNO';

---------------------------------------------------------------------------------------------------------------
/* < �������� 2 > */
--���� 1������ ������ EMPIDX ���̺��� ������ �� �޿�(SAL)�� 1500 �ʰ��� ����鸸 ����ϴ� EMPIDX_OVER15K �並 ������ ������. 
--�� �̸��� ���� �䰡 �̹� ������ ��쿡 ���ο� �������� ��ü �����ؾ� �մϴ�. 
--EMPIDX_OVER15K ��� ��� ��ȣ, ��� �̸�, ��å, �μ� ��ȣ, �޿�, �߰� ���� ���� ������ �ֽ��ϴ�. 
--�߰� ���� ���� ��쿡 �߰� ������ �����ϸ� O, �������������� X�� ����մϴ�.

CREATE VIEW EMPIDX_OVER15K
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, 
            NVL2(COMM, 'O', 'X') AS COMM 
            FROM EMPIDX
            WHERE SAL > 1500);
            
DROP VIEW EMPIDX_OVER15K;

--UPDATE EMPIDX_OVER15K
--SET COMM
--WHERE COMM IS NOT NULL;

SELECT *
FROM EMPIDX_OVER15K;

---------------------------------------------------------------------------------------------------------------
/* < �������� 3 > */
--�� DEPT ���̺�� ���� ���� �� ������ ������ DEPTSEQ ���̺��� �ۼ��� ������.
--�� ������ DEPTSEQ ���̺��� DEPTNO ���� ����� �������� ������ Ư���� �°� ������ ������.
--�� ���������� ������ DEPTSEQ�� ����Ͽ� �����ʰ� ���� �� �� �μ��� ���ʴ�� �߰��� ������.
CREATE TABLE DEPTSEQ
    AS SELECT * 
         FROM DEPT;

CREATE SEQUENCE SEQ_DEPTSEQ 
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 99
   MINVALUE 1
   NOCYCLE 
   NOCACHE;

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'DATABASE', 'SEOUL');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'WEB', 'BUSAN');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC) 
VALUES (SEQ_DEPTSEQ.NEXTVAL, 'MOBILE', 'ILSAN');

SELECT *
FROM DEPTSEQ;


INSERT INTO MENU_INFO
    VALUES ('COFFEE','100' 'ESPRESSO', '2500', ');  

































































