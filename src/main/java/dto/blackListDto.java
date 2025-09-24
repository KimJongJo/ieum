package dto;

import java.sql.Date;

public class blackListDto {
	
	Integer blackNo;	// 블랙리스트 번호
	Integer blockerNo;	// 차단한 회원
	Integer blockedNo;	// 차단당한 회원
	Date blackCreated;	// 차단 날짜
	boolean isActive;	// 차단 여부
	
	public blackListDto() {}
	
	public blackListDto(Integer blackNo, Integer blockerNo, Integer blockedNo, Date blackCreated, boolean isActive) {
		super();
		this.blackNo = blackNo;
		this.blockerNo = blockerNo;
		this.blockedNo = blockedNo;
		this.blackCreated = blackCreated;
		this.isActive = isActive;
	}
	
	
	@Override
	public String toString() {
		return "blackList [blackNo=" + blackNo + ", blockerNo=" + blockerNo + ", blockedNo=" + blockedNo
				+ ", blackCreated=" + blackCreated + ", isActive=" + isActive + "]";
	}


	public Integer getBlackNo() {
		return blackNo;
	}
	public void setBlackNo(Integer blackNo) {
		this.blackNo = blackNo;
	}
	public Integer getBlockerNo() {
		return blockerNo;
	}
	public void setBlockerNo(Integer blockerNo) {
		this.blockerNo = blockerNo;
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
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	
	

}
