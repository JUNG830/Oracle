--1. EMPLOYEES ���̺��� King�� ������ �ҹ��ڷ� �˻��ϰ� �����ȣ, ����, ������(�ҹ��ڷ�),�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME, CONCAT(' ',  LAST_NAME)) �̸�, UPPER(JOB_ID), DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE UPPER(LAST_NAME) = 'KING';
    
--2. EMPLOYEES ���̺��� King�� ������ �빮�ڷ� �˻��ϰ� �����ȣ, ����, ������(�빮�ڷ�),�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME, CONCAT(' ',  LAST_NAME)) �̸�, LOWER(JOB_ID), DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE LOWER(LAST_NAME) = 'king';

SELECT * 
    FROM EMPLOYEES;

--3. DEPARTMENTS ���̺��� (�μ���ȣ�� �μ��̸�), �μ��̸��� ��ġ��ȣ�� ���Ͽ� ����ϵ��� �϶�.
SELECT (DEPARTMENT_ID || ' : ' || DEPARTMENT_NAME) "�μ�+�̸�",
            (DEPARTMENT_NAME || ' : ' || LOCATION_ID) "�μ�+��ġ"
FROM DEPARTMENTS;

SELECT * 
    FROM DEPARTMENTS;

--4. EMPLOYEES ���̺��� �̸��� ù ���ڰ� ��K�� ���� ũ�� ��Y������ ���� ����� ������
---- �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ����϶�.
---- �� �̸������� �����Ͽ���.
SELECT * 
    FROM EMPLOYEES;
-- SUBSTR ����ؼ��� ����
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE FIRST_NAME > 'L'
        AND  FIRST_NAME < 'Y'
    ORDER BY FIRST_NAME;

--5. EMPLOYEES ���̺��� 20�� �μ� �� �̸��� ���� �� �޿��� �ڸ����� 
---- �����ȣ, �̸�, �̸��� �ڸ���(LENGTH), �޿�, �޿��� �ڸ����� ����϶�.
---- LENGTHB�� BYTE ȥ������ ����!
SELECT  EMPLOYEE_ID, LENGTH(LAST_NAME) �̸����ڼ�, SALARY, LENGTH(SALARY) �޿��ڸ���
FROM EMPLOYEES;

--6. EMPLOYEES ���̺��� �̸� �� ��e������ ��ġ�� ����϶�.
SELECT LAST_NAME, INSTR(FIRST_NAME, 'e', 1) AS ��ġ
    FROM EMPLOYEES;
    
--7. EMPLOYEES ���̺��� �μ���ȣ�� 80�� ����� �޿��� 30���� ���� �������� ���Ͽ� ����϶�.
SELECT FIRST_NAME, MOD(SALARY, 30) ������
    FROM (SELECT *
                 FROM EMPLOYEES
                 WHERE DEPARTMENT_ID = 80);
--8. EMPLOYEES ���̺��� ������� �ٹ��� ���� ���� ���� �ΰ��� ����Ͽ���.
---- �� �ٹ� �ϼ��� ���� ��� ������ ����Ͽ���.
SELECT HIRE_DATE, 
            TRUNC((SYSDATE - HIRE_DATE) / 7 ) || '�� ' || 
            TRUNC(MOD((SYSDATE - HIRE_DATE), 7)) || '��'  "�ٹ��ϼ�(��, ��)"
FROM EMPLOYEES
ORDER BY  "�ٹ��ϼ�(��, ��)" DESC;

--9. EMPLOYEES ���̺��� �μ� 50���� �޿� �տ� $�� �����ϰ� 3�ڸ����� ,�� ����϶�
SELECT TO_CHAR(SALARY, '$999,999,999') �޿�
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

--10. EMPLOYEES ���̺��� �μ����� �ο���, ��� �޿�, �����޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� ���
SELECT DEPARTMENT_ID �μ���ȣ, COUNT(*) �μ����ο���, TRUNC(AVG(SALARY)) ���, MIN(SALARY)�ּ�, MAX(SALARY)�ְ�, SUM(SALARY) ��
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

--11. EMPLOYEES ���̺��� 30�� �μ� �� �̸��� ��� ������ �����Ͽ� ���
SELECT CONCAT(LAST_NAME, JOB_ID) 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

--12. EMPLOYEES ���̺��� ������ �޿��� ����� 10000 �̻��� ������ ���ؼ� ������,��� �޿�, �޿��� ���� ���Ͽ� ���
SELECT JOB_ID �����̸�, 
            TRUNC(AVG(SALARY)) ��ձ޿�, 
            SUM(SALARY) �޿���
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) >= 10000;

-- 13. EMPLOYEES ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ���
SELECT DEPARTMENT_ID �μ���ȣ, 
            COUNT(*) �ο���, 
            SUM(SALARY) �޿���
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 4;







