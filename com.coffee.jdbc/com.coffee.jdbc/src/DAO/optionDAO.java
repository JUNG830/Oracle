package DAO;

import VO.MenuInfoVO;
import VO.optionVO;
import util.Common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class optionDAO {
    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Scanner sc = new Scanner(System.in);

    public List<optionVO> optionSelect(int mno) {
        List<optionVO> list = new ArrayList<>();




        try {

            String orderInfo = "INSERT INTO ORDER_INFO (ORDER_DATE, ORDER_NO, MNO)  " +
                    "    VALUES (SYSDATE, SEQ_ORDER_NO.NEXTVAL, ?) ";

            conn = Common.getConnection();
            pstmt = conn.prepareStatement(orderInfo);
            pstmt.setInt(1, mno);
            rs = pstmt.executeQuery();

            String sql = "SELECT M.MNO, C.OPTION_CODE, C.OPTION_NAME, O.OPTION_PRICE " +
                    "FROM MENU_INFO M " +
                    "INNER JOIN OPTION_INFO O ON M.MNO = O.MNO " +
                    "INNER JOIN OPTION_CODE_INFO C ON O.OPTION_CODE = C.OPTION_CODE " +
                    "WHERE M.MNO = ? ";

            conn = Common.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mno);
            rs = pstmt.executeQuery();


            while(rs.next()) {
                int mno1 = rs.getInt("MNO");
                String optionCode = rs.getString("OPTION_CODE");
                String optionName = rs.getString("OPTION_NAME");
                int optionPrice = rs.getInt("OPTION_PRICE");


                optionVO vo = new optionVO(mno1, optionCode, optionPrice, optionName);
                list.add(vo);
            }


            Common.close(rs);
            Common.close(pstmt);
            Common.close(conn);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void optionSelectRst(List<optionVO> list) {
        for(optionVO e : list) {
            System.out.print(e.getOptionCode() + " ");
            System.out.print(e.getOptionName() + " ");
            System.out.print(e.getOptionPrice() + " ");
            System.out.println();
        }
    }
}
