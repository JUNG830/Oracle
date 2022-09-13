package VO;

public class MenuInfoVO {
    private int mno;
    private String mname;
    private int mprice;

    public MenuInfoVO(int mno, String mname, int mprice) {
        this.mno = mno;
        this.mname = mname;
        this.mprice = mprice;
    }

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public int getMprice() {
        return mprice;
    }

    public void setMprice(int mprice) {
        this.mprice = mprice;
    }
}