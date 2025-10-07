package dto.otherDto;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;

public class ReservationInfoDto {
	
	Integer rNo; // 예약 번호
	Integer uNo;	// 예약자 번호
	Integer hNo;	// 병원 번호
	Integer mNo;	// 의사 번호
	LocalDate rDate;	// 예약 날짜
	LocalTime rTime;	// 예약 시간
	String rContent;	// 상담 내용
	String actName;	// 실제 방문자
	String actTel;	// 실제 전화번호
	String rStatus;	// 예약상태
	String rDay;	// 요일
	
	String hNm; // 병원 이름
	Integer categoryNo; // 카테고리
	String hAddress; // 병원 주소
	String hLocationY; // 병원 위치 위도
	String hLocationX; // 병원 위치 경도
	String transferInfo; // 근거리 교통 정보
	String holidayInfo; // 휴무 정보
	String hTel; // 전화번호
	String hLink; // 홈페이지 링크
	Integer hosImgFileNo; // 병원 썸네일 파일
	String status; // 활동 상태
	String hCode; // 병원코드
	String services; // 제공하는 편의 시설
	boolean silson; // 실손 24 서비스 제공 여부
	
	String id;	// 아이디
	String username;	// 이름
	Date birthDate;	// 생년월일
	String gender;	//성별
	String uTel; //전화번호
	String email;	//이메일
	Date createdAt;	// 가입일
	String userType;	// 회원분류 -> 
	String major; //전공
	String introduction; //자기소개
	String nickname; //닉네임
	Integer fileNo;
	
	ReservationInfoDto(){
		super();
	}

	public ReservationInfoDto(Integer rNo, Integer uNo, Integer hNo, Integer mNo, LocalDate rDate, LocalTime rTime,
			String rContent, String actName, String actTel, String rStatus, String rDay, String hNm, Integer categoryNo,
			String hAddress, String hLocationY, String hLocationX, String transferInfo, String holidayInfo, String hTel,
			String hLink, Integer hosImgFileNo, String status, String hCode, String services, boolean silson, String id,
			String username, Date birthDate, String gender, String uTel, String email, Date createdAt, String userType,
			String major, String introduction, String nickname, Integer fileNo) {
		super();
		this.rNo = rNo;
		this.uNo = uNo;
		this.hNo = hNo;
		this.mNo = mNo;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rContent = rContent;
		this.actName = actName;
		this.actTel = actTel;
		this.rStatus = rStatus;
		this.rDay = rDay;
		this.hNm = hNm;
		this.categoryNo = categoryNo;
		this.hAddress = hAddress;
		this.hLocationY = hLocationY;
		this.hLocationX = hLocationX;
		this.transferInfo = transferInfo;
		this.holidayInfo = holidayInfo;
		this.hTel = hTel;
		this.hLink = hLink;
		this.hosImgFileNo = hosImgFileNo;
		this.status = status;
		this.hCode = hCode;
		this.services = services;
		this.silson = silson;
		this.id = id;
		this.username = username;
		this.birthDate = birthDate;
		this.gender = gender;
		this.uTel = uTel;
		this.email = email;
		this.createdAt = createdAt;
		this.userType = userType;
		this.major = major;
		this.introduction = introduction;
		this.nickname = nickname;
		this.fileNo = fileNo;
	}

	@Override
	public String toString() {
		return "ReservationInfoDto [rNo=" + rNo + ", uNo=" + uNo + ", hNo=" + hNo + ", mNo=" + mNo + ", rDate=" + rDate
				+ ", rTime=" + rTime + ", rContent=" + rContent + ", actName=" + actName + ", actTel=" + actTel
				+ ", rStatus=" + rStatus + ", rDay=" + rDay + ", hNm=" + hNm + ", categoryNo=" + categoryNo
				+ ", hAddress=" + hAddress + ", hLocationY=" + hLocationY + ", hLocationX=" + hLocationX
				+ ", transferInfo=" + transferInfo + ", holidayInfo=" + holidayInfo + ", hTel=" + hTel + ", hLink="
				+ hLink + ", hosImgFileNo=" + hosImgFileNo + ", status=" + status + ", hCode=" + hCode + ", services="
				+ services + ", silson=" + silson + ", id=" + id + ", username=" + username + ", birthDate=" + birthDate
				+ ", gender=" + gender + ", uTel=" + uTel + ", email=" + email + ", createdAt=" + createdAt
				+ ", userType=" + userType + ", major=" + major + ", introduction=" + introduction + ", nickname="
				+ nickname + ", fileNo=" + fileNo + "]";
	}

	public Integer getrNo() {
		return rNo;
	}

	public void setrNo(Integer rNo) {
		this.rNo = rNo;
	}

	public Integer getuNo() {
		return uNo;
	}

	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}

	public Integer gethNo() {
		return hNo;
	}

	public void sethNo(Integer hNo) {
		this.hNo = hNo;
	}

	public Integer getmNo() {
		return mNo;
	}

	public void setmNo(Integer mNo) {
		this.mNo = mNo;
	}

	public LocalDate getrDate() {
		return rDate;
	}

	public void setrDate(LocalDate rDate) {
		this.rDate = rDate;
	}

	public LocalTime getrTime() {
		return rTime;
	}

	public void setrTime(LocalTime rTime) {
		this.rTime = rTime;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getActName() {
		return actName;
	}

	public void setActName(String actName) {
		this.actName = actName;
	}

	public String getActTel() {
		return actTel;
	}

	public void setActTel(String actTel) {
		this.actTel = actTel;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public String getrDay() {
		return rDay;
	}

	public void setrDay(String rDay) {
		this.rDay = rDay;
	}

	public String gethNm() {
		return hNm;
	}

	public void sethNm(String hNm) {
		this.hNm = hNm;
	}

	public Integer getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String gethAddress() {
		return hAddress;
	}

	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}

	public String gethLocationY() {
		return hLocationY;
	}

	public void sethLocationY(String hLocationY) {
		this.hLocationY = hLocationY;
	}

	public String gethLocationX() {
		return hLocationX;
	}

	public void sethLocationX(String hLocationX) {
		this.hLocationX = hLocationX;
	}

	public String getTransferInfo() {
		return transferInfo;
	}

	public void setTransferInfo(String transferInfo) {
		this.transferInfo = transferInfo;
	}

	public String getHolidayInfo() {
		return holidayInfo;
	}

	public void setHolidayInfo(String holidayInfo) {
		this.holidayInfo = holidayInfo;
	}

	public String gethTel() {
		return hTel;
	}

	public void sethTel(String hTel) {
		this.hTel = hTel;
	}

	public String gethLink() {
		return hLink;
	}

	public void sethLink(String hLink) {
		this.hLink = hLink;
	}

	public Integer getHosImgFileNo() {
		return hosImgFileNo;
	}

	public void setHosImgFileNo(Integer hosImgFileNo) {
		this.hosImgFileNo = hosImgFileNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String gethCode() {
		return hCode;
	}

	public void sethCode(String hCode) {
		this.hCode = hCode;
	}

	public String getServices() {
		return services;
	}

	public void setServices(String services) {
		this.services = services;
	}

	public boolean isSilson() {
		return silson;
	}

	public void setSilson(boolean silson) {
		this.silson = silson;
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

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getuTel() {
		return uTel;
	}

	public void setuTel(String uTel) {
		this.uTel = uTel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Integer getFileNo() {
		return fileNo;
	}

	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}

	
	
	


}
