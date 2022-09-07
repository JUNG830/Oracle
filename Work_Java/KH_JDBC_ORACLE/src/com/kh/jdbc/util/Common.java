package com.kh.jdbc.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
public class Common {
        final static String ORACLE_URL = "jdbc:oracle:thin:@localhost:1521:xe";  // 오라클 ip 로 자동으로 연결
        final static String ORACLE_ID = "SCOTT"; // SCOTT ID로 자동 로그인, 변경시 여기만 바꿔주면 됨.
        final static String ORACLE_PW = "TIGER"; // SCOTT PW로 자동 로그인
        final static String ORACLE_DRV = "oracle.jdbc.driver.OracleDriver";

        public static Connection getConnection() {
            Connection conn = null;
            try {
                Class.forName(ORACLE_DRV);
                System.out.println("Oralce 연결 성공");
                // 연결 얻기
                conn = DriverManager.getConnection(ORACLE_URL, ORACLE_ID, ORACLE_PW);
                System.out.println("Connection 생성 성공");
            } catch (Exception e) {
                e.printStackTrace();
            }
            return conn;
        }

        public static void close(Connection conn) {
            try {
                if(conn != null && !conn.isClosed()) { // 닫혀있지 않고, null 이 아니면
                    conn.close();
                    System.out.println("Connection 해제 성공");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public static void close(Statement stmt) {
            try {
                if(stmt != null && !stmt.isClosed()) {
                    stmt.close();
                    System.out.println("Statement 해제 성공");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public static void close(ResultSet rset) {
            try {
                if(rset != null && !rset.isClosed()) {
                    rset.close();
                    System.out.println("Result set 해제 성공");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        public static void commit(Connection conn) {
            try {
                if(conn != null && !conn.isClosed()) {
                    conn.commit();
                    System.out.println("커밋 완료");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

//        public static void rollback(Connection conn) {
//            try {
//                if(conn != null && !conn.isClosed())
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }

}
