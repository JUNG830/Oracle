package DAO;

import VO.MenuInfoVO;
import VO.optionVO;
import VO.seqOrderNoVO;
import util.Common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class seqOrderNoDAO {
    public List<seqOrderNoVO> seqOrderNo() {
        List<seqOrderNoVO> list = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Common.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT SEQ_ORDER_NO.NEXTVAL AS ORDERNO FROM DUAL ";
            rs = stmt.executeQuery(sql);

            while(rs.next()) {
                int seqOrderNo = rs.getInt("ORDER_NO");

                seqOrderNoVO ODvo = new seqOrderNoVO(seqOrderNo);
                list.add(ODvo);
            }
            Common.close(rs);
            Common.close(stmt);
            Common.close(conn);

        } catch (Exception e) {
            e.printStackTrace();
        } return list;
    }
}

