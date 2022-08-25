-- 1. EMPNO������ EMP���̺��� ��� �̸��� �ټ����� �̻��̸� �������� �̸��� ��� ���� ���
--      MASKING_EMPNO ������ �����ȣ �� ���ڸ� �� ���ڸ��� * ��ȣ�� ���
--      MASKING_ENAME ������ ��� �̸��� ù���ڸ� �����ְ� ���������� ����ŭ * ��ȣ ���.
-- LPAD/RPAD('���ڿ�', �ѱ���, �����ʿ� ä�� ����)
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO, 1, 2), LENGTH(ENAME) - 1, '*') AS MASKING_EMPNO,
       ENAME, 
      SUBSTR(ENAME, 1, 1) || LPAD('*', LENGTH(ENAME) - 2, '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) = 5 ;


-- 2. EMP ���̺��� ������� �� ��� �ٹ��ϼ��� 21.5�� 
-- �Ϸ� 8�ð� �ٹ��� ���� �� �Ϸ� �޿� (DAY_PAY) �� �ñ�(TIME_PAY)�� ���
-- ��, �Ϸ� �޿��� �Ҽ��� ����° �ڸ����� ������ �ñ��� �ι�° �ڸ����� �ݿø�

SELECT ENAME, SAL,
        TRUNC(SAL / 21.5, 2)  AS DAY_PAY,
        ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
FROM EMP;    

-- 3. EMP ���̺��� ������� �Ի����� �������� 3������ ���� �� �����Ͽ� �������� ��
-- ����� �������� �Ǵ� ��¥ (R_JOB) �� YYY-MM-DD �������� ���
-- ��, �߰������� ���� ����� �߰������� N/A�� ���

SELECT EMPNO, ENAME, HIREDATE,
    TO_CAHR(NEXT_DATE(ADD_MONTHS(HIREDATE, 3), '������'), 'YYYY-MM-DD' ) AS R_JOB,
    NVL(TO_CHAR(COMM, 'N/A')) AS COMM
FROM EMP;


-- 4. EMP ���̺��� ��� ����� ������� ���� ����� �����ȣ MGR�� ������ ���� ��ȯ�ؼ� CHG_MGR ���� ���
-- ���ӻ�� ������ 0000
-- ���ӻ�� �� ���ڸ� 75 = 5555
-- ���ӻ�� �� ���ڸ� 76 = 6666
-- ���ӻ�� �� ���ڸ� 77 = 7777
-- ���ӻ�� �� ���ڸ� 78 = 8888
-- �� �ܴ� �״�� ���

SELECT EMPNO, ENAME, MGR, 
    AS CHG_MGR

    
    
    
    
    
    
    