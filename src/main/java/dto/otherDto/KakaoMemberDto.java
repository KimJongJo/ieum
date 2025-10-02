package dto.otherDto;

import dto.MemberDto;

public class KakaoMemberDto {
	
	private String id;
	private String nickname;
	private String profile;
	private MemberDto memberDto;

	
	public KakaoMemberDto(String id, String nickname, String profile, MemberDto memberDto) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.profile = profile;
		this.memberDto = memberDto;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	

}
