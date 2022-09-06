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
CREATE TABLE MEMBER_INFO (
    MEMBER_ID       NUMBER PRIMARY KEY,
    MEMBER_NAME     VARCHAR2(20) UNIQUE,
    MEMBER_PHONE    VARCHAR2(20) );
    
/* ȸ�� ���� �Է� */
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '�̽���', '010-4443-2345');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '�̽���', '010-4566-3456');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '�̽���', '010-1234-5674');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '������', '010-5234-4578');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '������', '010-2376-9756');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '���ϴ�', '010-3452-6785');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '������', '010-1135-3467');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '������', '010-3574-2367');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '������', '010-3567-3457');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '���ֿ�', '010-7888-5678');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '������ ������', '010-3333-7788');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '������', '010-5678-9804');
INSERT INTO MEMBER_INFO VALUES(SEQ_MEMBER_ID.NEXTVAL, '�̿���', '010-9374-2345');

/* ȸ����ȣ ���� ������ */
CREATE SEQUENCE SEQ_MEMBER_ID
START WITH 5000
INCREMENT BY 1
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_MEMBER_ID;


SELECT *
FROM MEMBER_INFO;

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
    �г��� VARCHAR2(30),  -- DEFAULT �ֹ�����(�ֹ���ȣ) NOT NULL,
    �޴��� VARCHAR2(30) NOT NULL,
    �ɼ��̸� VARCHAR2(30)
);

--�ֹ� ���� ����
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, '�̽���', '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, '�̽���', '�ڹ�Ĩ ����Ǫġ��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, '�̽���', '��׷��� Ƽ', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, '������', '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-1, '������', '�Ƹ޸�ī��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-1, '���ϴ�', '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-1, '������', '�ڹ�Ĩ ����Ǫġ��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-30, '������', '�Ƹ޸�ī��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-30, '������', '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-60, '���ֿ�', '�ڹ�Ĩ ����Ǫġ��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-60, '������', '�Ƹ޸�ī��', '���� �� ��');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-90, '������', '�Ƹ޸�ī��', '�� �߰�');
INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-90, '�̿���', '��', '���� �� ��');

INSERT INTO �ֹ����� VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, ' ', '��', '�� �߰�');

--�ֹ���ȣ ������ ����
CREATE SEQUENCE SEQ_ORDER
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_ORDER;

---------------------------------------------------------------
/* ���� �Ѹ��� ��ȸ ������ */

SELECT �ֹ���, NVL(�޴���,'�Ϻ� �հ�') AS �޴���, SUM(�Ǹŷ�) ���Ǹŷ�, SUM(�Ѹ����) �Ѹ����
FROM (
SELECT �ֹ���, �ֹ�����.�޴��� �޴���, COUNT(*) �Ǹŷ�, SUM((�޴�����) + (�ɼ�.�߰��ݾ�)) �Ѹ���� 
    FROM �ֹ�����, �ɼ�, ī��޴� 
WHERE �ֹ�����.�޴��� = ī��޴�.�޴���
    AND �ɼ�.�ɼ��̸� = �ֹ�����.�ɼ��̸�
GROUP BY �ֹ���, �ֹ�����.�޴���
) A
GROUP BY ROLLUP(�ֹ���, �޴���);


SELECT ����.�ֹ���, ����.�޴���, COUNT(*) as ����, SUM(����.�޴�����+�ɼ�.�߰��ݾ�) as �����
FROM �ɼ� JOIN (SELECT * FROM �ֹ����� NATURAL JOIN ī��޴�) ����
ON �ɼ�.�ɼ��̸� = ����.�ɼ��̸�
GROUP BY ����.�ֹ���, ����.�޴���
ORDER BY ����.�ֹ���, ����.�޴���;

--ORDER BY �ֹ���;

/* ���� ����� ��ȸ ������ */
SELECT TO_CHAR(�ֹ���, 'MON') ��, COUNT(*) �Ǹŷ�, SUM((�޴�����) + (�ɼ�.�߰��ݾ�)) �Ѹ���� 
    FROM �ֹ�����, �ɼ�, ī��޴�
WHERE �ֹ�����.�޴��� = ī��޴�.�޴���
    AND �ɼ�.�ɼ��̸� = �ֹ�����.�ɼ��̸�
GROUP BY TO_CHAR(�ֹ���, 'MON')
ORDER BY ��;

/* �г��Ӻ� ����� ��ȸ ������ */ 
--�ֹ�����-�г����� unique�� �����ؾ� ����
--�ֹ�����-insert�� ������ �г����� �ְ� �׽�Ʈ
SELECT TO_CHAR(�г���), COUNT(*) �Ǹŷ�, SUM((�޴�����) + (�ɼ�.�߰��ݾ�)) �Ѹ���� 
    FROM �ֹ�����, �ɼ�, ī��޴�
WHERE �ֹ�����.�޴��� = ī��޴�.�޴���
    AND �ɼ�.�ɼ��̸� = �ֹ�����.�ɼ��̸�
GROUP BY �г���
ORDER BY �г���;
















