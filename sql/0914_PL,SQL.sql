SET SERVEROUTPUT ON;  -- 실행 결과를 화면에 출력
--BEGIN 
--    DBMS_OUTPUT.PUT_LINE('HELLO, PL/SQL!!!!!');
--END;    -- SYSTEM OUT 과 같음.

DECLARE
    V_EMPNO NUMBER(4) := 8000;  -- 변수 이름  데이터의 형(크기) := (선언된 변수에 값을 대입)
    V_NAME VARCHAR2(10);        -- 선언 이후에 값을 대입하지 않음. 
    
BEGIN 
    V_NAME := 'SCOOT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_NAME : ' || V_NAME);
END;    

-- 상수(변하지 않는 값) 정의 및 사용하기
DECLARE
    V_TAX CONSTANT NUMBER(1) := 5;
    
BEGIN
--    V_TAX := 6;  CONSTANT 지정했기 때문에 변경 안됨.
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;    


-- 변수에 디폴트 값 대입하기.
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;    

-- 변수에 NULL 값 저장 막기
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL := 20;  -- NOT NULL 하면 값을 선언 해 주어야 함. 
    
BEGIN
    V_DEPTNO := 10; 
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

-- 참조형 사용하기
-- 참조형은 오라클 데이터베이스에 존재하는 특정 테이블 열의 자료형이나 하나의 행 구조를 참조하는 자료형을 의미
-- 열을 참조할 때는 %TYPE, 행을 참조할 때는 %ROWTYPE 을 사용.

-- < 열을 참조 > 
-- %TYPE : 값을 대입받을 수 있음.
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

--  < 행 구조를 참조 >
-- %ROWTYPE : 값을 대입 받을 수 었음.
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW   
    --  V_DEPT_ROW : 데이터를 저장할 변수 이름 (참조형 타입) - DEPTNO, DNAME, LOC 값을 저장.
        FROM DEPT
    WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;





















































