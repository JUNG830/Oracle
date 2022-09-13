package VO;

import java.sql.Date;

public class orderVO {
    private Date orderDate;
    private String orderNo;
    private int mno;
    private String optionCode;
    private int optionCount;


    public orderVO(Date orderDate, String orderNo, int mno, String optionCode, int optionCount) {
        this.orderDate = orderDate;
        this.orderNo = orderNo;
        this.mno = mno;
        this.optionCode = optionCode;
        this.optionCount = optionCount;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public String getOptionCode() {
        return optionCode;
    }

    public void setOptionCode(String optionCode) {
        this.optionCode = optionCode;

    }

    public int getOptionCount() {
        return optionCount;
    }

    public void setOptionCount(int optionCount) {
        this.optionCount = optionCount;
    }
}
