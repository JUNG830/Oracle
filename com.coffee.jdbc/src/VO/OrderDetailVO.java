package VO;

public class OrderDetailVO {
    private int orderNo;
    private String optionCode;
    private int optionCount;

    public OrderDetailVO(int orderNo, String optionCode, int optionCount) {
        this.orderNo = orderNo;
        this.optionCode = optionCode;
        this.optionCount = optionCount;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
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
