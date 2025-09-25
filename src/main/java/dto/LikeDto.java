package dto;

public class LikeDto {
	Integer commuNo;
	Integer uNo;
	public LikeDto() {
		super();
	}
	public LikeDto(Integer commuNo, Integer uNo) {
		super();
		this.commuNo = commuNo;
		this.uNo = uNo;
	}
	@Override
	public String toString() {
		return "like [commuNo=" + commuNo + ", uNo=" + uNo + "]";
	}
	public Integer getCommuNo() {
		return commuNo;
	}
	public void setCommuNo(Integer commuNo) {
		this.commuNo = commuNo;
	}
	public Integer getuNo() {
		return uNo;
	}
	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}
	
	
}
