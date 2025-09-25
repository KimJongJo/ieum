package dto;

public class CommuLikeDto {
	Integer CommuLikeNo;
	Integer commuNo;
	Integer uNo;
	
	
	public CommuLikeDto() {
		super();
	}


	public CommuLikeDto(Integer commuLikeNo, Integer commuNo, Integer uNo) {
		super();
		CommuLikeNo = commuLikeNo;
		this.commuNo = commuNo;
		this.uNo = uNo;
	}

	
	

	@Override
	public String toString() {
		return "CommuLikeDto [CommuLikeNo=" + CommuLikeNo + ", commuNo=" + commuNo + ", uNo=" + uNo + "]";
	}


	public Integer getCommuLikeNo() {
		return CommuLikeNo;
	}


	public void setCommuLikeNo(Integer commuLikeNo) {
		CommuLikeNo = commuLikeNo;
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
