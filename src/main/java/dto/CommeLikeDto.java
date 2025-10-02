package dto;

public class CommeLikeDto {
	Integer commeLikeNo;
	Integer uNo;
	Integer commeNo;
	public CommeLikeDto() {
		super();
	}
	public CommeLikeDto(Integer commeLikeNo, Integer uNo, Integer commeNo) {
		super();
		this.commeLikeNo = commeLikeNo;
		this.uNo = uNo;
		this.commeNo = commeNo;
	}
	@Override
	public String toString() {
		return "commeLikeDto [commmeLikeNo=" + commeLikeNo + ", uNo=" + uNo + ", commeNo=" + commeNo + "]";
	}
	public Integer getCommmeLikeOn() {
		return commeLikeNo;
	}
	public void setCommmeLikeOn(Integer commmeLikeNo) {
		this.commeLikeNo = commmeLikeNo;
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
