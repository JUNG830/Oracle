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
    닉네임 VARCHAR2(30),  -- DEFAULT 주문내역(주문번호) NOT NULL,
    메뉴명 VARCHAR2(30) NOT NULL,
    옵션이름 VARCHAR2(30)
);

--주문 내역 기입
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, '미스조', '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, '미스우', '자바칩 프라푸치노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, '미스박', '얼그레이 티', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, '조동주', '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-1, '조혜경', '아메리카노', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-1, '박하늘', '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-1, '정재이', '자바칩 프라푸치노', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-30, '이종석', '아메리카노', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-30, '임윤아', '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-60, '이주연', '자바칩 프라푸치노', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-60, '곰돌이', '아메리카노', '선택 안 함');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-90, '사육사', '아메리카노', '샷 추가');
INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE-90, '이영지', '라떼', '선택 안 함');

INSERT INTO 주문내역 VALUES(SEQ_ORDER.NEXTVAL, SYSDATE, ' ', '라떼', '샷 추가');

--주문번호 시퀀스 생성
CREATE SEQUENCE SEQ_ORDER
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_ORDER;

---------------------------------------------------------------
/* 일일 총매출 조회 쿼리문 */

SELECT 주문일, NVL(메뉴명,'일별 합계') AS 메뉴명, SUM(판매량) 총판매량, SUM(총매출액) 총매출액
FROM (
SELECT 주문일, 주문내역.메뉴명 메뉴명, COUNT(*) 판매량, SUM((메뉴가격) + (옵션.추가금액)) 총매출액 
    FROM 주문내역, 옵션, 카페메뉴 
WHERE 주문내역.메뉴명 = 카페메뉴.메뉴명
    AND 옵션.옵션이름 = 주문내역.옵션이름
GROUP BY 주문일, 주문내역.메뉴명
) A
GROUP BY ROLLUP(주문일, 메뉴명);


SELECT 조인.주문일, 조인.메뉴명, COUNT(*) as 수량, SUM(조인.메뉴가격+옵션.추가금액) as 매출액
FROM 옵션 JOIN (SELECT * FROM 주문내역 NATURAL JOIN 카페메뉴) 조인
ON 옵션.옵션이름 = 조인.옵션이름
GROUP BY 조인.주문일, 조인.메뉴명
ORDER BY 조인.주문일, 조인.메뉴명;

--ORDER BY 주문일;

/* 월별 매출액 조회 쿼리문 */
SELECT TO_CHAR(주문일, 'MON') 月, COUNT(*) 판매량, SUM((메뉴가격) + (옵션.추가금액)) 총매출액 
    FROM 주문내역, 옵션, 카페메뉴
WHERE 주문내역.메뉴명 = 카페메뉴.메뉴명
    AND 옵션.옵션이름 = 주문내역.옵션이름
GROUP BY TO_CHAR(주문일, 'MON')
ORDER BY 月;

/* 닉네임별 매출액 조회 쿼리문 */ 
--주문내역-닉네임의 unique를 제거해야 가능
--주문내역-insert시 동일한 닉네임을 넣고 테스트
SELECT TO_CHAR(닉네임), COUNT(*) 판매량, SUM((메뉴가격) + (옵션.추가금액)) 총매출액 
    FROM 주문내역, 옵션, 카페메뉴
WHERE 주문내역.메뉴명 = 카페메뉴.메뉴명
    AND 옵션.옵션이름 = 주문내역.옵션이름
GROUP BY 닉네임
ORDER BY 닉네임;
















