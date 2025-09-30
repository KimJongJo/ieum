 package dto;

import java.sql.Date;

public class BlackListDto {
	
	Integer blackNo;	// 블랙리스트 번호
	Integer uNo;	// 차단한 회원
	Integer commuNo; //해당 게시물 번호
	Integer commeNo; // 해당 댓글 번호
	Integer blockedNo;	// 차단당한 회원
	Date blackCreated;	// 차단 날짜
	
	
	public BlackListDto() {}


	public BlackListDto(Integer blackNo, Integer uNo, Integer commuNo, Integer commeNo, Integer blockedNo,
			Date blackCreated) {
		super();
		this.blackNo = blackNo;
		this.uNo = uNo;
		this.commuNo = commuNo;
		this.commeNo = commeNo;
		this.blockedNo = blockedNo;
		this.blackCreated = blackCreated;
	}


	@Override
	public String toString() {
		return "BlackListDto [blackNo=" + blackNo + ", uNo=" + uNo + ", commuNo=" + commuNo + ", commeNo=" + commeNo
				+ ", blockedNo=" + blockedNo + ", blackCreated=" + blackCreated + "]";
	}


	public Integer getBlackNo() {
		return blackNo;
	}


	public void setBlackNo(Integer blackNo) {
		this.blackNo = blackNo;
	}


	public Integer getuNo() {
		return uNo;
	}


	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}


	public Integer getCommuNo() {
		return commuNo;
	}


	public void setCommuNo(Integer commuNo) {
		this.commuNo = commuNo;
	}


	public Integer getCommeNo() {
		return commeNo;
	}


	public void setCommeNo(Integer commeNo) {
		this.commeNo = commeNo;
	}


	public Integer getBlockedNo() {
		return blockedNo;
	}


	public void setBlockedNo(Integer blockedNo) {
		this.blockedNo = blockedNo;
	}


	public Date getBlackCreated() {
		return blackCreated;
	}


	public void setBlackCreated(Date blackCreated) {
		this.blackCreated = blackCreated;
	}
	
	
}
