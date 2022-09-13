package VO;

public class OptionCodeInfoVO {
    private String optionCode;
    private  String optionName;

    public OptionCodeInfoVO(String optionCode, String optionName) {
        this.optionCode = optionCode;
        this.optionName = optionName;
    }

    public String getOptionCode() {
        return optionCode;
    }

    public void setOptionCode(String optionCode) {
        this.optionCode = optionCode;
    }

    public String getOptionName() {
        return optionName;
    }

    public void setOptionName(String optionName) {
        this.optionName = optionName;
    }
}
