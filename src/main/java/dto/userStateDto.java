package dto;

public class userStateDto {
	
	Integer stateCode; // 상태 코크
	String description; // 상태 의미
	
	public userStateDto() {
		super();
	}

	public userStateDto(Integer stateCode, String description) {
		super();
		this.stateCode = stateCode;
		this.description = description;
	}
	

	@Override
	public String toString() {
		return "userStateDto [stateCode=" + stateCode + ", description=" + description + "]";
	}

	public Integer getStateCode() {
		return stateCode;
	}

	public void setStateCode(Integer stateCode) {
		this.stateCode = stateCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	

}
