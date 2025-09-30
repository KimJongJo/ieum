package dto.otherDto;

// 병원 등록 신청자 정보
public class ApplicantInfoDto {
	
	String name;
	String email;
	String tel;
	
	public ApplicantInfoDto() {}

	public ApplicantInfoDto(String name, String email, String tel) {
		super();
		this.name = name;
		this.email = email;
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "ApplicantInfoDto [name=" + name + ", email=" + email + ", tel=" + tel + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	
	
	

}
