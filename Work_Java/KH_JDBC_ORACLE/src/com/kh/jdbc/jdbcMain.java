package com.kh.jdbc;

import com.kh.jdbc.dao.*;
import com.kh.jdbc.vo.EmpVO;

import java.net.PortUnreachableException;
import java.util.List;
import java.util.Scanner;

public class jdbcMain {
    public static void main(String[] args) {
        {
        menuSelect();
    }
        EmpDAO dao = new EmpDAO();

        dao.empInsert();
        List<EmpVO> list = dao.empSelect();
        dao.empSelectRst(list);
    }
    public static void menuSelect() {
        Scanner sc = new Scanner(System.in);
        EmpDAO dao = new EmpDAO();
        while (true) {
            System.out.println("====== [EMP TABLE] =====");
            System.out.println("메뉴를 조회 하세요");
            System.out.print("[1]Select, [2]Insert, [3]Update, [4]Delete, [5]Exit :");
            int sel = sc.nextInt();
            switch (sel) {
                case 1 :
                    List<EmpVO> list = dao.empSelect();
                    dao.empSelectRst(list);
                    break;
                case 2 :
                    dao.empInsert();
                    break;
                case 3 :
                    dao.empUpdate();
                    break;
                case 4 :
                    dao.empDelete();
                    break;
                case 5 :
                    System.out.println("메뉴를 종료합니다.");
                    return;
            }
        }
    }
}