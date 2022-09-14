SET SERVEROUTPUT ON;  -- ���� ����� ȭ�鿡 ���
--BEGIN 
--    DBMS_OUTPUT.PUT_LINE('HELLO, PL/SQL!!!!!');
--END;    -- SYSTEM OUT �� ����.

DECLARE
    V_EMPNO NUMBER(4) := 8000;  -- ���� �̸�  �������� ��(ũ��) := (����� ������ ���� ����)
    V_NAME VARCHAR2(10);        -- ���� ���Ŀ� ���� �������� ����. 
    
BEGIN 
    V_NAME := 'SCOOT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_NAME : ' || V_NAME);
END;    

-- ���(������ �ʴ� ��) ���� �� ����ϱ�
DECLARE
    V_TAX CONSTANT NUMBER(1) := 5;
    
BEGIN
--    V_TAX := 6;  CONSTANT �����߱� ������ ���� �ȵ�.
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;    


-- ������ ����Ʈ �� �����ϱ�.
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;    

-- ������ NULL �� ���� ����
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL := 20;  -- NOT NULL �ϸ� ���� ���� �� �־�� ��. 
    
BEGIN
    V_DEPTNO := 10; 
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

-- ������ ����ϱ�
-- �������� ����Ŭ �����ͺ��̽��� �����ϴ� Ư�� ���̺� ���� �ڷ����̳� �ϳ��� �� ������ �����ϴ� �ڷ����� �ǹ�
-- ���� ������ ���� %TYPE, ���� ������ ���� %ROWTYPE �� ���.

-- < ���� ���� > 
-- %TYPE : ���� ���Թ��� �� ����.
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

--  < �� ������ ���� >
-- %ROWTYPE : ���� ���� ���� �� ����.
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW   
    --  V_DEPT_ROW : �����͸� ������ ���� �̸� (������ Ÿ��) - DEPTNO, DNAME, LOC ���� ����.
        FROM DEPT
    WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;





















































