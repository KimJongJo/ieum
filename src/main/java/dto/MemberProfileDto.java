package dto;

public class MemberProfileDto {
	private Integer uNo;
    private String id;
    private String username;
    private String nickname;
    private String uAddress;
    private String email;
    private String uTel;
    private String gender;
    private String diaryPrivate;

    // file 테이블 컬럼 (profile)
    private String profileFileName;
    private String profileFilePath;
    private String profileFileSize;

    
    
    
    
    public MemberProfileDto(Integer uNo, String id, String username, String nickname, String uAddress, String email,
			String uTel, String gender, String diaryPrivate, String profileFileName, String profileFilePath,
			String profileFileSize) {
		super();
		this.uNo = uNo;
		this.id = id;
		this.username = username;
		this.nickname = nickname;
		this.uAddress = uAddress;
		this.email = email;
		this.uTel = uTel;
		this.gender = gender;
		this.diaryPrivate = diaryPrivate;
		this.profileFileName = profileFileName;
		this.profileFilePath = profileFilePath;
		this.profileFileSize = profileFileSize;
	}

	// 기본 생성자
    public MemberProfileDto() {}

    // Getter & Setter
    public Integer getuNo() {
        return uNo;
    }
    public void setuNo(Integer uNo) {
        this.uNo = uNo;
    }

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getuAddress() {
        return uAddress;
    }
    public void setuAddress(String uAddress) {
        this.uAddress = uAddress;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getuTel() {
        return uTel;
    }
    public void setuTel(String uTel) {
        this.uTel = uTel;
    }

    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDiaryPrivate() {
        return diaryPrivate;
    }
    public void setDiaryPrivate(String diaryPrivate) {
        this.diaryPrivate = diaryPrivate;
    }

    public String getProfileFileName() {
        return profileFileName;
    }
    public void setProfileFileName(String profileFileName) {
        this.profileFileName = profileFileName;
    }

    public String getProfileFilePath() {
        return profileFilePath;
    }
    public void setProfileFilePath(String profileFilePath) {
        this.profileFilePath = profileFilePath;
    }

    public String getProfileFileSize() {
        return profileFileSize;
    }
    public void setProfileFileSize(String profileFileSize) {
        this.profileFileSize = profileFileSize;
    }
}
