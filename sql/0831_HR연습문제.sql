--1. EMPLOYEES ���̺��� King�� ������ �ҹ��ڷ� �˻��ϰ� �����ȣ, ����, ������(�ҹ��ڷ�),�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID, UPPER(LAST_NAME), UPPER(JOB_ID), DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE UPPER(LAST_NAME) = 'KING';
    
--1-2. EMPLOYEES ���̺��� King�� ������ �빮�ڷ� �˻��ϰ� �����ȣ, ����, ������(�빮�ڷ�),�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID, LOWER(LAST_NAME), LOWER(JOB_ID), DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE LOWER(LAST_NAME) = 'king';

SELECT * 
    FROM EMPLOYEES;

--2. DEPARTMENTS ���̺��� (�μ���ȣ�� �μ��̸�), �μ��̸��� ��ġ��ȣ�� ���Ͽ� ����ϵ��� �϶�.
SELECT (DEPARTMENT_ID || ' : ' || DEPARTMENT_NAME) "�μ�+�̸�",
            (DEPARTMENT_NAME || ' : ' || LOCATION_ID) "�μ�+��ġ"
FROM DEPARTMENTS;

SELECT * 
    FROM DEPARTMENTS;

--3. EMPLOYEES ���̺��� �̸��� ù ���ڰ� ��K�� ���� ũ�� ��Y������ ���� ����� ������
---- �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ����϶�.
---- �� �̸������� �����Ͽ���.
SELECT * 
    FROM EMPLOYEES;

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE LAST_NAME > 'K'
        AND  LAST_NAME < 'Y'
    ORDER BY LAST_NAME;

--4. EMPLOYEES ���̺��� 20�� �μ� �� �̸��� ���� �� �޿��� �ڸ����� 
---- �����ȣ, �̸�, �̸��� �ڸ���(LENGTH), �޿�, �޿��� �ڸ����� ����϶�.
---- LENGTHB�� BYTE ȥ������ ����!
SELECT  EMPLOYEE_ID, LENGTH(LAST_NAME) �̸����ڼ�, SALARY, LENGTH(SALARY) �޿��ڸ���
FROM EMPLOYEES;

--5. EMPLOYEES ���̺��� �̸� �� ��e������ ��ġ�� ����϶�.
SELECT LAST_NAME, INSTR(LAST_NAME, 'e') AS ��ġ
    FROM EMPLOYEES;
    
--6. EMPLOYEES ���̺��� �μ���ȣ�� 80�� ����� �޿��� 30���� ���� �������� ���Ͽ� ����϶�.
SELECT SALARY, MOD(SALARY, 30) ������
    FROM (SELECT *
                 FROM EMPLOYEES
                 WHERE DEPARTMENT_ID = 80);
--7. EMPLOYEES ���̺��� ������� �ٹ��� ���� ���� ���� �ΰ��� ����Ͽ���.
---- �� �ٹ� �ϼ��� ���� ��� ������ ����Ͽ���.
SELECT HIRE_DATE, 
            TRUNC((SYSDATE - HIRE_DATE) / 7 ) || ', ' || 
            TRUNC(SYSDATE - HIRE_DATE)  "�ٹ��ϼ�(��, ��)"
FROM EMPLOYEES
ORDER BY TRUNC(SYSDATE - HIRE_DATE) DESC;

--8. EMPLOYEES ���̺��� �μ� 50���� �޿� �տ� $�� �����ϰ� 3�ڸ����� ,�� ����϶�
SELECT TO_CHAR(SALARY, '$999,999,999') �޿�
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

--9. EMPLOYEES ���̺��� �μ����� �ο���, ��� �޿�, �����޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� ���
SELECT DEPARTMENT_ID �μ���ȣ, COUNT(*) �μ����ο���, TRUNC(AVG(SALARY)) ���, MIN(SALARY)�ּ�, MAX(SALARY)�ְ�, SUM(SALARY) ��
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

--10. EMPLOYEES ���̺��� 30�� �μ� �� �̸��� ��� ������ �����Ͽ� ���
SELECT CONCAT(LAST_NAME, JOB_ID) 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

--11. EMPLOYEES ���̺��� ������ �޿��� ����� 10000 �̻��� ������ ���ؼ� ������,��� �޿�, �޿��� ���� ���Ͽ� ���
SELECT JOB_ID �����̸�, 
            TRUNC(AVG(SALARY)) ��ձ޿�, 
            SUM(SALARY) �޿���
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) >= 10000;

-- 12. EMPLOYEES ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ���
SELECT DEPARTMENT_ID �μ���ȣ, 
            COUNT(*) �ο���, 
            SUM(SALARY) �޿���
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 4;







