package dto.otherDto;

import dto.MemberDto;

public class NaverMemberDto {
	
	private MemberDto memberDto;
	private String id;
	private String profile;
	private String gender;
	private String email;
	private String tel;
	private String birthDate;
	
	public NaverMemberDto(MemberDto memberDto, String id, String profile, String gender, String email, String tel,
			String birthDate) {
		super();
		this.memberDto = memberDto;
		this.id = id;
		this.profile = profile;
		this.gender = gender;
		this.email = email;
		this.tel = tel;
		this.birthDate = birthDate;
	}
	
	

	@Override
	public String toString() {
		return "NaverMemberDto [memberDto=" + memberDto + ", id=" + id + ", profile=" + profile + ", gender=" + gender
				+ ", email=" + email + ", tel=" + tel + ", birthDate=" + birthDate + "]";
	}



	public MemberDto getMemberDto() {
		return memberDto;
	}

	public void setMemberDto(MemberDto memberDto) {
		this.memberDto = memberDto;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	
	
	
	

}
