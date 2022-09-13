CREATE TABLE T_MEMBER (
    ID      VARCHAR2(10) PRIMARY KEY,
    PWD     VARCHAR2(10),
    NAME    VARCHAR2(50),
    EMAIL   VARCHAR2(50),
    JOIN    DATE DEFAULT SYSDATE
);
drop table T_MEMBER;
INSERT INTO T_MEMBER VALUES('JKS2024', 'SPHB8250', '곰돌이사육사', 'jks2024@gmail.com', sysdate);
INSERT INTO T_MEMBER VALUES('1234567', '1234567', '안유진', 'anyou@gmail.com', sysdate);
INSERT INTO T_MEMBER VALUES('56785678', '1234567', '이영지', 'leeyj@gmail.com', sysdate);

select * from t_member;
commit;