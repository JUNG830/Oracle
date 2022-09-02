/* �޴� ���̺� ����� */

CREATE TABLE MENU_INFO (
/*�޴� ���� ��ȣ*/   MPART    NUMBER,
/*�޴� ����*/       PARTNAME VARCHAR2(20),
/*�޴� ��ȣ*/       MNO      NUMBER PRIMARY KEY, -- �⺻Ű
/*�޴� �̸�*/       MNAME    VARCHAR2(20),
/*�޴� �ݾ�*/       MPRICE   NUMBER
);

INSERT INTO MENU_INFO VALUES (1000, 'Ŀ��', 1001, '����������', 2500);
INSERT INTO MENU_INFO VALUES (1000, 'Ŀ��', 1002, '�Ƹ޸�ī��', 4000);
INSERT INTO MENU_INFO VALUES (1000, 'Ŀ��',  1003, '��', 5000);
INSERT INTO MENU_INFO VALUES (1000, 'Ŀ��',  1004, 'ī���ī', 5500);
INSERT INTO MENU_INFO VALUES (2000, '��Ŀ��',  2001, '���ڿ���', 2500);
INSERT INTO MENU_INFO VALUES (2000, '��Ŀ��',  2002, '����', 2500);
INSERT INTO MENU_INFO VALUES (2000, '��Ŀ��',  2003, 'ȫ��', 2500);
INSERT INTO MENU_INFO VALUES (2000, '��Ŀ��',  2004, '��ũƼ', 2500);

SELECT * FROM MENU_INFO;
DROP TABLE MENU_INFO;


-------------------------------------------------------------------------
/* �ɼ� ���̺� ����� */

CREATE TABLE CAFE_OPTION (
	CUP_SIZE    VARCHAR2(1) CHECK (CUP_SIZE = 'S' OR CUP_SIZE = 'M' OR CUP_SIZE = 'L'),
	SIZE_PRICE  NUMBER,
    ADD_SHOT    NUMBER,
    SHOT_PRICE  NUMBER,
	ADD_SYRUP   VARCHAR2(30) CHECK (ADD_SYRUP = '������� �÷�' OR ADD_SYRUP = '�ٴҶ� �÷�' OR ADD_SYRUP = 'ī��� �÷�'),
    SYRUP_PRICE NUMBER,
	HOT_ICE     VARCHAR2(5) CHECK (HOT_ICE = 'HOT' OR HOT_ICE = 'ICE')
);

INSERT INTO OPTION_INFO VALUES ('S', 0, 1, 400, );
INSERT INTO OPTION_INFO VALUES ('M', 500);
INSERT INTO OPTION_INFO VALUES ('L', 1000);

UPDATE OPTION_INFO
    SET SIZE_PRICE = 
        (CASE 
        WHEN CUP_SIZE = 'S'
            THEN 0
        WHEN CUP_SIZE = 'M'
            THEN 500
        WHEN CUP_SIZE = 'L'
            THEN 1000
        END );        

SELECT * FROM OPTION_INFO;
DROP TABLE OPTION_INFO;

