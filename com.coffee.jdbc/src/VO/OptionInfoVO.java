package VO;

public class OptionInfoVO {
    private int mno;
    private String optionCode;
    private int optionPrice;

    public OptionInfoVO(int mno, String optionCode, int optionPrice) {
        this.mno = mno;
        this.optionCode = optionCode;
        this.optionPrice = optionPrice;
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
}
