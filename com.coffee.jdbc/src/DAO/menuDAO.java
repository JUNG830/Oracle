package DAO;

import VO.MenuInfoVO;
import util.Common;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class menuDAO {
        Connection conn = null;
        Statement stmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Scanner sc = new Scanner(System.in);

        public List<MenuInfoVO> menuSelect() {
            List<MenuInfoVO> list = new ArrayList<>();
            try {
                conn = Common.getConnection();
                stmt = conn.createStatement();
                String sql = "SELECT * FROM MENU_INFO";
                rs = stmt.executeQuery(sql);

                while(rs.next()) {
                    int mpart = rs.getInt("MPART");
                    String partname = rs.getString("PARTNAME");
                    int mno = rs.getInt("MNO");
                    String mname = rs.getString("MNAME");
                    int mprice = rs.getInt("MPRICE");


                    MenuInfoVO vo = new MenuInfoVO(mpart, partname, mno, mname, mprice);
                    list.add(vo);
                }
                Common.close(rs);
                Common.close(stmt);
                Common.close(conn);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }

    public void menuSelectRst(List<MenuInfoVO> list) {
        for(MenuInfoVO e : list) {
            System.out.print(e.getMname() + " ");
            System.out.print(e.getMprice() + " ");
            System.out.println();
        }
    }
}
