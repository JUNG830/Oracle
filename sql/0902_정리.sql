
-- 1) 메뉴 테이블
CREATE TABLE MENU_INFO (
	MPART    NUMBER,
	PARTNAME VARCHAR(20),
	MNO      NUMBER PRIMARY KEY, -- 기본키
	MNAME    VARCHAR(20),
	MPRICE   NUMBER
);

INSERT INTO MENU_INFO VALUES (1000, '커피', 1001, '에스프레소', 2500);
INSERT INTO MENU_INFO VALUES (1000, '커피', 1002, '아메리카노', 4000);
INSERT INTO MENU_INFO VALUES (1000, '커피',  1003, '라떼', 5000);
INSERT INTO MENU_INFO VALUES (1000, '커피',  1004, '카페모카', 5500);
INSERT INTO MENU_INFO VALUES (2000, '논커피',  2001, '초코우유', 2500);
INSERT INTO MENU_INFO VALUES (2000, '논커피',  2002, '녹차', 2500);
INSERT INTO MENU_INFO VALUES (2000, '논커피',  2003, '홍차', 2500);
INSERT INTO MENU_INFO VALUES (2000, '논커피',  2004, '밀크티', 2500);

SELECT * FROM MENU_INFO;

-- 2) 옵션 코드 테이블
CREATE TABLE OPTION_CODE_INFO (
	OPTION_CODE   VARCHAR(20) PRIMARY KEY,
	OPTION_NAME VARCHAR(20)
);

INSERT INTO OPTION_CODE_INFO VALUES ('001', '사이즈 업');
INSERT INTO OPTION_CODE_INFO VALUES ('002', '샷 추가');
INSERT INTO OPTION_CODE_INFO VALUES ('003', '시럽 추가');

SELECT * FROM OPTION_CODE_INFO;

-- 3) 상품별 옵션 정보 테이블
CREATE TABLE OPTION_INFO (
	MNO NUMBER,
	OPTION_CODE   VARCHAR(20),
	OPTION_PRICE NUMBER
);

INSERT INTO OPTION_INFO VALUES (1001, '002', 500);
INSERT INTO OPTION_INFO VALUES (1002, '001', 500);
INSERT INTO OPTION_INFO VALUES (1002, '002', 500);
INSERT INTO OPTION_INFO VALUES (1002, '003', 300);
INSERT INTO OPTION_INFO VALUES (1003, '001', 500);
INSERT INTO OPTION_INFO VALUES (1003, '002', 500);
INSERT INTO OPTION_INFO VALUES (1003, '003', 300);
INSERT INTO OPTION_INFO VALUES (2001, '001', 500);

DROP TABLE OPTION_INFO;

-- 어떤 메뉴를 선택하시겠습니까? (한글로 선택할 것)
SELECT MNO, MNAME, MPRICE
FROM MENU_INFO;


-- 옵션을 선택해주세요
SELECT C.OPTION_CODE, C.OPTION_NAME
FROM MENU_INFO M
INNER JOIN OPTION_INFO O ON M.MNO = O.MNO
INNER JOIN OPTION_CODE_INFO C ON O.OPTION_CODE = C.OPTION_CODE
WHERE M.MNAME = '아메리카노';

-- 4) 주문 테이블
CREATE TABLE ORDER_INFO (
    ORDER_DATE  DATE,
    ORDER_NO    NUMBER PRIMARY KEY,
--    ORDER_MENU  VARCHAR2(20) DEFAULT 
    MNO         NUMBER,
    PRICE NUMBER
);

-- SET @MNAME = '아메리카노';
-- SET @MNO = (SELECT MNO FROM MENU_INFO WHERE MNAME = @MNAME);
--    
INSERT INTO ORDER_INFO VALUES (SYSDATE, 1,'1002', 0);
INSERT INTO ORDER_INFO VALUES (SYSDATE, 2,'1003', 0);
INSERT INTO ORDER_INFO VALUES (SYSDATE, 3, '1004', 0);
    
SELECT * FROM ORDER_INFO;
DROP TABLE ORDER_INFO;

CREATE SEQUENCE SEQ_EMPID
START WITH 1 -- 몇번부터 시작할래
INCREMENT BY 1  -- 몇씩 증가시킬 것인가.
MAXVALUE 1000  -- 몇번까지 반복할거니?
NOCYCLE -- 반복하지 않음
NOCACHE;

DROP SEQUENCE SEQ_EMPID;

-- 5) 주문 상세 테이블 (옵션 선택)
CREATE TABLE ORDER_DETAIL (
    ORDER_NO NUMBER,
    OPTION_CODE VARCHAR(20),
    OPTION_COUNT NUMBER
);
    
INSERT INTO ORDER_DETAIL(ORDER_NO, OPTION_CODE, OPTION_COUNT) 
    VALUES (1, '002', 1);
INSERT INTO ORDER_DETAIL(ORDER_NO, OPTION_CODE, OPTION_COUNT) 
    VALUES (2, '003', 2);
INSERT INTO ORDER_DETAIL(ORDER_NO, OPTION_CODE, OPTION_COUNT) 
    VALUES (3, '001', 2);
    

SELECT * FROM ORDER_DETAIL;
DROP TABLE ORDER_DETAIL;


-- 총액 > ORDER_INFO 테이블 PRICE에 UPDATE
UPDATE ORDER_INFO OI
    SET OI.PRICE = (SELECT M.MPRICE + NVL(SUM(OPTION_PRICE * OPTION_COUNT), 0)
    FROM  ORDER_INFO OI 
    INNER JOIN ORDER_DETAIL D ON OI.ORDER_NO = D.ORDER_NO
    INNER JOIN OPTION_INFO I ON D.OPTION_CODE = I.OPTION_CODE AND OI.MNO = I.MNO
    INNER JOIN MENU_INFO M ON OI.MNO = M.MNO 
    WHERE OI.ORDER_NO = '3'
    GROUP BY M.MPRICE)
    WHERE OI.ORDER_NO = '3';

    
SELECT * FROM ORDER_INFO;


--
--SELECT M.MPRICE + SUM(OPTION_PRICE*OPTION_COUNT)
--    FROM  ORDER_INFO OI
--    INNER JOIN ORDER_DETAIL D ON OI.ORDER_NO = D.ORDER_NO
--    INNER JOIN OPTION_INFO I ON D.OPTION_CODE = I.OPTION_CODE AND OI.MNO = I.MNO
--    INNER JOIN MENU_INFO M ON OI.MNO = M.MNO
--    WHERE OI.ORDER_NO = '1'
--    GROUP BY M.MPRICE;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

