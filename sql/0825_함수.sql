---------------------------------------------------------------------------------------------
-- < ������ �Լ� : �����Ͱ� �� �྿ �Էµǰ� �Էµ� �� ��� ����� �ϳ��� ���� >
SELECT ENAME, UPPER(ENAME) �빮��, LOWER(ENAME) �ҹ���, INITCAP(ENAME) ù�ڸ��빮��
FROM EMP;

SELECT  *
FROM EMP
--WHERE UPPER(ENAME) = 'JAMES';
WHERE UPPER(ENAME) = LOWER('JAMES');  -- �ȳ���.

SELECT  *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER ('%jam%');

---------------------------------------------------------------------------------------------
/* ���ڿ� ���̸� ���ϴ� �Լ� */
-- LENGTH() : ���ڿ��� ���̸� ��ȯ. (��� ���������� ��� ����) 
 -- LENGTHB () :  ���ڿ��� BYTE ���� ��ȯ. (��� ���������� ��� ����) 
 -- DUAL : SYS �������� �����ϴ� ���̺�� �Լ��� ������ ���̺� ���� ���� �����غ��� ���� ����(DUMMY)���̺�
SELECT ENAME, LENGTH(ENAME) �̸��Ǳ��� 
FROM EMP; 

SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 5;

SELECT LENGTH('������'), LENGTHB('������')  -- ���� ����, �� �ȿ� �ѱ��ڴ� 3BYTE�� �����ϰ� ����. 
FROM DUAL;

SELECT LENGTH(50), LENGTHB(50)
FROM DUAL;

SELECT 20 * 30 
FROM DUAL;   -- DUAL : �ӽ����̺�
---------------------------------------------------------------------------------------------
-- MOD(NUM1, NUM2) : NUM1 ������ NUM2 �� �������� ���ΰ�
SELECT MOD(5, 4)  -- ������ ������ 5�� 4�� ������ �������� �󸶳�~
FROM DUAL;

SELECT MOD(21, 5)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  ABS() : ���밪�� ���ϴ� �Լ� */
SELECT -10, ABS(-10)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  ROUND() : �ݿø��� ����� ��ȯ (�ݿø��� ��ġ ���� ����, �������� ������ �Ҽ��� ù��°�ڸ����� �ݿø�, ���� ���� ����(���� ����) */
SELECT 12.3456, ROUND(12.3456), ROUND(12.3456, 2), ROUND(12.3456, -1), ROUND(12.3456, -2)
FROM DUAL;
---------------------------------------------------------------------------------------------
/* TRUNC() : �����ϴ� �Լ�(������ ��ġ ���� ����, �������� ������ �Ҽ��� ù��°�ڸ� ����, ���� ���� ����(���� ����) */
SELECT 12.3456, TRUNC(12.3456), TRUNC(12.3456, 1), TRUNC(12.3456, 2), TRUNC(12.3456, -1), TRUNC(12.3456, -2)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  CEIL() : �Ҽ��� ���� �ø��ϴ� �Լ� */
SELECT 12.3456, CEIL(12.3456)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  FLOOR() :�Ҽ��� ���� �����ϴ� �Լ� */
SELECT 12.3456, FLOOR(12.3456)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  POWER(A, B) :  A�� B��ŭ �����ϴ� �Լ�(�Ǽ��� ����) */
SELECT  POWER(3, 4.3)
FROM DUAL;
---------------------------------------------------------------------------------------------
/*  SUBSTR(���ڿ�������, ������ġ) : ���ڿ��� ������ġ���� ������ ��ȯ.  */
/*  SUBSTR(���ڿ�������, ������ġ, ����) : ���ڿ��� ������ġ���� ���̸�ŭ ��ȯ.  */
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;
/* -LENGTH(JOB) = - �� ������ �տ������� -5 -4 -3 -2 -1 ������ ��ȯ�Ѵ�.  */
SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)), 
        SUBSTR(JOB,  -LENGTH(JOB), 3), 
        SUBSTR(JOB,  -LENGTH(JOB), 1),
        SUBSTR(JOB,  -3)
FROM EMP;
---------------------------------------------------------------------------------------------
/* INSTR(����ڿ�, ã������ ����/���ڿ�, ��ġ(���� ������ ó������), ���°���� ������ �ش繮��) : ���ڿ� ������ �ȿ� Ư�� ���ڳ� ���ڿ��� ��� ���ԵǾ� �ִ��� ��ġ Ȯ�� */
SELECT INSTR('HELLO, ORACLE!', 'L') AS "INSTR�⺻",
        INSTR('HELLO, ORACLE!', 'L', 5) AS "INSTR��ġ����",
        INSTR('HELLO, ORACLE!', 'L', 2, 2) AS "INSTR 2��° L�� ��ġ"
FROM DUAL;
---------------------------------------------------------------------------------------------
/* Ư�����ڰ� ���Ե� �� ã��(LIKE���� �ٸ� ���) */
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') > 0;
--WHERE ENAME LIKE '%S%';  
---------------------------------------------------------------------------------------------
/* REPLACE(���ڿ�, ã�¹��ڿ�, ������ ���ڿ�(����)) : Ư�� ���ڿ� �����Ϳ� ���Ե� ����/���ڿ��� �ٸ� ����/���ڿ��� ��ü, ��ü�� ���ڸ� �������� ������ �ش� ����/���ڿ� ���� */
SELECT '010-2283-3333' AS ������, 
        REPLACE('010-2283-3333', '-', '*') AS ���ڿ�����, 
        REPLACE('010-2283-3333', '-') AS ���ڿ�����
FROM DUAL;
---------------------------------------------------------------------------------------------
/* LPAD, RPAD : ���� ���� ĭ���� �����ϰ� ��ĭ ��ŭ Ư�� ���ڷ� ä��� �Լ�(LPAD ���ʿ� ä���/ RPAD �����ʿ� ä���) */
-- ä�� ���ڸ� �� �ָ� �������� ä��
SELECT LPAD('ORACLE', 10, '+'),
              RPAD('ORACLE', 10, '+'),
              LPAD('ORACLE', 10)
FROM DUAL;

SELECT RPAD('220830-3827462', 18, '*') �ֹε�Ϲ�ȣ,
            LPAD('010-5584-3245', 13, '*') ��ȭ��ȣ
FROM DUAL;
---------------------------------------------------------------------------------------------
/* CONCAT() :�ι��ڿ��� ��ġ�� �Լ� */
SELECT CONCAT(EMPNO, ENAME), 
              CONCAT( EMPNO, CONCAT (' : ', ENAME))
FROM EMP
WHERE ENAME = 'JAMES';
---------------------------------------------------------------------------------------------
/* TRIM / LTRIM / RTRIM : ���ڿ� ������ Ư�� ���ڿ� ����( ��, �ڸ� ����) / ��, �� ������ ���� �� ����ϴ� ���� ��õ */
 -- || �� ���ڿ� �̾���̱�
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,  -- ���� �� ����
         '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,   -- ���� �� ����
         '[' || LTRIM('<_Oracle_>', '< _') || ']' AS LTRIM_2,   -- ���� �� Ư�� ���ڿ� ����
         '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,  -- ������ �� ����
         '[' || RTRIM('<_Oracle_>', '> _ ') || ']' AS RTRIM_2   -- ������ �� Ư�� ���ڿ� ����
 FROM DUAL;
---------------------------------------------------------------------------------------------
/* ��¥ �����͸� �ٷ�� �Լ� */
-- ��¥ ������ + ���� : �ش� ��¥���� ���ڸ�ŭ ����� ���.
-- ��¥ ������ - ���� :  �ش� ��¥���� ���ڸ�ŭ ������ ���.
-- ��¥������ - ��¥������ : �� ��¥�� �ϼ��� ������
-- ��¥������ + ��¥������ : ����! 
 /* SYSDATE() : ���ٸ� �Է� ������ ����, ����Ŭ �����ͺ��̽� ������ ��ġ�� �ü���� ���� ��¥�� �ð��� ���� �� */
 SELECT SYSDATE AS NOW,
        SYSDATE -1 AS YESTERDAY,
        SYSDATE +1 AS TOMORROW
FROM DUAL;
---------------------------------------------------------------------------------------------
/* ADD_MONTHS(��¥������, ���� ������) */
SELECT SYSDATE, 
        ADD_MONTHS(SYSDATE, 4)
FROM DUAL;

SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS (HIREDATE, 120) �Ի�10�ֳ�
    FROM EMP;
---------------------------------------------------------------------------------------------
/* MONTHS_BETWEEN(��¥������, ��¥������) : �� ��¥���� ������ ���� ���ϴ� �Լ� */
-- TRUNC �� �����ؼ� ������ �� (TRUNC �� ���� �Ҽ��� ����)
SELECT EMPNO, ENAME, HIREDATE,
    TRUNC (MONTHS_BETWEEN(HIREDATE, SYSDATE)) �Ի簳����,
    TRUNC (MONTHS_BETWEEN(SYSDATE, HIREDATE)) �Ի簳����2
FROM EMP;
---------------------------------------------------------------------------------------------
/* NEXT_DAY(��¥������, ���Ϲ���) : Ư�� ��¥ �������� ���ƿ��� ������ ��¥�� ����ϴ� �Լ� */
/* LAST_DAY(��¥������) : Ư�� ��¥�� ���� ���� ������ ��¥�� ����ϴ� �Լ� */
SELECT SYSDATE, 
    NEXT_DAY(SYSDATE, 'ȭ����'),
    LAST_DAY ('1970/01/01')
FROM DUAL;
---------------------------------------------------------------------------------------------
/* ����Ŭ���� ��¥ �����͸� ����� �� ���� ���� */
-- CC, SCC : �⵵�� �� 2�ڸ��� ���
-- SYYYY, YYYY, YEAR, SYEAR, YYY, YY, Y : ������ ǥ���ϴ� ����
-- Q : �� �б��� �ι�° ���� 16�� ���� ǥ��
-- MONTH, MON, MM, RM : ���� ǥ���ϴ� ���� 
-- WW : �ش� ������ ���° ���ΰ�
-- W : �ش� ���� ���° ���ΰ�
-- DDD, DD, J : ���� ǥ���ϴ� ����(12�� ���� ����)
-- DAY, DY, D : ���ְ� ���۵Ǵ� ��¥
--HH12, HH24 : �ð��� ǥ�� 
SELECT SYSDATE, 
    TO_CHAR(SYSDATE, 'CC') FORMAT_CC, 
    TO_CHAR(SYSDATE, 'YY') FORMAT_YY,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS') "��/��/�� ��:��:��",
    TO_CHAR(SYSDATE, 'Q') FORMAT_Q,
    TO_CHAR(SYSDATE, 'DD') FORMAT_DD,
    TO_CHAR(SYSDATE, 'DDD') FORMAT_DDD,
    TO_CHAR(SYSDATE, 'HH') FORMAT_HH,
    TO_CHAR(SYSDATE, 'HH12') FORMAT_HH12,
    TO_CHAR(SYSDATE, 'HH24') FORMAT_HH24,
    TO_CHAR(SYSDATE, 'WW') FORMAT_WW,
    TO_CHAR(SYSDATE, 'W') FORMAT_W
FROM DUAL;    
---------------------------------------------------------------------------------------------
/* ���ڿ� ���ڿ��� ���Ͽ� ����ϱ�(�ڵ�����ȯ) */
SELECT EMPNO, ENAME, EMPNO + '500'
    FROM EMP
    WHERE ENAME = 'FORD';

-- �̰� ���� 
SELECT EMPNO, ENAME, EMPNO + 'ABCD'
    FROM EMP
    WHERE ENAME = 'FORD';
---------------------------------------------------------------------------------------------
/* ���� ����ȯ */
-- ��¥ �Ǵ� ���ڸ� ���ڷ� ��ȯ�ϱ� : TO_CHAR �Լ� 
-- TO_CHAR(��¥������, '��µǱ⸦ ���ϴ� ��������')
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS') ���糯¥�׽ð�
FROM DUAL;

SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS ����,
    TO_CHAR(SYSDATE, 'YY') AS "2�ڸ� ����",
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS') AS "��/��/�� ��:��:��",
    TO_CHAR(SYSDATE, 'Q') AS �б�,
    TO_CHAR(SYSDATE, 'DD') AS ��¥,
    TO_CHAR(SYSDATE, 'DDD') AS "1���� ��ĥ",
    TO_CHAR(SYSDATE, 'PM HH') AS "���� + ��",
    TO_CHAR(SYSDATE, 'HH') AS "�ð�12�ð�",
    TO_CHAR(SYSDATE, 'HH12') AS "�ð�12�ð�_2",
    TO_CHAR(SYSDATE, 'HH24') AS "�ð�24�ð�",
    TO_CHAR(SYSDATE, 'WW') AS "�ش���� ���°��",
    TO_CHAR(SYSDATE, 'W') AS "1���� ���°��"
FROM DUAL;

---------------------------------------------------------------------------------------------
/* Ư�� �� ���缭 ��¥ ����ϱ� */
-- TO_CHAR(��¥ ������, '��� ����', 'NLS_DATE_LANGUAGE=KOREA') : ��� ����
SELECT SYSDATE, 
    TO_CHAR(SYSDATE, 'MM') MM,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE=KOREAN') MON_KOR,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE=JAPANESE') MON_JAPANESE,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE=ENGLISH') MON_ENGLISH,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=KOREAN') MON_KOR,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=JAPANESE') MON_JAPANESE,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=ENGLISH') MON_ENGLISH,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=KOREAN') MON_KOR,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=JAPANESE') MON_JAPANESE,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') MON_ENGLISH,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE=KOREAN') MON_KOR,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE=JAPANESE') MON_JAPANESE,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE=ENGLISH') MON_ENGLISH
FROM DUAL;
---------------------------------------------------------------------------------------------
/* ���ڵ����� ���� ����ϱ� */
-- 9 : ������ ���ڸ� �ǹ� (���ڸ��� ä���� ����.)
-- 0 : ���ڸ��� 0���� ä��.
-- $ : �޷� ǥ�ø� ����
-- L : ���� ȭ����� ��ȣ�� ����
-- . : �Ҽ����� ǥ��
-- , : õ ������ ����
SELECT SAL,
    TO_CHAR(SAL, '$999.999') AS SAL_$,
    TO_CHAR(SAL, 'L999,999') AS SAL_L,
    TO_CHAR(SAL, '999,999.00') AS SAL_0,
    TO_CHAR(SAL, '000,999,999.00') AS SAL_1,
    TO_CHAR(SAL, '000999999.99') AS SAL_2,
    TO_CHAR(SAL, '999,999,00') AS SAL_3
FROM EMP;
---------------------------------------------------------------------------------------------
/*  ���ڿ����� ��õ� ��¥�� ��ȯ�ϴ� �Լ� */
-- TO_DATE('���ڿ�', '���ڿ� ����')
SELECT
    TO_DATE('220825', 'YY/MM/DD')
FROM DUAL;    

SELECT 
    TO_DATE('2022-08-25', 'YY/MM/DD')
FROM DUAL;

---------------------------------------------------------------------------------------------
-- ���ڿ��� ���ڷ� ��ȯ.
-- ���� Ÿ���� ���ڿ��� ���� ������ Ÿ������ ��ȯ���ִ� �Լ�. ��� ����� ������ �ʰ� ������ Ÿ�Ը� �ٲ�.
--SELECT 1300 - TO_NUMBER('1500')
--SELECT '1300' - '1500' -- �̰͵� ���������� ����Ŭ���� �������� ����. 
SELECT TO_NUMBER('1300') - TO_NUMBER('1500')
FROM DUAL;

---------------------------------------------------------------------------------------------
/* NULL ó�� �Լ� */
-- Ư�������� �࿡ ���� �����Ͱ� ���� ��� �������� ���� NULL�� �� ( 0 �� �ƴ�, ���� ������ �ǹ�)
-- ORACLE ���� ���̺��� ������ �� �ǵ������� NULL ���� ������ ���ϰ� ���� �� �� ����. 
-- NULL�� 0 �� �ƴϰ� ���� ���� ������ ������ �� ����. 
-- NVL(�˻��� ������ �Ǵ� ��(�ʼ�), NULL�� ��� ��ȯ�� ������) 

SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
    NVL(COMM, 0),  -- COMM�� NULL �̸� 0���� ��ȯ
    SAL+NVL(COMM, 0)  -- COMM �� NULL �� ��� 0�� ��ȯ�� �Ϳ� SAL�� ����.
FROM EMP;

-- NVL2( �˻��� ������ �Ǵ� ��(�ʼ�), NULL�� '�ƴ�' ��� ��ȯ�� ������ �Ǵ� ����(�ʼ�), NULL �� ��� ��ȯ�� ������ �Ǵ� ����(�ʽ�))
SELECT EMPNO, ENAME, SAL, COMM,
    NVL2(COMM, 'X', 'O'),  -- COMM�� NULL �̸� O, �ƴϸ� X ��ȯ
    SAL+NVL2(COMM, SAL*12+COMM, SAL*12) �ѿ���  -- COMM �� NULL �� ��� SAL*12, �ƴҰ�� SAL*12+COMM
FROM EMP;

---------------------------------------------------------------------------------------------
/* NULLIF( A, B ) : �� ���� �����ϸ� NULL ��ȯ�ϰ� �ƴϸ� ù��° �� ��ȯ. */
SELECT NULLIF(10, 10),
    NULLIF('A', 'B') 
FROM DUAL;
---------------------------------------------------------------------------------------------
/* DECODE : �־��� ������ ���� ���� ���� ��ġ�ϴ� ���� ����ϰ�, ������ �⺻�� ���(switch ~ case�� ����.) */
-- DECODE(�˻� ����� �� ���� ������, ����1, ����1�� ��ġ�� ��� ������ ������, ����2, ����2�� ��ġ�� ��� ������ ������, ............, ��ġ�� ��찡 ���� ��� ��ȯ ��)
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB,
        'MANAGER', SAL*1.1,
        'SALESMAN', SAL*1.05,
        'ANALYST', SAL, 
        SAL*1.03) AS �޿��λ�
FROM EMP;    
---------------------------------------------------------------------------------------------
/* CASE(�˻��� ���� ������, WHEN[����1] THEN[TRUE �� ��� ������ ������] ........ ELSE[]) */
SELECT EMPNO, ENAME, JOB, SAL, 
    CASE JOB
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALSMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS �޿��λ�    
FROM EMP;            

SELECT EMPNO, ENAME, COMM, 
    CASE 
        WHEN COMM IS NULL THEN '�ش���׾���'
        WHEN COMM = 0 THEN '�������'
        WHEN COMM > 0 THEN '���� : ' || COMM
    END AS ����
FROM EMP;    
        









