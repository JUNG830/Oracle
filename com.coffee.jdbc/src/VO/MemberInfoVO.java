package VO;

public class MemberInfoVO {
    private String memberId;
    private String memberName;
    private String memberPhone;

    public MemberInfoVO(String memberId, String memberName, String memberPhone) {
        this.memberId = memberId;
        this.memberName = memberName;
        this.memberPhone = memberPhone;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberPhone() {
        return memberPhone;
    }

    public void setMemberPhone(String memberPhone) {
        this.memberPhone = memberPhone;
    }
}
