package VO;

public class MenuInfoVO {
    private int mpart;
    private String partname;
    private int mno;
    private String mname;
    private int mprice;

    public MenuInfoVO(int mpart, String partname, int mno, String mname, int mprice) {
        this.mpart = mpart;
        this.partname = partname;
        this.mno = mno;
        this.mname = mname;
        this.mprice = mprice;
    }

    public int getMpart() {
        return mpart;
    }

    public void setMpart(int mpart) {
        this.mpart = mpart;
    }

    public String getPartname() {
        return partname;
    }

    public void setPartname(String partname) {
        this.partname = partname;
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
