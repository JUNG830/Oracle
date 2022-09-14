package DAO;
import VO.OrderInfoVO;
import util.Common;

import java.sql.*;
import java.util.List;


public class orderInfoDAO {
    public void orderInsert(int mno, int orderNo) {
//        List<OrderInfoVO> list = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;


        String sql = "INSERT INTO ORDER_INFO (ORDER_DATE, ORDER_NO, MNO)  " +
                "    VALUES (SYSDATE, ?, ?)";

        try {
            conn = Common.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, orderNo);
            pstmt.setInt(2, mno);


            Common.close(pstmt);
            Common.close(conn);

        } catch (Exception e) {
            e.printStackTrace();
        }
//        return list;
    }

    public static void OrderInfoRst(List<OrderInfoVO> list) {
        for(OrderInfoVO e : list)
        System.out.println(e.getMno() + " ");
    }
}

