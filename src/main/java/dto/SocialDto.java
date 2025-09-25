package dto;

public class SocialDto {
	
	Integer socialNo;
	String socialName;
	
	
	public SocialDto() {}
	
	
	public SocialDto(Integer socialNo, String socialName) {
		super();
		this.socialNo = socialNo;
		this.socialName = socialName;
	}
	
	
	
	@Override
	public String toString() {
		return "socialDto [socialNo=" + socialNo + ", socialName=" + socialName + "]";
	}



	public Integer getSocialNo() {
		return socialNo;
	}
	public void setSocialNo(Integer socialNo) {
		this.socialNo = socialNo;
	}
	public String getSocialName() {
		return socialName;
	}
	public void setSocialName(String socialName) {
		this.socialName = socialName;
	}
	
	

}
