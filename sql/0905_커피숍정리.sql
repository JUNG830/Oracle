SELECT *
FROM EMP;



/* ī�װ� ���̺� */
DROP TABLE ī�װ�;
SELECT * FROM ī�װ�;

CREATE TABLE ī�װ� (
    ���� VARCHAR2(30) PRIMARY KEY
);

INSERT INTO ī�װ� VALUES('����������');
INSERT INTO ī�װ� VALUES('����Ǫġ��');
INSERT INTO ī�װ� VALUES('Ƽ�ٳ�');
---------------------------------------------------------------
/* ȸ������ */ 
CREATE TABLE ȸ������ (
    ȸ����ȣ       NUMBER PRIMARY KEY,
    ȸ���̸�     VARCHAR2(20) NOT NULL,
    ȸ����ȭ��ȣ    VARCHAR2(20) );
    
/* ȸ�� ���� �Է� */
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '�̽���', '010-4443-2345');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '�̽���', '010-4566-3456');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '�̽���', '010-1234-5674');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '������', '010-5234-4578');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '������', '010-2376-9756');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '���ϴ�', '010-3452-6785');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '������', '010-1135-3467');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '������', '010-3574-2367');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '������', '010-3567-3457');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '���ֿ�', '010-7888-5678');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '������ ������', '010-3333-7788');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '������', '010-5678-9804');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '�̿���', '010-9374-2345');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '�̽���', '010-1111-1111');
INSERT INTO ȸ������ VALUES(TO_CHAR(SEQ_ȸ����ȣ.NEXTVAL), '�̽���', '010-2222-3333');

/* ȸ����ȣ ���� ������ */
CREATE SEQUENCE SEQ_ȸ����ȣ
START WITH 5000
INCREMENT BY 1
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_ȸ����ȣ;


SELECT *
FROM ȸ������;
DROP TABLE ȸ������;
---------------------------------------------------------------
/* ī��޴� ���̺� */
DROP TABLE ī��޴�;
SELECT * FROM ī��޴�;

CREATE TABLE ī��޴� (
    �޴��� VARCHAR(30) NOT NULL,
    �޴����� INTEGER CHECK(�޴����� > 0) NOT NULL,
    ���� VARCHAR2(30) CONSTRAINT �������� REFERENCES ī�װ�(����)
);

-- ī��޴� �߰�
INSERT INTO ī��޴� VALUES('�Ƹ޸�ī��', 4500, '����������');
INSERT INTO ī��޴� VALUES('��', 5000, '����������');
INSERT INTO ī��޴� VALUES('�ڹ�Ĩ ����Ǫġ��', 6300, '����Ǫġ��');
INSERT INTO ī��޴� VALUES('ī��� ����Ǫġ��', 5900, '����Ǫġ��');
INSERT INTO ī��޴� VALUES('�ڸ� ��Ϻ�Ƽ', 5700, 'Ƽ�ٳ�');
INSERT INTO ī��޴� VALUES('��׷��� Ƽ', 4500, 'Ƽ�ٳ�');
---------------------------------------------------------------
/* �ɼ� ���̺� */
DROP TABLE �ɼ�;
SELECT * FROM �ɼ�;

CREATE TABLE �ɼ� (
    �ɼ��̸� VARCHAR2(30) DEFAULT '���� �� ��' NOT NULL,
    �߰��ݾ� NUMBER
);

-- �ɼǸ޴� �߰�
INSERT INTO �ɼ� VALUES('�� �߰�', 500);
INSERT INTO �ɼ� VALUES('�÷� �߰�', 500);
INSERT INTO �ɼ� VALUES('���� �� ��', 0);
---------------------------------------------------------------
/* �ֹ����� ���̺� */
DROP TABLE �ֹ�����;
SELECT * FROM �ֹ�����;

CREATE TABLE �ֹ����� (
    �ֹ���ȣ NUMBER,
    �ֹ��� DATE NOT NULL,
    ȸ����ȣ NUMBER NOT NULL,  -- DEFAULT �ֹ�����(�ֹ���ȣ) NOT NULL,
    �޴��� VARCHAR2(30) NOT NULL,
    �ɼ��̸� VARCHAR2(30)
);

--�ֹ� ���� ����
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5000, '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5000, '��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5001, '�ڹ�Ĩ ����Ǫġ��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5002, '��׷��� Ƽ', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5003, '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5004, '�Ƹ޸�ī��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+1, 5005, '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+1, 5006, '�ڹ�Ĩ ����Ǫġ��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+30, 5007, '�Ƹ޸�ī��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+30, 5008, '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+60, 5009, '�ڹ�Ĩ ����Ǫġ��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+60, 5010, '�Ƹ޸�ī��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+90, 5011, '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+90, 5012, '��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+90, 5013, '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+90, 5014, '��', '���� �� ��');



--�ֹ���ȣ ������ ����
CREATE SEQUENCE SEQ_ORDER
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_ORDER;
---------------------------------------------------------------
/* �հ�ǥ */

SELECT ����.�ֹ���, ����.�ֹ���ȣ, ȸ��.ȸ����ȣ, ȸ��.ȸ���̸�, ����.�޴���, ����.�޴�����, ����.�ɼ��̸�, �ɼ�.�߰��ݾ�, ����.�޴�����+�ɼ�.�߰��ݾ� as ���ֹ��ݾ�
FROM �ɼ� JOIN (SELECT * FROM �ֹ����� NATURAL JOIN ī��޴�) ����
        ON �ɼ�.�ɼ��̸� = ����.�ɼ��̸�
    LEFT JOIN ȸ������ ȸ��
        ON ȸ��.ȸ����ȣ = ����.ȸ����ȣ
ORDER BY �ֹ���ȣ;

---------------------------------------------------------------
/* (��)���� �Ѹ��� ��ȸ ������ */

SELECT NVL(TO_CHAR(�ֹ���), '��ü') AS ��¥, NVL(�޴���, '�հ�') AS �޴���, 
        SUM(�Ǹŷ�) ���Ǹŷ�, SUM(�Ѹ����) �Ѹ����
FROM (
    SELECT �ֹ���, �ֹ�����.�޴��� �޴���, COUNT(*) �Ǹŷ�, SUM((�޴�����) + (�ɼ�.�߰��ݾ�)) �Ѹ���� 
        FROM �ֹ�����, �ɼ�, ī��޴� 
    WHERE �ֹ�����.�޴��� = ī��޴�.�޴���
        AND �ɼ�.�ɼ��̸� = �ֹ�����.�ɼ��̸�
    GROUP BY �ֹ���, �ֹ�����.�޴���
) A
GROUP BY ROLLUP(�ֹ���, �޴���);

---------------------------------------------------------------
/* (��)���� �Ѹ��� ��ȸ ������ */
SELECT �ֹ���, COUNT(*) �Ǹŷ�, SUM((�޴�����) + (�ɼ�.�߰��ݾ�)) �Ѹ���� 
    FROM �ֹ�����, �ɼ�, ī��޴� 
WHERE �ֹ�����.�޴��� = ī��޴�.�޴���
    AND �ɼ�.�ɼ��̸� = �ֹ�����.�ɼ��̸�
GROUP BY �ֹ���
ORDER BY �ֹ���;


/* ���� ����� ��ȸ ������ */
SELECT TO_CHAR(�ֹ���, 'MM"��"') ��, COUNT(*) �Ǹŷ�, SUM((�޴�����) + (�ɼ�.�߰��ݾ�)) �Ѹ���� 
    FROM �ֹ�����, �ɼ�, ī��޴�
WHERE �ֹ�����.�޴��� = ī��޴�.�޴���
    AND �ɼ�.�ɼ��̸� = �ֹ�����.�ɼ��̸�
GROUP BY TO_CHAR(�ֹ���, 'MM"��"')
ORDER BY ��;

/* ȸ���� ����� ��ȸ ������ */ 
SELECT ȸ��.ȸ����ȣ ȸ����ȣ, ȸ��.ȸ���̸� ȸ���̸�, COUNT(*) �Ǹŷ�, SUM((�޴�����) + (�ɼ�.�߰��ݾ�)) �Ѹ���� 
    FROM �ֹ����� �ֹ�
        INNER JOIN ī��޴� �޴�
            ON �ֹ�.�޴��� = �޴�.�޴���
        LEFT JOIN �ɼ� �ɼ�     
            ON �ɼ�.�ɼ��̸� = �ֹ�.�ɼ��̸�
        LEFT JOIN ȸ������ ȸ��
            ON ȸ��.ȸ����ȣ = �ֹ�.ȸ����ȣ
GROUP BY ȸ��.ȸ���̸�, ȸ��.ȸ����ȣ
ORDER BY ȸ��.ȸ����ȣ;