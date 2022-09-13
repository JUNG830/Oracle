import DAO.menuDAO;
import DAO.optionDAO;
import DAO.orderDAO;
import DAO.seqOrderNoDAO;
import VO.MenuInfoVO;
import VO.optionVO;
import VO.orderVO;
import VO.seqOrderNoVO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class coffeeMain {
    public static void main(String[] args) {
        menuSelect();
    }

    public static void menuSelect() {
        Scanner sc = new Scanner(System.in);
        menuDAO dao = new menuDAO();
        optionDAO optionDAO = new optionDAO();
        orderDAO orderDAO = new orderDAO();
        String optionCode;
        int optionCount = 0;


        while (true) {
            System.out.println("===== [MENU] =====");
            List<MenuInfoVO> list = dao.menuSelect();
            dao.menuSelectRst(list);
            System.out.println();
            System.out.print("메뉴를 입력하세요[번호를 입력] : ");
            int mno = sc.nextInt();

            List<optionVO> oplist = optionDAO.optionSelect(mno);
            optionDAO.optionSelectRst(oplist);
            while (true) {
                System.out.println("옵션을 선택해주세요 [001]/[002]/[003]/[999 : 선택완료] : ");
                optionCode = sc.next();
                System.out.println("옵션 수량 : ");
                optionCount = sc.nextInt();
                if (optionCode.equals("999")) {
                    System.out.println("선택완료");
                    break;
                }
                List<orderVO> odlist = orderDAO.orderInsert(mno, optionCode, optionCount);
            } return;
        }
    }
}
