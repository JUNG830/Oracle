package VO;

import java.sql.Date;

public class OrderInfoVO {
    private Date orderDate;
    private String memberId;
    private int orderNo;
    private int mno;
    private int price;

    public OrderInfoVO(Date orderDate, String memberId, int orderNo, int mno, int price) {
        this.orderDate = orderDate;
        this.memberId = memberId;
        this.orderNo = orderNo;
        this.mno = mno;
        this.price = price;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
