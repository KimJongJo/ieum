package dto.otherDto;

public class MainUserDto {
	String nickname;
	Integer profileNo;
	String profilePath;
	public MainUserDto() {

	}
	
	public MainUserDto(String nickname, Integer profileNo, String profilePath) {
		super();
		this.nickname = nickname;
		this.profileNo = profileNo;
		this.profilePath = profilePath;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getProfileNo() {
		return profileNo;
	}
	public void setProfileNo(Integer profileNo) {
		this.profileNo = profileNo;
	}
	public String getProfilePath() {
		return profilePath;
	}
	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	@Override
	public String toString() {
		return "MainUserDto [nickname=" + nickname + ", profileNo=" + profileNo + ", profilePath=" + profilePath + "]";
	}
	
	

}
