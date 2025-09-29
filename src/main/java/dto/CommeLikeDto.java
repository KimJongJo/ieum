package dto;

public class CommeLikeDto {
	Integer commeLikeOn;
	Integer uNo;
	Integer commeNo;
	public CommeLikeDto() {
		super();
	}
	public CommeLikeDto(Integer commeLikeOn, Integer uNo, Integer commeNo) {
		super();
		this.commeLikeOn = commeLikeOn;
		this.uNo = uNo;
		this.commeNo = commeNo;
	}
	@Override
	public String toString() {
		return "commeLikeDto [commmeLikeOn=" + commeLikeOn + ", uNo=" + uNo + ", commeNo=" + commeNo + "]";
	}
	public Integer getCommmeLikeOn() {
		return commeLikeOn;
	}
	public void setCommmeLikeOn(Integer commmeLikeOn) {
		this.commeLikeOn = commmeLikeOn;
	}
	public Integer getuNo() {
		return uNo;
	}
	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}
	public Integer getCommeNo() {
		return commeNo;
	}
	public void setCommeNo(Integer commeNo) {
		this.commeNo = commeNo;
	}
}
