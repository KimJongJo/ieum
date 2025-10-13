package dto.otherDto;

public class MainUserDto {
	String nickname;
	Integer profileNo;
	String profilePath;
	String profileNm;
	String username;
	public MainUserDto() {

	}

	
	
	public MainUserDto(String nickname, Integer profileNo, String profilePath, String profileNm, String username) {
		super();
		this.nickname = nickname;
		this.profileNo = profileNo;
		this.profilePath = profilePath;
		this.profileNm = profileNm;
		this.username = username;
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
	public String getProfileNm() {
		return profileNm;
	}
	public void setProfileNm(String profileNm) {
		this.profileNm = profileNm;
	}

	


	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	@Override
	public String toString() {
		return "MainUserDto [nickname=" + nickname + ", profileNo=" + profileNo + ", profilePath=" + profilePath
				+ ", profileNm=" + profileNm + ", username=" + username + "]";
	}

	
	
	

}
