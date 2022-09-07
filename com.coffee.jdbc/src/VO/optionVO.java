package VO;

public class optionVO {
    private int mno;
    private String optionCode;
    private int optionPrice;
    private  String optionName;

    public optionVO(int mno, String optionCode, String optionName, int optionPrice) {
        this.mno = mno;
        this.optionCode = optionCode;
        this.optionPrice = optionPrice;
        this.optionName = optionName;
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

    public int getOptionPrice() {
        return optionPrice;
    }

    public void setOptionPrice(int optionPrice) {
        this.optionPrice = optionPrice;
    }

    public String getOptionName() {
        return optionName;
    }

    public void setOptionName(String optionName) {
        this.optionName = optionName;
    }
}
