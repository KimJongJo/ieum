 package dto;

import java.sql.Date;

public class BlackListDto {
	
	Integer blackNo;	// 블랙리스트 번호
	Integer uNo;	// 차단한 회원
	Integer blockedNo;	// 차단당한 회원
	Date blackCreated;	// 차단 날짜
	
	
	public BlackListDto() {}


	public BlackListDto(Integer blackNo, Integer uNo, Integer blockedNo, Date blackCreated) {
		super();
		this.blackNo = blackNo;
		this.uNo = uNo;
		this.blockedNo = blockedNo;
		this.blackCreated = blackCreated;
	}


	@Override
	public String toString() {
		return "BlackListDto [blackNo=" + blackNo + ", uNo=" + uNo + ", blockedNo=" + blockedNo + ", blackCreated=" + blackCreated + "]";
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
