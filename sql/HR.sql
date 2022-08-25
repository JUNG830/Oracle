SELECT *
FROM EMPLOYEES;

-- 1. EMPLOYEES ���̺��� King�� ������ �ҹ��ڷ� �˻��ϰ� �����ȣ, ����, ������(�ҹ��ڷ�),�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID,FIRST_NAME, LOWER(LAST_NAME), LOWER(JOB_ID), DEPARTMENT_ID
FROM  EMPLOYEES
WHERE LOWER(LAST_NAME) = 'king';
-- 2. EMPLOYEES ���̺��� King�� ������ �빮�ڷ� �˻��ϰ� �����ȣ, ����, ������(�빮�ڷ�),�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID,FIRST_NAME, UPPER(LAST_NAME), UPPER(JOB_ID), DEPARTMENT_ID
FROM  EMPLOYEES
WHERE UPPER(LAST_NAME) = 'KING';

--3. DEPARTMENTS ���̺��� (�μ���ȣ�� �μ��̸�), �μ��̸��� ��ġ��ȣ�� ���Ͽ� ����ϵ��� �϶�.

SELECT * FROM DEPARTMENTS;
SELECT
    DEPARTMENT_ID || DEPARTMENT_NAME || LOCATION_ID AS DEPTLOCA
FROM DEPARTMENTS;
--4. EMPLOYEES ���̺��� �̸��� ù ���ڰ� ��K�� ���� ũ�� ��Y������ ���� ����� ������
---- �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ����϶�.
---- �� �̸������� �����Ͽ���.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SUBSTR( FIRST_NAME, 1, 1) > 'K' AND SUBSTR( FIRST_NAME, 1, 1) < 'Y'
ORDER BY FIRST_NAME;

--5. EMPLOYEES ���̺��� 20�� �μ� �� �̸��� ���� �� �޿��� �ڸ����� 
---- �����ȣ, �̸�, �̸��� �ڸ���(LENGTH), �޿�, �޿��� �ڸ����� ����϶�.
---- LENGTHB�� BYTE ȥ������ ����!
SELECT 
    EMPLOYEE_ID, 
    FIRST_NAME, 
    LENGTH(FIRST_NAME) AS �̸�����, 
    SALARY, 
    LENGTH(SALARY) AS �޿�����
FROM EMPLOYEES;

--6. EMPLOYEES ���̺��� �̸� �� ��e������ ��ġ�� ����϶�.
SELECT FIRST_NAME,
     INSTR(FIRST_NAME, 'e', 1) AS e����ġ
FROM EMPLOYEES;     

--7. EMPLOYEES ���̺��� �μ���ȣ�� 80�� ����� �޿��� 30���� ���� �������� ���Ͽ� ����϶�.
--8. EMPLOYEES ���̺��� ������� �ٹ��� ���� ���� ���� �ΰ��� ����Ͽ���.
---- �� �ٹ� �ϼ��� ���� ��� ������ ����Ͽ���.
--9. EMPLOYEES ���̺��� �μ� 50���� �޿� �տ� $�� �����ϰ� 3�ڸ����� ,�� ����϶�
--10. EMPLOYEES ���̺��� ������� �ٹ��� ���� ���� ���� �ΰ��� ����Ͽ���. 
---- �� �ٹ� �ϼ��� ���� ��� ������ ����Ͽ���.
