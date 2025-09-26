package dto;

public class commeLikeDto {
	Integer commmeLikeOn;
	Integer uNo;
	Integer commeNo;
	public commeLikeDto() {
		super();
	}
	public commeLikeDto(Integer commmeLikeOn, Integer uNo, Integer commeNo) {
		super();
		this.commmeLikeOn = commmeLikeOn;
		this.uNo = uNo;
		this.commeNo = commeNo;
	}
	@Override
	public String toString() {
		return "commeLikeDto [commmeLikeOn=" + commmeLikeOn + ", uNo=" + uNo + ", commeNo=" + commeNo + "]";
	}
	public Integer getCommmeLikeOn() {
		return commmeLikeOn;
	}
	public void setCommmeLikeOn(Integer commmeLikeOn) {
		this.commmeLikeOn = commmeLikeOn;
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
