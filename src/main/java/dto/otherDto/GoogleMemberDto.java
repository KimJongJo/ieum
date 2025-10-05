package dto.otherDto;

import dto.MemberDto;

public class GoogleMemberDto {
	
	private MemberDto memberDto;
	private String id;
	private String name;
	private String profileImage;
	private String email;
	
	public GoogleMemberDto(MemberDto memberDto, String id, String name, String profileImage, String email) {
		super();
		this.memberDto = memberDto;
		this.id = id;
		this.name = name;
		this.profileImage = profileImage;
		this.email = email;
	}
	
	

	@Override
	public String toString() {
		return "GoogleMemberDto [memberDto=" + memberDto + ", id=" + id + ", name=" + name + ", profileImage="
				+ profileImage + ", email=" + email + "]";
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	

}
