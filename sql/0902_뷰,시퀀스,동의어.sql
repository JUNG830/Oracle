/* �ε��� */ 
SELECT ROWID  -- ����������ȣ(6) + ���Ϲ�ȣ(3) + BLOCK ��ȣ(6) + ROW��ȣ(3)
FROM EMP;

SELECT * 
FROM USER_INDEXES-- ;   -- SCOTT ������ �ε��� �Ǿ� �ִ� �͵� ���� Ȯ��.
WHERE TABLE_NAME = 'EMP';
/* �ε��� Ű ��� */
-- ���� �ε��� Ű ���
CREATE INDEX IDX_EMP_SAL ON EMP(SAL);  
-- ���� �ε��� ��� (�ִ� 32������ ��� ����)
CREATE INDEX IDX_EMP_TUPLE ON EMP(JOB, DEPTNO);
-- ����ũ(UNIQUE) �ε��� : �ε����� ������ �÷��� �ش� ���̺��� ������ ��.
CREATE UNIQUE INDEX IDX_EMP_UK 
    ON EMP(EMPNO, MGR);
-- �ε��� ���� (DROP)
DROP INDEX IDX_EMP_TUPLE;

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























































































