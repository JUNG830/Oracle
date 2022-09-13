package DAO;
import VO.MenuInfoVO;
import VO.optionVO;
import VO.orderVO;
import util.Common;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class orderDAO {
    public List<orderVO> orderInsert(int mno, String optionCode, int optionCount) {
        List<orderVO> list = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Scanner sc = new Scanner(System.in);

        String sql = "INSERT INTO ORDER_DETAIL (ORDER_DATE, ORDER_NO, MNO, OPTION_CODE, OPTION_COUNT) "
                + " VALUES (SYSDATE, SEQ_ORDER_NO2.NEXTVAL, ?, ?, ?)";

        try {
            conn = Common.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mno);
            pstmt.setString(2, optionCode);
            pstmt.setInt(3, optionCount);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Date orderDate = rs.getDate("ORDER_DATE");
                String orderNo = rs.getString("ORDER_NO");
                mno = rs.getInt("MNO");
                optionCode = rs.getString("OPTION_CODE");
                optionCount = rs.getInt("OPTION_COUNT");

                orderVO vo = new orderVO(orderDate, orderNo, mno, optionCode, optionCount);
                list.add(vo);
            }
            Common.close(pstmt);
            Common.close(conn);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void OrderNoRst(List<orderVO> list) {
        for(orderVO e : list)
        System.out.println(e.getMno() + " ");
    }
}

