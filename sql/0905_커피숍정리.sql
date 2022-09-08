SELECT *
FROM EMP;



/* 카테고리 테이블 */
DROP TABLE 카테고리;
SELECT * FROM 카테고리;

CREATE TABLE 카테고리 (
    구분 VARCHAR2(30) PRIMARY KEY
);

INSERT INTO 카테고리 VALUES('에스프레소');
INSERT INTO 카테고리 VALUES('프라푸치노');
INSERT INTO 카테고리 VALUES('티바나');
---------------------------------------------------------------
/* 회원정보 */ 
CREATE TABLE 회원정보 (
    회원번호       NUMBER PRIMARY KEY,
    회원이름     VARCHAR2(20) NOT NULL,
    회원전화번호    VARCHAR2(20) );
    
/* 회원 정보 입력 */
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '미스조', '010-4443-2345');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '미스우', '010-4566-3456');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '미스박', '010-1234-5674');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '조동주', '010-5234-4578');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '조혜경', '010-2376-9756');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '박하늘', '010-3452-6785');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '정재이', '010-1135-3467');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '이종석', '010-3574-2367');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '임윤아', '010-3567-3457');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '이주연', '010-7888-5678');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '곰돌이 사육사', '010-3333-7788');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '사육사', '010-5678-9804');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '이영지', '010-9374-2345');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '미스조', '010-1111-1111');
INSERT INTO 회원정보 VALUES(TO_CHAR(SEQ_회원번호.NEXTVAL), '미스우', '010-2222-3333');

/* 회원번호 생성 시퀀스 */
CREATE SEQUENCE SEQ_회원번호
START WITH 5000
INCREMENT BY 1
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_회원번호;


SELECT *
FROM 회원정보;
DROP TABLE 회원정보;
---------------------------------------------------------------
/* 카페메뉴 테이블 */
DROP TABLE 카페메뉴;
SELECT * FROM 카페메뉴;

CREATE TABLE 카페메뉴 (
    메뉴명 VARCHAR(30) NOT NULL,
    메뉴가격 INTEGER CHECK(메뉴가격 > 0) NOT NULL,
    구분 VARCHAR2(30) CONSTRAINT 제약조건 REFERENCES 카테고리(구분)
);

-- 카페메뉴 추가
INSERT INTO 카페메뉴 VALUES('아메리카노', 4500, '에스프레소');
INSERT INTO 카페메뉴 VALUES('라떼', 5000, '에스프레소');
INSERT INTO 카페메뉴 VALUES('자바칩 프라푸치노', 6300, '프라푸치노');
INSERT INTO 카페메뉴 VALUES('카라멜 프라푸치노', 5900, '프라푸치노');
INSERT INTO 카페메뉴 VALUES('자몽 허니블랙티', 5700, '티바나');
INSERT INTO 카페메뉴 VALUES('얼그레이 티', 4500, '티바나');
---------------------------------------------------------------
/* 옵션 테이블 */
DROP TABLE 옵션;
SELECT * FROM 옵션;

CREATE TABLE 옵션 (
    옵션이름 VARCHAR2(30) DEFAULT '선택 안 함' NOT NULL,
    추가금액 NUMBER
);

-- 옵션메뉴 추가
INSERT INTO 옵션 VALUES('샷 추가', 500);
INSERT INTO 옵션 VALUES('시럽 추가', 500);
INSERT INTO 옵션 VALUES('선택 안 함', 0);
---------------------------------------------------------------
/* 주문내역 테이블 */
DROP TABLE 주문내역;
SELECT * FROM 주문내역;

CREATE TABLE 주문내역 (
    주문번호 NUMBER,
    주문일 DATE NOT NULL,
    회원번호 NUMBER NOT NULL,  -- DEFAULT 주문내역(주문번호) NOT NULL,
    메뉴명 VARCHAR2(30) NOT NULL,
    옵션이름 VARCHAR2(30)
);

--주문 내역 기입
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5000, '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5000, '라떼', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5001, '자바칩 프라푸치노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5002, '얼그레이 티', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5003, '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, 5004, '아메리카노', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+1, 5005, '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+1, 5006, '자바칩 프라푸치노', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+30, 5007, '아메리카노', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+30, 5008, '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+60, 5009, '자바칩 프라푸치노', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+60, 5010, '아메리카노', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+90, 5011, '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+90, 5012, '라떼', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+90, 5013, '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE+90, 5014, '라떼', '선택 안 함');



--주문번호 시퀀스 생성
CREATE SEQUENCE SEQ_ORDER
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_ORDER;
---------------------------------------------------------------
/* 합계표 */

SELECT 조인.주문일, 조인.주문번호, 회원.회원번호, 회원.회원이름, 조인.메뉴명, 조인.메뉴가격, 조인.옵션이름, 옵션.추가금액, 조인.메뉴가격+옵션.추가금액 as 총주문금액
FROM 옵션 JOIN (SELECT * FROM 주문내역 NATURAL JOIN 카페메뉴) 조인
        ON 옵션.옵션이름 = 조인.옵션이름
    LEFT JOIN 회원정보 회원
        ON 회원.회원번호 = 조인.회원번호
ORDER BY 주문번호;

---------------------------------------------------------------
/* (후)일일 총매출 조회 쿼리문 */

SELECT NVL(TO_CHAR(주문일), '전체') AS 날짜, NVL(메뉴명, '합계') AS 메뉴명, 
        SUM(판매량) 총판매량, SUM(총매출액) 총매출액
FROM (
    SELECT 주문일, 주문내역.메뉴명 메뉴명, COUNT(*) 판매량, SUM((메뉴가격) + (옵션.추가금액)) 총매출액 
        FROM 주문내역, 옵션, 카페메뉴 
    WHERE 주문내역.메뉴명 = 카페메뉴.메뉴명
        AND 옵션.옵션이름 = 주문내역.옵션이름
    GROUP BY 주문일, 주문내역.메뉴명
) A
GROUP BY ROLLUP(주문일, 메뉴명);

---------------------------------------------------------------
/* (전)일일 총매출 조회 쿼리문 */
SELECT 주문일, COUNT(*) 판매량, SUM((메뉴가격) + (옵션.추가금액)) 총매출액 
    FROM 주문내역, 옵션, 카페메뉴 
WHERE 주문내역.메뉴명 = 카페메뉴.메뉴명
    AND 옵션.옵션이름 = 주문내역.옵션이름
GROUP BY 주문일
ORDER BY 주문일;


/* 월별 매출액 조회 쿼리문 */
SELECT TO_CHAR(주문일, 'MM"월"') 月, COUNT(*) 판매량, SUM((메뉴가격) + (옵션.추가금액)) 총매출액 
    FROM 주문내역, 옵션, 카페메뉴
WHERE 주문내역.메뉴명 = 카페메뉴.메뉴명
    AND 옵션.옵션이름 = 주문내역.옵션이름
GROUP BY TO_CHAR(주문일, 'MM"월"')
ORDER BY 月;

/* 회원별 매출액 조회 쿼리문 */ 
SELECT 회원.회원번호 회원번호, 회원.회원이름 회원이름, COUNT(*) 판매량, SUM((메뉴가격) + (옵션.추가금액)) 총매출액 
    FROM 주문내역 주문
        INNER JOIN 카페메뉴 메뉴
            ON 주문.메뉴명 = 메뉴.메뉴명
        LEFT JOIN 옵션 옵션     
            ON 옵션.옵션이름 = 주문.옵션이름
        LEFT JOIN 회원정보 회원
            ON 회원.회원번호 = 주문.회원번호
GROUP BY 회원.회원이름, 회원.회원번호
ORDER BY 회원.회원번호;