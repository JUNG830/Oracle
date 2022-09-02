/* 고객 주문 테이블 만들기 */
CREATE TABLE ORDER_INFO(
/* 오늘 날짜 */ DATE_TODAY DATE DEFAULT SYSDATE,
/* 메뉴 선택 */ OI_MENU VARCHAR2(30)REFERENCES MENU_INFO(MENU_NAME),
/* 사이즈 선택 */ OI_SIZE VARCHAR2(20),
/* 샷 추가 */ OI_SHOT NUMBER,
/* 시럽 추가*/ OI_SYRUP NUMBER
);

SELECT * FROM ORDER_INFO;
DROP TABLE ORDER_INFO;


INSERT INTO (OI_MENU, OI_SIZE, OI_SHOT, OI_SYRUP)
    VALUES ('아메리카노', 'M', 2, 1);

(OI_MENU, OI_SIZE, OI_SHOT, OI_SYRUP)
 
    

/* 주문 금액 계산 테이블 만들기 */

CREATE TABLE ORDER_PRICE
        MENU_NO NUMBER REFERENCES      
    AS SELECT O.CUSTOMER, O.MNO, O.OPTION_NAME, M.MPRICE, O.SIZE_PRICE, O.ADD_SHOT, O.ADD_SHOT * 400 SHOT_PRICE,
                M.MPRICE+O.SIZE_PRICE+(O.ADD_SHOT * 400) "토탈"
            
        FROM MENU_INFO M JOIN ( SELECT I.CUSTOMER, I.MNO, I.OPTION_NAME, P.SIZE_PRICE, I.ADD_SHOT
                                FROM ORDER_INFO I, OPTION_INFO P
                                WHERE I.OPTION_NAME = P.CUP_SIZE) O
        ON O.MNO = M.MNO;

SELECT * FROM CUSTOMER_PRICE;
DROP TABLE CUSTOMER_PRICE;







--SELECT O.CUP_SIZE, O.ADD_SHOT, O.OPT_PRICE, O.HOT_ICE_NONE
--FROM CAFE_OPTION O INNER JOIN MENU_INFO I
--    ON O.ADD_SHOT = I.MNO
--    WHERE I.MNAME = '아메리카노';    
--    
--INSERT INTO MENU_INFO (MNAME)
--    VALUES ('아메리카노');








