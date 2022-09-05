package com.kh.jdbc.comm;

import com.kh.jdbc.comm.dao.EmpDeleteDAO;
import com.kh.jdbc.comm.dao.EmpInsertDAO;
import com.kh.jdbc.comm.dao.EmpSelectDAO;
import com.kh.jdbc.comm.dao.EmpUpdateDAO;
import com.kh.jdbc.comm.vo.EmpVO;

import java.util.List;
import java.util.Scanner;

public class jdbcMain {

    public static void main(String[] args) {
        menuSelect();
    }

    public static void menuSelect() {
        Scanner sc = new Scanner(System.in);
        while(true) {
            System.out.println("===== [EMP Table 조회] =====");
            System.out.println("메뉴를 선택 하세요 : ");
            System.out.println("[1]SELECT, [2]INSERT, [3]UPDATE, [4]DELETE, [5]EXIT");
            int sel = sc.nextInt();
            switch(sel) {
                case 1:
                    EmpSelectDAO select = new EmpSelectDAO();
                    List<EmpVO> list = select.listEmp();
                    select.printEmpSelect(list);
                    break;
                case 2 :
                    EmpInsertDAO insert = new EmpInsertDAO();
                    insert.empInsert();
                    break;
                case 3 :
                    EmpUpdateDAO update = new EmpUpdateDAO();
                    update.empUpdate();
                    break;
                case 4 :
                    EmpDeleteDAO delete = new EmpDeleteDAO();
                    delete.empDelete();
                    break;
                case 5 :
                    System.out.println("메뉴를 종료 합니다");
                    return;
            }
        }
    }
}